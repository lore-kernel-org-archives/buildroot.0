Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44191C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B470A416BC;
	Sat, 23 Jul 2022 21:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B470A416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qdWFKLtict0; Sat, 23 Jul 2022 21:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FD6B416B7;
	Sat, 23 Jul 2022 21:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FD6B416B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05BE91BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D28EA416B7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D28EA416B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDFZ7sl_Wdbo for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:27:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 151324049B
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2124.outbound.protection.outlook.com [40.107.92.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 151324049B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:27:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHY54c2yLNJt6H7GJgz/TFRHp7On/Y4OHTj0s6XWfY2+d4FjbDaBVEeNuITDCOtle8IhmDs3WmhNZGmLyuyyu4btxEmPMEiSz8kyrM72ItDBsT7r5Th9zKV/TmhfW5sNY1yKZaBJqtijYC4xcK98OM81peGLYmYvFwlj+lFqE8FbKQ6vFLSA0LmPuMdwzlSi8uhbWj9ApW1U1JM35ZCVhc2uZTAEWemNCtWainc10ysO6NMXCTPbvqn9HuHHxIEAO+uO+ADc8mgaWaayxLPolTPSl041fQsOuwCiE4waipQsqcW6FJX/LXw4PUoas6qxlS+a/6JDSsXSkLv0rX/+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB8pt2L2jLS8ApKRILxVkeWRF9MHjspHzOAqCiBh01g=;
 b=nXr1B+hS4jC03NjfRe4WHigmZy0GLG4h0ziueKMMO4CzjYb34k4+y2VmTgF+IqUacd1jU9gq0JwcEPBGJlorSGCeYLI8emT81rzeieYO2iHtgwoKUOJCDTGUeNpN2KclwtkyKWinCsOjPTZF+uU34IzQ64A/0HKg6iE4bZXDCzngYc9xyYs0B/rZOOYSu4wlzqrbbx/VTaNVwcx8MtJHUBNvOF03/oZxFph7Kjt2yvxxHeFDHhmoFAFesHeowmvejC6MfLDvHpqbeQvuXV0VAF1GK9PQZxo9Pjv7SkmWZN2Y4pFohX0s/FLqjagZHLizcb6BgGj9EHytiMCu/tykwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BY3PR17MB5267.namprd17.prod.outlook.com (2603:10b6:a03:3c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.21; Sat, 23 Jul
 2022 21:27:20 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5458.020; Sat, 23 Jul 2022
 21:27:20 +0000
Message-ID: <06c4eec4-3b5a-6c8a-56c2-b3fef1bb73bb@phobosdpl.com>
Date: Sat, 23 Jul 2022 16:27:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Sen Hastings <sen@phobosdpl.com>
References: <ad1ce428-7b65-b779-27ec-ea13060abb57@phobosdpl.com>
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
In-Reply-To: <ad1ce428-7b65-b779-27ec-ea13060abb57@phobosdpl.com>
X-ClientProxiedBy: SA1P222CA0043.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::17) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6c0727d-7580-474e-c330-08da6cf2200c
X-MS-TrafficTypeDiagnostic: BY3PR17MB5267:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVsYG+wNbQm2aQatCGmMky0V65x3g01uxLy0K8DJCVCEjAEgqL25p1+WIKSNPN7NeAGZISZdi6dG7YbpBb/4nhHkstn7sP5InYW+Z40s7C77TljnzqWVpcmHu912bzlmp/S7YfaOxCZjJdLn2iYVyLKMN0iIEe26IPSVK63qLgCWDqCcDD9YGrnPobKRC5s7kLHz6mw9H4IT1Tx/fIXkM9iGdWdxUfm7mEyiBMCWXO6P3ahgYeMHi+Lrh489RBhOPmksBhhG/z+VmPUilvhV2Q5ffWFSvTsIp9n+Fgc6rqE2sYd21bbp3NmRUo4OB4OhlT9PxDc76FcdDBzlQDv4x4JD90WBkJtAPCUmirsntE2ZM/vWzIOAGWK9HxzMFb7NQHblifIjLnQm1oXeLeqKyaEdNQe/9jb3nySOZaGqDJrjjopBly8nSlS9aBMMT4KBGQeAWp+Ym1w5nBPZRU31duzyEeMwSpHzA2MWaGBODeJA/5gRTnduWDLcyCS+Sj2kEhWQ43IWjgp7eTdZNcRkFdSLkOrDcTVVPST3B75QtjoCPwjG/LnVGyDAKUMoVvZem48mGLhFUUw3p8Y+MKZk0ObRiGZFnsHH4aMvyElSFhTrPs1R1HO6ZDe/vub2VBhALGgRCeRwEYUnrr1VIXA/lnf1K+EahbJ+AGCL86B16+bjd52urXxzFNERRIkMCThLIH0MZe5v3ldsmOXikD0zLGp34TNNjY8TvaeXSQnsvVH1q5IhHmDRerHtj//sSiKSpoPvA5csi/sO3jF/EXaWhWd0a4qhREbzTb8BmYoxFTkSNvABnIul8oYyY/+Lzarwm/A/BPPm/IgERHGmIF1j9Fovmmtf1C8eiEeSj9rtq9Tp/V9RfbXPM7tN7Tlt1SdPWhO1iC1xlMNkhHcHiBbndg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(346002)(39830400003)(376002)(396003)(186003)(2616005)(83380400001)(66946007)(66556008)(66476007)(8676002)(36756003)(31686004)(6512007)(3450700001)(41300700001)(6506007)(52116002)(53546011)(26005)(2906002)(38350700002)(31696002)(86362001)(38100700002)(5660300002)(316002)(8936002)(478600001)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWc1K0pocUtDdkxoUVJpVythWWNtSVFqOHJlQ3NhVEVneWRHajF1K3NydlpR?=
 =?utf-8?B?UVROS0R1dHZnYkNZeXI5TVhHVmZwaThUdElSVmQxRmhqcEoyZlhwZDJNTDE0?=
 =?utf-8?B?dHNSRE02aVZJT0ExRFJtRklCbVJYTUQ5MUZhRTBTeVJrOVB0Sm5DNHNxZ3gv?=
 =?utf-8?B?NllPWSt5N1BXK0dOWEU1c01mWnNVZGZUMklDT2pZZDF1aWhpd3c0Tms0LzFu?=
 =?utf-8?B?dFZ2WEFtRUpuVjR1WGR6QXFMVHJXby9qempXY3llQ004NU1IWkFBbzRMWSsr?=
 =?utf-8?B?VXIyT2VzbSs2eUoxdlVrTUZIWkF4dXpFNUhHSlE0bVYrVHVhSnZ3QTZqc3FI?=
 =?utf-8?B?bWpib3ZvOXg2TWcyaXhBQWZld2NNRjNHY200Sm1LcW1USzBzSlRCek90NlI3?=
 =?utf-8?B?S2VxRStUQWJRYnRoY3k0cldQU2VGckFKdDFUZ2lpWDFlM1hrc3FLV3pyMGtH?=
 =?utf-8?B?blg0VmFHYnRVUGtmOFF6ZmRiTzNJa0NGRW5DUlc1VGdzQzNZQkdzc3FscHM3?=
 =?utf-8?B?bnJERzlYNmV2SjlqRmErQjljNjJ4VVlFb2pQZ2hPSm11SjNhaXZ6VGUrck5t?=
 =?utf-8?B?OGZWaTMxNUZ2N2pQTU1TbHIzVW5Rb0RGOVdtRTlDRS9kWXJTb1A5anlBYW1w?=
 =?utf-8?B?aTg4SVdNNzJ5eXFrbDlIZEhyWXZyU2xZZFZpMEp5cUhMVElSNmtaaFhGWlhF?=
 =?utf-8?B?dzhxcDJHeGFjZ3BpZ2syQThtS3kxdXJMUTdtV3h1ZGJIYnY0cWFhWWhickZS?=
 =?utf-8?B?OXVYeGR2cWFrSU1YWTJSSjdjZVJrMEhpZWI3L0NuMnFHZUlYYjBPVDk0QWpK?=
 =?utf-8?B?UnZRb041ZTNQb24xL1gwcmNtLzlMR01xTjczWEZaNC9vUi8xYkFLZndKanJz?=
 =?utf-8?B?eXVZaDJISjZMNzJoTnhKNWxYbit5OHV6THZIeUQ5eFR2SGUwUThDUXJBTys4?=
 =?utf-8?B?YzFRUmtTRjBsWE9JVlJneFdpUHVNVG5PYXVXdC9INWtjcWZWem1ocGRTRXR0?=
 =?utf-8?B?VjFGS3dvOU9ZL05DRENPRm1aZFFKQjFRZzh3K3ZESjRzS3RDL2VZVEY4Zlpq?=
 =?utf-8?B?Y3UycGxXOWhONG13T2VNbExIZzZqeWtaUCtWL3FySFhDSFYwNWxndTJXN1lT?=
 =?utf-8?B?d2pnNXB4Y0svNWxxaDVYTGF4dnhDT2EySGYyN280dHRyaVRSVlpUcXJUaWpQ?=
 =?utf-8?B?eVVua2h6b2FnZFNmTkhiQ0swL3h1YWxqMGhnbU4rOHUvU3duY3EwTWY1am1K?=
 =?utf-8?B?cjdrR3VzZHN1VCtKUHhIOGJwTEhGVmh2YW5jT1BRdGtXRHg2S1hydE5YdDJY?=
 =?utf-8?B?eUtzNXNHUVNTSDJKNnozekQ2ZkwrSy9ROTRHQWhYTWJXSWtzWXhwWU9IbkJr?=
 =?utf-8?B?bUJUdVdtSUNMQjJ0TVhiVm5scExacXZ4SURFUHNzZUdqdEMrQ01CRUh5dENC?=
 =?utf-8?B?eXN3a2l0c1ZNRFNNTTJqNm1xQVVTOEdjZE9BSC9WdTFLeFhQdHZiNW5yQ01t?=
 =?utf-8?B?VFUwazBpRkUxQktBMEI5Wk1qdFNKd0pOTDJaQXB0VEJNQUJQWFgvT3I1VTlO?=
 =?utf-8?B?NmNsQk9NUkNVVWlxNnBWSHBpSzRHUStlZkRaZnZRV3hBVTN5QTBCV0JmaThx?=
 =?utf-8?B?dURhM1puL1B2U2hyN3Zrdjl4T3FHcXpubFBMTnR6MmxQOXV0WXYxOXNNRWpT?=
 =?utf-8?B?YnRLd0JRNzRsUXB4b2Y3eXlYdHA1TEtvUHdSbWthalFpSDRvNWhPbFdBaUVy?=
 =?utf-8?B?RG9TR0VDZ0R5NG1FTitYcnBHcG5JWXYzNEdYb2Y5MHA2RVlNa2swekFmUi9J?=
 =?utf-8?B?cmxicnFNYTJBZmVxSFFaNmpIZGhpaXhRQ2N1S2duZ0M4L1VDT29OZk9MY21E?=
 =?utf-8?B?S3crRlY4Sjl4bnlXVU5uSndNZURYek96SGFaYkI2UXIrSGQ4aE4yaW04bDJl?=
 =?utf-8?B?clRxQncrT3FMSVg4eExEYmRtT05HYmZrNlRPRWk0eU1PbkhkWW5OS3VCemwy?=
 =?utf-8?B?Y2lTdDdVd3NnVE5uTHUvYzNPVlNpOHcrakExK0JvcWszQTE3bFZUck5DRlBS?=
 =?utf-8?B?ZlpDTDhHWUxJUVU1NVNhRTJDcWRsMko5elJRaUJSd0ZtdzBuUnJkcDFQVHFk?=
 =?utf-8?Q?8BukdPAB5CRN3GZflNWcyAwiq?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c0727d-7580-474e-c330-08da6cf2200c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 21:27:20.3345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR7ptvBVvFuP37DgwRvKlVywvFLU78JgZa7jt19YN3DxqbN013qsQxKcGNGtMOiOEc+8J65aL8Ch+Xv+y6VyJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR17MB5267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB8pt2L2jLS8ApKRILxVkeWRF9MHjspHzOAqCiBh01g=;
 b=zvdEFHr0Ssu3TOkBwbJRu/KMw6s2ObGclDSKe7syn7bBxLr83/KIP3Ml+MyPbrjbrKEd+O1dubhbUgDVGJ9xVlLaXNt3Jtjn7V6tkisHPj4ciug6QNh567kNcTwjV+ShMH/M13WSgDk1wNbG8H4GLedItY718NVVSzI+URE3UGI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=zvdEFHr0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8
 errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/23/22 12:47, Arnout Vandecappelle (Essensium/Mind) wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=bf178754efbb8cc32f2aacc94327d34484e1d738
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Commit f1bcb2a45c4ba42d8dea3ba7c3413cb1d0fcab93 introduced a number of
> flake8 errors. Fix these by:
> - adding noqa to the multi-line string containing tabs;
> - replacing other tabs with spaces;
> - removing space after opening parenthesis;
> - splitting the long lines.
> Looks all good from my end.

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Sen Hastings <sen@phobosdpl.com>
Tested-by: Sen Hastings <sen@phobosdpl.com>
> ---
>  support/scripts/pkg-stats | 61 ++++++++++++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 24 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 6dc206d2bc..a4bb5ae599 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -828,7 +828,7 @@ function sortGrid(sortLabel){
>  <a href=\"#results\">Results</a><br/>
>  
>  <p id=\"sortable_hint\"></p>
> -"""
> +"""  # noqa - tabs and spaces
>  
>  
>  html_footer = """
> @@ -865,8 +865,8 @@ def boolean_str(b):
>  
>  
>  def dump_html_pkg(f, pkg):
> -    f.write( f'<div id=\"package_{pkg.name}\" \
> -	class=\"package data {pkg.name}\">{pkg.path}</div>\n')
> +    f.write(f'<div id=\"package_{pkg.name}\" \
> +        class=\"package data {pkg.name}\">{pkg.path}</div>\n')
>      # Patch count
>      data_field_id = f'patch_count_{pkg.name}'
>      div_class = ["centered patch_count data"]
> @@ -877,8 +877,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("somepatches")
>      else:
>          div_class.append("lotsofpatches")
> -    f.write( f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -	\">{str(pkg.patch_count)}</div>\n')
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> +        \">{str(pkg.patch_count)}</div>\n')
>  
>      # Infrastructure
>      data_field_id = f'infrastructure_{pkg.name}'
> @@ -889,8 +889,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("wrong")
>      else:
>          div_class.append("correct")
> -    f.write( f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -	\">{infra_str(pkg.infras)}</div>\n')
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> +        \">{infra_str(pkg.infras)}</div>\n')
>  
>      # License
>      data_field_id = f'license_{pkg.name}'
> @@ -901,7 +901,7 @@ def dump_html_pkg(f, pkg):
>      else:
>          div_class.append("wrong")
>      f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -	\">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
> +        \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
>  
>      # License files
>      data_field_id = f'license_files_{pkg.name}'
> @@ -912,7 +912,7 @@ def dump_html_pkg(f, pkg):
>      else:
>          div_class.append("wrong")
>      f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -	\">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
> +        \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
>  
>      # Hash
>      data_field_id = f'hash_file_{pkg.name}'
> @@ -923,7 +923,7 @@ def dump_html_pkg(f, pkg):
>      else:
>          div_class.append("wrong")
>      f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -	\">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
> +        \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
>  
>      # Current version
>      data_field_id = f'current_version_{pkg.name}'
> @@ -932,7 +932,7 @@ def dump_html_pkg(f, pkg):
>      else:
>          current_version = pkg.current_version
>      f.write(f'  <div id=\"{data_field_id}\" \
> -	class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
> +        class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
>  
>      # Latest version
>      data_field_id = f'latest_version_{pkg.name}'
> @@ -1059,19 +1059,32 @@ def dump_html_pkg(f, pkg):
>  def dump_html_all_pkgs(f, packages):
>      f.write("""
>  <div id=\"package-grid\">
> -<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\" class=\"package data label\"><span>Package</span><span></span></div>
> -<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\" class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
> -<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\" class=\"centered infrastructure data label\">Infrastructure<span></span></div>
> -<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\" class=\"centered license data label\"><span>License</span><span></span></div>
> -<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\" class=\"centered license_files data label\"><span>License files</span><span></span></div>
> -<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\" class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
> -<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\" class=\"centered current_version data label\"><span>Current version</span><span></span></div>
> -<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\" class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
> -<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\" class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
> -<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\" class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
> -<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\" class=\"centered cves data label\"><span>CVEs</span><span></span></div>
> -<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\" class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
> -<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\" class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
> +<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\"
> +     class=\"package data label\"><span>Package</span><span></span></div>
> +<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\"
> +     class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
> +<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\"
> +     class=\"centered infrastructure data label\">Infrastructure<span></span></div>
> +<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\"
> +     class=\"centered license data label\"><span>License</span><span></span></div>
> +<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\"
> +     class=\"centered license_files data label\"><span>License files</span><span></span></div>
> +<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\"
> +     class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
> +<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\"
> +     class=\"centered current_version data label\"><span>Current version</span><span></span></div>
> +<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\"
> +     class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
> +<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\"
> +     class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
> +<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\"
> +     class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
> +<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\"
> +     class=\"centered cves data label\"><span>CVEs</span><span></span></div>
> +<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\"
> +     class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
> +<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\"
> +     class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
>  """)
>      for pkg in sorted(packages):
>          dump_html_pkg(f, pkg)
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
