Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B815BC83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 18:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69747611A2;
	Tue, 15 Jul 2025 18:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpVfqS6KRmFw; Tue, 15 Jul 2025 18:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98E00611A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98E00611A0;
	Tue, 15 Jul 2025 18:09:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A3611AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5661409A2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2ub5l0Ho-aJ for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 18:09:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1951400F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1951400F4
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1951400F4
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XehOTSGJGoDqjT1TlflwcBr0tvwucAhT0bne1Jolm2GfVX+TE8R9cXYWs4qfhkpV2X7C67JLBMLETHZ+wmNZafqeTPoW68rL5tVKSilyLQHzBEiiPMuI5pZm7GpLBkaLd+4H1vxBC24WUM7oBYtwYhVwlpn2XRICOBaDwLI3P23R8woOAinhzA1XuKts8t6ydy2WK80t6LQbUjKkjFQ18EKqrTKrenWqDuMs5vpMK6HwpJmcoxzfzJd6G0llko1qfc7PlytSIx8A3tPXmHxSFYmxPcUifAbyhs7IMRZL61AjpcN/BytffBMDiai2R5LYnp6ymrP+VKB6mcFlZ3dF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VfagpmSqPMbpUmpoAtsVnde8GH3HNao4rPRabKS77E=;
 b=fXWil37PxtPudUNwrsNmpEV0Se/ZelZcOuzItDSqQsVaXNh0otd6SJFlbxPSXybQiRWxxqX6wFtz8QEaa8ccLqJPeF+EFBc0eiw0aEYc3hUtcd2R1/cG8ZuWb6O9w4DDdFq6Dfs8Xj0clklHviNK72ZxGQGC/fxaXyFz2fOj4Qkx/y0mA7vqTydGXIe4AGXnVDyamr+k0/htwVnxSIXVy+Cueiz+QoTcqJi2zIl/wgcdWymfm5K803M+NQYgtdlh1/iS8hneIfwxmUoUH/CDb+Tm6PWbEYkn6QnB//70sV/xdmAKqcDPYLxUzM0oVCNF8pNYDMFj09hY5F3rF67LCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by PH0PR10MB5869.namprd10.prod.outlook.com (2603:10b6:510:14b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 15 Jul
 2025 18:09:29 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%5]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 18:09:28 +0000
Date: Tue, 15 Jul 2025 13:09:24 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>,
 buildroot@buildroot.org
Message-ID: <aHaZVPIduNS8_3AS@colin-ia-desktop>
References: <20250715160149.2886803-1-gero.schwaericke@sevenlab.de>
 <d0473d32-8362-4c92-be5e-1cb82c370c4e@bubu1.eu>
Content-Disposition: inline
In-Reply-To: <d0473d32-8362-4c92-be5e-1cb82c370c4e@bubu1.eu>
X-ClientProxiedBy: IA4P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::17) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|PH0PR10MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d93c3fa-8c76-4dc1-6d4a-08ddc3cabd85
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnJkR2RIb0UvMHNLTFlzemhicWJQYW16K2hiZEtDM1VkOE5zTnVMZGtaV3Bo?=
 =?utf-8?B?djRTMDA3OXBERkNmUUFuUG96RFRuVUVoZ0V2VDNlemdkSkoyS0FyMFh2OFR2?=
 =?utf-8?B?TG9jcy9NVVJiR1hhbmJra0Rha2tVbS9NaXBnc3Q0eDdwVXNsZnl5T0twNTZl?=
 =?utf-8?B?NU9iaHFEemdSS0pJdkN5VEx1VEwrMUsrUHpCQ0gyV0tYNWZLV0wvR24rbjVG?=
 =?utf-8?B?eFJVK3FCbVhpZ0YyRHovajVLU0l0RXdlSjRhV2hWSm9nc3JUelpueEc5bHZZ?=
 =?utf-8?B?b1FoT3hUMFduVmkya3g3OVBMMzlOVjdLRkJDSUZSY0wwazdOYWNUWEFrU1gr?=
 =?utf-8?B?KzZEanpSTFlRMm95YlZURGdpKzJlMDdHY3dsaHhwL295ZkRrY1ppR0w4NnNr?=
 =?utf-8?B?ME93cnBRNmVWNHZaRDVscXhmZkFtUVVBVkkyZFdtMUJyR1dGaUxaOHlPWWdZ?=
 =?utf-8?B?SWpaM3BlWEZwOTBLWGZ5VU5xSjRGbEkzemFyRmxxT29BcVg0L3lNdFgyUzd2?=
 =?utf-8?B?OWYzaC9ucmI5c0pSaWVkbHJjdFJmdmhlRTMycUZRZC94eHpGY3BuYkM4c1JV?=
 =?utf-8?B?R3VMVVVWTGNXdUJ3WGdmTm9OdWlRa1VnVmt1dHRBNFF6bERRZGs5V3NYQWI1?=
 =?utf-8?B?WGhXSGcvbG9TMXJKWDh6VnpDN1lQa1g4a2dJUlpKZDFjKzZCWDlMREphWGNW?=
 =?utf-8?B?YXpXRmU2dk5WVmdRbEkyWUN1VVQzK1JRQzNNdjNtZndTQzRjb3FINlBndnA1?=
 =?utf-8?B?b3kvRnpvNmdnazdwc1VVL0Y5WHJuTG9HMU5kWVFMbDNHc25OZ0wrSUtEZlpx?=
 =?utf-8?B?aU9wKy81MDJ1V3BMdXFTVjlpSXJqQmJwMU4xOG9lbWxUeVVhRG9nMmwyQXNF?=
 =?utf-8?B?dDFMWUczVmI5a0NTMUhna1RVYTJuWnVkTHd0VmtNaDVZSzZTdzlRUDRxVXBP?=
 =?utf-8?B?eDZneUhpcWJodndXV3BvWHFWcHZBczRFeU8xS0UweTl2ZEluNElUdTBLa1Ju?=
 =?utf-8?B?OFRrK3ZGL3B3T1ZtM2hEM2IrZjVvQU9hcW0rV2RMb1NNRXRrK0RmZCszU0JB?=
 =?utf-8?B?V2ptNldkZ2dFMU00cmI2RzV6NDhTdnJGdFl2UmdLT29Uc2xRdmdiWWtYSWh2?=
 =?utf-8?B?MzBXWjRrandWeXZ5WUZac3dKSFJ4QXUxOVcxbHRDQytjTEM0M3BCcFZCUWgw?=
 =?utf-8?B?K2hHSlk2STJBZVBPMFRDb0RLQ0xhK2tXREwvRy9razJmKzcreHRNTTV3aVVR?=
 =?utf-8?B?QmxLTUxYVEFkNHJUMlpkelBNMG5KaVkvdHdyY0VhY0xoS1c2d2hRbzE4ZFps?=
 =?utf-8?B?ejlUYTNjR0g3dlNpcmNRdmZaQ3VpQ2JvZlNQTVhuWnRMcnBpYlhiSjA2Mnp0?=
 =?utf-8?B?UFVnQXd2K3A4b1ArSTZVYm96UWg2VURRMWZhZHJwVW5yejEzVVdBNDgxQUNp?=
 =?utf-8?B?SnJRajI0eDFPTkdzc09jRUFRTEFvZGk4ZklBVm43VWpnZ05ORFhsZ250RlJB?=
 =?utf-8?B?Rm1OcVMxM01xQWtWd283anE1bHdSVnArSFdVMnFKTnVWeDY2aERhQXYxa1JW?=
 =?utf-8?B?dFd6ck1YQVJNZFc3bEo4Q2o4cVNpendGOFBUMXROcE5nMXk5YzhVZ2liMmtM?=
 =?utf-8?B?RWpiUXQvMzJtQmJwSTBJYmJubUsvMkErSkF1bk51SlI4d0RkbzFZUkdEUHV1?=
 =?utf-8?B?ZEZCUHBDakRGL2FmL3hmcEVNd2NiSGgrRENXRUs0M1RRaE9jWm5nMU95ZitF?=
 =?utf-8?B?aFpYWElMTm1FU2NsZXpjSE43YjFxekhua3NVOStnVnd0K0VyelhSWTVSQmQ3?=
 =?utf-8?B?ci9PbHFmL0JsVHpJQWlTZHU4OGpQdndIRDJjZFFneU9pc1BZMzhpbUpaS2o4?=
 =?utf-8?B?TDljWUZiZE1MQ3Rvdno5RjEyOHBmZGo5WjQ3RnRnWS9nc3BIMDh0TmtXa3BD?=
 =?utf-8?Q?cV74mFz7Cms=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlNZWTNLZjFsRE9DSE9oRVRaOGt3b2RYL2JIYTNRN1BMenBvZTBEakJUbm1M?=
 =?utf-8?B?emU2ckpOanA5MHcyWEJLaHVwVHFwRWN4bk9pVjhIcFUvTlZBVWJ0VStkY1BF?=
 =?utf-8?B?enh4aHJmam9QZm5wU2pwNGFjVU9SYUZWYkRNYkRiZ1lkTHgvVlVLT3BNeks1?=
 =?utf-8?B?TjIwb3FSdmhZaVJOcktIbWQ5T1NjWGZyNHBrKytCREJNYVBuYm0xUUZRbTAv?=
 =?utf-8?B?Y29abUdFdHZaNEtTbkxJYzNybzlYMzlxckNLZHZXT0d5RC92eWgvM3BZL1gr?=
 =?utf-8?B?QURWcUNqcVRwSzJER2FYY2UrTTRvTUViYU1qcVB4OGxYQktkRzVsdW50MkdX?=
 =?utf-8?B?VFptd01zVEFUd0VuelFwbG1kY0JESmdwWFVPR0ZwL3ZlaUJWV2ZWdEZjSmFq?=
 =?utf-8?B?ZG5OSXhNNVdRN1F3UVVDci9iM29uZzRtQkRHcmQ5ZGorL0p4MFBsYUYxSmZz?=
 =?utf-8?B?bDFzVFYwMkZzKzEwWEhJWS9MVXJMWUpHVjZqV1BXQUdib3VDc3VwQUdPUk1w?=
 =?utf-8?B?SzR5MWpjYlVpSVNEby9zTE01bFkwLzA3aDhxRU84Z1BhaFNhU0Q2RFExcUc5?=
 =?utf-8?B?ejljVTRrNDhVUE5BNS82TjFDNnB3Z0l1VXRDTjlDN0tsa0xnSUZ3Tkl5Snhz?=
 =?utf-8?B?VWd3NHhCOWozTGlvUDJwUnFJUGNWL3B4Q0FpNUpJRkFYNm5Jd2YvUlF1c2c1?=
 =?utf-8?B?NUQ3VHlWQ0Q1QldtelJib0JMbEpZTVhYck5pOUkxeEJNRDVnakRlaFR6RkpW?=
 =?utf-8?B?N0tVaVdPOG1HRlBLZ0dMOHVsN29zUEhWR2p0S2hVb0sxTE1GZ2xkSmVLOHk2?=
 =?utf-8?B?UEVUM002VDBldERhY3I4bkd3aDdBb3d3RDl3Snl2dFk4TmFmcjV2M1VtZFcx?=
 =?utf-8?B?dVlaL25HSXcza1l5Y3BrN1NJKzdwb3h4cENvV1RhUGZoNEJ2NUJmVnI2d0VH?=
 =?utf-8?B?NkxUOW1xdWpCcndjVFBNQ3FGNWVmMzlnSzc4U2krVHJlTkRzTTdzajU1eFhp?=
 =?utf-8?B?b3RCRWIvRmxlNTJSNlVTMjE3TzF4VEd0RXM5NE0wL2tYNzJnVHhDb0NLRG12?=
 =?utf-8?B?N1dvNkhEa1dPV01FOVlja3FJVTltYStxOUlEbzhud2Z5bWpwNkRyQVRVcStz?=
 =?utf-8?B?SDUySkduSDUrYVgweEV1TFdrSkROMXVvaVZjZmd6Y1ZucHVxQlBUSkJZQmty?=
 =?utf-8?B?TmU4YU9LNkdQUTJDS3EyR0cvQ2FyV0cwYjd6cDVlNGZ2MmNxazFHdldCZHkz?=
 =?utf-8?B?WitGRWxzazN4YVBLK05ZTFVIN3pWMkJTL01XQUM2Q20zanhidHpKLzU1dmll?=
 =?utf-8?B?V1hRQnN3U2JoNGMwMHRxRnlIeFgrMlo5SlNDdGhLTWgzT0pNN0gwckJHQ2Fv?=
 =?utf-8?B?UjVNVWcrV0ZpMXJESWFQT2VVSEdsMTJGOTA5RmhnWElNY1k2ZG9SSVhkZmZs?=
 =?utf-8?B?QkxPa3EyS2ZDTVVPb0lVaXVPT2JINFU1UmRZWnVGY1FINkVEek92UUpGL21m?=
 =?utf-8?B?SE44MXRRb0lBNWhHWm42THBhdS9VUkIzVlo5NTZSeDhmdk5rRmo5cmJvRGNB?=
 =?utf-8?B?ME1FREl1TElXRVppSHJQcXUwZTgwdmxlR3NDckF2NlJPSkx3WFQ0eVhlNzMx?=
 =?utf-8?B?VnFHLzdnSzRtYTBXRTBqSnhrMXNRT3Qxcnc5TFZWYWN5ZkdGcFpOVlNrSGRO?=
 =?utf-8?B?enNtam53Z29FUWVPV0hNZ2hUd2NSSzMwNHRZVXpON3hSSWNwZW1INTFqZnZY?=
 =?utf-8?B?M2FicStSeEpjT3Z1eTdZQkJrcnhGb1pOcnNHS3RvNHhsUDJkNVRFSGp1RUVt?=
 =?utf-8?B?RTFycm9ra0hPTVpCa25Mak15VHRsWGg4NjYxWGx1dTR6T2k2V053WWZPZ0hx?=
 =?utf-8?B?aFdoNm50R0pWdGVMT25Qd0w4cFJhZ0xKZzJNZG1NOENHRDlvb3B4RENwdm81?=
 =?utf-8?B?TTNIVC9oM3kvK0gyT1pnKzA2TEI4VWtNZllGWFFMZEJFSnFYa2xabG84YjRy?=
 =?utf-8?B?dlRYWGVJSEsrRUcxcXpYeGRocXV3bU1hVHBvZWdVd1phMCtnaGx0L1VReExB?=
 =?utf-8?B?cTAwMHY0eGFUam1qTXJXc3NVRXkwZnl6RmptU01EWXVCY1Nid1BRdGtWeUxK?=
 =?utf-8?B?a3lzRUZ3bE5CRFcyNnFuZ2IxaGNZRk5aeVk2WTgyQmxPU0FjRTVlZ0JRNFFu?=
 =?utf-8?Q?ujmUTQXPVn+TgeGFI0IecLk=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d93c3fa-8c76-4dc1-6d4a-08ddc3cabd85
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 18:09:28.8473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgUOX133eOUnKQLbFG8N79MdGq96P0dPwFZoQZAmh/xKgutclFQYZkcr7k/bbmJPDa+XfRssPouvsoxSp2xdEMnW+8hGg8sT/mupRgjXGBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5869
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VfagpmSqPMbpUmpoAtsVnde8GH3HNao4rPRabKS77E=;
 b=KJRDOyHruexBbMdSKIfs19qU325X8mbV9gyizEHXcVowZ5awXbnB2Ghec53FUqBA2Pb2sbdefcHFstXHePzxXhqvUU3sVLw3/r+ZuPnkH0Xm5V22k5bDl4+6uH0FeLekW9Kv9XgrCUIZtcO97kmQJMkioK+kWnggGwsNPJuxqCE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=in-advantage.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=KJRDOyHr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH] package/rauc-hawkbit-updater: fix missing
 user
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMDg6MDI6NThQTSArMDIwMCwgTWFyY3VzIEhvZmZtYW5u
IHdyb3RlOgo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYnVpbGRyb290QGJ1YnUx
LmV1LiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5B
Ym91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPiAKPiBIaSBHZXJvLAo+IAo+IEkgZm91bmQgYWxt
b3N0IGV4YWN0bHkgdGhpcyBjaGFuZ2UgaW4gb3VyIGxvY2FsIHBhdGNoZXMgcmVjZW50bHkgYnV0
Cj4gZGlkbid0IGdldCBhcm91bmQgdG8gdXBzdHJlYW1pbmcgdGhpcyB5ZXQuLi4gb29wcy4KPiAK
PiBTbWFsbCBub3RlIGJlbG93IGZvciBzb21ldGhpbmcgdGhhdCBzaG91bGQgcHJvYmFibHkgYmUg
Y2hhbmdlZCBmb3IKPiBjb25zaXN0ZW5jeS4KPiAKPiBPbiAxNS4wNy4yNSAxODowMCwgR2VybyBT
Y2h3w6RyaWNrZSB3cm90ZToKPiA+IFN5c3RlbWQgc3VwcG9ydCBmb3IgdGhlIFJBVUMgaGF3a2Jp
dCB1cGRhdGVyIHdhcyBhZGRlZCBpbgo+ID4gCj4gPiAgICA0YWE3YTRhZDhhIChwYWNrYWdlL3Jh
dWMtaGF3a2JpdC11cGRhdGVyOiBhZGQgc3lzdGVtZCBvcHRpb25hbCBkZXBlbmRlbmN5LCAyMDI0
LTA3LTEwKQo+ID4gCj4gPiBUaGlzIGluc3RhbGxzIHRoZSBSQVVDIGhhd2tiaXQgdXBkYXRlciBz
ZXJ2aWNlLCB3aGljaCBleGVjdXRlcyBhcyB1c2VyCj4gPiAicmF1Yy1oYXdrYml0IiBbMV0sIHdo
aWNoIGRvZXNuJ3QgZXhpc3QgYnkgZGVmYXVsdC4KPiA+IAo+ID4gWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXVjL3JhdWMtaGF3a2JpdC11cGRhdGVyL2Jsb2IvMjcxMWMwZTAyNzgxZWI5ZDk3Mjg1
Yzg3MTk3ZjFiYWZlZjc1ZDBkMS9zY3JpcHQvcmF1Yy1oYXdrYml0LXVwZGF0ZXIuc2VydmljZQo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvLnNjaHdhZXJpY2tl
QHNldmVubGFiLmRlPgo+IAo+IFJldmlld2VkLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9v
dEBidWJ1MS5ldT4KCkFwb2xvZ2llcy4gV2hlbiBJIGltcGxlbWVudGVkIGl0IEkgd2Fzbid0IHVz
aW5nIHN5c3RlbWQsIHNvIEkgZGlkbid0CmNvbWUgYWNyb3NzIGl0LiBJbiB0aGUgbGFzdCB3ZWVr
IEkgY2FtZSBhY3Jvc3MgdGhpcyBmb3IgYSBob2JieSBwcm9qZWN0LApidXQgaGF2ZSBiZWVuIHNp
dHRpbmcgb24gdGhlIHBhdGNoLgoKVGhhbmtzIGZvciBqdW1waW5nIG9uIHRoaXMhCgpBY2tlZC1i
eTogQ29saW4gRm9zdGVyIDxjb2xpbi5mb3N0ZXJAaW4tYWR2YW50YWdlLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
