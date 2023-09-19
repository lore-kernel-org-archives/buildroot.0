Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996E9CD5BD6
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 15:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE8B60FD5;
	Tue, 19 Sep 2023 15:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE8B60FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quQoH1aCg42c; Tue, 19 Sep 2023 15:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBC760FAF;
	Tue, 19 Sep 2023 15:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DBC760FAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A00631BF28B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 581CE40A8A
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 581CE40A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ha02yjevnfQ2 for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 15:31:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C2DA40A75
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 15:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2DA40A75
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMtKqJQG72l/20tzya9c8/sNe8vtPwICqGwIzp2AmYKDBRurXXmktIB7yeH/CQLwDFbrMO2hN9lN5+a0VxjJXzHbkUDYFLWY21ww9XuOTfvqe9sr0OZPCnjy7ClD1wV7GrucVuUvL3MaR3Z8S9JqzKVNoopHjmz3H4GMVvIghX0W2cEXS6YdsDFqECxBWassS8DLB2biAIKi3+XeGbRna/7Dj2QQ0cDEsMHEuj4oAaAxs0V4WN28/odNX2Eh8fpW9VHMzPH5agKPP+AljYrjU7Sw8tZRZxU8Auvp/Cp4le7ELlHPfrOQXd5QUXduniKj+5IIju0QFUI1UfDh//rWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Giy8UetT3drQ1YccnjXkZH3MOA6t9+yRCnT+pN2llUg=;
 b=gUkjl6Qz9JlexocxSS2A3aWdB2iA+3qR2bTws4w/6hQDkDQLN13HupWsNBEe3CS4ciuddzjH2fuDzz2Cx2IdmFColbR0ZuKHBhg0fUGQD9Z451gi3mjvfvdyq+SgvPKBkSKsD15DkpqsRfJI4yBoN1u6Hy/z5rXTOtVvNyBjAecVywsz/8oDfMm9s4a5YbcuCsit82UdU4DFLPyJVQOxnZmBhSoTwTr2YnwIMY3JzHxsRef/JaIOZmgex+vVUxNjFJrZ0zJ/k5zIyH2lAt0O/sxpEqoSkzUxLPLax62837uLvZzU4mz4iULYAN0UUWdWo4amIqe0p+wecRgJ+yib0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB8522.eurprd04.prod.outlook.com (2603:10a6:20b:431::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 15:31:12 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5c00:6152:6ce:72b6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5c00:6152:6ce:72b6%7]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 15:31:12 +0000
Message-ID: <06fcde99-1fb3-dbf7-4346-744776b30aad@theobroma-systems.com>
Date: Tue, 19 Sep 2023 17:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20230919152844.2774368-1-angelo@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20230919152844.2774368-1-angelo@amarulasolutions.com>
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: fe62d7f3-95aa-4407-2d38-08dbb9257435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EoOAYl63eibZv1XHsNfxV8P+3nhn1CW3YgNJe5Rk8NJHoP1TJJKu05OiaWmHLh+4zZ6MHUIr4vW/Q2+ikgWCvEAv5uZHcIrZhBDKEVuopXTv4pWAwa1s1bk8Bu7jveOm2u2exWN9ZGeMFkwelmhs3nJ9/ZemQ4dLgJroAU6LaecCXV/Gg4skJ9Yk7dQcei3g/HDOb6cHlz+Gv5kL+kaDGOL3sg8wskfOkNefMv8Vr939BZd+2vmjM55C6h697k7YpyRL9QLiOuS0JthQALkEvL4Y2zt1ZaHotpioPK5sEJWfI4XoCC+uosB7YEpnzu1WNJCCHqTpQjhmTvONI3QC8Hx+qiuxNAnz4iaM8NKnXSe23EJAKKBDZYgxNsiK8Jg9H5G0txxwxJiVgFYnbSwcYWl2qlaIuYmg2R54UxxGYilGSRYzYH+s03tRWq/5zvYxOsthAaRwQe56Jud2P2/z+eYXyqm2yz3v/IZnoq2qJSxhTL90HPxq8TrzcmBAHXVT9TgrkBOU3DYBfUszP9VunCnbaDDa+nhR2XPUwqSZF9GWDMKkUGY5ypARSwtW+AjV4wVO1ayLodwM53RDDZx/Hqj+b0d4rPAQ5SGGKxkyWKeSn9H0EvJ7K/8HFboxLk5/DBuq5Gg7zwj70OToF+mjNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(39850400004)(376002)(1800799009)(451199024)(186009)(966005)(45080400002)(6512007)(6506007)(6486002)(53546011)(36756003)(31686004)(86362001)(66946007)(66556008)(41300700001)(316002)(478600001)(38100700002)(31696002)(66476007)(8936002)(8676002)(26005)(44832011)(5660300002)(83380400001)(2616005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3lqSWFTd0YvdE9SQWVOcUpvdTh2WlZaTUhJaHQ2cGhzeWxrSzl2ZG1aSmor?=
 =?utf-8?B?cTZIak91RWhNSG5jU0pYcU9rQjJSSmtJY2NuMGljR3dKNjRuTkdLeE4yMmRV?=
 =?utf-8?B?RHZCSVpscnRnMGxlSk1hRDFva3kzQTVnNFZYVWNrL0krRWR6K3N1aTJHNnJZ?=
 =?utf-8?B?ay9GRVNmNTdNREc0YVJpQUxCTVJ6enFOSXEzcllyQU9XaXVuQXJobmtCQ3lv?=
 =?utf-8?B?THZTeTJ6ZTl1bzhzWDVYM1F0VWNCQWVoZFNOTXYwbTZzUWNJaU9GQXhoWU03?=
 =?utf-8?B?Tk5heEN5NjZmMFczTnJybEhOZWlLSFc0NGZjMWZxdHo5VklVR0kzcW5aOG1I?=
 =?utf-8?B?VHVmMWhVVElNZWdENkVmZXVYRXZvb3paamdKODRtRWppVncxOURUdE8yaXhw?=
 =?utf-8?B?Vy9kejFLWG9mYjlCcUFGZ2l6dFQ3Tm81dW1OY1c0azdVc3NkQUU2RWJOTTNk?=
 =?utf-8?B?SDBsMHJIYVN3QmFhZFpjTG9QYlVtb1hqWDdBRldHQlJHQnFWL0tXZFRjWHZP?=
 =?utf-8?B?cmVpd2RGWFR2aGlIODFlWWlya3QzTDc1M0xTNXQrcDdSQms2TzJsb1dEMTJF?=
 =?utf-8?B?M1lLZzNIUnd6SnZZOWpLK3NkZUhWN1hmKzJId2puNUtQSkxTYytzTS9IMk5h?=
 =?utf-8?B?MzdUWUJVR01VS0d3c3hsakpzVW1DWXRBNmp2T0ZPeDVRZUU5QW5XUndacEVX?=
 =?utf-8?B?ZUZYZWZyMjJoUWMySUlWenZHOFE3YUhibmJ4TGN0b24xLzFvNzdmMnRRczVO?=
 =?utf-8?B?cDVaMC84VnR2Um5FMTFYdU9YVkEyaG1UVnd6VnZoZm9YWEJhZDVhclpLaVcx?=
 =?utf-8?B?VHBhTEZ6NXZXRkxtWXVTbEpYNlBYKzh1QkhRWjByb0IzUVI4QXhIbWJ2QVJG?=
 =?utf-8?B?NjFCOXlCWEtJQkl4d3FKMDVZbjVqRmhrS0tZKyswa0RSWGtVZWgzck56L05W?=
 =?utf-8?B?NENwYzZ0NXJMSkxkWE5oRGlTQVlBcGlsZXdDanpEY1IzTjZqUlp5VDdTWG9X?=
 =?utf-8?B?UjZ1OUlBd0dNVmN0cFJVSURRenpYNmVlcDdINy9TOWtLd2l6Mlg0SkJTWmxY?=
 =?utf-8?B?MDlWL2RwRGk5MmFmMldpT1VaY25xMWhBaGlTYks5WG93SkxHbFc5WjQyYVpK?=
 =?utf-8?B?MVArZkNhTTFpeTFJSVB2WWlpbzVhU0MxUHQ2bElLSkpka012TUxJM0FMU3hM?=
 =?utf-8?B?Y296em93NElheUM0MGxVR1QySW9ZRUdPd1ROSzdIcHdPM3VSR01FZ3dtT3Nt?=
 =?utf-8?B?Z2xwY29aai9NN2ZzWUFydk92VGpNd2JRQTYzVndnY1BFSk1rYmV3aUxDWGlU?=
 =?utf-8?B?M0I5cXZMSlgxakVJK1c3WEp1OGo5cUVTUVN2L0NsV2h1NWFMSGdWZCtaQVdU?=
 =?utf-8?B?U29HcG93YUZKTE1QM0d5N2FUZUZyanMzOExOYU1OMGNkWHhSNnVFMWFHWU8w?=
 =?utf-8?B?dFVXY2JubCtEVWd3d3ptR3FyM0RlVEdGZldZVnpLdlFUR3V1TlV4NWVWL2My?=
 =?utf-8?B?d2lHbmY4ZjFWZzFKeVdDT2tsN2h0Wk5jcktVaE9sRGVZV0VUU0pDMjNKMXVC?=
 =?utf-8?B?WU02eGZpOTF4Y0NwNStNKzdDL1hwZzNvRk1EbFZiTjlPWjNXZUVHOU5Jb3di?=
 =?utf-8?B?WWp3ajdPQ0xxb2tzbmZKdGIwV1lERUwxQ20xdmh2VlQvQTQ5M3pxdlQxZWcr?=
 =?utf-8?B?OTlrSEl5N0N1TmFMOE1HZnR4MDQycnFNdDYvbnJKVXJFUUNOS1djallnbkln?=
 =?utf-8?B?SFFxMlFFcXRwVFEyYUVWZGxJMlVqaDZUUkVwOUNMZ2pSci8xTGs4ZEdmYVp3?=
 =?utf-8?B?R0JIZ3V5SVR5a1dvZ1B6ZDhFb3dyU3JHQmg0cWxKaTZnZWlZRTYxRUlkTjNl?=
 =?utf-8?B?d3M2MUlpZmhEOG5ZT3kwMUNhc0Frb09DWnQ2MUdYOFRGWHZlb09TZlBlQURJ?=
 =?utf-8?B?anlXTEhBVTQvMWl3WXhxY2Y2Y2dBT09qR0tFak1VWjl6c3A2OXRjVTcyWmF3?=
 =?utf-8?B?TGRUWEFKZGhCYm1TNXNkUzFicjlCZ1lyT2owc2FlckxLdWYveEo5SDJVNDF5?=
 =?utf-8?B?M2dYR2tlTlBnQ3ZBbkwxMEJUZVRwMWhySjBhR281eElmeDdFNjhRU3E3Zko0?=
 =?utf-8?B?ZFJWQUFIbFErV0tvazFOUng0ZlV3Unc3cTVkbHRsY1MvMWFYUHVQNFpCekVu?=
 =?utf-8?Q?9A+zbFVg8+zl+bVUfZL9awI=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe62d7f3-95aa-4407-2d38-08dbb9257435
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 15:31:11.9696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2LQSC+j7jHRiZwXsz8/XJGucN7OTz8R/ZZs1wNn1CqgsGzldEo0BtLdBg6fdC7ppcYZ1016xDDWECApQAOTKfI8slRjIl2R2uCYoQgailVD6qLSvXdGZ6KBS+Xv023w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8522
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Giy8UetT3drQ1YccnjXkZH3MOA6t9+yRCnT+pN2llUg=;
 b=GfuKjX0hI0whl11kp/OmD1DhTBficNjJvgTu0PxjhUDf1nBkFbfwaOETSNwUjpKB27a3SUKIxV6VF5u0zsoBeNOQzO4ZxLJfMekW6sqvWu7bSD43uLT1aH4HbLuT7xTpl8nc0HOOlexZl0jONsof41GHmRrAbLSKW8Z1a8E3sVRB/q7qw0t7ot6UJnK9ieTjTA00GicU6WqBGM1H4VkE28gQr8sGtM1Ot3pKr5TEy0MmCh7zpwx/G+fWRruTYGuOZzsSz7CwCbpQ/KCdrT4HtJw7JCeRYmu4ESNvMFLWE8tDYXtEoiVIYyv6AlvNAPgORXnyUSaCkP501GL4MmEX3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=GfuKjX0h
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH] package/python-pillow: bump to version
 10.0.1
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

Hi Angelo,

On 9/19/23 17:28, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>   package/python-pillow/python-pillow.hash | 4 ++--
>   package/python-pillow/python-pillow.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index bca66a7436..5f4b0d9492 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5  2a8f327ba2250aad26ed101337c8fa56  Pillow-10.0.0.tar.gz
> -sha256  9c82b5b3e043c7af0d95792d0d20ccf68f61a1fec6b3530e718b688422727396  Pillow-10.0.0.tar.gz
> +md5  93a0585ab0ee9717a7576129bdabdf93  Pillow-10.0.0.tar.gz

missing update to the tar.gz filename?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
