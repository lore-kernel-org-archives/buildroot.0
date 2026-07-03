Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E51C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 15:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B7960B13;
	Fri,  3 Jul 2026 15:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uEffKY-RYnt; Fri,  3 Jul 2026 15:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C04B60739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783090841;
	bh=1WJb/UFE3c//MOkeBX7RIrj6qacv9I9uhaXDTBR8z7E=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=TNdyQfBeE0B3PiZMek3lDCslAcxfwp1aI9nb4RUAbEOpTAZ4jIh8UBB6avY0Og0dj
	 zMWHa+GoOzS5VXVc96y0Yv3bNO97XXbBScPRvyJWETSboCxuO3pAIc4y8JulmyhcVH
	 /TiezsdZRB41eW7yjE2uEoV/KSGhOXIj+lcYh1q+0colQ7cH/u+IpCrTH9DRI9xuYK
	 WsFf0/6iOBEex0H99/2TjVN2dqudm137MnaogHQvXidTzitUfIDHGKYT5OXzwu1zs0
	 6MedvaUsmO+GPkivpcLprUzMO8pzv2RjnVFrhoHW9+1HhMKjqEpRuJMfFB174OvmJn
	 vfBFG+znFB9sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C04B60739;
	Fri,  3 Jul 2026 15:00:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 123A414F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 15:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBFEB406DF
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 15:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ubq-6dVidP6j for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 15:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::1;
 helo=am0pr83cu005.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03EC840689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03EC840689
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03EC840689
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 15:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgZZxOm/OowXX4NRS0JSmWY/0X/x++v/mvyh3Km6F8sb0M8ryPMGi2YhYB7jzHFGn6IRacCVFdbJI5+AAaCCo6QpQ9s36ArLjWgZp/xy8x8HEuGJNN7/bQZ25m39cHJhdqFGzG6GRwTMdHB9qW84AJ5My+FEEplXrwy2HjyQW8YER+jV9hIvHLY5DRYzFTm66sR3+RYZ3jS/3sg83XwD0IQ5cYSfRd6NHEnZHJt2g1cenfp9zlRumPWYY30WJri8wzafu8FqR0UK6Bpi2WVN/WNY8Ju9vf6lqKSxauBXy8MpKrBOEQCrUf1PCMYyizV2q8rnLoPY7/+dQn4PHU5Xpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3r7pBkgCnRj6fF++gZ+vUSxjnspC89JK0cECHaMa0Fk=;
 b=yzm09TH2oI6SXxzy/i0Elp7DU6crfZ5hD8iCluDvH5p4c+lUXnu2Hpz2E/3+Vkr6xtspaUmUl0wUjGVME/Ln/jPSaBJTU3gCVNnUdsAqfosnFSphs1eX+0L3Ps1c9o9dAr/Ot5LfZ+m71FmP8gguCKub1S+6t/co0Emuf+WwoI28kWfB+CBsOeYqefzoVmn3zxwjlGDYt98Q7lbrhvhIGPY/ubadEDLYPn70WvwRCFL0aaCcU57LwWRgKYBARLN6FqlOrJNPhIkfGD9p34IM9KMTfmBiindVR43gKz6hTvEMqN2es5O4l1qCecGRpaJb4CkRTiga31KbS7ISh/n4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DB9PR04MB9790.eurprd04.prod.outlook.com (2603:10a6:10:4c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 15:00:33 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 15:00:33 +0000
Message-ID: <2f6f9a46-afd4-433a-9a0b-6a985a96a98e@cherry.de>
Date: Fri, 3 Jul 2026 17:00:32 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-4-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260624101340.80670-4-thomas.perale@mind.be>
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DB9PR04MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: d984ceb0-7c91-472d-2641-08ded913d4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|13003099007|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tX/XidOjK8ccXsjhgUpOT81jJQKGwsLnmycoeTc9uc5G6up2tj+PhAI14A0LH7cCUBOjaDWYQnQbhOjM+6ieCnJRELGjjhKmBMWtPrLF5cNGvaGNX/ntXksb3vdWDKyyjMkgUECLvOUlhKVTxTdY+mlkrIKxs9sS7zyMwNrCe4ljx9qBWk53ddHN/GkgfgZmI+JetfEmOmPtVx9YS+O6ctaKxgrzApK9F9uJxuPhsBJXc0XXXGmMLuy5kLcUFTgaONoOALq44FmcZwQ/VQExyypzs15s2DFAegyc6zwhvH97i9GtPE5ig3GAuq7KcMND86KNpzmmTQrkvlGz5cvClBuxAvM2eFzdEadcN6ZwiaVcoijaHA7b1kEF2DnI7QmeBFVf1EibR36aJBij7doy2fKSEg9YdnjguPfuuArKLpAPzANZo2OGcRZGoPg6R8itvJvz8HwYTBo5V25zzL98chESvgRFLLuE4ntxBpLhHDarTTVK3ZrmK/eav1WtabmoQWvAuVcFwuZ8+YWgd3z/J4Ci/MEhvQE5MAEk0mO4gpulVzZ3egyCOER6ygHsDay3G08TZ5r6EyXuTC+Qs250iK0s+vsM4NGfdRwwuUhkneg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(13003099007)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2l6OXg4RGs0RFNxaEFVN2lVTHZ5dVdGUGtTYmVhRmtZK2lDK2g4VWFjckdn?=
 =?utf-8?B?R29iSm9RcUVGN0QvVUVnK2gyN0N2RjV0UHRUZDhUWkpuZWN3NUwwNGVjQVZ4?=
 =?utf-8?B?ZkVRNmZRVG5nbUpFRW51K05hNGw5N0tKbFQ5OWhSSkJubTZIUldsYmVwbkxn?=
 =?utf-8?B?SUgxZnlOUEhsZlYrNGVpSlJKckU3YVJvU2E1RGVBVUpqaHpZM2toQjBFYmsy?=
 =?utf-8?B?UWRjNjA0TWg4ZW0xbzVCZ3o2YnNaMnBoem5RRzZkYmU2QnpsY3FuSVBqOGlS?=
 =?utf-8?B?a1pmeG12TENMUTl0ckQ0RC82MXdYNFJlUjVudmNMaHdzdnlLRlBOcC84L3gv?=
 =?utf-8?B?cml2aW9NQVZBQVB3SGwyMjVJWkMrZlpMa3J3U2VGZVhldHYrbkhrSUFZR3ZY?=
 =?utf-8?B?aUJEbEtEejFzcFlVcWxKR1JpTjNZaXZUZ0pqSHV5OHZTWGEyN0twMEdwNjl5?=
 =?utf-8?B?MFlPMlc2dVhscmovc2VzL3RJQnBZV3lsVWJKRVNrTkNOQjZveUs1WkFOT2la?=
 =?utf-8?B?a2kvMnNiK00xMHJQSyt4VGFBVVMzWFB4SXdpVlhnZTJheXJEZksveWhlYVdj?=
 =?utf-8?B?Rk1acUE0SGdDUDNTRUpiaFBvMHdJQXhwUnBGTkVyb3dxNUJFYjQxSkU0NDhI?=
 =?utf-8?B?VEtOMnp1dXh1NFRLZzVpUnhja01YZ0JUYXp2Rkh3UERBRHlpbis0b3ZRaUJN?=
 =?utf-8?B?MGpLUG5hc0lkR24wU3pGdXJ0bXZSZVBjdm1kNTlXS3FCV0NKL3pHTFl5THMx?=
 =?utf-8?B?ejdGVnBOL28rYUhLcE16V1RDTk9GZjYzSFE3TGI5RjR6bXdWZmZLenZkbGE5?=
 =?utf-8?B?ZlZ1NzVXVUtEOXlCTmplMG84MWw3eUtaaHdBcWtsKytHWWdEM21JQ20zMVhU?=
 =?utf-8?B?QTNkQm16Qkl5TUExMk5lZC81ZVBDTmZmM3VicjdoUHQ0NXdkVVhuSjVFUW1n?=
 =?utf-8?B?TEh0RmYyT0ZPSHhIR1ZLOExQcWJpaFRvWmplS0pTQ3ErdEk1Z2toZlNjOFM5?=
 =?utf-8?B?OU8vcXFWWTdKUWZiVWVLTUFOTFp4b1BlblBIQWpzTW85dWdUczdQaGRtRXdr?=
 =?utf-8?B?NEp3SzRCVFh6Wk1vOGxHRTkzaGpuMDhENEVWWi9SR1M2dVJuOThiY2FFUWkz?=
 =?utf-8?B?Q2w0VFY5UHdiNTU3Nm9SdUpMSi9ZVjE0NE5Ga2dMc2lPQVVsSUcxTzFqcUtQ?=
 =?utf-8?B?YzNBZjRHa0ZjVStJWm9vQ1c5aFFqRER3VlRTMEQ4akxEbDc3T1c3UG1qU1Mz?=
 =?utf-8?B?cnNDcGJPQ1FpWjF2TmpsSUQwdGxQWklNeEc1SDRpQ2JkNCtHaXlyRVpkcUhr?=
 =?utf-8?B?RGE3M3dvNnR2aitCcUUyRjg2RnFudml6SzZjR3FBajFvKzM3WFZrVThESXhh?=
 =?utf-8?B?WVNqc05KRXpFUnFxQjNRL1lkR2hTR3NuTXkzTVMyV1VRZFVPeEdVVGwwOXkv?=
 =?utf-8?B?bTVLNlZZWGJoNVFXVjdkL3ZIbEM5S3JYMUt2SlNTOUlOZkdaT01qajVYZXo2?=
 =?utf-8?B?U1RiRnprNG1xai9weFRycWRYcTlML3NXZ3p0TVdXbTF3WHBUWCtNVkxnS21C?=
 =?utf-8?B?UHVqTU1rRXNuZDN5V0JBcmZHODZ3VVBleW1PSGhzUHpmZ2ZHdXM0cnM0RkVI?=
 =?utf-8?B?bDBEOXJKcEsvNjBMbXFhWnk1MkVwRkhsbEM5ZTFmMkVoOXlGWDhJRmI5eVQz?=
 =?utf-8?B?dDNUQVcvaHczK3UyeTR5bytHaG50L2R2bWJYc1FrNmVGTUdXY1d1VmlnOUV4?=
 =?utf-8?B?aXRQVkJhZFpyL1pQVlF1eUtsaitDeEZNYTQ4cWZZdFNVRS9iQlA5RkdFWlpX?=
 =?utf-8?B?aGJ5cmp1Wlg5Z2Rsb242NXdoQTBXUnV0R1Z6NkZieE5PRmtwVjVSdHNjOXBR?=
 =?utf-8?B?ZW5pcDBqL01zakhzbkdSV1pwdG96YnNuVzRTZkFTTUFWNE82RkMrcitaSlJx?=
 =?utf-8?B?YlVzeXlIaExSaDBxQStBeExINzl0bHJJOWlzaXBXUnFhSXRjK2k1TnAzMDdl?=
 =?utf-8?B?ZVN1N3d2YjJINXQxeStycGl0M1FzL1VPNXdycUw0UUhLRkVIRVY4Vm4rK1NK?=
 =?utf-8?B?WW1EZWpvTXNzVjV3ZlpWZUtSTm1lL2xZWFlwTzJNRllxZm5qbUFrYmExTTVm?=
 =?utf-8?B?WDVVb2pTaXdTVUxsUHBEaXk5Yk1WUTQ3SFZ6UU0raml4OThTUUEwWmhvQjBR?=
 =?utf-8?B?UWZ6TWpEUWhuMVRqcXFQSDYrdVhLU0RsMDF5ZkVKUmpsOVBtdzBRUXptWmZQ?=
 =?utf-8?B?WE9meEhhR3hHbERkVy9rOExZR21SVGJRaVZZMzZLdHlLOUNqVjJ3OGRGWkRU?=
 =?utf-8?B?YVg1bW9kYks2ZzBSZnIrSXQxNEczNUJEaUJJVjh6VytuOEVid1luQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d984ceb0-7c91-472d-2641-08ded913d4ec
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 15:00:33.4565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLZ6jxrIqDovkxmoHFmrvqfUKHAIQ6BRV0wbviRSzOC/5ahnj/bJHoDsymfuzwwpFf+tTpCGfNWBTUQQGVulw2DdbEva3iBQobQ8k3jKkTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9790
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r7pBkgCnRj6fF++gZ+vUSxjnspC89JK0cECHaMa0Fk=;
 b=T9XxXMR6EjJyXtxuGOauYbp3qjKtN5oARy/s66y/sMOZPxud1DRXO/t4SP+fhwwmRRngd5NPMC5Qy03vFJOnfKQ7X32SaBaGUchWmkhZMxJyy0h9M0MmZRnls5aYVzBnuJAW8heMUwKOgKUf4oI6ES1h2w7bRiGJbO8EmqYkoOU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=T9XxXMR6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 4/9] utils/generate-cyclonedx: mark host
 packages as excluded
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

On 6/24/26 12:13 PM, Thomas Perale wrote:
> Mark Buildroot's host packages as 'excluded' with the scope
> property [1]. The excluded scope is defined like the following:
> 
>> Components that are excluded provide the ability to document component
>> usage for test and other non-runtime purposes. Excluded components are
>> not reachable within a call graph at runtime.
> 
> This fits the usage of 'host' packages : a package without a runtime
> purpose.
> 
> See the mailing list discussion around this property [2][3][4][5]
> 
> [1] https://cyclonedx.org/docs/1.6/json/#metadata_tools_oneOf_i0_components_items_scope
> [2] https://lore.kernel.org/r/<de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
> [3] https://lore.kernel.org/r/<20260409204208.302842-1-thomas.perale@mind.be>
> [4] https://lore.kernel.org/r/<bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
> [5] https://lore.kernel.org/r/<176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>
> 

I was wondering if the toolchain (which brings a libc for example) would 
be impacted by this, but no, so this here is likely fine.

> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 902b4276ec..9e3bc9d4b8 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -371,6 +371,9 @@ def cyclonedx_component(name, comp):
>       return {
>           "bom-ref": name,
>           "type": "library",
> +        **({
> +            "scope": "excluded"
> +        } if comp["type"] == "host" else {}),

The spec says there can be three states here, excluded, required and 
optional, the default being required. I'm assuming with the example of 
the toolchain above, we may not want to make all target packages 
"required" (explicitly, that is, though that is essentially the same as 
not setting it). But maybe we can filter packages we know cannot be 
called on the target (e.g. a toolchain, but then, can we have a 
toolchain in the final image, such that we can compile on the target for 
e.g. another device?).

This seems fine to me for host packages in any case, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
