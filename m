Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B91EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 14:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54D2241913;
	Thu, 22 Jun 2023 14:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54D2241913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yApVJjfSlq5l; Thu, 22 Jun 2023 14:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F7E94059D;
	Thu, 22 Jun 2023 14:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F7E94059D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6AB01BF4E7
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 14:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F0484059D
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 14:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F0484059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vY5jp-___s3E for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 14:55:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 205DB4010C
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::625])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 205DB4010C
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 14:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcPx7umqrLYSApOYnKM8CXwRYau1HlHx6uNcXeIpu1m7lqLQi53avfpA3OTbdeJj3BbeOeGWmhhBvCjkH+N1H+XxekDpKf0+N+pT2TOVFA3k1rqXz2p4kztkaRz9/PsUtmpS60JkswobmqlO/NQBX1B5/X9WqXH3p965oK5ND7HU+LPJ2gkSGlTuIJeLdv0TqLbNGXxOQ7h8tz1wCBynsVLpscQy4uzV0TjO7mJLTKgXJlam1CIREHHcb32257vqVFcztd3QyPrBm2/ZOI3ZqXs+z41uheX3rYgWy+LIzVj/ntL3YhGWo9KlEcS52dT05hmcNX7H0/dcVEQA9Urcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7gCHeXA2wH6qbKQKep/SWWv+kv9MDrWjdgNUR8Ihno=;
 b=kB+Lmt6FctkSVounZRV20kqQHJnGd0L0lhcZqkraprzw8PY2A9mCaVM6wHhBdIvp8Xwhm6P89xOobXrIRLL+zANNodxBdxg1cqa58ZKnF5N9AyazfNrL2oQyv4thi4p1OuaXPoGDUbjRp2hVXqZpV+niSuwBx2DDrqL1LwR02mLk/F/52FBJgXuBJ2EIM22vqWxQAn1cAB3yw+Rkm9ogrFza6K7vyPUZIbccRg1ZFrW3uY7fiJ33z/lL6iLI2S0w5lFrHRrwMtfF3hHxHEU+23tfvIrGTXju0b7TnPp5+dsbRhG7z267M5AtcfYmANWDxx7V/bu298PfnRmYysouzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8229.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Thu, 22 Jun
 2023 14:55:13 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb%3]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 14:55:13 +0000
Message-ID: <853d711d-a36d-9a68-60b9-493dcf9315f5@theobroma-systems.com>
Date: Thu, 22 Jun 2023 16:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Witold Lipieta <witold.lipieta@thaumatec.com>, buildroot@buildroot.org
References: <20230418114204.1773697-1-witold.lipieta@thaumatec.com>
In-Reply-To: <20230418114204.1773697-1-witold.lipieta@thaumatec.com>
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 19bddf27-de19-4362-9456-08db7330aebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5i/ulT+hRfqVutRJeWclyAVhTlxlXzIdPxrSOCgJEQ5Tj9bcBYuPsniINvDy77QHyPIJEiBNtamiE5NTxWgwNKDT/F6Ures1KRUJGStwN33dU454OxvEGtS4J/pOGHEf9JSHmXC3nQSEmziZJMShdoprl3xne74eujypTCar3QWHfzGvyKcLarbhpRvh1JUXPGq0NHCj1bKd3soWa3EXohj3acazPEbQhsP2NO0Rszo5EXvzLSd3nQhf3tfASaGykn8OJ62fS+vgj97AU4cuejeA+kUUaH4exKSrDhWy15czubYnbeUMOjmOUf6LbPMV9VGWWRwaTRCtq+Ml25Afa57PdRN5GZIdtj1EVIinZXqBbqBuh5+0z1uH1L+sufVLFrH57bMcmkTNFJQJVbAn1CGGf8qaTcltxulr6g8qOOLHFjqiavKC7dtIVK4ifAaE6dJGfiTXlem8thg7nvo6WnHEq/63aQIWcLXdKIve9UXTZzyUA7NQw19E1wD75g9nE+bKO4h3GI5cGZE1PTfeL1oA6qwmyEPwUPLMHdpHYqEUD9qkIc5CnrBEE6rbGYxMmI2ctRF9KVHqU0tLzGBIC84MrTCxVo4hJGqDCsdY1jWWUy6SwDreR43CnKRfsMz1WxvtE3Nn76E+FCpXYg3zMQur2eIB+Hlv2e3qOYZ6rxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(39850400004)(136003)(376002)(451199021)(186003)(8936002)(4744005)(8676002)(41300700001)(31686004)(316002)(54906003)(44832011)(2906002)(478600001)(66556008)(66946007)(66476007)(5660300002)(4326008)(6486002)(6506007)(53546011)(966005)(6512007)(2616005)(36756003)(31696002)(38100700002)(86362001)(43740500002)(41080700001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNyVG92VUNTZzNSMXZ1bFNrUDRxV2pRWlRzK2JaTTQ3dVBoSVZnUXp0VXo5?=
 =?utf-8?B?TlRlNzNDcCtWVFFjM3Q4cUE3eW9hRlg5REUxV1hxdTRrVlo4QTJxOWtmTlJs?=
 =?utf-8?B?TFhaQTVrYTZDL2w3bzRBVStqdDdLL0lheGIyeDJyTHdQbHhHUHNwc2ZrS2tT?=
 =?utf-8?B?c3kxb25CNk84NC9US2R3WTlEQVFvWnVNNWpEdzd3cldJNklaaHk0RzlHVWF4?=
 =?utf-8?B?ZStFemZPU3A5SmNxN3A5VGw2di95Y0tiSzVUQ1E0NkhXWjdDZkY5K1JKUUM4?=
 =?utf-8?B?RDV4b0pzR21PemJCNG8zYXNLQ0tpZHVyN0VRM21tNFdSNzdvN1dSRGIxdVdJ?=
 =?utf-8?B?UmxvVkRyajU3MjJhTUZnOStaOXoxT1I1U3FJdE54cjF4ZGJuL0dtS09WZi8v?=
 =?utf-8?B?UG9SQlU5L2dxUzNLdTViMGhmZ3BPMDYxS1NUTERlUHNiZkRVK2VlRlZIVEIw?=
 =?utf-8?B?WmtpaHVJbldLSjZUMjdRWWhPNkRDd1NzNGdmUG02MFUyRXd3WWlUZmkxYU03?=
 =?utf-8?B?YTRwcW01WUVCYVRzSlZvVndJbDN0SHpDRmh4RU9WemFyMnEyN0t4bWdPM3dn?=
 =?utf-8?B?NVV4Q1RhVGoxQXFmSGNndEw1Vmp2d0FLQVFpQ08xQ3pzVmJRaGpxbzcyckJL?=
 =?utf-8?B?RzV1bTBwMVY5ZlN5MFZHSWNrNjhkOU55ckV4VE11bmY5OWJKcUUyQ0pGVFVH?=
 =?utf-8?B?ZzdpKzNJV2lrN1BRQzQ3TFNMdHRQaSsyU0M2SVB5T0tsMjVQSDNhcW9yWS9E?=
 =?utf-8?B?QzNyZG5CYTZmYldueDJ4Qm00SFJuNUJZN0t6c0E2d1o5b0dMaDE3NGp6Nk00?=
 =?utf-8?B?L3dXYXhObmRGemNmb2tQN2w3ZEo4TjRPZ2dyWVRxamsyaldTekR5TzQzM3pU?=
 =?utf-8?B?QVlsTFQxdG9pOU1TamxKOVpGWkFOVUM5MjcwUFI3Y2o0bjhZRy9nVlFqUkpF?=
 =?utf-8?B?Yklrc0k4aGgxZ1lzMWpBQmY0SGp5Ny9sNFRmbmxXcGVIb1orWFFJN0dOS2xz?=
 =?utf-8?B?Y0NhczdIV1FTSThWTWszdVZmemxaWHZRbHlBS3RkeHVoanNFQkpuU3FEMFYv?=
 =?utf-8?B?Qm4xUHFMR09Yb3FFeWJoVEl1d2FqNEJXT29SSVlTUG1aRjQ5MGd2bFpxQjEr?=
 =?utf-8?B?OTBYUkJEeHpaYWRZSEpoWWpaRE1rRTlReGhZVkVrdGZLQnFpdkdhMlNOK2ZX?=
 =?utf-8?B?UXB1S0ZQd1VBQWNhaXhFUE9lOVBPcjkxdDcwWlZ5SWRmZVdRcGl0ZlhEaENt?=
 =?utf-8?B?UE5WNFlLNGVlbm9aR1dIWDNyVWowUFk2VUxqbHJ0L3dJTHpNcDd4S1pwVTEw?=
 =?utf-8?B?VVR2RmM2SkNzdll2dEQwaTI1ZDhxMkViS2MvR3lUQ1FJOVhrZXZDc0o5ZEZG?=
 =?utf-8?B?QWdGZzdha1ZsNTlsVGN4WUVXVnQ0OEdRM2tGY1B6YnB5ZVVnK0hyUTFvWlp6?=
 =?utf-8?B?TjFMWC8ydG1xQ3k0NzhITUxpVVduZlBZcWxOTkppcDcvL2NicGlDYkF0V0hM?=
 =?utf-8?B?ZGxsSVV1Q3FDSE9iQ3pKVm1WZEE0N0paZVhEQ3Z3MnZmNFd0a3ROdk5aZmYw?=
 =?utf-8?B?NmJQOEdveXZMcGd5dlZXZWsyVFRPUDVhREpVRWdSVXYrMmRyd09MTEZFNGZa?=
 =?utf-8?B?Ym83VEhkN2xDb01Sb0tkczZ0ZHYzVm1XRDBWeGRNekZ5ZFk0Qmp2THpGYWtG?=
 =?utf-8?B?Q1ZvTVIxZ3hoYVZlUjhMWWdsd1UxOUk2ZFh4OC95ZDIrTEVpNzlKUlVQNHZL?=
 =?utf-8?B?MFBESmkyNCtTTHRUbTk2YzRHVTV6dnN0SlZEaWVJMGo5aTlzSXVaWGN5SmFn?=
 =?utf-8?B?SktiTlluaTNrUTFwRUNlS1J0MTdHQVpYMVpZUkxyNFdDUXNTcWUzdUpRblJO?=
 =?utf-8?B?RmE0bHYyNUVNRHU2bnozN2MwcWt2Zk5PWlptYldGKzBEZWVZZ3p0eU1SSW9G?=
 =?utf-8?B?UnZ4OUw4Rzl6SEM3TStjUWRDU2RqMmsyV3IySnZVSGJaclEwU0VsNi85NzlV?=
 =?utf-8?B?T2FoeERqbDdxUit2R1MwdVRXTWN0WCs3cHIrTmF4QWNKOEhQd3lKdjczYVpK?=
 =?utf-8?B?WHBuOEJta1haMkRFSTlFK0dscDNGVm9RYlovOTArYUlnMmV5MXlBQVJ4VGU2?=
 =?utf-8?B?Qll4YWtWM0NkOUVkbldJUmpoTWFUOGhIN21xdTdQYkJhcS8rb3NHalNXOW16?=
 =?utf-8?B?NmpPdUdxdi80Zll2S3JralBSeU84bW9iRWxTd3ZLdCtwSVgxWFlqSER1QnVr?=
 =?utf-8?B?YUloSE04WUtrU3ZrRzNGb1lPcmJ3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bddf27-de19-4362-9456-08db7330aebd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:55:13.2449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khOGiQF1Kw0187G+tBNAP3dxV5Fb9a7IOWrExh0HHF+W0tJcmjC3o27Q+OcO9nCGfr4uIZKaUpeZxjHdh85D1MLFB+GfIr30xDv/9wR+JxZhUDkS178eifOL9Rf2dz9r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7gCHeXA2wH6qbKQKep/SWWv+kv9MDrWjdgNUR8Ihno=;
 b=JT3H3oa+S+W2R7iAQCqczD1vJ5HZoQSgleCno4IEVyK3N9qS+OGDVVPJuJPjEI7whb2UDA5wb5/E0zr4ddo5IVy3v80a48mXhcVlSkiR5gy3YaO3q7a0RxpiswBao2qABNl0zG7ZJdPPbvnpMzPflraHEIpcUfiJ6B+4HoSgnqg0l3Vn22KvX9Beuv4i3dWrJ4pb4OCTCqD7hu7WAx8pslr38dbeH2VDehhABu11fEC1Jdw48knQS9Vt2zq7SzDx8uQfafU98UhkHo9rrpOrKHRPmAgPK/rBZP0911adyxz88mX3rT+IoYxpb9Gn2it98HQ/9jZ0T4WGAs8/KQ8NwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=JT3H3oa+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-segno: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On 4/18/23 13:42, Witold Lipieta wrote:
> segno 1.5.2 https://urldefense.com/v3/__https://pypi.org/project/segno/__;!!OOPJP91ZZw!lEXVpUWYiy1T9YwZ4Cxu2S_MeTgIGviWmD0J_Fk0JPmBkA2a3mg6rZE0RH2upyZgVix3S-CVL0iXSgampn5Rt-Yx03cfCLJn7F7icG3a6A$
> 
> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>

Build tested by running:
make raspberry4_defconfig
# change toolchains to prebuilt
# enable python3-segno package
make python3-segno

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
