Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA44C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D85041735;
	Tue, 26 Jul 2022 15:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D85041735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFx6fL2xDwZm; Tue, 26 Jul 2022 15:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D575240169;
	Tue, 26 Jul 2022 15:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D575240169
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEA321BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96B0B613FB
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96B0B613FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rga_gozVkgpe for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:13:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11570606E7
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11570606E7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:13:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTMjHMF1NiE4hMYnEVxl2kFybATertOn/qXTRfLz1T5s4FYuOyIcSG65RFvCg7WfRWhakxjIL+M/SxtS/7yAt7by7e7wMuxAvKGjGYHYwr5xSl37DcdJWfJr6fBU52PDmxAMmRdfl9gsfs1EF1Xbeb+LwW/ViF4ApvNSE2WFMiNogvViF2KRFjD30DaBdBOLzEOPSs7BeJ+wzkqzdfRTf9LdXAaPI2TbKHHHToXNabgzUh786lEoN5OEzob6uiz/kwz9nA59WuoKe05M9zxWahUZKRNAQjpPSXtlMbuTCnMknTT8l/2U8Rq40v41bu8iHDCw9eU/DUPOcKgAqmkuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5e1PDSmKvlX07PSVBheWirn9f2eYhBjaSUfDrt1rB4=;
 b=kEteaYDUJbTyNfZNQpxE96ehPA94b4jc/i+7/l+gGbB7BeEDu9x+1Lhj50newbAh5p+y92vlybxwCcE2fUvwjMVmRda+NEXGr5irGlkF/MMm5Oghlk8HOhIY1GFweUoHK6BfR9KqncbEie3PPwspZJHDNUrzPKik4HvwxeH/NGWBj5p6X1FQIqosg9QzPL4rt3r+r5kaiaK0XEeKqfZue4QSpdKYUKtrgV+vCLI52CKOZ6L/fBrYGg8WVLFhxjyHPdNH4+OkmGIe13l+1wMLf7V0bTj99QKVfhzBVVFTUdOsZEjEvaQ8r+CWmgdrNnATkeJ/dx3auAMy5Zgqi7TSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR0402MB3744.eurprd04.prod.outlook.com (2603:10a6:803:16::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 26 Jul
 2022 15:13:13 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 15:13:13 +0000
Message-ID: <2a53c4f3-b7a2-f66e-e4c7-992e2f8d9de4@theobroma-systems.com>
Date: Tue, 26 Jul 2022 17:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Nicolas Tran <nicolas.tran@smile.fr>, buildroot@buildroot.org
References: <20220726145646.1894310-1-nicolas.tran@smile.fr>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220726145646.1894310-1-nicolas.tran@smile.fr>
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f45a2b-1d87-4b62-6b4c-08da6f195bde
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SpPt3d1IJ9ZlYMxovTigKFHI2FaGZSVfM21GJ65nxBaH4KXfaPqh1Ltr7LLLiZARdd3WZI/Ew5HqlvwvwVPcumv148/oy0CtT5l/aGfbeh1Zmhos//xInm0edbNQN+jDNDlC6jcwTJzoeDTAy0y38ix7Tu8lC0sqWwk/boYs0qgmgJ+6zGjxp2mgdo+L3EHUCRGsPVcXgiya+bREUTyPkD/AJvweOuPiwi0kZoCoDHP5O2CzIS7H5zURdnhGGrfzku7cmknvlBD7yxcIb46W+wObNn6aRN2YVukJGG0k/EmkV0aZvMYTYEOYEjEDY8RC+oNZEq/oeF2SQi2gSpT1hPwPn+prQquQk3UqcEbsgNRXFoLryrfCgro0zbHuaB8VoAPn8wZkUln8ry9k/Z3/Z3jbdtUkF0+9qphjITx7CmK96ASzzAfUS6Q98FWdZqiFlk04ollAKNTcr9oRFz925IqgRIXqb4AwrKAYmJ7Z3K0Rm3sVrwG0841Oz984Ve6lzhVURbT7l7SKdu9goQMIm/6xCrAb8Kp7N7QUwbs5eMUoYZUG77X0J9e3QQnVgj2zec6BcFsKK8wey0x6Oyv94ZrMqdGI5Xq5KGoDdkNW6x+QHrAiANJ1L+QfysOJ+GWmPq0s9o+TT7lJByQDtXPkdx+8GVBXDvkYaUy93o0M+WwxL+iWuLDR1ZMk1Zat5YEArVemZk2imTUE5z7HAxd6DBoIjuVgfGFsMFHMWSmj/qBA3RAzMNOC29Q82iNrHG/AGptADKThJObZYsWSmmkE2Z5l0T6E8x0NnOHfi4iiy0kV511m6rmBaA+sTO0Yq7Wz+q5l42kea+skukmKsB+Uis0nu5Br9SxJt6eIft9hCw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(346002)(136003)(376002)(39850400004)(31686004)(38100700002)(316002)(2906002)(53546011)(83380400001)(186003)(26005)(478600001)(41300700001)(6486002)(31696002)(2616005)(44832011)(36756003)(966005)(66946007)(5660300002)(6506007)(66556008)(66476007)(8676002)(8936002)(6512007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1FkcmxTUk96dHBCLzFxbVFyVFkxTTV5aVRGK2hTRzNiZHZUY01kNldnWHlG?=
 =?utf-8?B?Rko1TWV1N1BjUXZ3cXhrKzQvRkg2ZFBWUWxuRUM2TUdGVGlJdWZqN1AxdTc3?=
 =?utf-8?B?OFpMcEtESm16TE5UQWptVE5xcFErYWRjbDllV05POElNb1p2RUlCTGxTWlhh?=
 =?utf-8?B?UW5tTnVhU3g5eGlobThTcDN6K0cxc3Z0cGZVRUUxRXVEaU8xUUt1ZDBpTlNH?=
 =?utf-8?B?eVMxdlFWWlhJODNySWdwQkNYWEZ0a1Nlc015LzNjLzM0UktBWFpCS0h3Ykxq?=
 =?utf-8?B?c0ZSdzlyOVdpc3FRUTk2dHFZQm1ndjBhdnJuU0tKN05aaEt3ekdTMUFxZ0Z0?=
 =?utf-8?B?YSsxVXFEWGJ4M0srMnBkMUtlZEhVSko2UENiQmdoS3FxQTRERXlkT2ZVdmdV?=
 =?utf-8?B?OHNOTk94NUQ3UXlEcmZJMncxb0xub2dsM1o2RVBDZG85MmNiSnF3VE8rZFpt?=
 =?utf-8?B?MThGTlV6TzJ0QVlWSlAzdzFobG5UVGx2d0hMWlVlN1lCQnc1VWduSGVFT2J5?=
 =?utf-8?B?ZUE0Mmx2d0c1N08rUWhiSk5IRkVwSWpTSFpmcWVienNRL0twN3VRNnpvWG9n?=
 =?utf-8?B?aENGN1RCUkdSa3d6Y1FvaFQvbWRtWjlFcXZQVE1MUUYxRkVBMVorYlYrNEdp?=
 =?utf-8?B?TEVFblprWVEvY3J0ckVJY0lJNEs3TnJQOHZhYk1ZWndQWW5OL2t6LzN1S21k?=
 =?utf-8?B?NDgrOHVXMmgyN3RtQko3UE5yVnpCQ0wwTVFpbUk1ZmIweitBNmVkRUppU1hx?=
 =?utf-8?B?cWtGV2wveFlHa3l5ZmFxL1E0dHlqYTEvMUpHM2VKYktGZTY3WjVlR0JJYzlw?=
 =?utf-8?B?ZDRYVmdXZ2xaYjZobWhHUWk5N25SR0lMYllEY3hEcGNFbkpwN3NmaHUrVXlw?=
 =?utf-8?B?SHpLN2tuRk4rbmlxSjRjUTFGanN3alA4VzR6VmFpV3k2b3pyNHJQZDBYdUpx?=
 =?utf-8?B?RSs2RmJsTDhIQklzUFQ3WU9HVkdCdWRPamJkL0NCdnVFQmxqTk5jNGJtVldi?=
 =?utf-8?B?QmFUUFpGRjNnc25rUlk2dThpaE01eEltb1NQYXdRMDlCSHU3NGdXdGdhNm51?=
 =?utf-8?B?SEV4ZjlwNnc3dUF1dEpHd0VBQk5BQ2daZDkyZG4rZVMyeDhYYktiMzR6N2xj?=
 =?utf-8?B?YUI3d0V0MWlCNExldlJYVmY4ZjBacG5LOGxuYXg4bzNTbDMrc01WeEtPQ1R2?=
 =?utf-8?B?NE9lSnh6cmpxQVdEdGVRRnQ3Q2xwL0tpcXFTYjRvYUVxVGl1QkFadXVHZTlK?=
 =?utf-8?B?aytqY0lNOXdlUU1ObldMckNLNmUvQzV0ZkRSbTZRdXE2SU83SEpVTjc2SEI2?=
 =?utf-8?B?QXg1RzFMMU1qT0gyVlhVVWNDQ2s4a052cmhkYURMRThoVm92VUZQaUZ0R3pS?=
 =?utf-8?B?SFNGSkN3K3kvR3c1V1pNYXZ1bUpiK2NLMmlBalByd1hNQUxaQ1o4enFQcVpa?=
 =?utf-8?B?eGNySlgyOFRhWkVON2lVZHFxM1hZRFJJYXFrQzdhK3kwZm5oWXBmUFpsNVVt?=
 =?utf-8?B?akVCVE95NFh1cTZkZ3d3M2pidVJDelRVU0EzSjJNNzdXOE5sVkZBeWhpcmg1?=
 =?utf-8?B?S2JVMGRVSFduTzJ6UGxxODJiM0Z6c3hVNnVGbGM2cHJ6cDhBZnFYZEU4dkRy?=
 =?utf-8?B?blNpaHlReEhRMTN5Q1ZpQy9ZeGVNMXROdExHYzA1RGo4aDlIczFHb2R4V1pS?=
 =?utf-8?B?WTAwMEQ5bEtRdkNFVmlCeXRuS3ZuWnE4My9aUWd0ckh1TEgzMWZWWWlaM0Ra?=
 =?utf-8?B?NEh3V2dCM3pzc0licDh2Q2QyMU11dmdpQndUU3VqMUJqQVU4dUZJOWh5OTVG?=
 =?utf-8?B?a1ZWMGVrODkyVXFPbWNTTFovNnFqYVVRK3hqM3N6QXdteDBOUHVtK25JVThN?=
 =?utf-8?B?dDJ0MmNWMzNKclR0Tjk1NTV2MnMvbEp4eTloajlOQjVOL2JGY3QzTCtsUGJJ?=
 =?utf-8?B?UGF6ZDFGK3RzTmQrNjE1VEJETlJWUGo2MWYxb0lleDVnM1hKN2Q2S2xHWTBz?=
 =?utf-8?B?bmkyOWpEOG5MbUNrQ0s0MzFHeklyMC9xcnk1KzgvTS9WcXVpeDdFQWQwa211?=
 =?utf-8?B?YXdUT3MxZEVBV1E2c2creVowUEd6ZnlzM0oyRGFQcDRVcFIrQXJCcHVLUVhC?=
 =?utf-8?B?OTBtV2dvRHgxUWs4YjRaN3pyTm9ONXFIRndtK1RJQjROSHBaUUpwdCtQR1N2?=
 =?utf-8?Q?X6zFxJ+ciutb+V+ewmWCLUg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f45a2b-1d87-4b62-6b4c-08da6f195bde
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:13:13.3764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BG1NpriHssNHHnXN3UAIJ9DS0lTSs5lV0BJK/1EeDb0gDrTQQ6zDTSSC1q6L9GHiW6elklUsyArUC/MwlHgnf4YeDYtwFDrw30eI9WcycTIxC6UrkW7li0bAekljwyHy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3744
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5e1PDSmKvlX07PSVBheWirn9f2eYhBjaSUfDrt1rB4=;
 b=b4XIAlJ3iMRdScGl46uptlIHS0BslJdBxT3e9R8CEriWgh9DKl5iNMfBPAJr0hK4FRV95VpI+zf3HfWbFgV0mXbaESrpnDPMAtN5LHEu37VoFl1CPQdN6nrvMqquQkDlST8lXnnRco8roBzgBVoRQUyeJv18aKGJA7P6XHKYv6Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=b4XIAlJ3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH 1/1] new package: package/dust
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nicolas,

On 7/26/22 16:56, Nicolas Tran wrote:
> dust is an alternative of the command du from the Linux kernel,
> written in Rust. It aims to be more intuitive and visual in order
> to give the user a better view of his system's storage capacity.
> 
> ---

I think git am will not like this separator and have the commit log stop 
here instead of including the rest til the next separator (with your 
SoB). Maybe -- would be enough, or move this after the other separator 
before the list of modified files?

> The package has been checked with correct formatting and
> without typos:
> $ ./utils/check-package package/dust/*
> 
> Tests have been run using test-pkg:
> $ ./utils/test-pkg -c dust.config -p dust
> 
> test-pkg config:
> To run the test, the file dust.config contains the following line
> BR2_PACKAGE_DUST=y
> 
> Results:
>       bootlin-armv5-uclibc [1/6]: SKIPPED
>        bootlin-armv7-glibc [2/6]: OK
>      bootlin-armv7m-uclibc [3/6]: SKIPPED
>        bootlin-x86-64-musl [4/6]: OK
>         br-arm-full-static [5/6]: SKIPPED
>               sourcery-arm [6/6]: OK
> 
> Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
> ---
>   DEVELOPERS             |  1 +
>   package/Config.in      |  1 +
>   package/dust/Config.in | 12 ++++++++++++
>   package/dust/dust.hash |  3 +++
>   package/dust/dust.mk   | 12 ++++++++++++
>   5 files changed, 29 insertions(+)
>   create mode 100644 package/dust/Config.in
>   create mode 100644 package/dust/dust.hash
>   create mode 100644 package/dust/dust.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1dede4b83b..7a0fa47595 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2180,6 +2180,7 @@ F:	package/ofono/
>   
>   N:	Nicolas Tran <nicolas.tran@smile.fr>
>   F:	package/hyperfine/
> +F:  package/dust/
>   
>   N:	Niklas Cassel <niklas.cassel@wdc.com>
>   F:	configs/qemu_riscv64_nommu_virt_defconfig
> diff --git a/package/Config.in b/package/Config.in
> index d264449b30..a283fadc41 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -210,6 +210,7 @@ menu "Filesystem and flash utilities"
>   	source "package/curlftpfs/Config.in"
>   	source "package/davfs2/Config.in"
>   	source "package/dosfstools/Config.in"
> +	source "package/dust/Config.in"
>   	source "package/e2fsprogs/Config.in"
>   	source "package/e2tools/Config.in"
>   	source "package/ecryptfs-utils/Config.in"
> diff --git a/package/dust/Config.in b/package/dust/Config.in
> new file mode 100644
> index 0000000000..c02cf1aa83
> --- /dev/null
> +++ b/package/dust/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_DUST
> +	bool "dust"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP # host-rustc
> +	select BR2_PACKAGE_HOST_RUSTC
> +	help
> +	  dust is an alternative written in Rust of the command "du"
> +	  from the Linux kernel. It aims to be more intuitive and visual
> +	  in order to give the user a better view of his system's
> +	  current storage capacity.
> +
> +	  https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_bootandy_dust.git&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=qKkjyC6yAxeKvJmYdNlsDzDhFdDO0vSahgOTnZgBDNPKmYuAGOdkwdWdM3O_CAAt&s=gH07_ilQO9wqi8bv07RYANita8mpsOhdq7k__dVsOqg&e=
> diff --git a/package/dust/dust.hash b/package/dust/dust.hash
> new file mode 100644
> index 0000000000..82043b497d
> --- /dev/null
> +++ b/package/dust/dust.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde  dust-0.8.1.tar.gz
> +sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/dust/dust.mk b/package/dust/dust.mk
> new file mode 100644
> index 0000000000..a889d64f56
> --- /dev/null
> +++ b/package/dust/dust.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# dust
> +#
> +################################################################################
> +
> +DUST_VERSION = 0.8.1
> +DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION)-alpha.2)

There's a v0.8.1 released about two weeks ago, better use it instead of 
alpha.2?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
