Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13987C2BD09
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 02:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244F641396;
	Wed, 10 Jul 2024 02:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfZHsjKBB7R5; Wed, 10 Jul 2024 02:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D9A41391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8D9A41391;
	Wed, 10 Jul 2024 02:07:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE8211BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 02:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9DE781F0C
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 02:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUranVM8X6WY for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 02:07:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:feab::717;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=yang.li@amlogic.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A7DA81F08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A7DA81F08
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::717])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A7DA81F08
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 02:07:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoUUl7Vl5cuRwRwUHDxSTJqxFZpiKiKNR+dJ7OjyO7UO11l1EMcgfvApv6T2HoeHUMqV2u02y2PpsCTwgpMS8Qhd/E9fVy74NCQb9StpbjYRB4bPaZp3yAOuHSePiBF3zRaacPg6vD5IWt0cJgK5pF7mAxrE7foYHCKWQ3/EAH5cxQdQp59RtlZyAqUgWl5Wi5Aj5VSXjhS9WRNJah5qY/9HZnt7UvaQTT6tE3gOapF18YOTVYam7hqlVYIFkTNc5gDYFJB9I48Ivn0rxU0iN1yqQ+KlFizYeWwrN//7DDT2LYee2kTidE8u2imwQ9pdkhIaPgoco45no/aDVUV2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q6fykWzDguqM83m9c6bTMpgiTFgxCAez014FRi1/qM=;
 b=qH9+CBL2nhhMG+SP9eBu2F0otrsJoBHng4782F2bDpePmx0lMhf9YyaDVnSwXDXs6RqNZyn0ghFd3ujDIkqIAZDQrFTcLBDyBby6vZkj6kwjABQiTqXGfZttCMPuhU3ACpKliku7V8hXT09Vk98xadlXvqHKxebk+A3IV8qyvZYD46t2tZGFzdVt95qJx8E6k0xsQ41pmqpnd9dmJ1hYb1HImWgs+R4O1C2leZTnX+ofIQisx0gQWNpNCqr9cMPKvs4W5UDYeK0cEhTZ+UE3QGFuE94ZwOfnuHRvSM8uM2sdwifQt6MhGFbpHItW09wJgvuvizt16tU6xe4JTvK+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com (2603:1096:990:16::12)
 by KL1PR03MB7600.apcprd03.prod.outlook.com (2603:1096:820:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 02:07:07 +0000
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::4128:9446:1a0f:11fd]) by JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::4128:9446:1a0f:11fd%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 02:07:07 +0000
Message-ID: <e411a89b-02cb-46a3-85de-b2e45550fd69@amlogic.com>
Date: Wed, 10 Jul 2024 10:06:42 +0800
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240702121745.3445375-1-yang.li@amlogic.com>
 <20240709233246.4026b6f8@windsurf>
From: Yang Li <yang.li@amlogic.com>
In-Reply-To: <20240709233246.4026b6f8@windsurf>
X-ClientProxiedBy: TYCPR01CA0146.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::14) To JH0PR03MB7468.apcprd03.prod.outlook.com
 (2603:1096:990:16::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7468:EE_|KL1PR03MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c3460d-0177-4755-e753-08dca0850043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|41080700001;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXdqUkZrSHlvejJZUVlWT0tmZXhGZEgxZEhQWTJINGJhQ0NNTlpmbnlrRUty?=
 =?utf-8?B?NGp6ajNVRXhvOEsyQzFqNEU2aTU4R2JVOEw2My9Da1FGY2d6a0tCbDdNWkEx?=
 =?utf-8?B?WDJJZG52YnlmU0pZV05SckRUN3EzY3VBdE5WSVpZZGUrQ1duUStRYnFCbkJj?=
 =?utf-8?B?Wm5nWVFVQkgzUU4yQ1BsaWJEeUtBdzJaZnJDUUtEdlVWQ0hBOWJSVWdTNUhP?=
 =?utf-8?B?MmlJWkJRZG00RW1Yb1Y4OEZnQm0vMmRsVEthelZ2RGpiMlZxZWY0MEhRYXA3?=
 =?utf-8?B?UkdGcHlKcEZYTEtVK1QrNTlaT29maktFSHlRYk5QZnFGc0NkMTdkTmVXeXJp?=
 =?utf-8?B?K2NRSVMwWWxXS3gwaW0vVXVDSXNrVlA5MjM5R0F4ZWxUYlNIRnA5eEMyWCtK?=
 =?utf-8?B?V3dQVFErcUN5UzYxeGx0WmlUaHRrSDQzeTJmRExsM2krV1g1bFovdW1Jd1d0?=
 =?utf-8?B?OGJFWFR5SElMaVo4ZUljK0NCSnp1Nm1YZjJEZ016ZE92N1E5dE5lQjV2NkdN?=
 =?utf-8?B?M0tCemVyVU5GQ01aKzlNNUJtdUJZR1hYZ1ArRW5tajZKMU5GeGF3VGphME0z?=
 =?utf-8?B?cEsvVThNMnIxSTlOendnb1o0RHJSTGdkaU5vRitZUXBJK0VpUkZITHBRNnAr?=
 =?utf-8?B?bENhNXl0TG9lT3JacDRTbjlGR1pzNTdpQ1JUY1VSUFovb1VIZ3k0enBXQ3dm?=
 =?utf-8?B?VWQzbTZGdE9USkpveVA3MUhka3Bra2dmMmZZVXRvZlkzTm4yenBDZXpGUDV2?=
 =?utf-8?B?WFdkbE0rNkE0Q3Q5RmFwSytRb0NCdlh4aDMwemY4V2tXWlVsZC9DMzlyS24w?=
 =?utf-8?B?eGFKck9TbENLZ3c5dEp3OTVXTUZIVnBtSFVXOHpxMklvN2NBcWtGRjgvSENv?=
 =?utf-8?B?SEY1T1FmNG1RZXhWVFZWclBjTWlUYkRxLzlTL09tbjdKL0g4YjVyVDJlc3Z4?=
 =?utf-8?B?c1dBdFdGRGNaS2Uwd09PRUJEQnliTUU3d3RvRFpobSt0dUZsaHA5aXREOWp6?=
 =?utf-8?B?eDJIQ3diWm5WamxOWWw5UlhIL1VtNDN0OW1CQ21FdDREL2pqRDZQck5oa0k2?=
 =?utf-8?B?RXZJQ1NsdGR6dE8waVpIS2wwRE5pRHV1aHFhLzNRQ0tvbTNDclo0U09ud1Jm?=
 =?utf-8?B?YkYrK0ZET0wxQm9yTndVM2QrRDFsWHRXaDQ2VFJaWjc5MzA2Z3gwSm1BcGVN?=
 =?utf-8?B?VUJMNGFrbGtzMytoT0tteWhsdUNhM1hEWXRtdk5mTklCWDNDVkRDQ0Z5SXJx?=
 =?utf-8?B?aHZja0lZWXRhSzFyb3FXVlovV3VIWS8zVFkrQWdqUVJIa0srRnBJOU5zYjVR?=
 =?utf-8?B?OHpkdmwwcEZXRU05bW5MWkJsclMxeTl3Z1ZwSDE4ZklVNVN6TEtSRU11b1NM?=
 =?utf-8?B?QmovNDBzdjJSeFhwR1czY0JsNmRCNE82dFpIWFk3d1F2elNQYmpRcnpNOThB?=
 =?utf-8?B?anNFaytoZC9wRVE2UGpNTWkyd1VzVDlHcVZleG9IUmdidXc0TWtUT0FvOThW?=
 =?utf-8?B?dzVtRXFYeGJOZ09KQzNBMEY3VXVYejkxVHBVWXRSR1pzN1QwVEtyUW5TU0Fh?=
 =?utf-8?B?R21tYXM4azM5RGxkUWVhazl1NG1xcEl4S056cjN5SDl6cS84dWdFeWpUUHRh?=
 =?utf-8?B?M1FCSXJ6R2xsRk81VTJEdkpMUmlWTEs0RFhZa3g2ZlNRUmxwVTBLVC9VRldu?=
 =?utf-8?B?angwdXZ4UTRyeVVDaFhjRDVtSFVGeHpReUtkNjFubjNyOFNvV0NweDdiMHhK?=
 =?utf-8?B?bG9tV3ZpWkVWNDB2eGd1Rk92Nk53bG85RFdGYlFBSFZ4OC9TMjk0RzcyNG05?=
 =?utf-8?B?VnFIczRhQ29kQkV4cVM5UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JH0PR03MB7468.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(41080700001); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0hMMW42bGNzZU5Yc1B0ZGlTSTdBUVpBS2Q4Uzl2N0p5S2RSK3VFY0VPTEJL?=
 =?utf-8?B?cnpvWUhNZWYrR1FDTmJVVzdrOEZrKzBTWTBWT1pVRytOV2xYWkRDczFDM3ZI?=
 =?utf-8?B?dlFHK3ZPYmRLdzZWNVFTTkpZNG1Ed0tOZFZmeW42VVJWSCtFN0w5WDhVcmdS?=
 =?utf-8?B?ckd4anMyc1Z4bDVsSGNTWUV2QlNlQlcwT0dDZk1oRVlLaS9NL25Ea1dHTzFW?=
 =?utf-8?B?MHFnV2owOUtPSloySTBOcW5YVW5JSWN4WDhTeEFUQVYvQnJ2WFJuRVVtclk0?=
 =?utf-8?B?QStCNjg3RHF5dVNZSG9rcFdmTmk0TVVHV09tczNxSjBtVHNYZGR0ZHFNVFVi?=
 =?utf-8?B?L3FpM1MrVGZ3cW1GZ0Nrb2pxa0FocDFkMWNOVDlCMmFOVE1VVEx1ZHBSNDI2?=
 =?utf-8?B?WVB1aWFtNDZVSUNiakJJR2xIQ1lLRnBjbjNMVStxeEVSWjF1WnY4eUN5bC9X?=
 =?utf-8?B?QTZnWEp4M3hkeDM5S2RseHk2NkEybzdnVFVMUzNMMndXQkx6ZWppYnJoQVZv?=
 =?utf-8?B?aFdaelVwaUU5Mks2VW51TEJSRUMrWkNYVUxUYU9INmNKajlWY05SWWM2MjJt?=
 =?utf-8?B?RUJWQ09sTld3ckVORzQwcmF6MDlxUDNhaHZVWWNLcjI2Z2pVYzNCUHJMRDNr?=
 =?utf-8?B?U21ZcmxjdzQ1SERUM0QwUlF4VHhCTUF0bUU0eUJrRFdqMk5peDM3ZEFWQ3A4?=
 =?utf-8?B?Q2pDZENNN1ZBamoxd2ZQU1QrMmI0YnVaOHFDYjBxL1hRRG43a0FBT0IwNXNM?=
 =?utf-8?B?VlFLS1VsQXR0eC9aczVCS0I5TFdQZStudmtRQjI1OXh5VENXcnhQanVQTTg1?=
 =?utf-8?B?QXYydDlPQ1poWUV4Z2FSeUR4UXlZWGFQVWd3TVk1UWMzb0d3U1VDeS9oQ2NN?=
 =?utf-8?B?WTl0N2w2OWlUdHhRRkVtM0trd2g0VDFTRkwwOHJ2RGpyamlDU2hnS2hjcUV2?=
 =?utf-8?B?VWRkZktkZE9uZlZjUjZpSU5jYmE5Sk1TZDRrY2YyNVByZEE2Z0Z5S1ppL1Bm?=
 =?utf-8?B?QTNlaHlnQ3U0MGxsMGlkMU1GdWRDc2NJYzJRNkxPOXR0c2twNis4SWpZMlJ6?=
 =?utf-8?B?SW9KLzMvMzNscGtWN2FVeGwwUlRzMHRsVXE5NGovMWsxVlc0cmdYRFZOQ2xs?=
 =?utf-8?B?UHB2VklqMXdZcUVaeExiOFhVcGJiL0lNMEtETkZodEF2eWhqajBxbWFweVVO?=
 =?utf-8?B?TlZEeFJzaWViRFBnL1dLQ1ZGSHNWd01CbjR5WjdjMGxUTWR6aHYwcVFlbXFM?=
 =?utf-8?B?TmM3M3IwSTJXcU4zaW1uU0IzWjJtRHFjYkxTc2d0a1pOcGFkNHMzYW5YajVC?=
 =?utf-8?B?WFFNeXl6d2ZVTDNMOWVVTDVjekxzNWN0RHZWdG5CUGk1YXlGbTgySVFJbkVX?=
 =?utf-8?B?N1h4VkoraW9PTkNiK3pseUFUVU1TRFh0QnVqVnNiSm4zdW9Yb1h2OXN4OGxt?=
 =?utf-8?B?VHBiUFdQNG5yMWVjaUcyUDJVS2YvM0pOZVVLbTdKOG9Rcnhidzk1RDJncXRn?=
 =?utf-8?B?VXI2R2J4dlAvMllVMk11bjlWN0RJZWg4MVpzRjF5SHNPQTZRUXh6OHhodzM3?=
 =?utf-8?B?eTFKakZWTHRscHBhelhzSVFPekM1bXB4VURqajlxS1ZNV0xQL0hEV2pSMmdC?=
 =?utf-8?B?T3NRNlY1d3IyUHpjY2MzcTNvRTB2WThWRjhETEoxNEhXQnN2cGs3T0ZwM2Zj?=
 =?utf-8?B?QURyYjlEd3dERk5HdUpKakJ5bEdRWlp1OVpQWHY2VTk3cC94a09IQWhvdmFi?=
 =?utf-8?B?NzhPOWljOEJHSmJqWG9KU2EvUmlzOXlVRUFIUGhVNEd2WHhsRzE3VWpLQkE0?=
 =?utf-8?B?ZXlraVlGc05PN2lGM3hxTzNTQzUvWGV4VWE3TVZ0NFZmcVgybUVWV0IrMjhJ?=
 =?utf-8?B?eTh5djRDWUo4MXdTNkdEdGZUTDgzQzRmeHJpRERVVmRidWI0UkF2THQ2TEY1?=
 =?utf-8?B?Nk9LL1JBSkY4VUZHWmZHRkhFMGFGK2REaXgzSzZlMXBRb3hjWkRhQzZ3azFl?=
 =?utf-8?B?WDBNSUxCYzFkWVdFMkEyWmhMYStORUNXVDdaamhaTHh0d3RnaTRTcExVMC9X?=
 =?utf-8?B?dFVjV1Q5MHJkZmcrMzVJNmE3REdZZThRbC9ORFBxVFVRNGhvZXhiRFk1VlJJ?=
 =?utf-8?Q?+05DX3tXRIwVtUfMRdcPuVJfQ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c3460d-0177-4755-e753-08dca0850043
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 02:07:07.7138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIxE9edCAQi/bREYJWqAQXs4w4V9ajnaoovEeL/hri0dBw+BjC4oholwDb79m5f/c8QYx3fSEethWFVPvpSaIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7600
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amlogic.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q6fykWzDguqM83m9c6bTMpgiTFgxCAez014FRi1/qM=;
 b=BdYi60cc8iHjwD3pF8Br+pxvNmG+5bRdYgBu+rSXtLOQY7vUvL3R8JEsbPiyX6IORdEva33ydXm90Lx2iQGov+JvUOmYuHnVXkUNg+78ytJ6TM3A4HRkcnqMXBYcsuadMzmcTVvMmycsuKcT3NCe1fjojwkOsjdEhMG04Rkoyu01uCuAkphDmnuPwFUU/oItu7Lkw+ofWHOJSEo8J8wfFXoMV6n2rTDXV6qZVvkvTcDT0afD8HrOy4qGEyUhKU2kLUR6pBxuaYuta8M+8G7qqaxv9YMZQ7rfeVh6LXzqAUtwxmn9sEEYaDmjv3gODqgR2nej1aDCDkswiUKKG6Wu2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amlogic.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256
 header.s=selector1 header.b=BdYi60cc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: change Amlogic
 Bluetooth binary path
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
Cc: bernd@kuhls.net, yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear Thomas

Thanks for your help.


On 2024/7/10 5:32, Thomas Petazzoni wrote:
> [????????? thomas.petazzoni@bootlin.com ????????? https://aka.ms/LearnAboutSenderIdentification?????????????]
>
> [ EXTERNAL EMAIL ]
>
> Hello Yang,
>
> Thanks for your patch, which I have applied, after doing some changes,
> see below.
>
> On Tue, 2 Jul 2024 20:17:37 +0800
> Yang Li <yang.li@amlogic.com> wrote:
>
>> remove bluetooth subdirectory, and use generic pattern aml_*
>> to install all bluetooth binary.
> This commit log was not sufficient. It does not explain since when the
> bluetooth/ directory has been removed. This information is absolutely
> *critical* as it allows us to figure out whether this fix needs to be
> backported or not to previous version of Buildroot. Therefore, I have
> changed the commit log to:
>
>      package/linux-firmware: change Amlogic Bluetooth binary path
>
>      Since upstream commit 7d931f8afa51d83e9eaee3a3f449bc2f86a5edf3, which
>      first appeared in linux-firmware 20240709, the amlogic bluetooth
>      firmware files have been moved from amlogic/bluetooth/ to directly
>      amlogic/.

It's great!

>>   # Amlogic SoC Bluetooth
>>   ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
>> -LINUX_FIRMWARE_FILES += amlogic/bluetooth/*.bin
>> +LINUX_FIRMWARE_FILES += amlogic/aml_*
> The change from *.bin to aml_* looked unnecessary. As far as I can see,
> all files still have a .bin extension, so this change looked
> gratuitous, and was not explained in the commit log. So I kept the
> *.bin for now. If needed a future commit can be made, with a proper
> explanation as to why aml_* is a better wildcard.

Well, It's all right with me.

Thanks again.

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
