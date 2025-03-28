Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC7AC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 09:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78BEC4EF1A;
	Fri, 28 Mar 2025 09:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkcziiONb98G; Fri, 28 Mar 2025 09:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B91694EF22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91694EF22;
	Fri, 28 Mar 2025 09:37:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B32B19A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 09:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F7B6400FF
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 09:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArLtD3c0MBni for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 09:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::3;
 helo=mrwpr03cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFF1C4057F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF1C4057F
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFF1C4057F
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 09:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtKJOn0IgVh//oqQl5Lz1u6iko9AQou+WzSLeZqOUiDTW3+txPUApXEE4LN8maYtJk+v8Lwcx5Gcs5wSgjTIbdBUwpqus90bgwwotVNrA3FD/bwf5Ucy25MJQuZ7cVh4VPgfB6lH7S9t3uCklVM3dLk81MVEG3a7mFmPqvrQnWuH21/9+wvteeBLDrKPIGC10+kANV1MaOoNFYXZYz+b7CWi0iuy9Eun2MzQKyTG6AkJyiIRqbJpJj2wPOLj3/SlKXR5O21D3jAyJ3S1lgADPQG0NeR+F+l+aJxSNUL0mqtxDUABYURYkMPrlNs5D74vmdemuydUtIg9fyLD5ckfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGDh46Ith1CUvC17wxqgJkJ//lI/X+UGcvZxKXT7wRQ=;
 b=q1iJCzsgAqVE52Q/BEuFPeMiI0IRQgAlJj670biyintDQZSz8QVqa0RtRUGy+m21JdVubA8SSoQ1mr0G4L3Hq/OYPa3W4leVbwL785aRuSMQAqgnYO1oRSDuyznyvx0719pmgI66V8eHzBkI+X5rG3VL7phRSqSLm+N5hiDtwaYLoUrHDZxOmEp56dcC6NS8jPAN3JVqkTd9vHoPofydnUtumzz5RclBLUDMY5PW/04PtUKeM3VfrmZT8jEH2p0Z8IbXU7Lulgk/0c1an3QOMmxVLlnVfE3ZwEdHaFNwjHmlvRLfNcdl7ex09EoMy75hy1fQug5w2Ly6knEjGl/s8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB8003.eurprd04.prod.outlook.com (2603:10a6:20b:240::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:37:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:37:22 +0000
Message-ID: <b03e7b80-1f8c-4823-b3a9-4c8ac35696a8@cherry.de>
Date: Fri, 28 Mar 2025 10:37:21 +0100
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Peter Korsgaard <jacmet@sunsite.dk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
References: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
Content-Language: en-US
In-Reply-To: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
X-ClientProxiedBy: FR4P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 19164430-86bb-4bbe-d3a6-08dd6ddc23e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmdIZWQwc1JoKzFicTVQa2lQNjFLQmd4WlR5M2Q1aTZyL3N2MjhaUll2RThm?=
 =?utf-8?B?TVFsaUJ0YzFvbVYzOU1kRG5yRkxlL3JFa3c2eVV2QldCT3lsM1V3UGp1WVJr?=
 =?utf-8?B?UDcveUIxRGh5cnJJWHlpUUN3blRjdmY5VXBBRVpMSmVYWFpGK1V5cTlxZ3E0?=
 =?utf-8?B?ZVRzRThIbkNUZklPajFoK3J2YVRiMmM5TlpGREgzZEp0REdjY3hUTGxUSG8y?=
 =?utf-8?B?ZlFLSEJhZ1YyUmxQWjRkelZJYkhNTmNVZWczVGlqOVJ0MUFpK0tVQkYrL1NZ?=
 =?utf-8?B?SzhVREN3eldZQVI2UVdST253TEpGR1JyRUVQczFXcTBUM045b0FjN3ZzYkUr?=
 =?utf-8?B?OTMwZjlFeC9XTUNjdk9HWDRYR2RiVXp6UXdYQmxLT05vbnM4bjlrZEhsNXNT?=
 =?utf-8?B?SWRobnppbEdSbFVEbmVZUjVnQ016eHZTNTBKL2ZBbXJtQytxd3pRZjJPUlRV?=
 =?utf-8?B?Yk9BVG9sSy84bmJkY0pmQVRvUXplaVAvL2JUTDlTV3RLWEM1WkFlNVBtZWdT?=
 =?utf-8?B?dFBZSGdwa3RVOUtOb2xGOFRSazZTWjN4UnhBWFlVSUVQZXd2TEdEUCtoOUJ2?=
 =?utf-8?B?SzFPYXdpMXFhV0ppYlhVV1hzNmI1ZXlFODF0TEoyKzBDMU9uWnFDNkRWclJK?=
 =?utf-8?B?WlpIVHkvaXB5aGFwM05PSjUxbFVRTlVqemQzeVVHZzkrdExiSnR4bGRHSE1R?=
 =?utf-8?B?TjlhWEVSajFLMlVDODRScW53dWdWcGErSytwSjkrb015ZXA4RFdkY3RnQzJH?=
 =?utf-8?B?QzJ2UWlwZWYvZ2J4TlBWZlMySGFIdjg2cUJ0TWMvVkp0RndSS1JaVVRoNHhE?=
 =?utf-8?B?TmtRVHNjc2ZiVXlaQk9MbXhsdk9WeEdlUGNOWDNmT3F2Vjk2VTVpcGY5cTRK?=
 =?utf-8?B?RzBuUkljYTBiamxjdEZhd2RJMVJHOC9OQnpHQkY4SFFpMmhqb1lGSXBVWS9u?=
 =?utf-8?B?ZnR1MTF4emNxQ3FCblF0MlhITVRRaEMrY25BcnpNZWtOd2I2ajV6N0J4WVRm?=
 =?utf-8?B?N2ZtZzRUUllYODJKZTBSTWZxaVNpSDdPK0NhQ09lNGhLY0p1N3hWRlRxSjgr?=
 =?utf-8?B?WnpkY2NLdzdqNXZSenlUTnZPVmRzZnNyeXRtdEVseWVpUWd0K2JnbllZRUZr?=
 =?utf-8?B?S0hPeDhVNUdEMzFVd0NvSUdPOGFWcXFKUlpNTE5MaldFWFVIaFJQWVdlQjh2?=
 =?utf-8?B?WG9kVFlpdU9YTE5UYXFHVzVBaThBL0R5elVLV3RVRDBhamVQdXg4NGFxN1I1?=
 =?utf-8?B?ekdId0U4MW5maFMvNW5aUzNlbU5BSjhYRnBSa3RxcEhRSXpyTWhsYlNnc0xF?=
 =?utf-8?B?dnFQaEgrcWszV1pVVFJsVzJncUVtYUsxa2Jzb1RxSGUrTHZwMzlLZ0FiMTBY?=
 =?utf-8?B?MnNPUnVPMEF4QTFLdi80UmJDdSt3Tk9CSU5VcThuT0hFenlwUi8wR2VkaVp3?=
 =?utf-8?B?L3ZTampoeG5rRHl3NzJKZVVPWXR2M0FQZlVraWt0TzhrN3hyeS9Yb3A2M2Fv?=
 =?utf-8?B?bGIyczIzdFFDQ0NVbzVmK1VhMGdrR2pQdHdJYkduckJtenhEUFkwUTgyeEs5?=
 =?utf-8?B?SlBVZ21aTFVKbWQxa3ZvT0llbFJwS3BCcjZMSzc2eWtqTWJzVDFQTmlIZ0RU?=
 =?utf-8?B?a2lIQmdGSlZScC81TWNHSmgzQlBXeXkrVkJ0aG9ndUlyOXNneTdwdUgxQjNk?=
 =?utf-8?B?WktKRWk5dHdLeW1XUGJUZnNoRm5hQ0laeVpobmo1OHRVemhSQjU1YzhFaW52?=
 =?utf-8?B?RTNuMnFJMFY1S1VYaitSQnpVZzRkMEVMa05vRlhSaWlNaWg2SFJvOHFMNita?=
 =?utf-8?B?OTJ0c3VmQndOYVluQnhxM2pUL1FnN1Y1ZzM1dzk2VVBzeDRJYVdnamt5L1Bu?=
 =?utf-8?Q?HWdhWgYcjvGX5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3VnMnIxZUJGOUljM1JiQkFKTk1LKzU2bW5rdXlsV090Q0FWS3ZXd3k4ZlZm?=
 =?utf-8?B?RCs0Mklqa0lxV2F2ZXpuTXpsOFFlZzg2aFAzbHlEaXFaL2ptVWtJRXNHKzFM?=
 =?utf-8?B?TnEzV0lqblRlRTZnaU9tSGNSc0ZRdVdnd2JuLzhjYVVnbHhQZWdsWWVGamlQ?=
 =?utf-8?B?cml0YnFNclF2VTR1bkU0RVNoekQyZ0JjbmtabHd0czhiUml1TVZsQkFiS1U5?=
 =?utf-8?B?aStScklYSG8va3VzYlZ6SEduVWluVWdYWURYUldRcWtUUWY3WGVQWmdHQjNR?=
 =?utf-8?B?STgvOVZYZ2g0QnRueVIrcElYdkNHY0luZThGOEt5alMyczFLcERMczJCWWxT?=
 =?utf-8?B?aHp1TE1PNmxKcitjTlJGaEsvbFBsTGkrZUk3aTBidmI1VyttZmJ2TEJ0THJl?=
 =?utf-8?B?Vi9lWlZFYTZCT3l1QUVveGZmZDAxRU9OUkZYcWh0dkFjdnkzUHM2bVdLVkY5?=
 =?utf-8?B?RnhTMGxCNVVoSmhrYkZZOXFKTnU1WTN1OERoT2ZKaGlVbi9PQkt5ZTJlaWRZ?=
 =?utf-8?B?UUlhYllWY0NENVFyTEFNb2g5MFRBOWg0dTdwem1uWVlReFN1aUo1ZmxmMTNt?=
 =?utf-8?B?bFBVSXBnQnQ1Ty9RajhvSGcyZ1ZQcktBRkNWVko2aDJNRXl4MzB5YjBoRjZl?=
 =?utf-8?B?TENKOTN3MWNFSkNMNzVWRHRzam1jNTBLZTlHUHdHMDJzbTAzZW5FVUFXLzFh?=
 =?utf-8?B?K2YxaGJVa0NyMFkzN0hNVUZPdTdCcGRGUnBUbUJwdW5rS3g5RTlXK2FlQnRW?=
 =?utf-8?B?eWhwamovc2JSWVp5ajJoaGs0aFFzZUdrS3ppd0hjdTF3Sys0a2NIRm5lR2tm?=
 =?utf-8?B?TWNiVjdGdmVrNlhMOWxyN0ppcVlJbk5lVnNkajE1a2RQK21QYVZIbWViSlQ5?=
 =?utf-8?B?cDZoWjIrWmNIZ3pKdTl6VXRpTXZ1Y1orcW90eHpMc3RBbk53TFQ4UFpGNDdM?=
 =?utf-8?B?Q0lFZkkwaTVpbTdjWjlOdWxRUVZrMjFvVFRNUk1EUTNkbHpFV1NCL3NnYUht?=
 =?utf-8?B?b3lLaWd1STVtYjhjU25xdVA2YUxFUC9MNGRhaXRCZjBMMHkvRkg1SG1iM1Vw?=
 =?utf-8?B?MmJidUpWbFlySEcvZk12a05kOVY0ODl2Zk41WmdHcVJKdm5LNEpIZnJ5NGxB?=
 =?utf-8?B?WUtZTzFOOUxiSmJiTTlGeEpidG1aeU1hQ0YxVXhoWlgyQ1c1NXBkRnpkV1kz?=
 =?utf-8?B?TGE4djN0TnNuaGRncnNHS0NzcHZmaGFRaFBjZTh4MkpnZEhRVGlhWlJyb09M?=
 =?utf-8?B?TG0ybG5Gc2MxZWNaeGVIRkhhRnRZMmpRZ21IZmcxZ1puWE44UGxHZG90Y2Zr?=
 =?utf-8?B?V29uMkMyMkFONFBWNWg2K3NzaEl0Q0VSZlZJNkJNVjVVTzVKMjk2Q2NhTkJa?=
 =?utf-8?B?OG1rQ2ZVREFuczdTWTlOS2Y0ZlNwNDhhd21DdEFBMEVha1ArR2x1RHNiYlFm?=
 =?utf-8?B?RDZxaVkyU3UvTks1L2VNaVJrUGVhTm5sRDZUOE9weGdUS2hUN0U1UkxiWjBU?=
 =?utf-8?B?L3hoSlcrUjkwdzMvakx0RWh3VFdKZmMxUjdndW9CU0JsYVJHZm4xQVU5aEx3?=
 =?utf-8?B?QXl3LytXTnRuS0NJUEJpOVlReTFUbUNkejZ0UGtSc1FtbnJUMjVzYm5hdHA0?=
 =?utf-8?B?Y0Q1N1hxOWJjLzdqaXl1cUdEd0hpM3VWU3R2N1IrSjNyeXpnWW1YM3hleWZZ?=
 =?utf-8?B?WE5uajRsTmFnK04zc0o4N1ZXK3VmcWU3WkFQUzZoUlJ4d3ZaNzNLdzVmT09I?=
 =?utf-8?B?TVZxbGwyNVQxRzdYdGVYN09qd1NHVmhQTndNdXNCZzFsSUJLYnkrbDBlK2RD?=
 =?utf-8?B?OUFQTGlKa0IvR1d1SEplajZaSmNrdCtrNmU1NWM0R0pyYjlLTlVsejlVYWpC?=
 =?utf-8?B?TDI0dFVibjdZVzlXOXQ4dk5ocDdvSG41N2dXWmZxdWg2M0ZjQkhJSG9GWG9n?=
 =?utf-8?B?ZngxdXkwZFd6cGFYYlNzaXM0SVFIbjZvRkRQVlF2NWdoWDVXQ3dkOGw4ODFF?=
 =?utf-8?B?Z21ONG5BR0lEUWRhak5IdGpCaS9QdUgzNjZYUVRxcTk0Wk43OG9OM2xiaUR3?=
 =?utf-8?B?TE9oNk1hbzFVcEFpZ0NHU1k4di9XQ2JmaHdUTFliNDU0d3plRGUrRjhPN3hC?=
 =?utf-8?B?NGVnNjVaRnpDQTlxL1NNWURpamx0c1ZNUWdsYzZLR0FwOExQRUVzR0Z5blNr?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 19164430-86bb-4bbe-d3a6-08dd6ddc23e5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:37:22.1024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tn6mGBMmTV/3B2jh4LebGicOJvrYuwKV0v3tp0fYMy3qoQLX3zvjXdFLgpPjnwOe+iYpAb0ipk1RFAIgkCRzQ/1yoMeQ9YwNhQoepMDPbQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8003
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGDh46Ith1CUvC17wxqgJkJ//lI/X+UGcvZxKXT7wRQ=;
 b=gt3OIbZ7Egv9gY0eVw7MPo5IXiQ2NbP7sbaot396Xtu3Zz5pqVXh0WXbUoyS2fUlMd3UMZHbXwLuw6TQ6VgUQ1gPpQ/O9NwHz3PJfJJZQXNWyH6+TehMPixQTVfYRPzKB+pCipbUCAPPll+Od7VsoDYpslP5gqYQrmmGO2Pj9A0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=gt3OIbZ7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 0/4] package/setserial: patch with _PATCH
 content and fix build on newer toolchains
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

Hi all,

On 3/7/25 7:58 PM, Quentin Schulz wrote:
> The patching logic is broken for a while (only 13 years :) ) since
> commit 64ac7199525f ("apply-patches.sh: add recursivity when scanning
> patchdir") where support for patch files whose file extension is .dpatch
> got dropped, therefore the patch were simply and silently not applied
> anymore.
> 
> This series fixes that but is a bit more complex because we have patches
> inside Buildroot tree that conflict with the patches we get from the
> package's upstream.
> 
> Finally, setserial currently doesn't build on the Aarch64 external
> toolchain, so this fixes that by running ./configure (via _AUTORECONF =
> YES) to fix a configure-time compiler warning that fails the compiler
> check in the configure step, and also update to latest version available
> in Debian tree which includes necessary patches to fix other warnings
> returned by the compiler.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (4):
>        package/setserial: apply patches from setserial_2.17-45.3.diff.gz
>        package/setserial: autoreconfigure for compatibility with newer toolchains
>        package/setserial: update to 2.17-57 for compatibility with newer toolchains
>        package/setserial: simplify patching
> 

Any feedback on the series?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
