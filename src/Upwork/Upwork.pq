
// This file contains Upwork connector logic
[version = "3.1.3"]
section Upwork;

windowWidth = 1024;
windowHeight = 720;

clientId = Json.Document(Extension.Contents("client_application.json"))[ClientId];
clientSecret = Json.Document(Extension.Contents("client_application.json"))[ClientSecret];
callbackUrl = Json.Document(Extension.Contents("client_application.json"))[CallbackUrl];
recordsPerPage = Json.Document(Extension.Contents("client_application.json"))[RecordsPerPage];

//TEST
GQLLimit = 100;
contractsPerCall = recordsPerPage;
delayinSecGlobalParam = 1;

//Upwork base Url
baseUrl = "https://www.upwork.com";

//Upwork token Urls
requestTokenUrl = "/api/v3/oauth2/token";
authenticateUrl = "/ab/account-security/oauth2/authorize";

//Upwork GraphQL Url
graphQLUrl = "https://api.upwork.com/graphql";

//Upwork data APIs (relative path)
teamUrl = "/api/hr/v2/teams.json";
contractUrl = "/api/hr/v2/engagements.json";
jobUrl = "/api/hr/v2/jobs.json";
offerUrl = "/api/offers/v1/clients/offers";
jobApplicationUrl = "/api/hr/v4/clients/applications.json";

freelancePrefixUrl = "/api/profiles/v1/providers/";
freelanceSuffixUrl = "/brief.json";

billingPrefixUrl = "/gds/finreports/v2/buyer_companies/";
billingSuffixUrl = "/billings";

hoursPrefixUrl1 = "/gds/timereports/v1/companies/";
hoursPrefixUrl2 = "/teams/";
hoursSuffixUrl = "/hours";

//Billing query
billingQuery = "SELECT SUM(amount) WHERE assignment__reference=";
billingQuery2 = "SELECT reference, date, date_due, assignment__reference, type, subtype, notes, description, SUM(amount) WHERE date>='$sdate$' and date <='$edate$'";
totalHoursQuery = "SELECT assignment_ref, worked_on, week_worked_on, SUM(hours) where worked_on >= '$sdate$' and worked_on <= '$edate$'";

//Upwork public Urls
freelanceProfileUrl = "https://www.upwork.com/freelancers/";
contractProfileUrl = "https://www.upwork.com/ab/c/";

//Upwork columns to be retrieved
teamColumns = {
    "id",
    "reference",
     "name",
    "company__reference",
    "parent_team__id",
    "company_name"   
   };

teamOutputColumns = {
    "team_uid",
    "team_id",
    "team_name",
    "company_id",
    "company_uid",
    "company_name"   
   };

teamOutputFinalColumns = {
    "team_uid",
    "team_id",
    "team_name",
    "company_id",
    "company_uid",
    "company_name",
    "server_time"
   };

teamMasterColumns = {"auth_user", "teams", "server_time"};

contractColumns = {
    "buyer_team__reference",
     "reference",
    "engagement_title",
    "engagement_job_type",
    "status",
    "cj_job_application_uid",
    "job_application_ref",
    "job_ref_ciphertext",
    "hourly_charge_rate",
    "weekly_hours_limit",
    "created_time",
    "engagement_start_date",
    "engagement_end_date",
    "provider__reference",
    "dev_recno_ciphertext",
    "provider__id",
    "provider__name",
    "provider_team__name",
    "feedback",
    "offer_id",
    "fixed_charge_amount_agreed"
   };

 contractOutputColumns = {
    "buyer_team_id",
    "contract_id",
    "contract_title",
    "contract_type",
    "contract_status",
    "cj_job_application_uid",
    "job_application_ref",
    "job_text_id",
    "hourly_charge_rate",
    "weekly_hours_limit",
    "accept_date",
    "start_date",
    "end_date",
    "freelancer_id",
    "freelancer_text_id",
    "freelancer_user_id",
    "provider__name",
    "provider_team__name",
    "feedback",
    "offer_id",
    "fixed_price_budget"
   };

contractOutputFinalColumns = {
    "buyer_team_id",
    "contract_id",
    "contract_title",
    "contract_type",
    "contract_status",
    "job_text_id",
    "hourly_charge_rate",
    "weekly_hours_limit",
    "accept_date",
    "start_date",
    "end_date",
    "freelancer_id",
    "freelancer_text_id",
    "freelancer_user_id",
    "feedback_to_client_score",
    "feedback_to_freelancer_score",
    "offer_id",
    "fixed_price_budget"
   };

contractMasterColumns = {"server_time", "auth_user", "engagements"};
contractEnagementColumns = {"engagement", "lister"};


feedbackColumns = {
"feedback_for_buyer",
"feedback_for_provider"
};

jobColumns = {
    "buyer_team__reference",
    "job_ref_ciphertext",
    "reference",
    "title",
    "created_by_name",
    "status",
    "public_url",
    "category2",
    "subcategory2",
    "created_time"
};

jobOutputColumns = {
    "buyer_team__reference",
    "job_text_id",
    "job_id",
    "job_title",
    "job_created_by_name",
    "job_status",
    "job_public_url",
    "category",
    "subcategory",
    "job_created_date"
};

jobOutputFinalColumns = {
    "buyer_team__reference",
    "job_text_id",
    "job_id",
    "job_title",
    "job_created_by_name",
    "job_status",
    "job_public_url",
    "category",
    "subcategory",
    "job_created_date"
};

jobMasterColumns = {"auth_user", "jobs"};
jobMaster2Columns = {"job", "lister"};

freelancerColumns = {

    "dev_recno",
    "dev_short_name",
    "dev_country",
    "dev_city",
    "dev_is_affiliated",
    "dev_ac_agencies",
    "dev_total_hours",
    "dev_bill_rate",
     "dev_adj_score",
    "_is_error",
    "_error_code",
    "_error_message"
};

freelancerOutputColumns = {
    
    "freelancer_id",
    "freelancer_name",
    "country",
    "city",
    "is_affiliated_to_agency",
    "dev_ac_agencies",
    "total_hours",
    "profile_hourly_rate",
    "job_success_score",
    "_is_error",
    "_error_code",
    "_error_message"
};

freelancerOutputFinalColumns = {

    "freelancer_text_id",
    "freelancer_id",
    "freelancer_name",
    "country",
    "city",
    "is_affiliated_to_agency",
    "agency_name",
      "total_hours",
    "profile_hourly_rate",
    "job_success_score",
    "freelancer_profile_url",
    "_is_error",
    "_error_code",
    "_error_message"
};

freelancerMasterColumns = {"auth_user", "profile"};

billingMasterColumns = {"auth_user", "table"};

billingOutputFinalColumns = {
    "txn_id",
    "txn_date",
    "txn_date_due",
    "contract_id",
    "type",
    "accounting_subtype",
    "notes",
    "description",
    "amount_spent"
};

hoursWorkedMasterColumns = {"auth_user", "table"};

hoursWorkedOutputFinalColumns = {

    "company_uid",
    "worked_on_month",
    "worked_on_date",
    "worked_on_week_start_date",
    "contract_id",
    "hours_worked"
};

errorColumns = {
    "message",
    "reason"
};

//Enterprise Reporting columns

summaryInsightsTopLevelColumns = {
"avgTimeToHire", "avgTimeToHireOthers", "avgFillRate", "avgFillRateOthers", 
"avgFLRating", "avgFLRatingOthers", "clientUsage"};

summaryInsightsClientUsageColumns = {
    "totalEmployeeCount", "registeredUsers", "registeredUsersLast30Days", "jobPostedUsers", "spentUsers", "inactiveUsers", "projectsLessThan1k", "projects1kTo10k", "projects10kTo25k", "projectsMoreThan25k", "totalCategoriesWithNoSpend", "totalCategoriesWithSpend", "totalCategories", "activeHmCount"};

hiringManagerInsightsTopLevelColumns = {
"totalRegistered", "totalActive", "fillRate", "hiringManagers", "hiringManagersCount", "timePeriod"};

hiringManagerInsightsHiringManagerColumns = 
{"hmId", "email", "spend", "fillRate", "jobsPosted", "registrationDate", "daysSinceRegistration", "firstName", "lastName"};

categoriesInsightsTopLevelColumns = {
"activeCategoriesCount", "avgProjectCost", "jobsPosted"};

categoriesInsightsDetailsColumns = {
"id", "name", "spend", "spendOthers", "avgProjectCost", "jobsPosted", "description", "imageUrl", "avgFlRating",
"avgTimeToHire", "avgProjectDuration","avgProjectDurationOthers"
};

categoriesInsightsDetailsOutputColumns = {
"categoryId", "categoryName", "spend", "spendOthers", "avgProjectCost", "jobsPosted", "description", "imageUrl", "avgFlRating",
"avgTimeToHire", "avgProjectDuration","avgProjectDurationOthers"
};

categoriesInsightsTopServicesColumns = {"id", "name", "flAvailable", "hourlyRateStart", "hourlyRateEnd", "avgProjectCost", "avgProjectDuration", "totalSpend", "fillRate","subcategoryId"};

categoriesInsightsTopServicesOutputColumns = {"serviceId", "serviceName", "flAvailable", "hourlyRateStart", "hourlyRateEnd", "avgProjectCost", "avgProjectDuration", "totalSpend", "fillRate","subcategoryId"};

serviceInsightsColumns = {
 "name", "flAvailable", "hourlyRateStart", "hourlyRateEnd", "avgProjectCost", "avgProjectDuration", "totalSpend", "fillRate", "categoryId", "subcategoryId"};

serviceInsightsOutputColumns = {
"subcategoryName", "flAvailable", "hourlyRateStart", "hourlyRateEnd", "avgProjectCost", "avgProjectDuration", "totalSpend", "fillRate", "categoryId", "subcategoryId"};

companySelectorColumns =  {"title", "organizationId", "organizationRid", "organizationEnterpriseType"};

companySelectorOutputColumns = {"companyTitle", "companyOrgId", "companyReference", "organizationEnterpriseType"};

companySelectorOutputColumns2 = {"companyTitle", "companyOrgId"};

entObjectProgramSummaryName = "Program Summary";
entObjectUserMetricsName = "Users Metrics";
entObjectUserName = "Users";
entObjectCategoriesMetricsName = "Categories Metrics";
entObjectCategoriesName = "Categories";
entObjectTopServicesName = "Top Services";
entObjectCustomFields = "Custom Fields";

timePeriodList = {"MTD", "QTD", "YTD", "LAST12M"};

//GRAPHQL Based Calls


querySummaryInsights = "query summaryInsights ($timePeriod: InsightsTimePeriod) {   insights {     organizationInsights {       summaryInsights(timePeriod: $timePeriod) {         avgTimeToHire         avgTimeToHireOthers         avgFillRate         avgFillRateOthers         avgFLRating         avgFLRatingOthers         clientUsage {           totalEmployeeCount           registeredUsers           registeredUsersLast30Days           jobPostedUsers           spentUsers           inactiveUsers           projectsLessThan1k           projects1kTo10k           projects10kTo25k           projectsMoreThan25k           totalCategoriesWithNoSpend           totalCategoriesWithSpend           totalCategories           avgFillRate           activeHmCount         }       }     }   } }";


queryHiringManagerInsights = "query hiringManagersInsights ($timePeriod: InsightsTimePeriod, $limit: Int, $offset: Int) {   insights {     organizationInsights {       hiringManagersInsights(timePeriod: $timePeriod, limit:$limit, offset:$offset) {         totalRegistered         totalActive         fillRate         hiringManagers {           hmId           email           spend           fillRate           jobsPosted           registrationDate           daysSinceRegistration           firstName           lastName         }         hiringManagersCount         timePeriod       }     }   } }";


queryCategoriesInsights = "query categoriesInsights ($timePeriod: InsightsTimePeriod, $limit: Int, $offset: Int) {   insights {     organizationInsights {       categoriesInsights(limit: $limit, timePeriod: $timePeriod, offset: $offset) {         activeCategoriesCount         avgProjectCost         jobsPosted         categories {           id           name           spend           spendOthers           avgProjectCost           jobsPosted           description           imageUrl           avgFlRating           avgTimeToHire           topServices {             id             name             flAvailable             hourlyRateStart             hourlyRateEnd             avgProjectCost             avgProjectDuration             totalSpend             fillRate             categoryId             subcategoryId           }           topProjects {             id             title           }           avgProjectDuration           avgProjectDurationOthers         }       }     }   }  }";


queryServiceInsights = "query  serviceInsights ($timePeriod: InsightsTimePeriod, $limit: Int, $offset: Int) {   insights {     organizationInsights {       servicesInsights(timePeriod: $timePeriod, limit: $limit, offset: $offset) {         servicesCount         services {           id           name           flAvailable           hourlyRateStart           hourlyRateEnd           avgProjectCost           avgProjectDuration           totalSpend           fillRate           categoryId           subcategoryId         }       }     }   } }";


queryCompanySelector = "query  {   companySelector {     items {       title       organizationId       photoUrl       organizationRid       organizationType       organizationLegacyType       organizationEnterpriseType       legacyEnterpriseOrganization     }   } }";


queryCustomFields = "query customFields ($input: CustomFieldsInput!, $limit: Int, $offset: Int)  {  customFields (input: $input, offset: $offset, limit: $limit){ labelSnap    displayValueSnap rollupAssignmentId  stale}}";


queryOffers = "query offers($after: String, $first: Int!) {  organization {    id    clientOffers(pagination: {after: $after, first: $first}) {      totalCount      edges {        cursor        node {          id          title          offerCreatedDateTime          contactPerson {            id            nid            rid  email name          }  freelancer {            id            nid            rid            freelancerProfile{              aggregates{                jobSuccessScore                topRatedStatus              }            }          }           offer {            id createdUsingBYOFlow           offerTerms {              expectedEndDate              expectedStartDate            }            offerFeatures {              purchaseOrder {                orderNumber              }              privateTalentCloud {                name              }              eor            }          }        }      }    }  }}";

queryContracts = "query contracts($after: String, $first: Int!) {  organization {    id    clientOffers(pagination: {after: $after, first: $first}) {      totalCount      edges {        cursor        node {          contract {            id            title            feedback {              clientFeedback {                score                freelancerResponse                comment              }              freelancerFeedback {                score                clientResponse                comment        recommendScore      }            }          }        }      }    }  }}";

queryMilestones = "query milestones($contractid: ID){  contract(id: $contractid) {    id    title    milestones {      id      description      dueDateTime      state      createdBy {        id        nid        rid      }    }  }}";

[DataSource.Kind="Upwork", Publish="Upwork.Publish"]

// shared Upwork.Contents = () as any =>
//     let
//         source = Upwork.GetBilling()
//     in
//         source;

shared Upwork.Contents = Value.ReplaceType(Upwork.NavImpl, Upwork.NavImplType);
Upwork.NavImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.Contents.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.Contents.LongDescription")
        ];

Upwork.NavImpl =  () as table =>
    let
        objects = #table(
            {"Name",       "Key",  "Data", "ItemKind", "ItemName", "IsLeaf"},{
            {"Teams",   "Teams",  Upwork.GetTeams() , "Table",    "Table",    true},
            
            {"Contracts",   "Contracts",  Upwork.GetContracts() , "Table",    "Table",    true},
            {"Contracts Extended", "Contracts Extended", Upwork.GetContractsExtended(), "Table", "Table", true},

            {"Milestones", "Milestones", Upwork.GetMilestones(), "Table", "Table", true},
            {"Offers",   "Offers",  Upwork.GetOffers() , "Table",    "Table",    true},
            
            {"Freelancers",   "Freelancers",  Upwork.GetFreelancers() , "Table",    "Table",    true},
            {"Jobs",   "Jobs",  Upwork.GetJobs() , "Table",    "Table",    true},
            {"Billing",   "Billing",  Upwork.GetBilling() , "Table",    "Table",    true},
            {"Contract Hours",   "Contract Hours",  Upwork.GetTotalHoursWorked() , "Table",    "Table",    true},

            {"_Enterprise Reporting Insights", "_Enterprise Reporting Insights", Upwork.GetEntReportingObjects(), "Table", "Table", false}
        }),
        NavTable = Upwork.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        NavTable;

/** Code to support Enterprise reporting endpoints **/

//
// Get Top Level Enterprise objects
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//

Upwork.GetEntReportingObjects = () as table =>
    let 
        entReportingObjectsHeader = {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"}, 
        entReportingObjectsValues =  
          {
            {"Companies", "Companies", Upwork.GetTopLevelEnterprises(), "Table", "Table", true},
             {"Custom Fields",   "Custom Fields",  Upwork.GetCustomFields() , "Table",    "Table",    true},
            {"Program Summary",   "Program Summary",  Upwork.GetEntReportingwithTimePeriod(entObjectProgramSummaryName) , "Table",    "Table",    false},
            {"Users Metrics",   "Users Metrics", Upwork.GetEntReportingwithTimePeriod(entObjectUserMetricsName) , "Table",    "Table",    false},
            {"Users",   "Users",  Upwork.GetEntReportingwithTimePeriod(entObjectUserName) , "Table",    "Table",    false},
            {"Categories Metrics",   "Categories Metrics", Upwork.GetEntReportingwithTimePeriod(entObjectCategoriesMetricsName) , "Table",    "Table",    false},
            {"Categories",   "Categories",  Upwork.GetEntReportingwithTimePeriod(entObjectCategoriesName) , "Table",    "Table",    false},
            {"Top Services",   "Top Services",  Upwork.GetEntReportingwithTimePeriod(entObjectTopServicesName) , "Table",    "Table",    false}
          },

        objects = #table(entReportingObjectsHeader, entReportingObjectsValues),
        table = Upwork.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        table;


//
// Get Enterprise objects as per supported Time Periods
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//

Upwork.GetEntReportingwithTimePeriod = (entObjectName) =>
    let 
        entReportingObjectsHeader = {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"}, 
    
        entReportingObjectsValues =  List.Accumulate(timePeriodList, {}, 
                    (state, current) => state & 
                     {{ entObjectName & " - " & current, 
                        entObjectName & " - " & current, 
                        Upwork.ExecuteEntReporting(entObjectName, current), 
                        "Table", 
                        "Table", 
                        true}}),

        objects = #table(entReportingObjectsHeader, entReportingObjectsValues),
        table = Upwork.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        table;

//
// Get Enterprise Reporting data
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//

Upwork.ExecuteEntReporting = (entObjectName, timePeriod) =>

    let
        data = if entObjectName = entObjectProgramSummaryName then Upwork.GetEntProgramSummary(timePeriod) 
                else if entObjectName = entObjectUserMetricsName then Upwork.GetEntHiringManagersMetrics(timePeriod)
                else if entObjectName = entObjectUserName then Upwork.GetEntHiringManagersSummary(timePeriod)
                else if entObjectName = entObjectCategoriesMetricsName then Upwork.GetEntCategoriesMetrics(timePeriod)
                else if entObjectName = entObjectCategoriesName then Upwork.GetEntCategoriesSummary(timePeriod)
                else if entObjectName = entObjectTopServicesName then Upwork.GetEntTopServicesSummary(timePeriod)
                else if entObjectName = entObjectCustomFields then Upwork.GetCustomFields()
                else null
    in
        data;


//
// Get Summary for Enterprise reporting
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//
Upwork.GetEntProgramSummary = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntProgramSummaryBase([companyOrgId], timePeriod)),

        #"Expanded source" = Table.ExpandRecordColumn(data, "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source", "data", {"insights"}, {"insights"}),
        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"summaryInsights"}, {"summaryInsights"}),
        #"Expanded summaryInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "summaryInsights", summaryInsightsTopLevelColumns),
        #"Expanded clientUsage" = Table.ExpandRecordColumn(#"Expanded summaryInsights", "clientUsage", summaryInsightsClientUsageColumns),

        TimePeriodAdded = Table.AddColumn( #"Expanded clientUsage", "timePeriod", each timePeriod),

        #"Changed Type" = Table.TransformColumnTypes(TimePeriodAdded,
            {{"avgTimeToHire", Int64.Type}, 
            {"avgTimeToHireOthers", Int64.Type}, 
            {"totalEmployeeCount", Int64.Type}, 
            {"registeredUsers", Int64.Type}, 
            {"registeredUsersLast30Days", Int64.Type}, 
            {"jobPostedUsers", Int64.Type}, 
            {"spentUsers", Int64.Type}, 
            {"inactiveUsers", Int64.Type}, 
            {"projectsLessThan1k", Int64.Type}, 
            {"projects1kTo10k", Int64.Type}, 
            {"projects10kTo25k", Int64.Type}, 
            {"projectsMoreThan25k", Int64.Type}, 
            {"totalCategoriesWithNoSpend", Int64.Type}, 
            {"totalCategoriesWithSpend", Int64.Type}, 
            {"totalCategories", Int64.Type}, 
            {"activeHmCount", Int64.Type}, 
            {"avgFillRate", Percentage.Type}, 
            {"avgFillRateOthers", Percentage.Type}, 
            {"avgFLRating", type number}, 
            {"avgFLRatingOthers", type number}})

    in
          #"Changed Type";
 

//
// Get Hiring Manager Metrics
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//
Upwork.GetEntHiringManagersMetrics = (timePeriod) as any =>

    let

        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntHiringManagerPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                              1, //fetch 1 page for metrics 
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryHiringManagerInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),
        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"hiringManagersInsights"}, {"hiringManagersInsights"}),
        #"Expanded hiringManagersInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "hiringManagersInsights", hiringManagerInsightsTopLevelColumns),

        #"Removed Columns" = Table.RemoveColumns(#"Expanded hiringManagersInsights",{"hiringManagers"}),

        #"Changed Type" = Table.TransformColumnTypes( #"Removed Columns",
            {{"totalRegistered", Int64.Type}, 
             {"totalActive", Int64.Type}, 
             {"hiringManagersCount", Int64.Type}, 
             {"fillRate", Percentage.Type}})
    in
        #"Changed Type";


//
// Get Hiring Manager Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntHiringManagersSummary = (timePeriod) as any =>

    let
        
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntHiringManagerPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                               -1, //fetch all pages for summary  
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryHiringManagerInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),

        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"hiringManagersInsights"}, {"hiringManagersInsights"}),
        #"Expanded hiringManagersInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "hiringManagersInsights", hiringManagerInsightsTopLevelColumns),

        #"Removed Other Columns" = Table.SelectColumns(#"Expanded hiringManagersInsights", List.Combine({companySelectorOutputColumns2,  {"hiringManagers", "timePeriod"}})),

        #"Expanded hiringManagers" = Table.ExpandListColumn(#"Removed Other Columns", "hiringManagers"),
        #"Expanded hiringManagers1" = Table.ExpandRecordColumn(#"Expanded hiringManagers", "hiringManagers", hiringManagerInsightsHiringManagerColumns),

         FilterRows = Table.SelectRows(#"Expanded hiringManagers1" , each ([hmId] <> null)),

        #"Changed Type" = Table.TransformColumnTypes(FilterRows,
                    {{"hmId", Int64.Type}, 
                     {"jobsPosted", Int64.Type}, 
                     {"daysSinceRegistration", Int64.Type},
                     {"registrationDate", type date}, 
                     {"spend", Currency.Type}, 
                     {"fillRate", Percentage.Type}
                     })
        in
             #"Changed Type";


//
// Get Top Services Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntTopServicesSummary = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntCategoriesPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                               -1, //fetch all pages for summary  
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryCategoriesInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),

        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"categoriesInsights"}, {"categoriesInsights"}),
        #"Expanded categoriesInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "categoriesInsights", {"categories"}),
      
        #"Expanded categories" = Table.ExpandListColumn( #"Expanded categoriesInsights", "categories"),


        #"Expanded categories1" = Table.ExpandRecordColumn(#"Expanded categories", "categories", {"id", "name", "topServices"}, {"categoryId", "categoryName", "topServices"}),
        #"Expanded topServices" = Table.ExpandListColumn(#"Expanded categories1", "topServices"),
        #"Expanded topServices1" = Table.ExpandRecordColumn(#"Expanded topServices", "topServices", categoriesInsightsTopServicesColumns, categoriesInsightsTopServicesOutputColumns),

        TimePeriodAdded = Table.AddColumn( #"Expanded topServices1", "timePeriod", each timePeriod),

        FilterRows = Table.SelectRows(TimePeriodAdded , each ([categoryId] <> null)),

        #"Changed Type" = Table.TransformColumnTypes(FilterRows,
                            {{"flAvailable", Int64.Type}, 
                            {"hourlyRateStart", Currency.Type}, 
                            {"hourlyRateEnd", Currency.Type}, 
                            {"avgProjectCost", Currency.Type}, 
                            {"avgProjectDuration", Int64.Type}, 
                            {"totalSpend", Currency.Type}, 
                            {"fillRate", Percentage.Type}})

        in
             #"Changed Type" ;

//
// Get Categories Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntCategoriesSummary = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntCategoriesPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                               -1, //fetch all pages for summary  
                                                              0, //offset
                                                            timePeriod, //timeperiod
                                                             queryCategoriesInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),

        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"categoriesInsights"}, {"categoriesInsights"}),
        #"Expanded categoriesInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "categoriesInsights", {"categories"}),
      
        #"Expanded categories" = Table.ExpandListColumn( #"Expanded categoriesInsights", "categories"),
        #"Expanded categories1" = Table.ExpandRecordColumn(#"Expanded categories", "categories", categoriesInsightsDetailsColumns, categoriesInsightsDetailsOutputColumns),

        TimePeriodAdded = Table.AddColumn( #"Expanded categories1", "timePeriod", each timePeriod),
        
        FilterRows = Table.SelectRows(TimePeriodAdded , each ([categoryId] <> null)),

         #"Changed Type" = Table.TransformColumnTypes(FilterRows,
                    {{"spend", Currency.Type}, 
                    {"spendOthers", Currency.Type}, 
                    {"avgProjectCost", Currency.Type}, 
                    {"avgProjectDurationOthers", Int64.Type}, 
                    {"avgProjectDuration", Int64.Type}, 
                    {"avgTimeToHire", Int64.Type}, 
                    {"avgFlRating", type number}, 
                    {"jobsPosted", Int64.Type}})
        in
             #"Changed Type" ;


//
// Get Categories Metrics
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntCategoriesMetrics = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntCategoriesPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                                 1, //fetch 1 page for metrics 
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryCategoriesInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),
        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"categoriesInsights"}, {"categoriesInsights"}),
        #"Expanded categoriesInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "categoriesInsights", categoriesInsightsTopLevelColumns),
      

        TimePeriodAdded = Table.AddColumn(#"Expanded categoriesInsights", "timePeriod", each timePeriod),

         #"Changed Type" = Table.TransformColumnTypes( TimePeriodAdded,
                    {{"activeCategoriesCount", Int64.Type}, 
                     {"jobsPosted", Int64.Type}, 
                     {"avgProjectCost", Currency.Type}
                     })
        in
             #"Changed Type" ;


// DO NOT USE
// Get All Services Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntAllServicesSummary = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntServicesPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                                  -1, //fetch all pages for Summary 
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryServiceInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),

        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"servicesInsights"}, {"servicesInsights"}),
        #"Expanded servicesInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "servicesInsights", {"services"}),
      
        #"Expanded services" = Table.ExpandListColumn( #"Expanded servicesInsights", "services"),


        #"Expanded services1" = Table.ExpandRecordColumn(#"Expanded services", "services",
                                            serviceInsightsColumns,
                                            serviceInsightsOutputColumns),

        TimePeriodAdded = Table.AddColumn( #"Expanded services1", "timePeriod", each timePeriod),

         FilterRows = Table.SelectRows(TimePeriodAdded , each ([subcategoryId] <> null)),

        #"Changed Type" = Table.TransformColumnTypes(FilterRows,
                            {{"flAvailable", Int64.Type}, 
                            {"hourlyRateStart", Currency.Type}, 
                            {"hourlyRateEnd", Currency.Type}, 
                            {"avgProjectCost", Currency.Type}, 
                            {"avgProjectDuration", Int64.Type}, 
                            {"totalSpend", Currency.Type}, 
                            {"fillRate", Percentage.Type}})

        in
             #"Changed Type" ;


//
// Get Custom Fields
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetCustomFields = () as any =>

    let //get mapping between teams_id -> company ref -> company Org Id
        teams = Upwork.GetTeams(),
        topLevelEnt = Upwork.GetTopLevelEnterprises(),

        #"Merged Queries" = Table.NestedJoin(teams, {"company_id"}, topLevelEnt, {"companyReference"}, "Companies", JoinKind.Inner),
        #"Expanded Companies" = Table.ExpandTableColumn(#"Merged Queries", "Companies", {"companyOrgId"}, {"companyOrgId"}),
        
        dateFilter = Date.ToText(#date(Date.Year(DateTime.LocalNow())-2, 1, 1), "yyyy-MM-dd"),
        contracts = Upwork.GetContractsPaged(contractUrl, [created_time_from=dateFilter]),

        contractsTransformed = Table.TransformColumnTypes(contracts, {{"buyer_team_id", Int64.Type}}),
         #"Merged Queries2" = Table.NestedJoin(contractsTransformed, {"buyer_team_id"},  #"Expanded Companies", {"team_id"}, "Teams", JoinKind.Inner),
       
         #"Expanded Teams" = Table.ExpandTableColumn(#"Merged Queries2", "Teams", {"companyOrgId"}, {"companyOrgId"}),

        #"Added Index" = Table.AddIndexColumn(#"Expanded Teams", "Index", 1, 1),
        #"Removed Other Columns" = Table.SelectColumns(#"Added Index",{"Index", "contract_id", "companyOrgId"}),
        
        total_rows = Table.RowCount(#"Removed Other Columns"),
        contract_groups_orig = Number.Round(total_rows/contractsPerCall, 0),

        contract_groups = if contract_groups_orig = 0 then 1 else contract_groups_orig,

        #"Added Custom" = Table.AddColumn(#"Removed Other Columns", "contract_group", each Number.Mod([Index], contract_groups)),
        #"Grouped Rows" = Table.Group(#"Added Custom", {"contract_group", "companyOrgId"}, {{"List", each _, type table [Index=number, contract_id=number, contract_group=number, companyOrgId=text]}}),

        #"Added Custom1" = Table.AddColumn(#"Grouped Rows", "contract_ids", each Table.Column([List], "contract_id")),
        #"Extracted Values" = Table.TransformColumns(#"Added Custom1", {"contract_ids", each Text.Combine(List.Transform(_, Text.From), ","), type text}),
       
        #"Removed Columns" = Table.RemoveColumns(#"Added Custom1" ,{"List"}),
      
        data = Table.AddColumn(#"Removed Columns", "source", 
                            each Upwork.GetCustomFieldsPagedData(
                                            [companyOrgId],//orgid
                                            1, //current page to fetch
                                            -1, //fetch all pages
                                            0, //offset
                                            [contract_ids],
                                            queryCustomFields,//query 
                                            {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"source.data"}),
        #"Expanded source.data" = Table.ExpandRecordColumn(#"Expanded source1", "source.data", {"customFields"}, {"customFields"}),
        #"Expanded customFields" = Table.ExpandListColumn(#"Expanded source.data", "customFields"),
        #"Expanded customFields1" = Table.ExpandRecordColumn(#"Expanded customFields", "customFields", {"rollupAssignmentId", "labelSnap", "displayValueSnap", "stale"}, {"rollupAssignmentId", "labelSnap", "displayValueSnap", "stale"}),
        #"Renamed Columns" = Table.RenameColumns(#"Expanded customFields1",{{"labelSnap", "custom_field"}, {"displayValueSnap", "custom_field_value"}, {"rollupAssignmentId", "contract_id_toplevel"}}),

        #"Removed Columns2" = Table.RemoveColumns(#"Renamed Columns",{"contract_group", "contract_ids"}),
        
        #"Changed Type" = Table.TransformColumnTypes(#"Removed Columns2",{{"contract_id_toplevel", Int64.Type}}),

        #"Filtered Rows" = Table.SelectRows(#"Changed Type", each ([contract_id_toplevel] <> null))

    in
     #"Filtered Rows";
        

//
// Get Top Level Enterprises
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetTopLevelEnterprises = () =>

    let
        graphqlRequest = [query = queryCompanySelector],
        source = Json.Document(Upwork.GraphQLRequest(graphqlRequest)),

        data = source[data],
        companySelector = data[companySelector],
        items = companySelector[items],
        #"Converted to Table" = Table.FromList(items, Splitter.SplitByNothing(), null, null, ExtraValues.Error),

        #"Expanded Column1" = Table.ExpandRecordColumn(#"Converted to Table", "Column1",
                        companySelectorColumns, 
                        companySelectorOutputColumns),
       
        #"Filtered Rows" = Table.SelectRows(#"Expanded Column1", each ([organizationEnterpriseType] <> null)),
       
        TopLevelEnt = Table.SelectColumns( #"Filtered Rows" , {"companyTitle", "companyOrgId", "companyReference"}),
        TopLevelEnt2 = Table.TransformColumnTypes(TopLevelEnt, {{"companyReference", Int64.Type}})

    in
        TopLevelEnt2;

//
// Get Program Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntProgramSummaryBase = (OrgId, timePeriod) =>
    let
        variable = [timePeriod = timePeriod],
        graphqlRequest = [query = querySummaryInsights, variables = variable],

        source = Json.Document(Upwork.GraphQLRequest(graphqlRequest, OrgId)),

        table = if (Record.HasFields(source, "errors")) then 
              error Error.Record(source[errors]{0}[message], source[errors]{0}[message], source[errors])
                else 
                 source
    in 
        table;

// 
// 
//
// Get Hiring Manager Paged Data
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // timePeriod -> the timePeriod of data to fetch
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

//code reference taken from https://github.com/ranmax123/powerbi-custom-connectors/blob/master/ZendeskSupport/code/ZendeskSupport.pq    

Upwork.GetEntHiringManagerPagedData = (orgId, pageNumber, numPagestoFetch, offset, timePeriod, query, result) =>
    let
        limit = recordsPerPage,
        variable = [limit = limit, offset = offset, timePeriod = timePeriod],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId)),

        newResult = List.Combine({result, {response}}),
        hmRecord = try response[data][insights][organizationInsights][hiringManagersInsights][hiringManagers] 
                                otherwise [],
        
        newOffset = offset + limit
    in
       if (Record.HasFields(response, "errors")) then 
            error Error.Record(response[errors]{0}[message], response[errors]{0}[message], response[errors])
        else 
            if pageNumber = numPagestoFetch or 
            (Value.Is(hmRecord, type record ) and Record.FieldCount(hmRecord) = 0)
            or 
            (Value.Is(hmRecord, type list ) and List.Count(hmRecord) = 0)
            then //no more records to fetch or error
              newResult
            else
                Upwork.GetEntHiringManagerPagedData(orgId,
                                                    pageNumber + 1, 
                                                    numPagestoFetch, 
                                                    newOffset, 
                                                    timePeriod, 
                                                    query, 
                                                    newResult);


// 
// 
//
// Get Category Paged Data
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // timePeriod -> the timePeriod of data to fetch
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

Upwork.GetEntCategoriesPagedData = (orgId, pageNumber, numPagestoFetch, offset, timePeriod, query, result) =>
    let
        limit = recordsPerPage,
        variable = [limit = limit, offset = offset, timePeriod = timePeriod],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId)),

        newResult = List.Combine({result, {response}}),
        categoryRecord = try response[data][insights][organizationInsights][categoriesInsights][categories] 
                                otherwise [],
        
        newOffset = offset + limit
    in
       if (Record.HasFields(response, "errors")) then 
            error Error.Record(response[errors]{0}[message], response[errors]{0}[message], response[errors])
        else 
            if pageNumber = numPagestoFetch or 
            (Value.Is(categoryRecord, type record ) and Record.FieldCount(categoryRecord) = 0)
            or 
            (Value.Is(categoryRecord, type list ) and List.Count(categoryRecord) = 0)
            
            then //no more records to fetch or error
                newResult
            else
                Upwork.GetEntCategoriesPagedData(orgId, 
                                                pageNumber + 1, 
                                                             numPagestoFetch, 
                                                             newOffset, 
                                                             timePeriod, 
                                                             query, 
                                                             newResult);

 
// 
//
// Get Services Paged Data
    // orgId -> Org Id
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // timePeriod -> the timePeriod of data to fetch
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

Upwork.GetEntServicesPagedData = (orgId, pageNumber, numPagestoFetch, offset, timePeriod, query, result) =>
    let
        limit = recordsPerPage,
        variable = [limit = limit, offset = offset, timePeriod = timePeriod],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId)),

        newResult = List.Combine({result, {response}}),
        serviceRecord = try response[data][insights][organizationInsights][servicesInsights][services] 
                                otherwise [],
        
        newOffset = offset + limit
    in
       if (Record.HasFields(response, "errors")) then 
            error Error.Record(response[errors]{0}[message], response[errors]{0}[message], response[errors])
        else 
            if pageNumber = numPagestoFetch or 
            (Value.Is(serviceRecord, type record ) and Record.FieldCount(serviceRecord) = 0)
            or 
            (Value.Is(serviceRecord, type list ) and List.Count(serviceRecord) = 0)
            
            then //no more records to fetch or error
               newResult
            else
                Upwork.GetEntServicesPagedData(orgId,
                                                pageNumber + 1, 
                                                             numPagestoFetch, 
                                                             newOffset, 
                                                             timePeriod, 
                                                             query, 
                                                             newResult);



// 
// 
//
// Get Custom Fields Paged Data
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // input -> input for data
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

Upwork.GetCustomFieldsPagedData = (orgId, pageNumber, numPagestoFetch, offset, input, query, result) =>
    let
        limit = recordsPerPage,
        variable = [limit = limit, offset = offset, input = [rollupAssignmentIds = input]],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId)),

        newResult = List.Combine({result, {response}}),
        customFieldsRecord = try response[data][customFields]
                                otherwise [],
        
        newOffset = offset + limit
    in
       if (Record.HasFields(response, "errors")) then 
            error Error.Record(response[errors]{0}[message], response[errors]{0}[message], response[errors])
        else 
            if pageNumber = numPagestoFetch or 
            (Value.Is(customFieldsRecord, type record ) and Record.FieldCount(customFieldsRecord) = 0)
            or 
            (Value.Is(customFieldsRecord, type list ) and List.Count(customFieldsRecord) = 0)
            
            then //no more records to fetch or error
                newResult
            else
                Upwork.GetCustomFieldsPagedData(orgId, 
                                                pageNumber + 1, 
                                                             numPagestoFetch, 
                                                             newOffset, 
                                                             input, 
                                                             query, 
                                                             newResult);

/** Support for Enterprise Reporting Code ends here **/

// 
// 
//
// Get Teams
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

[DataSource.Kind="Upwork"]
shared Upwork.GetTeams = Value.ReplaceType(Upwork.GetTeamsImpl, Upwork.GetTeamsImplType);

Upwork.GetTeamsImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetTeams.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetTeams.LongDescription")
        ];


Upwork.GetTeamsImpl = () =>
    let
        url = teamUrl,
        parameters = [],
        response =  Upwork.Request(false, url, parameters),
        json = Json.Document(response),
        teamMaster = Table.Transpose(Record.ToTable(json)),
        teamMasterTable = Table.PromoteHeaders(teamMaster, [PromoteAllScalars=true]),
        table = Table.ExpandListColumn(teamMasterTable, "teams"),
        expanded = Table.ExpandRecordColumn(table, "teams", teamColumns, teamOutputColumns),

        teams = Table.SelectColumns(expanded, teamOutputFinalColumns),
       
        teamsTable = Table.RenameColumns(teams,{{"server_time", "refreshed_date"}}),

        transformedDate = Table.TransformColumns(teamsTable, 
                                                    {{"refreshed_date", each Upwork.FromTimestampToDate(_)}}),

        transformedTable = Table.TransformColumnTypes(transformedDate,
                    {{"team_id", Int64.Type}, 
                    {"company_id", Int64.Type},
                    {"refreshed_date", type datetime}})
    in
        transformedTable;

//
// Get offers
//
[DataSource.Kind="Upwork"]
shared Upwork.GetOffers = Value.ReplaceType(Upwork.GetOffersImpl, Upwork.GetOffersImplType);

Upwork.GetOffersImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetOffers.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetOffers.LongDescription")
        ];

//
// Get Offers
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//
Upwork.GetOffersImpl = () as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetOffersPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                              -1, //fetch all pages
                                                              0, //offset
                                                             queryOffers,//query 
                                                             {})),
        
        #"Expanded list" = Table.ExpandListColumn(data, "source"),

        #"Expanded source" = Table.ExpandRecordColumn( #"Expanded list", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source", "data", {"organization"}, {"organization"}),
        #"Expanded organization" = Table.ExpandRecordColumn(#"Expanded data", "organization", {"clientOffers"}, {"clientOffers"}),
       
        #"Expanded clientOffers" = Table.ExpandRecordColumn(#"Expanded organization" , "clientOffers", {"edges"}, {"clientOffers.edges"}),
        #"Expanded clientOffers.edges" = Table.ExpandListColumn(#"Expanded clientOffers", "clientOffers.edges"),
        #"Expanded clientOffers.edges1" = Table.ExpandRecordColumn(#"Expanded clientOffers.edges", "clientOffers.edges", {"node"}, {"clientOffers.edges.node"}),
        #"Expanded clientOffers.edges.node" = Table.ExpandRecordColumn(#"Expanded clientOffers.edges1", "clientOffers.edges.node", {"title", "offerCreatedDateTime", "contactPerson", "freelancer", "offer"}, {"clientOffers.edges.node.title", "clientOffers.edges.node.offerCreatedDateTime", "clientOffers.edges.node.contactPerson", "clientOffers.edges.node.freelancer", "clientOffers.edges.node.offer"}),

        #"Expanded clientOffers.edges.node.contactPerson" = Table.ExpandRecordColumn(#"Expanded clientOffers.edges.node", "clientOffers.edges.node.contactPerson", {"id", "nid", "rid", "email", "name"}, 
        {"clientOffers.edges.node.contactPerson.id", "clientOffers.edges.node.contactPerson.nid", "clientOffers.edges.node.contactPerson.rid", "clientOffers.edges.node.contactPerson.email",
         "clientOffers.edges.node.contactPerson.name"}),

        #"Expanded clientOffers.edges.node.offer" = Table.ExpandRecordColumn(#"Expanded clientOffers.edges.node.contactPerson", "clientOffers.edges.node.offer", {"id", "createdUsingBYOFlow", "offerTerms", "offerFeatures"}, {"clientOffers.edges.node.offer.id", "clientOffers.edges.node.offer.byo", "clientOffers.edges.node.offer.offerTerms", "clientOffers.edges.node.offer.offerFeatures"}),
        #"Expanded clientOffers.edges.node.offer.offerTerms" = Table.ExpandRecordColumn(#"Expanded clientOffers.edges.node.offer", "clientOffers.edges.node.offer.offerTerms", {"expectedEndDate", "expectedStartDate"}, {"expectedEndDate", "expectedStartDate"}),
        #"Expanded clientOffers.edges.node.offer.offerFeatures" = Table.ExpandRecordColumn(#"Expanded clientOffers.edges.node.offer.offerTerms", "clientOffers.edges.node.offer.offerFeatures", {"purchaseOrder", "privateTalentCloud", "eor"}, {"purchaseOrder", "privateTalentCloud", "eor"}),
        #"Expanded purchaseOrder" = Table.ExpandRecordColumn(#"Expanded clientOffers.edges.node.offer.offerFeatures", "purchaseOrder", {"orderNumber"}, {"purchase_order"}),

         #"Expanded privateTalentCloud" = Table.ExpandRecordColumn(#"Expanded purchaseOrder", "privateTalentCloud", {"name"}, {"talent_cloud"}),

         #"Expand freelancer" = Table.ExpandRecordColumn(#"Expanded privateTalentCloud","clientOffers.edges.node.freelancer", {"rid", "freelancerProfile"}, {"freelancer_id", "freelancerProfile"}),

         #"Expand freelancerProfile" = Table.ExpandRecordColumn(#"Expand freelancer", "freelancerProfile", {"aggregates"}),

          #"Expand freelancerAggregates" = Table.ExpandRecordColumn(#"Expand freelancerProfile", "aggregates", {"jobSuccessScore", "topRatedStatus"}, {"job_success_score_100", "top_rated_status"}),

        #"Renamed Columns" = Table.RenameColumns(  #"Expand freelancerAggregates" ,{{"clientOffers.edges.node.title", "offer_title"}, {"clientOffers.edges.node.offerCreatedDateTime", "offer_created_date"}, {"clientOffers.edges.node.contactPerson.nid", "contact_person_username"}, 
        {"clientOffers.edges.node.contactPerson.email", "contact_person_email"},
        {"clientOffers.edges.node.contactPerson.name", "contact_person_name"},
        {"clientOffers.edges.node.offer.byo", "fl_byo"},

        {"clientOffers.edges.node.offer.id", "offer_id"}, {"expectedEndDate", "expected_end_date"}, {"expectedStartDate", "expected_start_date"}, {"eor", "eor"}}),


        #"Removed Other Columns" = Table.SelectColumns(#"Renamed Columns",{"offer_title", "offer_created_date", "contact_person_username", "contact_person_email", "contact_person_name", "offer_id", "expected_end_date", "expected_start_date", "purchase_order", "talent_cloud", "eor", "freelancer_id", "job_success_score_100","top_rated_status", "fl_byo"}),


        #"Reordered Columns" = Table.ReorderColumns(#"Removed Other Columns",{"offer_id", "offer_title", "offer_created_date", "contact_person_username", "contact_person_email", "contact_person_name", "expected_end_date", "expected_start_date", "purchase_order", "talent_cloud", "eor", "freelancer_id", "job_success_score_100","top_rated_status", "fl_byo"}),

        #"Filtered Rows" = Table.SelectRows(#"Reordered Columns" , each ([offer_id] <> null)),

        #"Changed Type" = Table.TransformColumnTypes(#"Filtered Rows",
                            {{"offer_created_date", type datetimezone}, 
                            {"expected_end_date", type datetimezone}, 
                            {"expected_start_date", type datetimezone}}),

        #"Changed Type1" = Table.TransformColumnTypes(#"Changed Type",
                            {{"offer_created_date", type date}, 
                            {"expected_end_date", type date}, 
                            {"expected_start_date", type date}, 
                            {"eor", type logical},
                            {"fl_byo", type logical},
                            {"freelancer_id", Int64.Type}})
    in
        #"Changed Type1";
 
// 
//
// Get offers Paged Data
    // orgId -> Org Id
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

Upwork.GetOffersPagedData = (orgId, pageNumber, numPagestoFetch, offset, query, result) =>
    let
        limit = GQLLimit,
        variable = [first = limit, after = Text.From(offset)],
        graphqlRequest = [query = query, variables = variable],

        rawResponse = Upwork.GraphQLRequest(graphqlRequest, orgId, null, 5),
        response = Json.Document(rawResponse),
      

        newResult = List.Combine({result, {response}}),
        offers = try response[data][organization][clientOffers][edges] 
                                otherwise [],
        
        newOffset = offset + limit
    in
         if pageNumber = numPagestoFetch or 
            (Value.Is(offers, type record ) and Record.FieldCount(offers) = 0)
            or 
            (Value.Is(offers, type list ) and List.Count(offers) = 0)
            
            then //no more records to fetch or error
               newResult
            else
                Upwork.GetOffersPagedData(orgId,
                                            pageNumber + 1, 
                                            numPagestoFetch, 
                                            newOffset, 
                                            query, 
                                            newResult);



//
// Get Contracts Extended
//
[DataSource.Kind="Upwork"]
shared Upwork.GetContractsExtended = Value.ReplaceType(Upwork.GetContractsExtendedImpl, Upwork.GetContractsExtendedImplType);

Upwork.GetContractsExtendedImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetContractsExtended.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetContractsExtended.LongDescription")
        ];

//
// Get Contracts Extended
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//
Upwork.GetContractsExtendedImpl = () as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetContractsExtendedPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                              -1, //fetch all pages
                                                              0, //offset
                                                             queryContracts,//query 
                                                             {})),
        
        #"Expanded list" = Table.ExpandListColumn(data, "source"),

        #"Expanded source" = Table.ExpandRecordColumn( #"Expanded list", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source", "data", {"organization"},
        {"organization"}),
      
        #"Expanded organization" = Table.ExpandRecordColumn(#"Expanded data", "organization", {"clientOffers"}, {"clientOffers"}),

        #"Expanded clientOffers" = Table.ExpandRecordColumn(#"Expanded organization", "clientOffers", {"edges"}, {"edges"}),
        #"Expanded edges" = Table.ExpandListColumn(#"Expanded clientOffers", "edges"),
        #"Expanded edges1" = Table.ExpandRecordColumn(#"Expanded edges", "edges", {"node"}, {"node"}),
        #"Expanded node" = Table.ExpandRecordColumn(#"Expanded edges1", "node", {"contract"}, {"contract"}),
        #"Expanded contract" = Table.ExpandRecordColumn(#"Expanded node", "contract", {"id", "feedback"}, {"id", "feedback"}),
        #"Expanded feedback" = Table.ExpandRecordColumn(#"Expanded contract", "feedback", {"clientFeedback", "freelancerFeedback"}, {"clientFeedback", "freelancerFeedback"}),

        #"Expanded clientFeedback" = Table.ExpandRecordColumn(#"Expanded feedback", "clientFeedback", {"score", "freelancerResponse", "comment"}, {"clientFeedback.score", "clientFeedback.freelancerResponse", "clientFeedback.comment"}),

        #"Expanded freelancerFeedback" = Table.ExpandRecordColumn(#"Expanded clientFeedback", "freelancerFeedback", {"score", "clientResponse", "comment", "recommendScore"}, {"freelancerFeedback.score", "freelancerFeedback.clientResponse", "freelancerFeedback.comment", "clientFeedback.recommendScore"}),
       
       #"Renamed Columns" = Table.RenameColumns(#"Expanded freelancerFeedback",{{"id", "contract_id"}, {"clientFeedback.score", "feedback_to_freelancer.score_num"}, {"clientFeedback.freelancerResponse", "feedback_to_freelancer.freelancerResponse"}, {"clientFeedback.comment", "feedback_to_freelancer.comment"}, {"freelancerFeedback.score", "feedback_to_client.score_num"}, {"freelancerFeedback.clientResponse", "feedback_to_client.clientResponse"}, {"freelancerFeedback.comment", "feedback_to_client.comment"}, {"clientFeedback.recommendScore", "feedback_to_freelancer.private_recommend_score"}}),
        #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns",{"companyTitle", "companyOrgId", "companyReference"}),

        #"Filtered Rows" = Table.SelectRows(#"Removed Columns", each ([contract_id] <> null)),

        #"Changed Type" = Table.TransformColumnTypes( #"Filtered Rows",
                                {{"contract_id", Int64.Type}, 
                                {"feedback_to_freelancer.score_num", type number}, 
                                {"feedback_to_client.score_num", type number},
                                {"feedback_to_freelancer.private_recommend_score", Int64.Type}})
    in
        #"Changed Type";
    
// 
//
// Get contracts extended paged data
    // orgId -> Org Id
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

Upwork.GetContractsExtendedPagedData = (orgId, pageNumber, numPagestoFetch, offset, query, result) =>
    let
        limit = GQLLimit,
        variable = [first = limit, after = Text.From(offset)],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId, null, 5)),

        newResult = List.Combine({result, {response}}),
        contracts = try response[data][organization][clientOffers][edges] 
                                otherwise [],
        
        newOffset = offset + limit
    in
         if pageNumber = numPagestoFetch or 
            (Value.Is(contracts, type record ) and Record.FieldCount(contracts) = 0)
            or 
            (Value.Is(contracts, type list ) and List.Count(contracts) = 0)
            
            then //no more records to fetch or error
               newResult
            else
                Upwork.GetContractsExtendedPagedData(orgId,
                                                        pageNumber + 1, 
                                                        numPagestoFetch, 
                                                        newOffset, 
                                                        query, 
                                                        newResult);



//
// Get Contracts per Page
// url -> engagement url
// parameters -> parameters to pass to API, mostly we will pass pagination param
//
Upwork.GetContractsPerPage = (url, parameters) =>
    let
        response =  Json.Document(Upwork.Request(false, url, parameters))
    in
        response;

//
// Get Contracts using pagination
//
Upwork.GetContractsPaged = (url, optional param as record) =>
    
    let
        additionalParam = if param = null then [] else param,
        contractsJsonPaginated = List.Generate( () => 
                        [pageResult = null, total_items = 0, nextOffset = 0, counter = 1],
                         each Number.From([total_items]) <> 0 or [counter] <= 1,
                        each [pageResult = try Upwork.GetContractsPerPage(url, additionalParam &
                                                       [page=Text.From([nextOffset]) & ";" & Text.From(recordsPerPage)]) 
                                           otherwise null, 
                                total_items = try pageResult[engagements][lister][total_items] otherwise 0,
                                nextOffset = [nextOffset] + recordsPerPage,
                                counter = [counter] + 1],
                        each [pageResult]),
        
        contractsJsonPaginated2 = List.Skip(contractsJsonPaginated, 1),
        table = Table.FromList(contractsJsonPaginated2, Splitter.SplitByNothing(), null, null, ExtraValues.Error),

        //CODE FOR HANDLING NO DATA
        tableWithCheck = if Table.IsEmpty(table) then #table(type table[Column1 = [server_time=any,
                                                                                auth_user=any,
                                                                                engagements=any]], {}) else table,
 

        expanded = Table.ExpandRecordColumn(tableWithCheck, "Column1", contractMasterColumns, contractMasterColumns),
        expanded2 = Table.ExpandRecordColumn(expanded, "engagements", contractEnagementColumns, contractEnagementColumns), 

        //API RETURNS AN ARRAY IF MORE THAN ONE ENTRY, NO ARRAY IF ONE ENTRY
        convertToList = Table.TransformColumns(expanded2, { "engagement", each if Value.Is( _, type record ) then { _ } else _ } ),
        listExpanded = Table.ExpandListColumn(convertToList, "engagement"),
        allEngagements = Table.ExpandRecordColumn(listExpanded, "engagement", contractColumns, contractOutputColumns),
    
        allEngagementsSelectedColumns = Table.SelectColumns(allEngagements, contractOutputColumns)

    in
        allEngagementsSelectedColumns;

//
// Get All Contracts through pagination
// Tested for
// 0 contracts - SUCCESS
// 1 contract - 
// More than 1 contracts - SUCCESS 
//
[DataSource.Kind="Upwork"]
shared Upwork.GetContracts = Value.ReplaceType(Upwork.GetContractsImpl, Upwork.GetContractsImplType);

Upwork.GetContractsImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetContracts.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetContracts.LongDescription")
        ];

Upwork.GetContractsImpl = () =>
    let
        url = contractUrl,

        //Get Contracts base data
        allEngagementsSelectedColumns = Upwork.GetContractsPaged(url),
        
        //FEEDBACK RECORD
        feedbackRecord = Table.TransformColumns(allEngagementsSelectedColumns, {{"feedback", each if _ = "" then [] else _}}),
        expandedFeedbackRecord = Table.ExpandRecordColumn(feedbackRecord, "feedback", feedbackColumns, feedbackColumns),
        expandedSubFeedbackRecord = Table.ExpandRecordColumn(expandedFeedbackRecord, "feedback_for_buyer", {"score"}, {"feedback_to_client_score"}),
        expandedSubFeedbackRecord2 = Table.ExpandRecordColumn(expandedSubFeedbackRecord, "feedback_for_provider", {"score"}, {"feedback_to_freelancer_score"}),

        contractsTable = Table.SelectColumns(expandedSubFeedbackRecord2, contractOutputFinalColumns),
      
        withProfileUrl = Table.AddColumn(contractsTable, "contract_url", 
                                        each contractProfileUrl & [buyer_team_id] & "/contracts/" & [contract_id]),

        transformedDate = Table.TransformColumns(withProfileUrl, 
                                                       {{"accept_date", each Upwork.FromTimestampToDate(_)},
                                                       {"start_date", each Upwork.FromTimestampToDate(_)},
                                                       {"end_date", each Upwork.FromTimestampToDate(_)}
                                                       }),

        transformedTable = Table.TransformColumnTypes(transformedDate,
                {
                {"buyer_team_id", Int64.Type},
                {"hourly_charge_rate", Currency.Type}, 
                {"weekly_hours_limit", type number}, 
                {"fixed_price_budget", Currency.Type}, 
                {"freelancer_id", Int64.Type}, 
                {"offer_id", Int64.Type},
                {"contract_id", Int64.Type},
                {"accept_date", type date},
                {"start_date", type date},
                {"end_date", type date}})
    in
        transformedTable;


//
// Get milestones
//
[DataSource.Kind="Upwork"]
shared Upwork.GetMilestones = Value.ReplaceType(Upwork.GetMilestonesImpl, Upwork.GetMilestonesImplType);

Upwork.GetMilestonesImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetMilestones.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetMilestones.LongDescription")
        ];

//
// Get milestone data for active contracts
// Tested for:
// Enterprise - 
// Non Enterprise - 
//
Upwork.GetMilestonesImpl = () as any =>

    let  //get mapping between teams_id -> company ref -> company Org Id
        teams = Upwork.GetTeams(),
        topLevelEnt = Upwork.GetTopLevelEnterprises(),

        #"Merged Queries" = Table.NestedJoin(teams, {"company_id"}, topLevelEnt, {"companyReference"}, "Companies", JoinKind.Inner),
        #"Expanded Companies" = Table.ExpandTableColumn(#"Merged Queries", "Companies", {"companyOrgId"}, {"companyOrgId"}),

        //getting milestone data for active contracts
        contracts = Upwork.GetContractsPaged(contractUrl, [status="active"]),

        contractsTransformed = Table.TransformColumnTypes(contracts, {{"buyer_team_id", Int64.Type}}),
    
        #"Merged Queries2" = Table.NestedJoin(contractsTransformed, {"buyer_team_id"},  #"Expanded Companies", {"team_id"}, "Teams", JoinKind.Inner),
       
        #"Expanded Teams" = Table.ExpandTableColumn(#"Merged Queries2", "Teams", {"companyOrgId"}, {"companyOrgId"}),

        requiredData = Table.SelectColumns(#"Expanded Teams", {"contract_id", "companyOrgId"}),
        
        data = Table.AddColumn(requiredData , "milestones", 
                        each Upwork.GetMilestonesPerContract(
                                                        [companyOrgId],//orgid
                                                            [contract_id])),

        #"Expanded milestones" = Table.ExpandRecordColumn(data, "milestones", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded milestones", "data", {"contract"}, {"contract"}),
        #"Expanded contract" = Table.ExpandRecordColumn(#"Expanded data", "contract", {"milestones"}, {"milestones"}),
        #"Expanded milestones1" = Table.ExpandListColumn(#"Expanded contract", "milestones"),
        #"Expanded milestones2" = Table.ExpandRecordColumn(#"Expanded milestones1", "milestones", {"id", "description", "dueDateTime", "state", "createdBy"}, {"milestone_id", "milestone_description", "dueDateTime", "milestone_state", "createdBy"}),
        #"Expanded createdBy" = Table.ExpandRecordColumn(#"Expanded milestones2", "createdBy", {"nid"}, {"nid"}),
        #"Renamed Columns" = Table.RenameColumns(#"Expanded createdBy",{{"dueDateTime", "milestone_due_date"}, {"nid", "milestone_created_by_username"}}),
       
       #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns",
                   {{"contract_id", Int64.Type}, 
                   {"milestone_id", Int64.Type}, 
                   {"milestone_due_date", type datetimezone}}),

        #"Changed Type1" = Table.TransformColumnTypes(#"Changed Type",
                    {{"milestone_due_date", type date}}),

        #"Filtered Rows" = Table.SelectRows(#"Changed Type1", each ([milestone_id] <> null))

    in
        #"Filtered Rows";
        
        
  

//
// Get Milestones data per contract level
// orgId -> the company OrgId
// contract_id -> the contract_id
//
Upwork.GetMilestonesPerContract = (orgId, contract_id) as any =>
    let
        variable = [contractid = contract_id],
        graphqlRequest = [query = queryMilestones, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId))
    in
        response;

//
// Get Jobs per Page
// url -> job url
// parameters -> parameters to pass to API, mostly we will pass pagination param
// Note: In some cases you can view a team but may not have access to see jobs in that team,
// so passing true in 4th param of Upwork.Request
//
Upwork.GetJobsPerPage = (url, parameters) =>
    let
        response =  Json.Document(Upwork.Request(false, url, parameters, true))
    in
        response;


//
// Get Jobs per team
// url -> job url
// parameters -> team_reference parameter
Upwork.GetJobsPerTeam = (url, parameters) =>
    let
        jobsJsonPaginated = List.Generate( () => 
                        [pageResult = null, total_items = 0, nextOffset = 0, counter = 1],
                        each Number.From([total_items]) <> 0 or [counter] <= 1,
                        each [pageResult = try Upwork.GetJobsPerPage(url, 
                                                             parameters & [page=Text.From([nextOffset]) & ";" & Text.From(recordsPerPage)]) 
                                            otherwise null, 
                                total_items = try pageResult[jobs][lister][total_items] otherwise 0,
                                nextOffset = [nextOffset] + recordsPerPage,
                                counter = [counter] + 1],
                        each [pageResult]),
        
        jobsJsonPaginated2 = List.Skip(jobsJsonPaginated, 1)
    in 
        jobsJsonPaginated2;

//
// Get Jobs
// Jobs are per team, get teams first and then iterate over each team to get jobs
// Tested for:
// 0 job - SUCCESS
// 1 job - SUCCESS
// More than 1 jobs - SUCCESS
//
[DataSource.Kind="Upwork"]
shared Upwork.GetJobs = Value.ReplaceType(Upwork.GetJobsImpl, Upwork.GetJobsImplType);

Upwork.GetJobsImplType = type function(optional status as ( type text meta[
        Documentation.FieldCaption = Extension.LoadString("Upwork.GetJobs.Status.Name"),
        Documentation.FieldDescription = Extension.LoadString("Upwork.GetJobs.Status.LongDescription")]
        )) as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetJobs.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetJobs.LongDescription")
        ];


Upwork.GetJobsImpl = (optional status as text) =>
    let
        jobstatus = if status is null then [] else [status = status],
        url = jobUrl,
        teams = Upwork.GetTeams(),
        response = Table.AddColumn(teams, "Jobs", each 
                                                    try Upwork.GetJobsPerTeam(url, 
                                                                        [buyer_team__reference=Text.From([team_id]), 
                                                                        include_sub_teams=Text.From(1)] & jobstatus)
                                                    otherwise null),

        table = Table.ExpandListColumn(response, "Jobs"),
       
        //CODE FOR HANDLING NO DATA
        tableWithCheck = if Table.IsEmpty(table) then #table(type table[Jobs = {[server_time=any,
                                                                                auth_user=any,
                                                                                jobs=any]}], {}) else table,
 
        expanded1 = Table.ExpandRecordColumn(tableWithCheck, "Jobs", jobMasterColumns, jobMasterColumns),
        expanded2 = Table.ExpandRecordColumn(expanded1, "jobs", jobMaster2Columns, jobMaster2Columns), 

        //API RETURNS AN ARRAY IF MORE THAN ONE ENTRY, NO ARRAY IF ONE ENTRY
        convertToList = Table.TransformColumns(expanded2, { "job", each if Value.Is( _, type record ) then { _ } else _ } ),
        listExpanded = Table.ExpandListColumn(convertToList, "job"),
        jobs = Table.ExpandRecordColumn(listExpanded, "job", jobColumns, jobOutputColumns),
    
        jobsOutputTable = Table.SelectColumns(jobs, jobOutputFinalColumns),
        
        //rename column since when fetching for say buyer_team__reference A, sometimes in output
        //I see sub team in buyer_team__reference column
        jobsTable = Table.RenameColumns(jobsOutputTable, {{"buyer_team__reference", "team_id"}}),

        //remove duplicates since sometimes subteams information is included when fetching teams information
        jobsUniqueTable = Table.Distinct(jobsTable),

        transformedDate = Table.TransformColumns(jobsUniqueTable, 
                                                       {{"job_created_date", each Upwork.FromTimestampToDate(_)}}),
                                                      
        //remove null jobs
        removeBlankRows = Table.SelectRows(transformedDate, each [job_text_id] <> null),

        transformedTable = Table.TransformColumnTypes(removeBlankRows,
                {{"job_created_date", type date},
                {"team_id", Int64.Type}})

    in
        transformedTable;


//
// Get Job applications per Page
// url -> job application url
// parameters -> parameters to pass to API, mostly we will pass pagination param
// Note: In some cases you can view a team but may not have access to see jobs in that team,
// so passing true in 4th param of Upwork.Request
//
Upwork.GetJobApplicationsPerPage = (url, parameters) =>
    let
        response =  Json.Document(Upwork.Request(false, url, parameters, true))
    in
        response;

Upwork.GetJobApplicationsCount = (url, parameters) =>
    let
        jobApps = Upwork.GetJobApplicationsPerPage(url, parameters & [page=Text.From(0) & ";" & Text.From(recordsPerPage)]),
        jobAppsCount = jobApps[data][paging][total]
    in
        jobAppsCount;
//
// Get Job applications per team per job
// url -> job url
// parameters -> team_reference parameter
Upwork.GetJobApplicationsPerTeamJob = (url, parameters) =>
    let
        jobsAppJsonPaginated = List.Generate( () => 
                        [pageResult = null, count = 0, nextOffset = 0, counter = 1],
                        each Number.From([count]) <> 0 or [counter] <= 1,
                        each [pageResult = try Upwork.GetJobApplicationsPerPage(url, 
                                                             parameters & [page=Text.From([nextOffset]) & ";" & Text.From(recordsPerPage)]) 
                                            otherwise null, 
                                count = try pageResult[data][paging][count] otherwise 0,
                                nextOffset = [nextOffset] + recordsPerPage,
                                counter = [counter] + 1],
                        each [pageResult]),
        
        jobsAppJsonPaginated2 = List.Skip(jobsAppJsonPaginated, 1)
    in 
        jobsAppJsonPaginated;

//
// Get Job applications for open jobs
// Tested for: 
// no open jobs
// some open jobs
//
[DataSource.Kind="Upwork"]
shared Upwork.GetJobApplications = Value.ReplaceType(Upwork.GetJobApplicationsImpl, Upwork.GetJobApplicationsImplType);

Upwork.GetJobApplicationsImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetJobApplications.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetJobApplications.LongDescription")
        ];


Upwork.GetJobApplicationsImpl = () =>
    let
        url = jobApplicationUrl,
        jobs = Upwork.GetJobs("open"),
        response = Table.AddColumn(jobs, "num_applications", each 
                                                     Upwork.GetJobApplicationsCount(url, 
                                                                        [buyer_team__reference=Text.From([team_id]), 
                                                                        job_key=Text.From([job_text_id])] )
                                                    ),

        selectedColumns = Table.SelectColumns(response, {"team_id", "job_text_id", "num_applications"})

    in
        selectedColumns;

//
// Get Freelancer's Profile
// Note: sometimes this API fails with 403 error code if profile is disabled
// freelanceRef -> reference freelancer
//
Upwork.GetFreelancerProfile = (freelanceRef) =>
    let 
        freelancerFullUrl = freelancePrefixUrl & freelanceRef & freelanceSuffixUrl,
        parameters = [],
        response = Json.Document(Upwork.Request(false, freelancerFullUrl, parameters, true)),

        errorCode = try response[error][status] otherwise 200,
        output = if errorCode = 403 
                    then [profile=[_is_error=Extension.LoadString("YesString"), 
                                   _error_code=errorCode, 
                                   _error_message=response[error][message]]] else response
    in
        output;

//
// Get Freelancers
// No bulk freelancers API available, hence get contracts first and then query to get freelancer info
// Tested for:
// 0 contracts - SUCCESS
// 1 freelancer - SUCCESS
// more than 1 freelancers - SUCCESS
//
[DataSource.Kind="Upwork"]
shared Upwork.GetFreelancers = Value.ReplaceType(Upwork.GetFreelancersImpl, Upwork.GetFreelancersImplType);

Upwork.GetFreelancersImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetFreelancers.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetFreelancers.LongDescription")
        ];

Upwork.GetFreelancersImpl = () =>
    let
        contracts = Upwork.GetContractsPaged(contractUrl),

        freelancerSelectedColumns = Table.SelectColumns(contracts, {"freelancer_text_id"}),
        uniqueFreelancers = Table.Distinct(freelancerSelectedColumns),
       
                       
        //ADD PROFILE URL
        freelancerTable = Table.AddColumn(uniqueFreelancers, "freelancer_profile_url", each freelanceProfileUrl & [freelancer_text_id]),

        withFreelancerCall = Table.AddColumn(freelancerTable, "freelancer", 
                                             each try 
                                                    Upwork.GetFreelancerProfile([freelancer_text_id])
                                                  otherwise 
                                                    null),
        expandedFreelancerMasterRecord = Table.ExpandRecordColumn(withFreelancerCall, "freelancer", freelancerMasterColumns, freelancerMasterColumns),
        expandedFreelancerRecord = Table.ExpandRecordColumn(expandedFreelancerMasterRecord, "profile", freelancerColumns, freelancerOutputColumns),

        //EXTRACT AGENCY RECORD
        agencyRecord = Table.TransformColumns(expandedFreelancerRecord, {"dev_ac_agencies", 
                                                        each if _ = "" then [] 
                                                             else _ }),

        expanded = Table.ExpandRecordColumn(agencyRecord, "dev_ac_agencies", {"dev_ac_agency"}, {"dev_ac_agency"}), 

         //API RETURNS AN ARRAY IF MORE THAN ONE ENTRY, NO ARRAY IF ONE ENTRY
        agencyNameList = Table.TransformColumns(expanded, { "dev_ac_agency", each if Value.Is( _, type record ) then { _ } else _ } ),

        firstAgencyName = Table.TransformColumns(agencyNameList, { "dev_ac_agency", 
                                                                each if Value.Is(_, type list) then List.First(_) 
                                                                else _}),
        withAgencyName = Table.ExpandRecordColumn(firstAgencyName, "dev_ac_agency", {"ag_name"}, {"agency_name"}),

        freelancerSelectedTable = Table.SelectColumns(withAgencyName, freelancerOutputFinalColumns),

        //UPDATE DATA TYPES
        transformedTable = Table.TransformColumnTypes(freelancerSelectedTable,
                        {{"freelancer_id", Int64.Type},
                        {"total_hours", Int64.Type},
                        {"job_success_score", type number},
                        {"profile_hourly_rate", Currency.Type}})
    in 
       transformedTable;

//
// Converts unix timestamp to date
// timestamp -> unix timestamp
//
Upwork.FromTimestampToDate = (timestamp as any) as any =>
    let
        extractedTimestamp = if timestamp <> null and Text.Length(timestamp) > 10 then Text.Range(timestamp, 0, 10) else timestamp,
        timestampToNumber = try Number.From(extractedTimestamp) otherwise null,
        date = if timestampToNumber <> null then #datetime(1970, 1, 1, 0, 0, 0) + #duration(0, 0, 0, timestampToNumber) else null
    in 
       date; 
//
// Get first day of month starting from startdate till enddate
// startdate -> start date to generate dates
// enddate -> end date
//
Upwork.GetMonthFirstDates = (startdate as date, enddate as date) =>
    let
         Source = List.Generate(
                () => [Date = startdate],
                each [Date] <= enddate,
                each [Date = Date.AddMonths([Date],1)],
                each [Date])

    in
        Source;

//
// Get Billing details
// teamRef -> reference team
// contractRef -> reference engagement
//
Upwork.GetBillingByTeamByContract = (teamRef, contractRef) =>
    let
        billingFullUrl = billingPrefixUrl & teamRef & billingSuffixUrl,
        parameters = [tq=billingQuery & contractRef],
        response = Json.Document(Upwork.Request(false, billingFullUrl, parameters))
    in
        response;


// 
// Get Billing details
// companyRef -> reference company
// querydate -> date filter for query
//
Upwork.GetBillingByCompany = (companyRef, querydate) =>
    let
        billingFullUrl = billingPrefixUrl & companyRef & billingSuffixUrl,
        billingQuerySDate = Text.Replace(billingQuery2, "$sdate$", Date.ToText(querydate, "yyyy-MM-dd")),
        billingQueryEDate = Text.Replace(billingQuerySDate, 
                                        "$edate$", 
                                        Date.ToText(Date.AddDays(Date.AddMonths(querydate,1),-1), "yyyy-MM-dd")),
        parameters = [tq=billingQueryEDate],
        response = Json.Document(Upwork.Request(false, billingFullUrl, parameters))
    in
        response;

// 
// Get Billing details
// Tested for
// 0 billing records per team - SUCCESS
// 1 billing record per team - SUCCESS
// More than 1 billing records per team - SUCCESS
//
[DataSource.Kind="Upwork"]
shared Upwork.GetBilling = Value.ReplaceType(Upwork.GetBillingImpl, Upwork.GetBillingImplType);

Upwork.GetBillingImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetBilling.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetBilling.LongDescription")
        ];

Upwork.GetBillingImpl = () =>
    let
        teams = Upwork.GetTeams(),
        withCompaniesRef = Table.SelectColumns(teams, "company_id"),
        withUniqueCompaniesRef = Table.Distinct(withCompaniesRef),

        teamsWithMonths = Table.AddColumn(withUniqueCompaniesRef, "billing_month", 
                                          each Upwork.GetMonthFirstDates(#date(2018,1,1), 
                                                             DateTime.Date(DateTime.LocalNow())), 
                                          type date),
       
        queryTable = Table.ExpandListColumn(teamsWithMonths, "billing_month"),
      
        //Get billing per team and per month
        response = Table.AddColumn(queryTable, "Billing", each 
                                                    try Upwork.GetBillingByCompany(Text.From([company_id]), [billing_month])
                                                    otherwise null),
        
        expandedMasterBilling = Table.ExpandRecordColumn(response, "Billing", billingMasterColumns, billingMasterColumns),
        expandedRows = Table.ExpandRecordColumn(expandedMasterBilling, "table", {"rows"}, {"rows"}),
        expandedRowsList = Table.ExpandListColumn(expandedRows, "rows"),
        expandedColumns = Table.ExpandRecordColumn(expandedRowsList, "rows", {"c"}, {"c"}),

        //first column is txn_id
        col1 = Table.AddColumn(expandedColumns, "reference", each if Value.Is([c], type list) then List.First([c]) 
                                                             else [c]),
       
        col2 = Table.AddColumn(col1, "date",
                                            each if Value.Is([c], type list) then [c]{1} 
                                            else [c]), 

        col3 = Table.AddColumn(col2, "date_due",
                                            each if Value.Is([c], type list) then [c]{2} 
                                            else [c]), 
        col4 = Table.AddColumn(col3, "assignment__reference",
                                            each if Value.Is([c], type list) then [c]{3} 
                                            else [c]), 

        col5 = Table.AddColumn(col4, "type",
                                            each if Value.Is([c], type list) then [c]{4} 
                                            else [c]), 

        col6 = Table.AddColumn(col5, "subtype",
                                            each if Value.Is([c], type list) then [c]{5} 
                                            else [c]), 
        col7 = Table.AddColumn(col6, "notes",
                                            each if Value.Is([c], type list) then [c]{6} 
                                            else [c]), 
        col8 = Table.AddColumn(col7, "description",
                                            each if Value.Is([c], type list) then [c]{7} 
                                            else [c]), 
        //last column is amount_spent
        colN = Table.AddColumn(col8, "amount", each if Value.Is([c], type list) then List.Last([c]) else [c]),

        expandedReference = Table.ExpandRecordColumn(colN, "reference", {"v"}, {"txn_id"}),
        
        expandedDate = Table.ExpandRecordColumn(expandedReference, "date", {"v"}, {"txn_date"}),
        expandedDateDue = Table.ExpandRecordColumn(expandedDate, "date_due", {"v"}, {"txn_date_due"}),
        
        expandedContract = Table.ExpandRecordColumn(expandedDateDue, "assignment__reference", {"v"}, {"contract_id"}),
        
        expandedType = Table.ExpandRecordColumn(expandedContract, "type", {"v"}, {"type"}),
        expandedSubType = Table.ExpandRecordColumn(expandedType, "subtype", {"v"}, {"accounting_subtype"}),

        expandedNotes = Table.ExpandRecordColumn(expandedSubType, "notes", {"v"}, {"notes"}),

        expandedDescription = Table.ExpandRecordColumn(expandedNotes, "description", {"v"}, {"description"}),

        expandedAmount = Table.ExpandRecordColumn(expandedDescription, "amount", {"v"}, {"amount_spent"}),

        billingTable = Table.SelectColumns(expandedAmount, billingOutputFinalColumns),

        filteredTable = Table.SelectRows(billingTable, each [contract_id] <> null),

        transformedTable = Table.TransformColumnTypes(filteredTable,
                {{"amount_spent", Currency.Type},
                {"contract_id", Int64.Type}})

    in
        transformedTable;

// 
// Get hours worked details
// companyid -> company id
// querydate -> date filter for query
//
Upwork.GetHoursWorkedByTeam = (companyid, querydate) =>
    let
        totalHoursFullUrl = hoursPrefixUrl1 & companyid,
        totalHoursQuerySDate = Text.Replace(totalHoursQuery, "$sdate$", Date.ToText(querydate, "yyyy-MM-dd")),
        totalHoursQueryEDate = Text.Replace(totalHoursQuerySDate, 
                                        "$edate$", 
                                        Date.ToText(Date.AddDays(Date.AddMonths(querydate,1),-1), "yyyy-MM-dd")),
        parameters = [tq=totalHoursQueryEDate],
        response = Json.Document(Upwork.Request(false, totalHoursFullUrl, parameters))
    in
        response;
// 
// Get GetTotalHoursWorked details
//
[DataSource.Kind="Upwork"]
shared Upwork.GetTotalHoursWorked = Value.ReplaceType(Upwork.GetTotalHoursWorkedImpl, Upwork.GetTotalHoursWorkedImplType);

Upwork.GetTotalHoursWorkedImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetTotalHoursWorked.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetTotalHoursWorked.LongDescription")
        ];

Upwork.GetTotalHoursWorkedImpl = () =>
    let
        teams = Upwork.GetTeams(),
        teamsWithCompanyUID = Table.SelectColumns(teams, "company_uid"),
        uniqueCompanyUIDs = Table.Distinct(teamsWithCompanyUID),

        teamsWithMonths = Table.AddColumn(uniqueCompanyUIDs, "worked_on_month", 
                                          each Upwork.GetMonthFirstDates(#date(2018,1,1), 
                                                             DateTime.Date(DateTime.LocalNow())), 
                                          type date),
       
        queryTable = Table.ExpandListColumn(teamsWithMonths, "worked_on_month"),
      
        //Get hours worked per company per team and per month
        response = Table.AddColumn(queryTable, "Hours", each 
                                                    try Upwork.GetHoursWorkedByTeam(
                                                        Text.From([company_uid]),
                                                        [worked_on_month])
                                                    otherwise null),
        
        expandedMasterHours = Table.ExpandRecordColumn(response, "Hours", hoursWorkedMasterColumns, hoursWorkedMasterColumns),
        expandedRows = Table.ExpandRecordColumn(expandedMasterHours, "table", {"rows"}, {"rows"}),
        expandedRowsList = Table.ExpandListColumn(expandedRows, "rows"),
        expandedColumns = Table.ExpandRecordColumn(expandedRowsList, "rows", {"c"}, {"c"}),

        //first column is contract_id
        col1 = Table.AddColumn(expandedColumns, "assignment_ref", each if Value.Is([c], type list) then List.First([c]) 
                                                             else [c]),
       
        col2 = Table.AddColumn(col1, "worked_on",
                                            each if Value.Is([c], type list) then [c]{1} 
                                            else [c]), 

        col3 = Table.AddColumn(col2, "week_worked_on",
                                            each if Value.Is([c], type list) then [c]{2} 
                                            else [c]), 

        //last column is hours
        colN = Table.AddColumn(col3, "hours", each if Value.Is([c], type list) then List.Last([c]) else [c]),

        expandedReference = Table.ExpandRecordColumn(colN, "assignment_ref", {"v"}, {"contract_id"}),
        expandedWorkedOn = Table.ExpandRecordColumn(expandedReference, "worked_on", {"v"}, {"worked_on_date"}),
        expandedWeekWorkedOn = Table.ExpandRecordColumn(expandedWorkedOn, "week_worked_on", {"v"}, {"worked_on_week_start_date"}),

        expandedHours = Table.ExpandRecordColumn(expandedWeekWorkedOn, "hours", {"v"}, {"hours_worked"}),
        
        hoursTable = Table.SelectColumns(expandedHours, hoursWorkedOutputFinalColumns),

        filteredTable = Table.SelectRows(hoursTable, each [contract_id] <> null),

        transformedTable = Table.TransformColumnTypes(filteredTable,
                {
                {"contract_id", Int64.Type},
                {"worked_on_month", type date}, 
                {"worked_on_date", type date},
                {"worked_on_week_start_date", type date},
                {"hours_worked", type number}
                })
    in
        transformedTable;

/* Helper functions for making OAuth 2.0 requests taken from
https://github.com/CurtHagenlocher/Twitter/blob/master/Twitter.pq
*/
Upwork.Request = 
            (isPost, // post or get 
            relativeUrl,  //relative url to base
            otherProps, //other api properties
            optional isManualStatusHandling //for manually handling errors
            ) =>
    let
        method = if isPost then "POST" else "GET",
        headers = [Accept="application/json"],
        queryString = Uri.BuildQueryString(otherProps),
        options = if isPost then [Headers = [#"Content-type" = "application/x-www-form-urlencoded"] & headers, Content = Text.ToBinary(queryString)] else [Headers = headers],
        actualUrl = if isPost or Text.Length(queryString) = 0 then relativeUrl else relativeUrl & "?" & queryString,
        relativePath = [RelativePath = actualUrl],
        manualStatusHandling = if isManualStatusHandling = true then [ManualStatusHandling={403}] else [],
        result = Web.Contents(baseUrl, manualStatusHandling & relativePath & options)
    in
        result;

//GraphQL Request
Upwork.GraphQLRequest = 
            (graphqlParams, //graphql properties,
            optional OrgId,
            optional ManualErrorHandling,
            optional delayInSecondsLocalParam
            ) =>
    let
        method = "POST" ,
        
        headers = [Accept="application/json"],
        headerOrgId = if OrgId <> null then [#"X-Upwork-API-TenantId" = OrgId] else [],

        queryString = Json.FromValue(graphqlParams),
        options = [Headers = [#"Content-type" = "application/json"] & headers & headerOrgId, 
                        Content = queryString] ,
     
        manualStatusHandling = if ManualErrorHandling = null then [] else ManualErrorHandling,
        delayInSec = if delayInSecondsLocalParam = null then delayinSecGlobalParam else delayInSecondsLocalParam,

        result = Function.InvokeAfter(()=>Web.Contents(graphQLUrl, manualStatusHandling & options),
                    #duration(0,0,0, delayInSec))
        in
            result;

/* Authentication functions provided by SDK */
Upwork.StartLogin = (resourceUrl, state, display) =>
    let
        AuthorizeUrl = baseUrl & authenticateUrl & "?" & Uri.BuildQueryString([
            client_id = clientId,  
            redirect_uri = callbackUrl,
            state = state,
            response_type = "code"
        ])
    in
        [
            LoginUri = AuthorizeUrl,
            CallbackUri = callbackUrl,
            WindowHeight = windowHeight,
            WindowWidth = windowWidth,
            Context = null
        ];

Upwork.FinishLogin = (context, callbackUri, state) =>
   let
        parts = Uri.Parts(callbackUri)[Query],
        result = if (Record.HasFields(parts, {"error", "error_description"})) then 
                     error Error.Record(parts[error], parts[error_description], parts)
                    else
                     Upwork.TokenMethod("authorization_code", "code", parts[code])

    in
        result;

Upwork.TokenMethod = (grantType, tokenField, code) =>
    let
        queryString = [
            client_id = clientId,
            client_secret = clientSecret,
            grant_type = grantType,
            redirect_uri = callbackUrl
        ],
        queryWithCode = Record.AddField(queryString, tokenField, code),
        
        token_uri = baseUrl & requestTokenUrl,

        tokenResponse = Web.Contents(token_uri, [
            Content = Text.ToBinary(Uri.BuildQueryString(queryWithCode)),
            Headers = [
                #"Content-type" = "application/x-www-form-urlencoded",
                #"Accept" = "application/json"
            ]
        ]),
        body = Json.Document(tokenResponse),
        result = if (Record.HasFields(body, {"error", "error_description"})) then 
                    error Error.Record(body[error], body[error_description], body)
                 else
                    body
    in
        result;

//Refresh access_token
Upwork.Refresh = (resourceUrl, refresh_token) => 
                Upwork.TokenMethod("refresh_token", "refresh_token", refresh_token);

//Data Source Kind description
Upwork = [
    // TestConnection is required to enable the connector through the Gateway
    TestConnection = (dataSourcePath) => { "Upwork.Contents" },
    Authentication = [
        OAuth=
            [StartLogin=Upwork.StartLogin, 
            FinishLogin=Upwork.FinishLogin,
            Refresh=Upwork.Refresh]
    ],
    Label = Extension.LoadString("DataSourceLabel")
];


// Data Source UI publishing description
Upwork.Publish = [
    Beta = true,
    Category = Extension.LoadString("ConnectorCategory"),
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://github.com/upwork/powerbi-upwork",
    SourceImage = Upwork.Icons,
    SourceTypeImage = Upwork.Icons
];

Upwork.Icons = [
    Icon16 = { Extension.Contents("Upwork16.png"), Extension.Contents("Upwork20.png"), Extension.Contents("Upwork24.png"), Extension.Contents("Upwork32.png") },
    Icon32 = { Extension.Contents("Upwork32.png"), Extension.Contents("Upwork40.png"), Extension.Contents("Upwork48.png"), Extension.Contents("Upwork64.png") }
];

// Navigation Table Helper
Upwork.ToNavigationTable =
(
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(table),
        newTableType = Type.AddTableKey(tableType, keyColumns, true) meta 
        [
            NavigationTable.NameColumn = nameColumn, 
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn, 
            Preview.DelayColumn = dataColumn, 
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(table, newTableType)
    in
        navigationTable;

