Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF75DC3ABB0
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 15:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BCD781299;
	Mon,  5 May 2025 15:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZfnvoh5JtfJ; Mon,  5 May 2025 15:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD11812AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD11812AF;
	Mon,  5 May 2025 15:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03C5E12E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 15:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D993F606A0
 for <buildroot@buildroot.org>; Mon,  5 May 2025 15:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VqXQxxaA46h5 for <buildroot@buildroot.org>;
 Mon,  5 May 2025 15:39:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2613::608;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59BC66075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59BC66075B
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::608])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59BC66075B
 for <buildroot@buildroot.org>; Mon,  5 May 2025 15:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blj9Db6wmryf+9Rx6eR4d4ajGIzLtOXqi6WKTKtnfrKaxXo/m41q2yncrD1VV2Og2KJitybZfTxrTBJUQZNU13M7u5fe7Oqu62CTdEPL4DKhI1yeir3XP0oD7+XrhZlLDp+5uPwVCC6ZarISxeBDE4HsklWFagM5A2M2yuTSKL1CLwcsxeptuhd6GnMwhWDurpQLZYeonIpLH/sgbNQIpIMEywY5e/Xd9kCgwdAAwpvKlSSN4Km/QID1szPHEOeH/MHj9K/ODwYMrKx3d+e3tSTcowpcVtw83BTlCoK7rEEZL/OiF4liKG4yRJ+3Kx0gEu/DDtxtdJjZubQqA0Nw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nKZlXPGN+QkWHfLVyRg1WxDiOG2bne1b3ISlhe8eEY=;
 b=vdOQBmeVZAighXjM0ImQsd9eg6YPF86ydV15m4aKBlDPjXrLMNwSiakwliJyoJ/MD2gAL4FrXI+lCxmAu8Q3ZRA3oVkUjHV2qwEQo3Q65a/GVknGpLuynaDY4tdpH6P1+xA/7EShopDnQ6jFgNIE4kU5sbRz62EsdNPURZV1R271K7yXSolQX9SNClQP8mArNpxH1mrL8uQFsxeChQFq40T82obUkKjlal9Sp2XNV8uBR0jl3xA3hGylklOnLkDCDTNlW9nepGKsDJW4nYMBKo/wfLKWCIukqq4sFdoEQp1a3gkPlipIY658RgS7J6/cI4wmfbsLP/vKg5KojTpQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10946.eurprd04.prod.outlook.com (2603:10a6:150:21d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 15:39:09 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 15:39:09 +0000
Message-ID: <3493fd0d-95aa-4762-bf61-725ecd86e429@cherry.de>
Date: Mon, 5 May 2025 17:39:08 +0200
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Peter Korsgaard <jacmet@sunsite.dk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
References: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
Content-Language: en-US
In-Reply-To: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10946:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f7dfbd-a15a-4a58-94fe-08dd8beaf9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkxLdE5Fd1Z1ODFWMi9kYmU5am16ZWZCemFHdG4yd1RzVWpPSDRSNzd2S3d3?=
 =?utf-8?B?VnFROEFadlJCL0RrYldIVHlNN3l2NGplYWVzRnBOelJrVk5SaW5obkQxdjRl?=
 =?utf-8?B?WGJzdWRUODNjMnVIcUxzbjFqMmNleWQvQXo2NUwwc0VMbUkrVzZnV0VxQkov?=
 =?utf-8?B?ZGQrUUs1N0RNWUdkRlRIVGM2OEh4RnpJV0RMZFhyVXRTb08zZVc3SGxjOGtO?=
 =?utf-8?B?TzZxM0YrN2FjM1MxcGEvZndVRStYUzNEN0VRMGI4SzM1UmdEdzFxNDhSZFI4?=
 =?utf-8?B?S1VJSmJBN3VxS3JPNExPUkhhdXg3UGhSaDBvZjJ5c01nYmwrWXl5R0lmbGhq?=
 =?utf-8?B?VUZBV1F1c0w0NEpkdnhrNkxpd3p2d0lmVy9kRm1rckh0elVRejZvdTU4WXBL?=
 =?utf-8?B?Yis0bnE4TTBjRU5kRHBLaXY1Y2FjaDFjTVZBUkYwN3BuMU5iNUpGZmQ4K1dx?=
 =?utf-8?B?Y0hwNjdTMVU1RmF4V09HMkx2ZFFpclJQTXMwd3JUTU5xemc4aFdFZTJSK3hW?=
 =?utf-8?B?N2RQVUdOYytjdFB4cmVFeXMwZXRNMnl4eWFTS1A2SWU2OXJGUGxYL1BUMEZC?=
 =?utf-8?B?VXR2dGRZYk9samNxb3p1SU9zOUV5VGxYaHdZVW1idCt5Zjd3L1k4cC9HaVI5?=
 =?utf-8?B?K0xETGZDNG9RMlJzR0pOY1ZJMWhodjlsQTFtd2RnV1B6MFQvWmYvTmUySGxz?=
 =?utf-8?B?K0JRd24xY3M1SjVNWUNrNUdhZm8rQkVyK1Q4ZkpEb1p6UVFUeTVpeTVxR3Fh?=
 =?utf-8?B?STlIaldaQWNaRHZ4U0VhOUZOaG5pNXVRb2NZL0lvS3JkNE9LcjhxZnltMXYy?=
 =?utf-8?B?b3U0a2k0dU90c0l3amh4WStnTjBwa0NMMzFKRkpLTE5DZUdxTEMxcVBtZTYz?=
 =?utf-8?B?OUFTV0NtR3dFd0JKcGxHR1h6bkFLYmRLclA4bkF4TGpxQ0xOTDdBbDFrUnEz?=
 =?utf-8?B?ZkEybFBQOWhSK2l2azNJb2cwT3l0NDhRL01NSWtUWnEwckNKa0RkNm4zSFBD?=
 =?utf-8?B?N3RHZUNFbHFSaTM0NWpEZ2tUcjBtaERXTktuTldrcUlCZjZxMFU4aTJRalpR?=
 =?utf-8?B?aVk3eE5zQ0VPNk16c0phd2ZvaUY1UjRkUFA5bTRCSEN0OW1VTE42a1NnV3Q4?=
 =?utf-8?B?RFhtSDFsWk9hWG0rc0dkWGRKcFZYTW1peWl3TCtxRURBNEFiSmd3R2xEQVpY?=
 =?utf-8?B?eXgyb0piOHBPR1hZV2s1d2RuU3VMNUFjNXduTU5NSlM5NmwxNzJGVEdOVlpr?=
 =?utf-8?B?emVhalpYazhCWnBNTlFuaVFHcE4rRnRxQWFyK21kNTVHYTFpbFAwc1dUdUI5?=
 =?utf-8?B?WWNHSFJXa0Y5SWw4YWJFVEM5bTF3MEdwUHNtUy8vRUt2cFBuZzlnSlRpbzlT?=
 =?utf-8?B?cEJkNWYzdU1sVnUzSmVvU29ENklxRHR4cnUwaG91dkdFcUkrNzZ6dFpvdWNM?=
 =?utf-8?B?UDFpT2dYbHAwTSs5bVB6cWdCVk5SdjBFSHFBZ3FWTHN0alJNUVlEVGF2Rlcz?=
 =?utf-8?B?Q0FyK1dNNXZ5UXR0eEdWSG1VQWdUdG5WSzlScmw3OEllVmphM2I5YnlKemVG?=
 =?utf-8?B?bTcxTDJFS3BoOWV0bDE3SU5zRHZOSlEyRjFaY29MRk9xdTFpTml5aTNRZVNv?=
 =?utf-8?B?eFJVZ3JqVkdFSXY1QzAxQktjdkttWlVJSzN3QmdnVk9lUXZyaVQ1a1VsZTAx?=
 =?utf-8?B?WHZzUnNKblk1YkdscVhwWVB6ejRPRllPbTFtOFBQaTBDS2FrMGEvU3FaR0Fs?=
 =?utf-8?B?KzFoY2cvUGl5dzFzNHBlTTUwUStjeGtOaHM0bm41ZjR2YlhIQWVUNkJ0UEVP?=
 =?utf-8?B?V0VzMmVqODJNTHk3dkYzTXlpRjdnL3kwQ0R1dDJLcDluQTVsS0ZSdkRNQXpt?=
 =?utf-8?B?OTgxYWgrdkJKaXBQTWZaUUNYYTkrS1VvdzAvb0VJTDNuY2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXFMdStNaURkcWxjSmt3aXI2aW5TRnJOL2cxbXU3aElNMlZ4RVNxTHc5bkN0?=
 =?utf-8?B?Nktob3YySHluZmxzZ2tCZ1dtR2ZJeVlSRUtHZkxzRzV2YVAyMWd3RzhtcitC?=
 =?utf-8?B?b1RVbmN5QUJxVmdUVEtVblF0WlhodmM1VG5jeFBYSi9hRlFGNG1LVWRwNVBk?=
 =?utf-8?B?QU9ZTjBmQmkwVzRTUHNKN1ZxN095ODJRVldQNXBXelkwZkZobWZNWkVRQzc2?=
 =?utf-8?B?R0xIVk44WDgrclV6RGdwamdXdzVMTEEvdzRDUmM4MndxM0xwZXROZjlyWGdp?=
 =?utf-8?B?ZjBQZ1hpZEJCRWJPWWt1R2lWMFc0Z2tyM1BzYU5vUlRDS1VTdElTYW11dGVj?=
 =?utf-8?B?anN3UHhxRk9VWjViUVJxbmVaREd2RGpvSkhmbjNFdENDeVd3ckdKWFNva2sw?=
 =?utf-8?B?bk1reGhCRkVwRmJDSjlZK2hhVE4rQSttN0dFaE81cGV5bGd3am5nTGhwMWl5?=
 =?utf-8?B?MFY3Q1V0NzhyaDRKVDVjT21iOHRVeGtVUDBnWG9pV2ZEeWJwRDBXeUhjbXQ0?=
 =?utf-8?B?c0NPUWE1RHNWSnIwMHFhTVNDQURaakZoY3pGNzRqZCtlQ0Z1MSttcmd5VGxE?=
 =?utf-8?B?Uk5ydW50S0IwaUxxbUlxTkQ3dVNmbUxyaTEwamlma1hiNGpaRG5LeTM0akwz?=
 =?utf-8?B?TWpiUlIzV3RHV2ViVFBYR3JXaWEwd0JsRmNVTGMvZ0tJclFQUTdxc1hOS3R6?=
 =?utf-8?B?MFZjY25nR3NrMVJVdStzSXpjWDQzSUZtbkhERDBtNDZnaFFYOTdRTzlHOUIr?=
 =?utf-8?B?REd5SmpWQlFTT1c4WmNFcDl6L2RMejZaVnB3OTdFN2VHd04wUTdkZmFuWE9H?=
 =?utf-8?B?RzNGMU91MVV1L0NzcWRDNzJJVXVXV0xoRjAvSEQwRWM0TDRkTHBmT3VBM2xG?=
 =?utf-8?B?Tm12NHN3STdPMnZ2Nm5YMWg4RytBN2d2elNQTlhpVUZaMVR3VENUNnp6WkEz?=
 =?utf-8?B?U3YyZkE0b3ZBeGRadzRweno0UVVUeEwrOFF4akhQTzBmYytadXpMOTJpcWND?=
 =?utf-8?B?QmlZdEZ0YU0vTW1OV2c4cnFsWVN3U0QwTElTQzQ3QnEwakV5Q3JxbHpaWVU5?=
 =?utf-8?B?SXV3T29RSUJJa29XTVdQa2tkTUkxYkJqM1dUUUZKMDJQSXZ5NTVzQTFxSFps?=
 =?utf-8?B?aEJUQU8yWGpVWnN6dCtEaU5QTTd1Nmx2UERYTTN0RFNYOWRPTTJXRkFXWkg3?=
 =?utf-8?B?RitXMlEvd25Ka3B3N0VNMXQ4dEw2UVJIcXZSTEZ5U2I0Y040ZkxSdGJmbHBi?=
 =?utf-8?B?amxkU3BCanQ3SFpYTGgxZlh1dFJQYTV2SFE3L3BhL2hPaVIrSXJoNmo2Z3RF?=
 =?utf-8?B?Nm9GQ1pDM3hKK0o2cmdHWkc5bmE5WGZLMnUwTGUwQm1ueERXUXRCT0xJZlh5?=
 =?utf-8?B?M29PYVRjZC8zYnp6UUZLTWNPL3JiTFNDcEdaN3dXZWFRdGVGQTlMOU1XM1Jt?=
 =?utf-8?B?UCs3SmNueFpIcHZYZTd1ZWFxU0ZnU2h5aHcxRUg1RnJIc0x0cEV6bTFremRl?=
 =?utf-8?B?SVl2YjArN2tDbU11OEp6ZnFCcm9SODgvZDZselI2MFBVNjF4MWJlSTE2bGs4?=
 =?utf-8?B?WWdna3VCUUdmM0NZYUN0TXRobnVVV05Ba1V2TU1vaGYyMVZ0M0R4OElReWUx?=
 =?utf-8?B?RlpOeG5rd1lGb2Y2dEMzT1M5NDRLTEZJa0taL1BVaVBBODF0RCtDbDFKNWtn?=
 =?utf-8?B?TDg0elcrcWh2dzQ3THN4cGZ0anFlOGpoMzcvTGl3clpQWVphMk5meUQyYU9z?=
 =?utf-8?B?aVdvZWQ5dUlpRGE2MFRCMmc2NnV3c2NMVmZ2MEcvVE9FTk5lc1hLdGNwOWRB?=
 =?utf-8?B?elYveFFJTkR3RDlmZ3U1UEIvdEdTYVNTM3ZXSXpzVTJOVGZGNEJZT3BvZjdD?=
 =?utf-8?B?Q1h6T1FjMUlZeWZsN2lQUG9WMDFtQWFyczRrMTZwNzF4MklDd0Y2WVVIcXc0?=
 =?utf-8?B?R0pxcDAybm91cWFpNDVNRjQybGhkRU9qOU1aY1c4c0xrT1BZVG5nendXTExS?=
 =?utf-8?B?Um9TZUhReXZiVWxwNmZrc2RURTFqNWM3UklWbERTTlhYSDA4bG5jdjljaE90?=
 =?utf-8?B?UGNjV1R6TjdROWI5SUJ5S3ZVbXNleTEyd0FKOXBZalE0bG9YbElYckZnVmE4?=
 =?utf-8?B?bVRoSmVhNDl6aFJiMW5zSnhVaG9kQ3NLOTJ0TTFpQ1JlNkZnSUtKSHVVZWor?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f7dfbd-a15a-4a58-94fe-08dd8beaf9f8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:39:09.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGt3X1N67Rt1Zk3DMWLHpstFNYby+QTg1cnrhFOU7ci0ygx5D3m+KN0cLdlukSQyJ/aC7nnnv82jogcK0iGiOFVoaKU/J152TLIwxS+FyBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10946
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nKZlXPGN+QkWHfLVyRg1WxDiOG2bne1b3ISlhe8eEY=;
 b=noC+8HXAQv2y6X73emzINMgfP6OdidomivxOSuXqlBihqoSWLjz97ktz/R8tc14lN4+vCHA+6KEvKHveaJg6GZgdl1Hg5tJHmTKQ+jZdLVnLKiot2eoD+wTxrw3mjIiZmH1kOJ/xZ2HVtwmBAWHtE0lOOHUgx5YWQ/stVjKJbvQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=noC+8HXA
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

Any feedback?

Our product doesn't use this package anymore so if this doesn't get 
merged/reviewed "soon", I may forget to monitor its status. Please do 
not hesitate to take over this patch series if you stumble upon it on 
the mailing list and need it.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
