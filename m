Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58643C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 10:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02FEC6117A;
	Tue, 31 May 2022 10:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id juZrEuVbCqi0; Tue, 31 May 2022 10:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309246116C;
	Tue, 31 May 2022 10:14:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF6581BF271
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBEAE41836
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjTNou0bZyZu for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 10:13:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60078.outbound.protection.outlook.com [40.107.6.78])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC111417A5
 for <buildroot@buildroot.org>; Tue, 31 May 2022 10:13:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIRvLZaoeQG0sl37y/4HPtzB3qcjn6o7RGh3UEY4K/g/2fzlKYBww99r6xwINe9h8PQuRy7MVPakhcZcVA2vc+t5bbDDzWRGZnpAbGDHIUyfIITH9xNQO4lmm3kBiQ+2fJzde2JbXJ7Y3INthAjG/YI5uVlhV+357c/eiqQhfpoaXP96hzAzz4ScRLgS9uOwf0pBIjH3vlNT+TYAKpPkwZJ2kLtM30MdXuhFyk3y7Nole+iJqzGRw8efUqAprckk2pDfRieo+ZlF/FWTcGxYDm4LC4W/gZ90AvOlX3Xjh3iZ95bbp+faY5LoJ6Hm/ro+WO8jIcxs3/2WLxAKHYGLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aI7euAV+TivPwOSh17e7BrfpZa00jqSG4mos9z2qYnE=;
 b=Wa+NjW9u3YsNTacR0DjuMxhkelxXGMlgVc1wcqx56+oI05nOwcE4jg0eployAWk5aNDGNPsv9UDCGu59WTGcKm1AQb2y6ZpBfIhOPRyuiMY7Ie7seY+8p8UpBeL1TfbXUeFnMyUyiGsvcAGXFH4SMlLoc0GI2NyoLG/OgUlyF184ECgY7g0vRQETsaHfcf+4sB82H6yjslOTeNjqDGc4SarUwoqcE6AOEM0lK3IuXCGqKpsAJPLs1SAWbWsSPhPNpQ5iQRf3INRjIfv+t1HSOFZHhT1+mOm2iSWBlMGDco9RjVs6ZP/qejxqWecZRqNPCVctIjfD5rnOERhKiwf06Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI7euAV+TivPwOSh17e7BrfpZa00jqSG4mos9z2qYnE=;
 b=bDlTRdahmK5cSAXwoIM/GRNXfzWZ1oTDsqD+kkR/pO1sBfRFL+13SiWBekFXCsnxryTye3gfg71vVCjjB8eQP3hsU5WE/JDDIA1F8CJ7gZ7by5eHVq9QYhPHxamJI1j0Wd1ySUZ1lrPyKFFiFg+Fs4Ndo2s6SdvZnSB7op0S82E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 10:13:53 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%5]) with mapi id 15.20.5293.018; Tue, 31 May 2022
 10:13:53 +0000
Message-ID: <4c4b80ae-4994-6638-6b35-aa3f52c1a4ae@theobroma-systems.com>
Date: Tue, 31 May 2022 12:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220511110619.1610327-1-foss+buildroot@0leil.net>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220511110619.1610327-1-foss+buildroot@0leil.net>
X-ClientProxiedBy: AS9PR06CA0757.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::10) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b74ee2d-255b-4422-13f8-08da42ee43b8
X-MS-TrafficTypeDiagnostic: AM9PR04MB8438:EE_
X-Microsoft-Antispam-PRVS: <AM9PR04MB84383CFDED0E9BF56D3CAF51C2DC9@AM9PR04MB8438.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Doab5TiwIF7j/Yqqy8JznLNb94OCOIULsDifj6jzC/C4ktyW3f2mJ7/BZHjm40/JlLY8LHY6NWjAfQgVIBBBVnreSuhz8HNAy0yez/kLB6meNJH+Ad9HawT/pDgJX7EEa74S0Dx9Zja3leHehHZ5DxWB+uIlinfsR4ZX46QJlnlPysCgRYvhiOYgx7o2mi0ooJUCKNT0xvDJrcxGywKUVdGbHfvH3iPNozOg/KGK4NPsthXbO7nN6Sixyyd6ui5I8SZY3W3Kp0NgqrVBNOWZ4V61wbGGHQiY9MVxuvhVwTfIJxEW4MYN65phQYwSvzDZ761IMvwmeHoY7bTwhvoxwiG7J+d38dzq6IzfGlDFjJBnlcXlxWVrRf1PZIdJet9FeC8iQo0hz3zWsJlEnhFZFeFVRSd0MAlVIN7GQWL/YPYt4B1XyeKvpyCEw/cO13wt9NknRzP3Ym0FLXaqsmz0FK9mPRfUmMpxhT0CHybN83adHvjzWhooFS5Jw7l4j8VNroeHfzy250afMbuUNxzImL1I+Q9r9bJAi050PecpTC2AqFtGp/JmuXPjDVzdb+8lnE4pgbchtGD76jFk027uhhzovZpHfCl/PHXdPnilUnWhxD/689iUR0rm+THeSMwPgcMPPLCIb96JwaMe18G3b1iRjd6odXfoCDj33g8o5opMoKP0kuVKO4oKhBndOsLkzXerSJ2wffuFPTK/1d0AQjHyqksBruJY+BgXBXXb0I00paUXyAd7HvD7dMWHkvmI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(86362001)(38100700002)(8676002)(8936002)(5660300002)(4326008)(31696002)(316002)(44832011)(36756003)(66946007)(31686004)(6486002)(66476007)(66556008)(26005)(6512007)(2906002)(53546011)(6506007)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dExiV3paRXNUZjF0Ri9EdWlTYlhpQlJlTVhDbC9UbmtKSitJUXhsbEVFUDg2?=
 =?utf-8?B?eXliRG5CVWxrRXlVTlQ2SzQ0S25YOXhNMVhNeHIvWXBxU2U3VzJtNXFMdnNU?=
 =?utf-8?B?djE5KzZ6UVJZMU80Nm1RZ3JqTzBiVldqVUZDUVJRTU1XWE1pNkVFMm1USTNG?=
 =?utf-8?B?RGpuNVVLVEd6SmlNZWxYYy9MOWlVWlFidEV4bTJqQ05JVUpoNFJPWVJERTVh?=
 =?utf-8?B?cEN0MkExaW5FNG90RjNON0FEOWtOa2k5TlRybTdJWkhrTzFLYlk1dG0yMWt0?=
 =?utf-8?B?aWkrdGdkWFJSV3F1MVhkWDZwbWM1elRydEhzcWZzOXQwazg0RUpZRUsvZ0dj?=
 =?utf-8?B?SXVmaVorcFZ3TjZhRjJnS3RTWlErck9tSURxejBvUHFUZlVNcHVicG9mcDF6?=
 =?utf-8?B?U2p4Rk5HMnpSZThQWWphZkhMRjZlRDNkQzJIbkw2T1k5TE82dVZwY2pnMGVG?=
 =?utf-8?B?WlV5cmZXWG5qVkRSNkZlcGZkS0w2N3Vub3hvaDZKZXQ2MFVWSFJySVJ5MWl1?=
 =?utf-8?B?Mm44czVEZ2tvemJLaWRPRjh2MWNGaVVtbXFUL0JMb1ppSnNwWTlEVE5UWDh2?=
 =?utf-8?B?L1JoUHUyYlgvcTB5NU92dnBwTEFxdW1WeG5tMGd3NCtFMG5kakdJMmVvTmtV?=
 =?utf-8?B?eVd0dmFIaDNnYWtSMyt5dCtDb0dOczVwdzZYNXhEakVHWUkvZHlhTWxtUG9Y?=
 =?utf-8?B?MGl0clVzREpRTllUdTYrUXdzdk8wTTRqNkk4eVVoUzBGdHpYOEViaHJjWUUy?=
 =?utf-8?B?Y2NWSDlMZExTb2paN0cwc2g1S3ZPYTNsbm5tTEM4RUp1YXJjNnF4MnhwOWpZ?=
 =?utf-8?B?SUZ4WTJJdTFQT0pRKzhNUEJDcjJpY1M0RWNvcmxvSXBiL2NhSXp0aVBrL1V0?=
 =?utf-8?B?THBQdGpKM0srNXZyZ1ZQT1pJK0ZsTnFyc1Zobll4VFp3cE9ON0I5RmkvQTNr?=
 =?utf-8?B?Q016L3BQV29oRGIzbStudnBJYVJFeG4yd2pZNlRwNzVid3p6YlloT3pwdmJw?=
 =?utf-8?B?SzB4blpVNm5GVlNmQWsxYTd6SkNMWWh3NUppKzNpcGluSDhGT25GcnhkV0RJ?=
 =?utf-8?B?Y1ZzQXdqSE0zVjhsU1k0WUZFMmpHUzVmZlpBMExxNzVVT3ZWVVp6V1lqZUlo?=
 =?utf-8?B?bkNGV204WHRrNE9vc1dYNTRiUEU4a0xXdEI5Ynk4V2VVOWsxUnd1d28wbHBO?=
 =?utf-8?B?bDYwVGZqVjF5V0hHTHlnb0d4QndyMWQ5bXVFQll6dUZ1WFRJUGJCc0ZxRGps?=
 =?utf-8?B?VGR6R3h2aUNTbU5LSXJQM0krMTZtZnV6aTFNVGlJK2xncmI2ckRIYmlQSTd1?=
 =?utf-8?B?c2FVaktnQjRLWlFac0k4aVp6b3lXaEZJdS96elhkd2pMZ3ZYU0lPWEJGOE9O?=
 =?utf-8?B?L3N0R0wyemFZQ1NDYXRJZTRaUi9wMkZ2VTcyVWg0aWYwYmd2SDZxemFJV0c0?=
 =?utf-8?B?RzhxTmo4RDlFZ2F6TUR6WjVURkhsR09PSXVXQVFiVUpQTDRXVzZlL20wc3NW?=
 =?utf-8?B?SFIveVpOVm5GcC9wQUtmVTBNcWJYTnAweFdHSFVEM2ROcmZIWXRydVNYNjEx?=
 =?utf-8?B?R1REaGhDeGhWTHVwVFRLdEhobU02V3AyaWVValJuREZuZ2VFSFNZUjhrUVYr?=
 =?utf-8?B?QldsdGREL3ErMklDakNxNVI2R1RIeG1xQVhiQ2FrUG9XdlVFUUE2NlZzUmZ2?=
 =?utf-8?B?YnR3MHVXUCtQT1BPc3hhY3cydzFTVFc3OGVrWUtMV1Y4cE5Ld3B1YmlMV2tI?=
 =?utf-8?B?dU1aS1J2V2dwc3hqMmE0dGFVbm9FdjlZK25pTVFOcktad0hqRzBJY2NtR2hz?=
 =?utf-8?B?YnpMOFFaYUczWm9lNmRMTmtqUnhpc3doQm9WL1FBd1BoY2dQaWpSaVBYaVUv?=
 =?utf-8?B?RHRVdzk2OForNVlMM2Q4ck4vbzMrbXcxMnlYQXd1ZndaVy90b2NvR2hQK0ZP?=
 =?utf-8?B?LzdFdm9DbFlNQU80VjlRWmhXaCtDN3k0VWM5c3RRaStaaWJKMC9hS0poeklB?=
 =?utf-8?B?VnZTU28xSHNNa2x5WlF6SGdvWkp1ZmtrNVZQT0xBSUR4N2ZFemp6c1pqdkp5?=
 =?utf-8?B?UzdrNjd3bUhLcFZOaVdRTkJwRVp3Wk5QNHFvWWJiZjVQS0lHdVMwaDR3bzBQ?=
 =?utf-8?B?TDdQWVVjZ25Sc0JMZXpDc1kvTXRGZ0dOUllNclZNdVNXKzg1SWFLUHlCOHZY?=
 =?utf-8?B?MUZlZ3RNNXlSZkkrTk9OVms0Y3Z5N1l6K1lSRmxnV2Z4Q3lhK29zQ1F6QkE1?=
 =?utf-8?B?eGNuQVZyLzVCUzJJeEdtaVhrdHlvNmJXZmRHRHI0Rmo4amNPQ3gyN3NycFR2?=
 =?utf-8?B?cVNzM0Z3b1htQXZXODk2d2h1bVRQZ1hqVVU3WjQ2cXVWOHZ1b2pvdmZVUUYv?=
 =?utf-8?Q?sn9DZttnHo0R5YQbHiy6F8zQDAbBsefVjRXKc?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b74ee2d-255b-4422-13f8-08da42ee43b8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 10:13:53.2914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Pwd71zdd90ul7goyDe99mQ6RN//DPLQoEnHMladx+X0DIj5UX6yo0/ZrVg33wrEvktyukK5we8MtUVr3Ju5G3EfBJ/xKFL3jJMfndNNwiWQw89fiaucnac5a+Xkv3mJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438
Subject: Re: [Buildroot] [PATCH 1/2] manual: add _TARGET_FINALIZE_HOOKS in
 the list of hooks
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Any feedback to offer on this patch series?

Cheers,
Quentin

On 5/11/22 13:06, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> While reading the docs to find hooks, I completely missed the
> LIBFOO_TARGET_FINALIZE_HOOKS one which was actually matching my
> use-case.
> 
> Though it is documented in a subsection a few lines below, let's also
> have it in the list of supported hooks so it's not hidden away.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   docs/manual/adding-packages-hooks.txt | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
> index 0ce79f8907..741b71ca29 100644
> --- a/docs/manual/adding-packages-hooks.txt
> +++ b/docs/manual/adding-packages-hooks.txt
> @@ -46,6 +46,8 @@ The following hook points are available:
>   * +LIBFOO_PRE_LEGAL_INFO_HOOKS+
>   * +LIBFOO_POST_LEGAL_INFO_HOOKS+
>   
> +* +LIBFOO_TARGET_FINALIZE_HOOKS+
> +
>   These variables are 'lists' of variable names containing actions to be
>   performed at this hook point. This allows several hooks to be
>   registered at a given hook point. Here is an example:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
