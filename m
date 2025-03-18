Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F24C28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 11:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DAE40733;
	Tue, 18 Mar 2025 11:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKYekL3FYZ_y; Tue, 18 Mar 2025 11:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362F540729
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362F540729;
	Tue, 18 Mar 2025 11:22:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE09950
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 11:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B48160BE2
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 11:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTbWreYb1xGq for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 11:22:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2612::61f;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E927260B89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E927260B89
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::61f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E927260B89
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 11:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDS2kTv9cxtvzXz+z5aJ2KKrVRpxTS74vEcIuCK2xcgIfUSZGWMWVmCh/gZTY9mYg68edTxuftI7saQYAj0YYMPYHhW0R49oM8MoR9GENZi9J2oAziZ/dP3cTc9PTXq8FNG1iIRHyphhYPFeLwjUfrdv3ktemgp1/16tQYNdUzDB/SG4G2s4jQTDTsWbIBukmoMMAlUQVoT7x22qvD6RPP5Hq8S5rYBclPqGMTNykca3zu/nguBEeeqxkvIlPyvDOdeqNuBCwXD3yN3c9LCf5qPONqi1s/HGq/Ax0uqrE43yxQqi5N4BkydBgS9fdobOH8pDa524t0H5fzllCKpSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDz3uU/2NmXkhyIXZOCHsbChsVzG6egHswDIRMNTmA4=;
 b=gi54TRxjI2Jdov+Tnq3jNf/c3gDUtB8N6vt8SOmMgQ4vBQRW/bJkdHH/74wVNWdJdY85jDNKC9bHj9SoPM29kQDLSVXnhIKLIKfnJXxngo8rvdY2OjztatcyJ3UXXd67NGjMqeICUvwrZFeFObP9qqhDsRggvPH50y1KGNYZ36nB7VlodxOQrvG3hXyUHQhTQ/85Blyt6Q4byiIq1U7XqV3jPgM6OQam7KZfrD0gE9gbHCcEiEm5VNd5JuNIzuItV6ldmpaIjUjvEohb3TIG+e5l3fnrzswIj+yKb2BxTwZb0len6h2UTMb3IeJ3LYMdgVvGZLFe6DVh6aLrDA8JZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9051.eurprd04.prod.outlook.com (2603:10a6:10:2e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.33; Tue, 18 Mar
 2025 11:22:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 11:22:31 +0000
Message-ID: <de08db82-e101-4630-b970-0081841fd4c9@cherry.de>
Date: Tue, 18 Mar 2025 12:22:30 +0100
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20250311-libcamera-qt6-v1-1-4897aadc6fe3@cherry.de>
 <87ldtbfn7p.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87ldtbfn7p.fsf@dell.be.48ers.dk>
X-ClientProxiedBy: FR4P281CA0330.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: eecd35ce-6fe7-4103-db9c-08dd660f2c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3doWDNScXp5SHFidXlqRVVid0lnQmU2WXFuZTBEelNrbkZxaDNzRlgxZkFs?=
 =?utf-8?B?WXJNTW1PRmpCQWhJYzltd0xKVmtxWEZwRCs0Vmx0a1FjM1lBTktCbVN2NkpN?=
 =?utf-8?B?WnBhcEVtaG9DRW4vYXJtelN3WnNkYWdCcXFPOUM1dThGTWtuZUtyYlpqT0Jw?=
 =?utf-8?B?ZXh2d0pMSXNTancxYzgwRFF6OTdhdERJczlodjYyUFgzemhJTlZiSmVCYTFs?=
 =?utf-8?B?WFFDVlZkUXk4TnN0R1Rmc0ZZZTlBVUEvWDRudE1vMUxMV2ZjcXFvU2RPYkJQ?=
 =?utf-8?B?NjJpd2tlamlHRGlCdUJ0YmgwN05BWjZndjJIaEI4Qm9idjRNTmNody9aZWJ5?=
 =?utf-8?B?OHg0UGZQczV4Sysrdjh0SDZyK211V1IxVzVzNmluSU5ZaWtFZmM4THpmWE9F?=
 =?utf-8?B?L2pja2p2RzZ2ZDdvVURnQ0ZsTUNkaEcva3VGaTJ1ZjJwcjFIZlBPcFIzMk5G?=
 =?utf-8?B?TmI2YUFkM3ErUmplaW1qTENnZlVKWkRXYWw2bHBxMExWckQrdVQxWmhXbGJY?=
 =?utf-8?B?aFdDRXhkeG45STBtTzRTZGFGWnhkS1RiMTFDWURuTjMyVXd6R3l4bG5ZQmkz?=
 =?utf-8?B?L21MRDBad2ordnJnMXpZd2xXSFN4UUZlVVp2ZHRmM3N6dElVaVFXSmt6MDBw?=
 =?utf-8?B?WU9vSnRyWlFGNGxkS2t0cWd5dEtRZHNXalFQV1FqLzQ5ZDY2SDVPY2hmVjc5?=
 =?utf-8?B?azkrUHdUL2RkL1JzOGFuZnZHd2xEZzJWZGc2WTB3ZUIvRGtkVXpzWURSSUN4?=
 =?utf-8?B?Tkg2Z0JHMndEcEgyeGpPU1BGTDZQN2N2VWx5aHRsTjZIeklaeVI1ZnJ1a25Z?=
 =?utf-8?B?RXdoMlRXMEVsbEsvK09zb0NuQW5XUUFEVEtqYTJOc0pNUUhsVjREclUvTFl5?=
 =?utf-8?B?YldVV3h4WlJiNVR0VFdDcFNUSC9xb3prRXlWZFAxUU9tNWJLZm5XRTdQL3VB?=
 =?utf-8?B?K3dGQm1ub3NvWEladEMxa2RMZ2hiTENtc2ZaaFdZdWdBRW1SSVhQVVNwMU5M?=
 =?utf-8?B?TVZEVEpUb3p5bkRISU9zOXJ3OHZwc1NUWERoWGRUY3dwT0xja0M2WDgvU0Vw?=
 =?utf-8?B?b1Y4bkxYYThxbkZCZVBOSDhhRjNvM3JBTURsS1dHZkFTUnBrS3dZZnFqMDVr?=
 =?utf-8?B?M0NqMm9uUVZoRjd3dWwycmJ2U3oxMmx0SDVsMnRsb2ZhTFBuZnhOQ2tMNGJa?=
 =?utf-8?B?d2Y5L1Jsaks0WFJjVlFFMVZCeWQzUEg2OEM1QUNHYzFqWW05aXFrUEZmM29y?=
 =?utf-8?B?OE5FbFozOXByWGdicDdubVlhdEYrRWdBTG9Ha1EvREM0cFhYOVFSenozWTVG?=
 =?utf-8?B?WGxQUkp6ZU4raWg4azExT0ZuTFN6ZWpKVHBVYnVpVkV3VFIyN2VrWXpDMGd2?=
 =?utf-8?B?Y3RySG05K0lRelRXOC95QVdLMzlxTll0REZzSzd4aW0rNDdnRnJpSnFGUzFW?=
 =?utf-8?B?SHdoa3VVS0tUNUpSY0NCWkIxRVV2cHpEMTFBZ1ZnVVE2R3BtY2hNU1kzQ3NT?=
 =?utf-8?B?dTNwd0tFTGgwaitCSk1tbUNJdWEvSDdRSXNBc3dLVTJRUG1WYUxLZWNDNnFM?=
 =?utf-8?B?TU8vaU5yWm00Rll2LytEZW13SWFQaUl3QW5wdTVFTDlTc3YrOUlNZHFUZXhX?=
 =?utf-8?B?YTN2anQ2Nm1VeWpHRStQQm1CMG9wdTd4dTg0Q3pVaXpNSTY4YUJNbUdvNFYx?=
 =?utf-8?B?cUVXZTRHdVFVNmdHREtNQ0NieXVKb3dWQ0psNEh4RE1wcmFNZ2hWbW94c2Jq?=
 =?utf-8?B?Q01WTlQ0ZXRaZmNXT2RIS3ZNU3o0MUZNOE9wZ0E4bHhZY3VLajZBWi82K0pO?=
 =?utf-8?B?N3NqNjJUcTdHS2lTRkVrQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDN4Q0plV0psZEpVUG1yeE5zUktQRHpIY3NvR0wzeHJHbXcvQkUwYnJtY2Iv?=
 =?utf-8?B?M0M0Mit1V0g3bW03YkhWZ0VQOThOczdicm45c1E2dkJEeEtmTkZ6QXpUT1Zp?=
 =?utf-8?B?ZkFwODlGdndsQngwSTFvVjh6UTVtSjFaZGpFR2ZYdFV5cjNISFoycmxFQVh5?=
 =?utf-8?B?OW85SjA0cW5qTTRxK0JTTHNMdlZMcHZxWVVDNVJnaXB5WmFZeUZqWHh1R3Rw?=
 =?utf-8?B?YjB0bXhpMVl3VUpHcmFYaTFHQ25acmdUT2FkZHVranMrMXFEVzkwZzROZUNC?=
 =?utf-8?B?TDNZNDcxQmtWYS8wTEo0c1dpYjRLcWhQYzNnUDVvSGFBY2p6V1ZrK3F2UVhR?=
 =?utf-8?B?TktGOXRRL2JCeGxPZGY1bWhkbGEvMFhWb0M0bjU1N2wrUmNab2NoT1ZaZlVk?=
 =?utf-8?B?ZzFnbTFGdkc2WTVQM3F4YVF0WGR2a1orWGhpYjArUXpBY1h4M0NZVFVxOVhI?=
 =?utf-8?B?VmtnR3ZwbmQ5V1BXcnN2RmFsQzhYZW9vVG90aHNRakpUb3pJY1QwdmlUTC9S?=
 =?utf-8?B?bE9DdlJDMjFqRXJsSk9mUVZkNDZmR3loVi9qVmdKSU5VMWNkUTU4NlFuREZh?=
 =?utf-8?B?RVZjaWU0L3pGTUlzUE92NHVXUmM0Mm9nRjU4SzgvanhOcVdWbWpjQURublp4?=
 =?utf-8?B?SEdPQTJKaHA1NVR0V2pSeHRaVDZrM3NBYjJzWE4vancyZTNYNFkyb3N5N3c3?=
 =?utf-8?B?Nzl3S3AzK0RmVnhWcHU0MGJRVEt5S3FLd2I3ekNTLzM0R0VLOWNzWlpQN2RI?=
 =?utf-8?B?K2hvVzV2d1phRFJtMW5neUhyVEFENHZzaEpKSmxLcnhFSW4yVE9lQitYTFBo?=
 =?utf-8?B?ZElTaHVVNjVXcmxxRFhCR1RVVVdTQWhHMmR2MXJVZ3RPbksxcUV4ak9ySlNk?=
 =?utf-8?B?KzY3TW5TSEoxMVVkMm1ENkpQV2FqS2VWTDdscUJPNjhNVkdYR2Vhb3JLdVBF?=
 =?utf-8?B?RjlmR2xUR0tDeVB0M0J5WExsaU9ObDFQV3o5SDllVUh6T09sSWM5clhZVVVy?=
 =?utf-8?B?RFBseFh0dXh4YXZ0S09YYkNERWVNK3lQU0VnbEZySVpIcXJ5ODUrRzRCRVB0?=
 =?utf-8?B?cUhjU0JuUFRDOTMvL0M2bWZXZEp6UnhuNFNqL0hUSEVQOEFqdElWTzAxYzAv?=
 =?utf-8?B?amt3YWtJUWQ5ejVWTFVXSkluTGJ1R0pzTUQrMWlmYTRxa1MxTjZsUUdscTB5?=
 =?utf-8?B?a1RZYjRDNnNDanZWbVBtYVM1VVQyTHRVWStDTjBYUkYrRktGTkZaZkFJeFY0?=
 =?utf-8?B?MGdnWmt2dDFUbVgxUURWeTRUU0dmRVErYTN3WXVZaDRxL0RuVFBYRnNBMHR6?=
 =?utf-8?B?TGJOYnRlNXBkRXRlWnptUGFabk9SOStUZStXRmY0VXljK00xd1d1YkJadHl2?=
 =?utf-8?B?TnlpU0NsSjhWaDhBUG1ubUF4Z3FQQjIxVlpNdS9YYW5abklpM0k1d3JrWW90?=
 =?utf-8?B?N0NSNDZ5dG9GemxnQ0lRNkVYQXF4alBEdzB1RHVLMEJQazVmT0Nnd1cxVUlW?=
 =?utf-8?B?eW9LYVo3Sk1JOXl4cVBPdTFiQUZFME9ubzNuOUo4ZHRtV0dDSlVKcFM3MTk4?=
 =?utf-8?B?VzF5R1E0Nm4yY1NZNDIwMWZNdWhEcDA3K3hDbTZpWmJrdmVHZ2xaNXFsZGNo?=
 =?utf-8?B?RTVxZ3lXRDFJbnpBWWorNldZOHVjZ2NSSGtMbmJjQjVVbU42QTlGOHltRmhC?=
 =?utf-8?B?UURyNlVsT2NmVDJSTit0dElCNjFOY3FWdVIwMlhWa280cytLNFp3VlJlU1VD?=
 =?utf-8?B?ZXk3alhvZk02RjB4REF3VWkrM1Bla1RaS2ZPNGpSVzhIZlUxQ3dJOUhJWHVz?=
 =?utf-8?B?YXo1NDRYcjNHMS9kM29MSm95em9LenhiMVgraUtlYmpTVndjalNOT2dSeis5?=
 =?utf-8?B?OVVFVlhEMW1wSnppd3F5T0VOMDdpckpyOEVad0NiblRSRkd6WGJ5SllLMnNk?=
 =?utf-8?B?ME1DemlDVkVJWmZDYkJPUmVMakJmdXFlbXVFQ2N4cWN5T1RoeXJXbEZJaHRq?=
 =?utf-8?B?bXFleWE3OGlKVFg0UWdQQzIrRkw0YUNmc1BuNFNWTWFnbDFkQUY5YXBSbUp2?=
 =?utf-8?B?QzZqdXRMOTdrbTQ3SVJqV0d3ZzNWYnlnMGZIZHN6NDFiWkEyZE9NYkhvT0ps?=
 =?utf-8?B?U0ttZUxvVWRnU0hMbUwwZnVVbXk3RTZ0ZlA4WEtPZjVsWWpGWFJ4b3NRZm5K?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: eecd35ce-6fe7-4103-db9c-08dd660f2c21
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 11:22:30.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rylxL7INvZXjwe2mwGuzBGiKLW1NlES6OBnGSAQkauKgELKoRpWQkedVOa08zi8Qx6jgVJcNsa3CKo1FCg0jowOIsEZFbJ7jETIHKYffGz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9051
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDz3uU/2NmXkhyIXZOCHsbChsVzG6egHswDIRMNTmA4=;
 b=e5mybKJR9ex7CaRhuk/8jIBQZsMzXK07lcAJUegMUMmHWFgwo9oXNpwYnoy1NMHj1OjCETdSPrbXNDEnrD+vn3hkokL07MTsUXBZ7/oRMmeAi8HyI4WA8lk31vGHRsPsloVqpFprOsNi6yIsRLwRohSOEv+cAkrjQmdJSHiWUi0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=e5mybKJR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH] package/libcamera: force-disable qcam for
 now
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

Hi Peter,

On 3/11/25 7:15 PM, Peter Korsgaard wrote:
>>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:
> 
>   > From: Quentin Schulz <quentin.schulz@cherry.de>
>   > qcam is based on Qt6 since commit 71aa3ceec30b ("apps: qcam: Port to Qt
>   > 6") which is part of the v0.3.1 release.
> 
>   > qcam being enabled when BR2_PACKAGE_QT5BASE_WIDGETS symbol is defined
>   > breaks the build as it's missing the qt6 dependencies.
> 
>   > The migration to Qt 6 for the Buildroot package isn't straightforward
>   > though as we're hitting a meson bug[1].
> 
>   > For now, let's just always disable qcam until we can get everything
>   > fixed and migrated properly.
> 
>   > [1] https://github.com/mesonbuild/meson/issues/13018
> 
>   > Fixes: 72757d111a5d ("package/libcamera: bump to version 0.3.2")
>   > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Committed after adding an autobuilder reference, thanks.
> 
>> ---
>   > This is suboptimal solution to unbreaking Buildroot builds of libcamera
>   > when Qt5 Widgets are enabled but that should do for Buildroot 2025.02
>   > release.
> 
>   > We should ideally work on adding proper support for qcam in a later
>   > commit, once the issue reported in
>   > https://github.com/mesonbuild/meson/issues/13018 is either fixed or
>   > worked around in Buildroot.
> 

OK so seems like the proper way to do this with meson would be to add 
moc, rcc, uic, lrelease, etc... to the cross-compilation.conf [binaries] 
section.

The issue is that a path to a tool that doesn't exist will crash meson 
instead of simply marking the tool as not found, c.f. 
https://paste.ack.tf/a12d3b Or at least, it'll crash when using a qt 
module trying to find qt tools.

I guess this can be mitigated by making use of _MESON_EXTRA_BINARIES for 
each package, that are only added when some symbols are 
enabled/dependencies met. But does it make sense since it'll likely be 
necessary for most qt6 packages?

We could also have some logic directly in package/pkg-meson.mk to add 
those paths provided the appropriate symbols are selected? (but that 
could still make meson fail if someone forgets to add the appropriate Qt 
packages as _DEPENDENCIES of said package).

Maybe there's a third option as well?

Which would best suit Buildroot?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
