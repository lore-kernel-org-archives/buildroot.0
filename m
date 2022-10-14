Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599B8C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 12:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D00B341186;
	Fri, 14 Oct 2022 12:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00B341186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIWEhVgL0rxS; Fri, 14 Oct 2022 12:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE4D94117F;
	Fri, 14 Oct 2022 12:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE4D94117F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C49E71BF29D
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 12:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 628EF42249
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 12:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 628EF42249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StkcRNyHBoFY for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 12:48:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA2C41DD5
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062.outbound.protection.outlook.com [40.107.247.62])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BA2C41DD5
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 12:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/1gGbBRIq55iU9a5F+myE/OIW2oBDtN9Ocq5UzpKN8Hj5ia5sh4/y7YdR7+ZqbeouxjWpNUrl3E5fM0pEvTICHGpf+Sr60gdMCZi2UgUbPx08IGnkhdttHci45HS8guMoVOS96ot/7yhVn7ElBgaoPtLIsLTeNXZUuAaXk7Log1BDx9STIvIKkmK6yVvirF2WbfrPlqGAVQo9FaPj1Qvzwfa2JO0XM9UG/8LHcQ/Jz8BjhfB+F+lqGNK1qKuucVtPzg3GSk0YqotdAQzpguXQYtJpl/g34rSeCGg778LR3v8Qk4Ac7WI931V3XJD5sHX2YFmNSjHVzoZ3BoIWf/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlwnjAd57BO+Y+gou8+M8+bPyp++KbNmJ5jGbGGeqUo=;
 b=bTUBkqlq31ti8PHDA6oXUJ3i2GRb/vdhXqJLN4r2k/+a2S4T/0bZuyhXu1n7xUbqc1zjv00BO1MciBlKmhmfW7xoVjCPzuEcPovfg5RKy4y6VxDP29S3Tgh/PXLPgO5A3XQEmheBG+NF1hpI49pc0xbqQdhCD6FZZeVi3Jt2Wz890ESl1YlxSApY3q+7P6D6/vAMjFbxb6o/gRiNYgzK6E/zmjsxn6MhaSJ8NRM+bWHhgIlg2/HhylUbI1nUICRdK83NSFKgHm5nX02Ny9wSFGlcIh427w3CuOOyhFSK7xDHR4IwlUSncO2PJSgZUUtyosccmJ46c3xIUACkL4y36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DU2PR04MB8520.eurprd04.prod.outlook.com (2603:10a6:10:2d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 12:48:36 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 12:48:37 +0000
Message-ID: <ede6e1e7-000e-da1a-e7af-39cc4a0a9e42@theobroma-systems.com>
Date: Fri, 14 Oct 2022 14:48:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
References: <CAMdwsN--va3eFthe39JypnPWJtkXKJdN_HdMChHS8d=RoneJbQ@mail.gmail.com>
In-Reply-To: <CAMdwsN--va3eFthe39JypnPWJtkXKJdN_HdMChHS8d=RoneJbQ@mail.gmail.com>
X-ClientProxiedBy: AS8P251CA0027.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::9) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DU2PR04MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 17cf6393-2faa-443c-9a69-08daade26962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fX3D8deaErgh3UcGeSSnqPCogo9mv3tYGlRJ9Mpbr6SpukE6tNBpwYfba8syTt2X38ZzcluJS+VO6m2KtDXTmXRedwXsphQlK8MmTH4/SBIvmUptfCaQdmMqaK8TYaOazrOUp+IWQOv/6r3vsbkkibLJuo6TD0wSA6uwsOMDNg9Qpg9dbh1FkNa/LzdRW5O2THOidDJ0zecWTGKkgtfw73Wuji16xamHfSsTn/x1RrKS6E+uxlxmqej6BwFn97H35ioDDM2xOruNtRLx725caYrrgntshAt6ZRWZomRw4EgxIdmNTHDPHaW2D0GT63e8Y92mefba0lsKa7Anl8IdNTkQmw8oGfuw7qlcYnjBy9tJt55vy2bQJFEinacs1j9s7+02c33BtAFTD73cmrdjjwxUf1GngqUmLdK0JXEiIT10VC6V81A6m3IQf0avfsWhEHpjJbDc9CwcmHWL6YGsEFHgkQssafljnXQVQz0t2YYTejm/JAI7NVhpHRtpWIea2kJYEZxIddKWtnBRR5kf3tlyIZG81Cd2iRWsMfJhrxXiYNY8xEjulOfyu4PuNzufU/295n3jsQs9Zwo1XAuMSnle5A8iHXekMdEumwjANzCpIKI30pq5Uiv88nfJjfwrYJJEbC02Yzz2WCLk4j+3EYtAutA4APdKCsqBqbLEBYvHN9coq8gjOFplIVupTsphtNT/Hc8KMgH5TKyvJqjwBauWNIGap3kyvYZKRtjhhD8z5g22uuLmzEvjijmUcIAiRIqO+9tKIbl/sfkXBzgaubGjeMnMZXcZ4OBRJLV05qQMqjIlAe9kff00pofLckYH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39840400004)(376002)(136003)(366004)(346002)(451199015)(478600001)(6486002)(2906002)(316002)(31686004)(186003)(6506007)(66946007)(66476007)(6512007)(8676002)(41300700001)(53546011)(26005)(66556008)(8936002)(44832011)(36756003)(86362001)(2616005)(5660300002)(38100700002)(31696002)(547064002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1hJR2VMeGgwL09mcmxoKzJQaHN1Ull0N0hUQVdnZnRoQ1VSd1lNcG8xS1ox?=
 =?utf-8?B?T2xlZzk5RUJyTnNtR3Nqdmg0Q2FIUmRCRTAxNlY4YVBzMkpVSXRwcmM4S29R?=
 =?utf-8?B?ZERmZTEyRUpzYUxMTFpyYTQ5NGxkYldQaW45MWd6NlZ3T1d0dHVJc3J2SWw3?=
 =?utf-8?B?MWFFdm00anBNeDFaV2hUdnp1eVViV09mYkhraWVHMzcvdGNHbGdoZVY4a0pX?=
 =?utf-8?B?V2FZbS9SWWt5OXgxelVENEpEN2lnbVV5UXE1OXZ3MnA3UmhXNXV3NG1KZEJs?=
 =?utf-8?B?dmExbjJiaWwxQU56R1hUTkRRK1IvZVFlbDJGb1I0SlJJM0pnczVxNXBsSFUr?=
 =?utf-8?B?dHd6NEFEOVlDSGZWNUVyWkFPSTl6dlVHUW53VmY1YUxoRUZJVG5yN3FBN2JD?=
 =?utf-8?B?SU83ZkdmQUYvV1BCVnB2MFp2SFp0WTR4Rk55UXplaVJNWnorWFBvVUp1WkFy?=
 =?utf-8?B?a09mZnRoN1Y0ZUdBek91Y3pLdHVHZ0RNVmpDUWwxR2lhSUpqaUVya2Y4ejdi?=
 =?utf-8?B?bmRteG03cjJxRmRMUG5jRERqRTAvSE1VSzY1L21BY1VVL1dYdHZ0WkhlNk9y?=
 =?utf-8?B?bGNNbTY1WUJubGduQXNkY3p4NXB4NVpKcmFqcHdWT3grQlVwdnpFb2FWSHBw?=
 =?utf-8?B?dlgzdGVuTEZMZVp6ejVzUmVlM014NjBjL29wLzR4Q09kNFVmbytDdm5LNkJT?=
 =?utf-8?B?bDF1a2RFRnpMaVFmSkZJUTFXbHJFZVJyWkZScWZoUUVpV1V6cTREWEZtVVh3?=
 =?utf-8?B?ZkpyQnpsTWhYK0xDRUV3Q3RrbGIxNlUvVkRDUXZ3a0FIMG1FekRDZDQyeXVN?=
 =?utf-8?B?MGhhejRyamtyK2Rqbi9BaWFxczBDcjBDOTRJdWFCbGM5WGdad0gvcllEQW9H?=
 =?utf-8?B?ZXhBY3lNbXRETkxZM1kwWGRFeUxtT085S0gzR3QzdWgvNGJDbWdsV1Bsenlz?=
 =?utf-8?B?VGx3aTFGRHhlUjFFUTlKbTZjUjIwTmEwdCtsR2I2akFpcjQzU1RCekJCNldk?=
 =?utf-8?B?Z0lraGZXMjBrRkphU3lOa2g0emd6MGljQ3IvMXU4OVVhUFdoWm9Cdm9INDg4?=
 =?utf-8?B?VTMrVUNVa1ZrU3NkZlRjTTFSMXZTNU5xT204UnJNcFYxUHFtNFVyMEg0UkMx?=
 =?utf-8?B?OExNSm9lQ21iODZ4RHM2QXRmbGttUmNxYlNHdHJTZUc3dE9rVGdIWC9HUmJL?=
 =?utf-8?B?Q1FNczFnRVJpN0U3OUhEeWZlM3RhRitmK1ZtTmlHRjVvbVdPaWErYXJPUU1p?=
 =?utf-8?B?QnZxSEJUMyt6UDJwenhBTFhwV1BQZmNEKzVRM1RlVWVuZXVjMmRXcDBFdVcv?=
 =?utf-8?B?dThzdHRqOHhiVkhGUTZxNVF0b3U2MzlCb3VhaXZWb1RHQ1lPcGx4cHlOZlA4?=
 =?utf-8?B?dysyeDhnZldOU2g0SWl5a2prV3lFQTkybEJJSmNVVmh0a0E0UkVxV0padVRS?=
 =?utf-8?B?eU9SNTNhdFJTRTgzcUswS21wdlkrK0VPTk51U2Z1dXJsZDZwQkNrSHIrUmVy?=
 =?utf-8?B?Q3BBRWhNZnoyS3JhdEtid0VvczhxQ1pYeGFTWS9RME9ORkVUalBQbEN1eTlz?=
 =?utf-8?B?UDNkd2N1cTk4RWFQa2h3V1h0VkdVbFNkaFRlaUxleVQ4Q0JQZWZqT1Rtajhz?=
 =?utf-8?B?OXMreTFuc0lqS2ROWmpwYzRxbWNhTitmaldxeUFEdVBpWmZndWhRRW5QNEpW?=
 =?utf-8?B?QisrMTFOQzR5c2xxSDZpUUJGTmxYbkN5RTBvRWFMcVRjbmczVDExK0xSSG8v?=
 =?utf-8?B?cllralQ3RlVubGd6T3VzakFrRVVDVWZ3TXZ4UnlPdGdtdmVmdm1DdzBkS2tY?=
 =?utf-8?B?NlBWVXltTTVXdnVWTXdobndDMFR0ajNVYldNVzhDVXd2MlNJWnBjSHZ1VTRZ?=
 =?utf-8?B?ZmVUbHd4R0FuQjdiSVRGd0R1dmJ0bGRFUkdnL0p3VWRadFpqSVNCZlRNOVdn?=
 =?utf-8?B?TnYwZml1YTB2eEtXNGNFQ0tFVnYzVWJXaW1nazc0dXd3eTRsdDRVZFFNaVp3?=
 =?utf-8?B?YnIwNnNLM3ZKd1h2T1YvRnJmUXFyK213SkN3SjBGZjBsTUkzZm5SWUhEVjhz?=
 =?utf-8?B?YjUvRDJhZ0hPbU9PZlVxYzhPcHlaM3ZuMU1SUEpvZ1JkK291SGtLa2JoQXVZ?=
 =?utf-8?B?YWhMMUVhc3NZNVpnVXhVNHZhL2d5VG9GSzBaSFl3TW93VVFnMG9zMSt4R2hP?=
 =?utf-8?Q?aepNLe+jUHbzSeYnUPi1FSw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cf6393-2faa-443c-9a69-08daade26962
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 12:48:37.0973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQ4JUyrpU3eRu2HJIb7KZLTAaG9mhUYujqc+C72lf1BEWbwMDcbGZpG8SSdsEESyqXWJEt4Xp5TOt+29a9atlr2vEEagqdmRspvGQ59JCwSyYfYkdP9+RhaOPZ2n/SqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8520
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlwnjAd57BO+Y+gou8+M8+bPyp++KbNmJ5jGbGGeqUo=;
 b=QtnW3uuoSpbm3Z+sWHyVs1/HCaLYlK3dpKLEiTF9bYd6MpGUdO8zNgOvTgfr5Xd2o+GztBQBTstjQvJ39GzK6uPYboZ0/dU8k/y3Ty7zPpp3r47DyVxuWcYgIYqO+raOT4+GrnyN2sJQIsnh/wUsMMSLzAod0ZVICFg1pJpSOprH2rUBkf8BzvZn4CPcRu8CV5wQD96g8AsvAtgVOGmB37lsiLjv69Hi1llH/tCFVKVBQHmEzq4y6+VYU3Gwami+7Pe2SScvw9HmsBbXw9VSCBnbncMy1nyIwJbFpdgiReyuPh/vA1r3Z+EEWhbgFyIStyldTcgGEtHCjJBMXIxm+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=QtnW3uuo
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] Changing configuration options of package in
 another one
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 10/13/22 15:06, Jesse Van Gavere wrote:
> Hello,
> 
> I'm in a bit of a peculiar situation for which I'm not sure what the
> correct solution is.
> I'm trying to implement the qt6 remote objects package, this has a
> dependency on host-qt6remoteobjects because it needs a host tool from
> it to build the target package, however, to build the host package it
> needs qt6base network enabled in the host qt6 build, this is by
> default turned off as it's not a necessity for the host tools needed
> to build the target package.
> 
> So to make it work I've added an enable for the network module to
> HOST_QT6BASE_CONF_OPTS but this seems like a bit of a dirty solution,
> what should I do here? Manipulate the qt6 host build it in the remote
> objects package? Or maybe turn on the network module for the qt6 host
> build whenever the target qt6 network module gets enabled?
> 

Not sure I have entirely understood the issue but here's a try anyways :)

I would add a build option to the host qt6 for network support in 
Kconfig, then have your remote objects package depends on this option 
being selected. If it's not selected, your package won't be selected 
either, which is what is desired I think?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
