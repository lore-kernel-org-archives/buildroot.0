Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B73C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 09:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF9EA40B54;
	Tue, 22 Apr 2025 09:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoX7igQqb7mr; Tue, 22 Apr 2025 09:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15FB440B56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15FB440B56;
	Tue, 22 Apr 2025 09:40:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2D101A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A81A840B50
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmixmVoZYApj for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 09:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2613::62b;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CED8F40B44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CED8F40B44
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CED8F40B44
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUpHSTYC9lRhPXEHvT/PlPj8hxTWmGynP8LvRCHnx7qU1ze5Dk/zPkqmKAxZyyGpWZssAuqeW4hckOewZy04hbkZwM8ZUH17BWwG41sS6IcZeMMqjzskQ3XXOkWE90xMY7B3Ft1A65nGEB323A5SU0h8V5QSvtpprIveDDfGgG1Ya+JMdlpGAdlSRb+PpC6EIETtQxACofWFewaUs6i3a0dLPJ8mxCXPQcCMcedb4cAKOnS/syGKgXZL7vWhMgEQnAzor8nk+4BAVfNGiGZ93eTikqvgsd/3tRdeMq4hlGasn7Q2wlHwJW8eNtL6s9Rb4QtrmuW48GlP+mqyjRSo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzEXzIYyj/8d8E92wc4PnG+yYgtZ4xwL0G9twXFetjQ=;
 b=VywfPV0nDyxb536w20epiDCsgurj5STez2T5ngd6+TpaGtLaEU6Ba34xSfvDyVCmPV/llQ4QMHCV2cpW3zOYVSM2NmM0peSuN/bgG2Z9w1SUaS5p1gIdzOYEm0PDwUHUqYFVdCJU31/2ZoE/L672ldTFOhS4+RLpvLjRSAU/EO84sLppZQn7M7u6J2/HEURLhdTUVFpe1gajY0pph4JLqYGjCrht8vVNnVH8GDcePR3sAN20/14CEp/gNsEXMUqyAexaNERWZ55e+WuXxHmCZGmTQOvJB74Pgc+S9R9W4/F6jtSBV0EkIVkh4wAS36gCdAY/hckl9CbmBXShqTdGiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9005.eurprd04.prod.outlook.com (2603:10a6:102:210::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Tue, 22 Apr
 2025 09:40:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:40:45 +0000
Message-ID: <e15073e3-c1db-480e-87d6-ea152c1e9392@cherry.de>
Date: Tue, 22 Apr 2025 11:40:44 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
 <20250404-libcamera-0-5-0-v1-3-e2ca9d029aeb@cherry.de>
 <20250419222648.109fca9d@windsurf>
Content-Language: en-US
In-Reply-To: <20250419222648.109fca9d@windsurf>
X-ClientProxiedBy: FR4P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: b9013ccf-ecd5-420b-a0dd-08dd8181c154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG02SEpuS3A4MWFsaGk0YUxjN2U4bnlkUWw3OE9yelQ3NXR5V2FCcWFRQzY5?=
 =?utf-8?B?UGhTbW03WU5OZjM2aU9wZVdvQzZ3TUZJdVd4UTB3QVRudlUzdDErbTNCVHZh?=
 =?utf-8?B?aXQ2Y1NtdWg3QWp5Ry8yTWtDSWt3OXV6cTF1NDFKWkltY3VqZHp2OVByc1Nm?=
 =?utf-8?B?V2R3WVpkb0ZLWlo2VTNsV1FrZVV4Y3Nac25XRlY5NDk3SVBrQTlOQ1cySmEw?=
 =?utf-8?B?SDBjNG0wOFhmVkJubVdBdWNkbjl3UENPS3RsMkpuVkNPQkRTZ0xkR0pkdUJ4?=
 =?utf-8?B?UDh2UHRzcFlVSWxYdWVrTjFmVVRBQkZ6TUFFUCtpaStoamRDTEZQNjROeCty?=
 =?utf-8?B?YkxHMzVSYS9nQmF2Vk9URy9IS25tRFUyOWJXU1lVUGZXU0EyM2UwVXNlends?=
 =?utf-8?B?UjlzVStsUTV3R0UvamROTFkxU291SmxMbjk2M25wSzJQSXJLUm94TVJjUFFr?=
 =?utf-8?B?VWZKVjFZaGROV3RpUFNuOVJxbnk0WmFaZnhzY3JqL3BpQTk3Y2RGOWxFbmJK?=
 =?utf-8?B?d0ozYzk0RnR4cXpHYUdNU0NsYVpxaTJKUlQ2bzNGNm1oUXJSM29ZNlpuSndx?=
 =?utf-8?B?YTdMMlJoNXBuTlMvSGErRDdVRUpQaXBqVGhBeE5sMTUvelNDellla3pEM0FU?=
 =?utf-8?B?bGJlN2piUStLZDgxMWlaM2s0K29NVThNeTFocUNNeFRpRnpLNzl4V1o3SkF3?=
 =?utf-8?B?a3N2R1M5MC96MlFlTksxMUtnMlhNTlMxcEZ3dExGWnVpNDgrbVdMalFZczFS?=
 =?utf-8?B?ZHNvaHBuNnB0TGRWZFFoYnNXT1VwME1KaUZWNWJnY0J1ZWpkZnNGUXBlRU8x?=
 =?utf-8?B?TjY4L3NYQWVPRmRSNzdoK0NlR0t5c05oR2Y0eUJjU0U5T3h0c01nd0IvNkFZ?=
 =?utf-8?B?SUYrYm8zQllHM3N0T2MwMm4vMGJVajNWSHFhaFJZTDRFYzRXMU1ldW01K2tM?=
 =?utf-8?B?ZEJONkRZVUFBVE1jMHQyb0FvdkFEb2RLS1hpQkdvWTJGclVBRExjUzRSNHlu?=
 =?utf-8?B?WWYvTitqdS9taGNUbnc1a2ZndjlmVXYrell1VnJseUU1K3FsR0E3czlGdEpX?=
 =?utf-8?B?TGhlYnNyZXBVeXhrTFo4RFpCY1FjdkZWb0twN2N4ZksvSkZnREgwYTcraDAx?=
 =?utf-8?B?Smx4ZFhkZVk3SmRsdm9CWGsvTVR6QlgxNGNNa1luVmdCUUtXNE9PZDN1ODBL?=
 =?utf-8?B?Sk9SbzdzS3Q1am5Nc3U0RTZaUThXbGo1UmMwdXVTRVpJMnBsbVBkQmsrVXZ1?=
 =?utf-8?B?L2dhcGJ3RERGV1VPeEFsQ3FBRyt1dlIvekJmS1QzSTBGRE5FMmhmVWNFSkxB?=
 =?utf-8?B?K3VOQm5RRHBxUmx3QWhHKy9Qb3J4cDZabElvUFNzZ0taQk9rSEVtU3JDUkR2?=
 =?utf-8?B?VlhVQVJYTjFOd3BNQjY3SUVCWm9hWUFGOXJldmFlT0FFMjdERzhSaXp1NzRs?=
 =?utf-8?B?ODVka28zQjREdGV2dzI4ckcwNm1WU1gyOS9ZTnFJenJZUkpuYmc1Qm90Q2d5?=
 =?utf-8?B?SkliNldxRGZBZDhkdUtDcEFwUU5kbm9wOHpIUldBcjBUd29TRFd4dDZFNmky?=
 =?utf-8?B?SWFrQk5pVG4vTDU0NThlUUxCOExvdmhLOTA3T0VWUmx0Y1Nxdk5iZVhTRzdI?=
 =?utf-8?B?TWFpMUJqZ3J1K1R2N3FOMUlQTXdLdnVTVEFKQ0g3WUpFM0w5ZlNkbFZ5d2ov?=
 =?utf-8?B?ZUx5QXAyTE1Ua0lCd2FPdjVvd1lLbU1nWVUyZkJIRzJ0ODlrZlN5dmZNc05O?=
 =?utf-8?B?M2xieGlLVlkzellpSTVIejE1VUJMbDRFNXBXUmRxOU5LRElZaUcvWVBSL1FK?=
 =?utf-8?B?UHlpTU9vakVFZjJoMFhLTlZRUzdsSE1kUDhwUjhMZC9Wam0vaTh5TGVjVlZR?=
 =?utf-8?B?Z1NiSEFWd3RoNTB6L1Nva0hUU0ZIVlpoYWlaWExXdHc2bzhBRkI0UFJKT2lX?=
 =?utf-8?B?aUFsa2tMYUt5WlkySEhEaW9abXBhSHZaQXhJbFViTjZESWdNSElBeEs4OFdN?=
 =?utf-8?B?MVFCd2w5d3JBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(41080700001); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCsrWTFtQUZ4dDNZUlZIa1p6czViT21ZNUNjdnpCOVlVUjlWYy9oeHNGeVo0?=
 =?utf-8?B?RG9uMU1Qa09TTmNxSU1XaWxFcnovSmtGd2c4NHgxTWlUY3d5dGd6YzFWKzYw?=
 =?utf-8?B?WWY2UjF6WmFWUWJhZlBBcHRYdEhhSUtCWFB1OFA4R0lIVXpzVGV3NGhyKzB5?=
 =?utf-8?B?MUQvVVZQY3BoODE1SnVHWWJ2c1R4MXlGZ2hJUlFicm9VMDVZaStWb3FTTlR6?=
 =?utf-8?B?bnRFU0ZFd2hZQ0dIRDhBMEwxTXkwN2RudUFRaTExN1M3U3l5SUV3SjdBeGhk?=
 =?utf-8?B?V3NLOHJ1bCtTbFZHYlVqT2R6eHcwa3RXbkxuQUkyWWZnZUpwSEV4a015cGhP?=
 =?utf-8?B?SHpkb3A0YVJQZzNOTG1zSmMrV2gwOWRURW5BeExGeEJrNndmWHN5YXg4aFlY?=
 =?utf-8?B?T0VWZFRESWJQMTdrL3BkSnJhTWtla1ZEUjl6ZCtmZERBZUIxaXpDdzlnckxq?=
 =?utf-8?B?STFOY3doRGorNUtWcEYrZ21QZVM2WTIrcDZXRVc4NlNMSWZESkNSS3Y3eHlJ?=
 =?utf-8?B?cUNpLzVPcy91SktUcURwMXVFK0JleERGTW0zdEtYNnlQemVTOXZtVTVSZzlx?=
 =?utf-8?B?TTZpNzdRcnUrRWV6TjNCRjFrY0dOT0lYR1F4eEpQRjRiZkhYT2NpNitjZE8v?=
 =?utf-8?B?aTFNUThvd1I0ZEVPQktyV1lMUi9yRnJrZGpmMUNNWGZnRzQwa3l6WEp1MUsy?=
 =?utf-8?B?ekRpUEJTZ1ZkdHI0RHFRZmRqUXBiRVM2TVluY3FuWHJSWWZ5QlpPUlFSNnRN?=
 =?utf-8?B?bFl6UTR3SzgwdCtlQm1qaElXS0JDdTNIM21ScUhVUEFjWDV2YlJ3ZS8yNy91?=
 =?utf-8?B?M2Q5bXNERHZpN21jaHRSc0s1bVpJN0dKNlA4V2kzZHU5alNqMW91T0NBNzdq?=
 =?utf-8?B?NWs1OEhPc2pYUGs5a2l3WlozUHJxQ1JjbWtCYndBZHpDaVZKTnhML3RzTURk?=
 =?utf-8?B?RWo2d1V4N0RaVFRQMUxHb3d6OVppOVVPUFVtUG5CN0dGRlQxMGZQWVBJQ1or?=
 =?utf-8?B?MFE3SXdpU1BzbWRJRGw3Zi9ZOE52aE9oY0dnVEhlY0Y1SEx2d0JjbEhZc05J?=
 =?utf-8?B?NGlHUk0wQTk5eGF6MHdya2h5b2xKdWlmYjBrTGttYU43SUU1SDRQU2ZzamUy?=
 =?utf-8?B?bFRTZzFWbUtPRlhlS1l1U0hZYkdta2o5bGozSWhVUWRMT1ZraEdsTlRkN2Zz?=
 =?utf-8?B?cFd0QmptRVhWMUNFSnV3aWxkTjc0VTFnS0ZUNFJiK1JDV3ZJZzY4ejlhdWMz?=
 =?utf-8?B?Q3FhSGRHbTIvV1RUdG9XT2VQRlcrOEl6SUprcGliZGdwek00V2RtY25MZnlK?=
 =?utf-8?B?TkcwN2t4UWJjTVpuOEZEUXdVb3RpbThRb0VhaUdYbzRsNjdzSFVkMVFxRDIr?=
 =?utf-8?B?b2dHVi9RM3ovdlNZejVteGFaZURJMEZTZGx2SHNURUZEaEpZYlR1bkg5bU5j?=
 =?utf-8?B?MVhBUnNmODJ1VUtuc1oxaGYzTmpNdlBOL3hNU25MdldPZlNaNlRkRW5ld2VX?=
 =?utf-8?B?V2FYcHJlcWxvZ3JPbC9UZWVITzA2TEFGWWFuTDlTNkVyVDcrajQ0dkVBNkRT?=
 =?utf-8?B?UGF1KzIxRUJuaFV6WjZyaEoyRXNSbExta2c4Ymk4dVdBWlhjZlFkM0xnRlZo?=
 =?utf-8?B?ZEQyUnRTTnhvSmxOemc3MlUyeVFRZG1RNXcvVHJqdkFQcFlrVHgvWit0STND?=
 =?utf-8?B?amwvOW8ySXJNV21xVkxHMGhLeEhIVWJTTkQyT240MkRKU0JCbkRCeTJtQW5V?=
 =?utf-8?B?YjFzclhqR0crT1NJTkkxMTR1OU9xcU82L2M0cUpPWTRNQkRnQWcxYUI2K0hk?=
 =?utf-8?B?U0RLK01tWmNRZTlGWGpjbUMvSnRCUXRwOWhyei80ZE56dktoTFdwUmk2d21O?=
 =?utf-8?B?RWZOajZVY1Z5UlMvdWZxeHdZd3hDaFRXaE1McnRqRExEbzAzWTVMWlVKcjBQ?=
 =?utf-8?B?b1JLMStrdnl5TUZiYWFZVWV6cnE5enZZTEVDUVBlb0E2dkpNMUxzRzlmTzYy?=
 =?utf-8?B?ZlVtOEpTK1VCWS9aV3VKUW9oN1E2MWgrOWE5eE1kYm04MFZubmVGWGNPaHBn?=
 =?utf-8?B?eWlNaVc2Nm0rMW4wZHo1NTN2M3Z0SkRUZVIrWHE2YzhnTTU0RG1aUmZrc3NW?=
 =?utf-8?B?cVR5cEdxNytTWlJFUUVIZEZyTXZWcVViNUZTSkFjQ3BYQUQ2RytySWlkM3dK?=
 =?utf-8?B?UUM4b1YvcTdIRUduRzdqNDlUOXdSalFEWHFrTzl4NVp3L3B4UWczbnVNdnFW?=
 =?utf-8?B?cDdyMmduMS9Gb3ZWd1FvSUxUYWl3PT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b9013ccf-ecd5-420b-a0dd-08dd8181c154
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:40:45.2483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5J4DuKOBkJyUWBWNO5M1jTC8OoUi5y+hscCGhWBdIz5Gth9SRrT0mH2AHV5M9PhmxKYkpql9evR+0j6AGQ2n5jDOi0gInN/1POffqCAiUxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9005
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzEXzIYyj/8d8E92wc4PnG+yYgtZ4xwL0G9twXFetjQ=;
 b=kVHL2TwsGzMBrv+ydlDTH+uAxxP34T2a/Ubkc3yzEoHCc7HxVldVqkHLHxeAJwIMkFVPXXh2lj6f5HcqDzyUhm5tYGfZRMXDqnIRd4lPbia+y3InMoM/tQFrfZkY2e0QQHjQK4QuocfEXnPXwm0DOSQ0MZBb3G94/HMRftLo+Mg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=kVHL2Tws
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 3/9] package/libcamera: fix crash on
 Rockchip with kernels before 6.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 4/19/25 10:26 PM, Thomas Petazzoni wrote:
> On Fri, 04 Apr 2025 18:47:34 +0200
> Quentin Schulz <foss+buildroot@0leil.net> wrote:
> 
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> libcamera migrated to use an ioctl for detecting frame sizes which is
>> only available in kernels 6.4 and later. If it doesn't exist, default
>> frame sizes are used. However the min and max resolutions supported by
>> the pipeline weren't initialized for kernels where that ioctl isn't
>> available and ended up creating invalid configuration that later
>> crashed.
>>
>> The introducing commit was part of the v0.4.0 release.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   ...amera-rkisp1-Eliminate-hard-coded-resizer.patch | 110 +++++++++++++++++++++
>>   1 file changed, 110 insertions(+)
> 
> I didn't merged this one for now, as the feedback from upstream isn't
> very clear, and it doesn't seem like it has been merged yet. Could you
> clarify this?
> 

Not merged yet, discussion dried out but I'm not entirely sure what's 
the way forward at the moment. Have pinged libcamera community on that.

I am confident something similar will need to be merged in order to 
support pre-ioctl kernels in libcamera but I understand Buildroot may 
want to wait for a patch accepted upstream.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
