{{ config(materialized='table', alias='badges_table') }}

select
value:"@Class" as Class,
value:"@Date"::Timestamp as Date,
value:"@Id" as Id,
value:"@Name" as Name,
value:"@TagBased"::Boolean as TagBased,
value:"@UserId" as UserId
from "MINIASSIGNMENT"."MINIASSIGNMENT"."BADGES", 
lateral flatten(to_array("MINIASSIGNMENT"."MINIASSIGNMENT"."BADGES".src_xml:"$"))
