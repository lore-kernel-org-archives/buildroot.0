Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEFDD6261F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 12:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42FA86F831;
	Thu, 22 Jan 2026 12:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEXs0p62xlG3; Thu, 22 Jan 2026 12:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB796F6A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769086529;
	bh=aWUsB1KmdItsmDYV4VfDWIVqqiG4XJUAJ7rcxHCUOw8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=CcHd5rdr/3kmqhiKEkt1RDxCIuuOxx84rlzxz3XMw+Svs49KCkSL19nZ3h9Ok82A1
	 HM2tbl6bvImfgzDaGBdoxBhlYpJEbBIdeZY+bpNqwYXvh4rcex0CjfOYPLPc2LZYOJ
	 wrDr3sV5hqtoJhOXvJwS6eLkUAM2scrpOYWKUndofJ/FLZGnhdZWvDrpfIrBXr0tw5
	 mcK6yOgtaclhOXv0M00+uREUtN6vwdFrOwD3jRTS7JJ1/RgeltnCTk/iLXmW3qFDsj
	 GUnDKs+SgFsUfacxTkRJCbJff0vAURuNIs796dBSz2vEsjJ4RBH31vPtW+C2+AG7E6
	 HbF2I/jMpEdkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB796F6A2;
	Thu, 22 Jan 2026 12:55:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A61A224D
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 12:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FB8841608
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 12:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bc7zdEqXHKcB for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 12:55:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F39B541490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F39B541490
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F39B541490
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 12:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIswx4vmaBFB3bncB438Qfike27K2tBdrNPCo5uhZgvTmLR7TR+loSGl93MaS7DQFpUUfcO1ld+W0iClfUbZYupCvKgQe2r7wLuvmbIgtJRuJNAmhgWSCOPSgJKGPCzkqYH0anfPhZ7KVtI1hTwLr4h9vDqR2ig56xtU4HrOXVIOb5Ms17uuyAslylNZHfyEdSXcmFTZFIbFZatpcNLuCiMnyvXHDzmgpar4nYkAmM6ObVzkMTgCZpynb7Eo7rJzklrMmwwWEmekMEoJIPcQ/tw+bnzO/bCEUwfDFWpJ3LIO77a2y6ZGOg6S1knigFoGk91fG3UDqFl9hxwdHkrWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2rkLqZVeC3NPblbKwYALZgBwfykBfPbPXa11YwOShQ=;
 b=rs9pixh1NXvHWHgmpD+GTizi+jpf1LXeR/HEmM9WGmDjjIm1c8MbKsrQsnGoMv+2wrDBkI9lUOHUDD5ftZJsISQhauuVMhH9XLzfGHjTiMWDZ7/SvNX5DyIkPgChKxTAguSodi449SfiFEFokhKQxv93lEH2grm4P11ZkF48+RCYOPX+pWkvg9Rma4yrB4Cr+3bwEhFp1sQ/W/3ZSNHRB1tf8dCLQSiHpnQikKXbPHempG/kB/eHiMBK4mhW3anhs/iBrorPXRwFoOS9qHQjqArvULZm4ZzncRg1syD5agnLJCtSlmEwSfQUBBwZiWeAmBe7fyIVkHTyKNflMVIxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AS8PR04MB7656.eurprd04.prod.outlook.com (2603:10a6:20b:29b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 12:55:20 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 12:55:19 +0000
Message-ID: <64be2a95-2669-462d-96e5-513a651dcab5@cherry.de>
Date: Thu, 22 Jan 2026 13:55:03 +0100
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Konrad_Vit=C3=A9?= <konrad.vite@cherry.de>,
 buildroot@buildroot.org
References: <20260112142524.82048-1-konrad.vite@cherry.de>
Content-Language: en-US
In-Reply-To: <20260112142524.82048-1-konrad.vite@cherry.de>
X-ClientProxiedBy: BE1P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::18) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AS8PR04MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 2596bf09-64eb-49e9-6c9d-08de59b57f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE13aWZmUlNvYnZZVFZRRHQrWmpzSmxaNUNDNUtXMHNTN000SUdZRy9FTWlQ?=
 =?utf-8?B?c05iYXIveVdyVURsbXl2a0s3RS9qaGFXSFVaSHJweXB5NW9vZlUreEFXY1Fj?=
 =?utf-8?B?M3lwTkQra1JycExiaUZ3VGJOeXFQQXdTOHhkUU5WMStCOFZxY0tISDFiRk1Y?=
 =?utf-8?B?L2dpelBFbUgrbUZpMExkcVF6VUszcnBSdERZeGVtMWoyUXhBa1M2czRkTWlz?=
 =?utf-8?B?RFZ6dUZZbWlvck5SS0dVR09lN0FYYmtUb2RZN0cyMVp5TFAyUGVaL0ZNM01s?=
 =?utf-8?B?cUx3UUhkcWFyaGRnczVqSUpaQmRoM2dGRFR5UkwrankxWFFDaVlkZ3JEOHUz?=
 =?utf-8?B?bGozS0lscUllcXNxUktGN1NJRk82Zlo3ajNPOTlzNFIzRWtyaE1qSmxiVUZS?=
 =?utf-8?B?M3d6dUZZMEp1YnEySm1POHBpME1KbHgyT0JldktzWDhRVlh5WFh0YTFUYWUx?=
 =?utf-8?B?c3NBRmxnNUR0WStjY25sWTYzQ1hCcUR2UitBMm9QSFJha0IrdEIyQzF4aUlw?=
 =?utf-8?B?bHFZK0xJQjBjZStDcDdER2oyVDNId0k0WVBlMVU2TTk5NTBEcnZDQWVBbzdY?=
 =?utf-8?B?bkN3NFFkeG5DZXNKUVdGc3g3TTNnVG5WS3hKUk9Da0pUa3hTQnJSOFJ2RllU?=
 =?utf-8?B?bU1FczJSN1BZMHYzeXhCY3BNVkhYNTMvb3NIcldDZVdvQ0ExRkkvWUlWMzRZ?=
 =?utf-8?B?Mmg2TURGdkR5THd1cFlLWGVad0RaQ0I5K1J0WW1YWWtTNTZUYnNrOEJDZEdq?=
 =?utf-8?B?aVdqc3lvazBPUlVRZ0tVeVVKbnJoN21IUzdibUZCMitqWWFIV2l6bTBPWUky?=
 =?utf-8?B?c1ZuLzRvZ296dFUzakwzcEU5SGI0MzRHNzVxYnprUVB0TlozbytNSFJzZnlZ?=
 =?utf-8?B?Nlc4NXJLODQrRVVTVThGV1FsY21HdHc4bTFxNWdGUGZhOSs5cHA1L3kwek1z?=
 =?utf-8?B?alU2aEN5TlhITUVLd0NJcm1pbGFBOUJodTY4MlQzWWZzOXlNLzl2dkRmU1E1?=
 =?utf-8?B?akgxd1lCVnI2Y2lHNjlqcjRwRGVZZExHblB0UnFGRmJwZ3VEMlNMdnZUUXRo?=
 =?utf-8?B?TzJnektUYnZhdVZKMzV6aG9VZW5PMjdpS09FaVFkTEtQTlpSZHFwRi9DSnZU?=
 =?utf-8?B?L0VQd2ZVRmhNVGg5Y0FrM29na3EzSi9ER2s0cXV3N0cwRVcraG15NkdORTBJ?=
 =?utf-8?B?OTk3RkJHb3VSTlFuUG13YnhvdFVCRnZCUWNoNThlbzZqdG1RK29TQ3RzYkQv?=
 =?utf-8?B?elEreWFFZXJLSVF6ZzVIVzd2MW1BLzM4NjRLTnVNdXQrK2pPSFRBSm84ZnlW?=
 =?utf-8?B?czdGVm5PQkZaTWpaTDRCVVZWekU5VzV1WlFMQVFhaFdGMzA3SWl0eUxobUpl?=
 =?utf-8?B?cGRmK0tSUThLaElHdE94bDVURmZQcEE2ZGdmdmJuVWNPVG0zVTdGa2dmVFNq?=
 =?utf-8?B?Z05pQnhnRDg4bnVzc3FxamxOejFWTVVqNWROSWVGTWJHSnBoeUt1czI0ci9V?=
 =?utf-8?B?S2F6QVhsdzdIU0lJSGJJcEpBa1QrWjlBWHlCMjEycmFRSWw3TUVIZVdhUUtj?=
 =?utf-8?B?Wmp2M3V1OVhNUWhXR1AwTUYzaUxtQk04T2JvRHorVEc2RkZ0emNKeUFGbWNV?=
 =?utf-8?B?SHRIWGF3T25vSnd3dUFqQkE0MEJsTHFESkhNUm15SXB4RmtmM3hoM1dzU3l5?=
 =?utf-8?B?YTBVMXNWMUc2R25taDhybDM0aHZROEtSVjkraC9KODJDNDBxTU1FNzYwNFll?=
 =?utf-8?B?VmdFRmE0ODRYWXJQSnRueFM1aEI4VDRxeW1wZStwUXNPNVMxK3ZzMURtTGQw?=
 =?utf-8?B?dXE5aVU0dHBYdFJJT1k4Qmc2c2xrendHbHRMZGZhbi83eE9PUzVHT0Y4YnI4?=
 =?utf-8?B?MzhwczRQU0crUS9Nc3JzcGVDYTJEbTlNVkV4bVBKcTBvZ2ZWeFVsVHBLVEhm?=
 =?utf-8?B?SEVCMkJyS2owNmh0Wit2MGNlMEZhdm96a2lvMnA3ZVl4eXkzL2RXSm9iZXA1?=
 =?utf-8?B?NWEzZ3FFM1p0YlRSOWowdFp6VTUvSFFwV00rYzl3c0VEQjYxWEh1ZzI1dGZw?=
 =?utf-8?B?SkR1NDR0NllxMjlpbmU5enVFWUpHZmtVZEhqNWJST2lLOExPYWZ4Nk5sRUVC?=
 =?utf-8?Q?g/sQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU4PR04MB12026.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SS9tczI4bEc0U3VCQjZ6cW83TVZObTJIbm5jK0szUTFUOUx1OHlSNE1nZHl2?=
 =?utf-8?B?SEtJWExPTDRLczBaRVFiMnczY0NrL2J2OSsyZ3k5VUV6Znh3bFFPdituaksx?=
 =?utf-8?B?UjdEa3RjLzVSZEZUVFlXNTlaMDdKenh3WFhPd2ZHNTZJbWZEWklXZDJKUlhN?=
 =?utf-8?B?Wmx5aVJtbW5kalhWbzRWZk1zWEVhWUJXL3UxQXk1ZDZNMUs0M21URE8yeXYz?=
 =?utf-8?B?STliTHE0WjJFRjdZSEtpSU43dFpWNTRERnR2WlprSmM0UVdNQmpVVS9WdVlC?=
 =?utf-8?B?UlhiNWlCSDVYekpjU0JVbjd0SDRUdFkxTC9SdE1zZllzZm1ZM1pmdGhHRnFP?=
 =?utf-8?B?WDlZUDVYNk9uUk5pa1h2QTNxVE01bGxkZ0phUEdJVGU4d2N6WTEvZ2hzK1Yy?=
 =?utf-8?B?eENLb1NUU0NwaHNPTXlPajlJa1g4R2tnYzJqSnhFcmtaYzU0dVVuS3liUXZJ?=
 =?utf-8?B?WitzOGs4d1RaNjdQVlpia0c2UmRlekJWakRwZ2JHS3ptdVdXQkU2YlFtU3hU?=
 =?utf-8?B?WkpmZzROVDBrK1BRTUNSa0xUU1JzVVo3ZjVzdno2TitCZXorSG1Xc3lyR041?=
 =?utf-8?B?MmdSTGdkY0Jmek5jZUVTZ1NHSTdtSXRWdDVRZThUMjdiNURzeWsrYlRsVTF6?=
 =?utf-8?B?cnpldkp0VnVqdDJuVjBzY1MwOUpvTStPajRJKzZIZkJZd3JmVVE3RmZVKzFx?=
 =?utf-8?B?QzhQYzRwQlEzOWVRcmM1bFpqbkdyRXF5QzIwbVc0VXhBeEZURWRqdTJOK1Za?=
 =?utf-8?B?clJPU3pMTVhYWXd5RkI3dm1iUVMvamlwNGN1QTlSTVV6YUw4cjRvUnAxdFR2?=
 =?utf-8?B?UVBBVTlLREZYRFNzeENYUGF4d1drUWJVdzJtS1gzdFpPdm1zNmpjRituNU01?=
 =?utf-8?B?Mno1VVhYMGowLzlCVnExQnFLRDhpVXRodzkwS0ZVZkxEd2FkUUJMU041YlFx?=
 =?utf-8?B?MEVGQ2xodC9EZWVIc0hhZks4aTVFdFU5RWRibU9YcUxvV0RkRm9zUjZtUnl0?=
 =?utf-8?B?ZXpKVmFjR0NzdkJDY2d3Mlo3dnZaRDdFdFZEZ1VmdXlyQ0I1dUUyLzhQOEVh?=
 =?utf-8?B?T3A2YXB6V1REV2VHRkxxd2NRT2VmL0hZWFFYaTdtRlA4Y1BJenFLakFjWWY0?=
 =?utf-8?B?bmxLRmJpRHovSlFUUERHcDVhRU5FS1VqdGt2SFZUMFV1OUJQTE1DK0NTYWR0?=
 =?utf-8?B?b0RmWEFkMFdHUit2dHh4b2pmVFhmZFRLaC81dUY3TDRaOUJtZGQvZUZjNURV?=
 =?utf-8?B?eFEvQU5oa0dlNitFbUJzSWtkTi93LzVtbkF6amhIdlJkaXkySHJWZ0ZFQU8z?=
 =?utf-8?B?Rk8wWW84QkxSeFRyQkJhQXk4dG16ZEZpb3NFQk5xZnRkc1B4UnRSUVlydlB3?=
 =?utf-8?B?L0FCbFg3NStWZHdQUUNWSTQxenBXdlhnWGZKKzlTZmFDMkZLdnBBUkc1TWxn?=
 =?utf-8?B?WUsxNU9hQXJGUVd1ZDhESmRMNmIxaHduMHorOTFnaEMzREJxZzVFd3Q1cUI4?=
 =?utf-8?B?elp5NXZ5MXdZR2xBWjZGRmpjN1o4VjlUV1FLRXVHMnZrM0dsQjZ2SjE4RHNi?=
 =?utf-8?B?b1Qzc1ZaS0gzSFNNM2k5QjFCZzBYZ0hyQVdTbWlUaDdhbElES1JYdi9Fc0Iv?=
 =?utf-8?B?OExtNTN5TU5iNis3ckQzNWQ3OVpaOHNYQnk1V1RSZmhJbGcxc3dCRmd5Zldo?=
 =?utf-8?B?Ly9RYVd3bHhSWEJhbWFlU2dTekZJR0Y2c3NleFdJOVZxTm80b2FycjZnMlhV?=
 =?utf-8?B?elR1bWpQTElTWWFsTTNVN2tubERkTExJYm5vWXZSekJVL0h1M0lOSWVBcHpr?=
 =?utf-8?B?QjZMZHJZUmMydEc1OEpBZ3cxWjBVdUJFc0Z5czlIeWJUUWRYQldSSWJ5cngy?=
 =?utf-8?B?L245RE1JZFZadXBCSFROOHJRTUtsNHN3WUNRTEtQZ1VWUmErdzZlYnRZKzhl?=
 =?utf-8?B?ZWJxUVNDd3pLajVWYUM4cHp2Z3lIOGhhbGQ2Q1pQdlFpcDBmeTFXNXIzcHYr?=
 =?utf-8?B?MGRLckM4ait1YnJrMlQ2elgrNThNU0pKODU0T0pOdytpVjRKS1FIMzRucFpJ?=
 =?utf-8?B?UFRkZDlyYW1seHNSMDJjTFNrNlZMWE96R2M0T1h5VjZwZTRmZUkwUVpjSDEy?=
 =?utf-8?B?Y2VGZ3MvT1ovdmxDMUxUb1c5dXRQRFpRZjR6eGdrMXhOanllcUNvd2lFVnM5?=
 =?utf-8?B?dVlmZ2gyMTVjR2tVcDZ5WWVtcEd1SS8yaVRSRWZFeE1HaDUvT2RvZGF0ZzZu?=
 =?utf-8?B?TkI5L3diK29qUVk2WFJWRTdEOVE1NS9tMDMwUTVCQ0NIZ0ZGa056UWtYaUlo?=
 =?utf-8?B?VWlIWVhGOUp0dVFSbm9na2ZnWDQwL2tJRHFmQ3ZLYWh2bmt5MlRBZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2596bf09-64eb-49e9-6c9d-08de59b57f8d
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:55:19.8470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ayFeVfdm0kFaPxgwDZLLi3CPpTnvErs4mwLdhPd4Zyk4a8zEwOb5aGahQENq76aV/ypCTRbypf2j3iHw9rkC6Gl8xHy8JS0Iu1QYoal6ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7656
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2rkLqZVeC3NPblbKwYALZgBwfykBfPbPXa11YwOShQ=;
 b=S6UCYIfAybzb5lee1kPydXFTEUEcDMNCGP+DOBf7uvT6AewYNUG5R4W9OOBc3OgkZrXziQRo6oV5C+QzvAYoWYUbdfXl4wyfIMoWDmWJkzjn5b0cA+3KkFYesr5icsKIbfZIn5EVHc+LptPPPzPSkQax62fkiH+cZW0VrNy/YDU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=S6UCYIfA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: add
 'no-tls-deprecated-ec' configuration option
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgS29ucmFkLCBhbGwsCgpPbiAxLzEyLzI2IDM6MjUgUE0sIEtvbnJhZCBWaXTDqSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+IEFkZCBvcHRpb24gdG8gZGlzYWJsZSBzdXBwb3J0IGZvciBsZWdhY3kg
VExTIEVDIGdyb3VwcyB0aGF0IHdlcmUKPiBkZXByZWNhdGVkIGluIFJGQzg0MjIuCj4gCgpGWUks
IHRoaXMgb3B0aW9uIGlzIG9ubHkgYXZhaWxhYmxlIHNpbmNlIDMuNSwgY29tbWl0IGZlZDliZTM5
ZmZlYyAoIk1ha2UgClJGQzg0MjIgZGVwcmVjYXRlZCBUTFMgRUMgY3VydmVzIGRpc2FibGFibGUi
KS4gU28gbm8gcG9pbnQgaW4gCmJhY2twb3J0aW5nIGFzIGZhciBhcyBJIGNhbiB0ZWxsLgoKVGhp
cyAib3B0aW9uIiB3aWxsIGJlIHRoZSBkZWZhdWx0IGluIDQuMCwgYnV0IG9uZSB3aWxsIGJlIGFi
bGUgdG8gCnJlLWVuYWJsZSBzdXBwb3J0IHdpdGggdGhlIGVuYWJsZS10bHMtZGVwcmVjYXRlZC1l
YyBvcHRpb24sIGMuZi4gY29tbWl0IAo0OTMzZTgzZjMyMzQgKCJEZXByZWNhdGUgc3VwcG9ydCBv
ZiB3ZWFrIGVsbGlwdGljIGN1cnZlcyBpbiBUTFMgYnkgCmRlZmF1bHQiKSBzbyB3ZSdsbCBuZWVk
IGEgcmVuYW1lIGFuZCBpbnZlcnRlZCBsb2dpYyB3aGVuIHVwZ3JhZGluZyB0byAKT3BlblNTTCA0
LjAgd2hlbmV2ZXIgdGhhdCBpcyByZWxlYXNlZC4gTWF5YmUgd2Ugc2hvdWxkIGFsc28gcmVjb25z
aWRlciAKdGhlIEtjb25maWcgZGVmYXVsdCBzdGF0ZSBvbmNlIG1pZ3JhdGluZyB0byBPcGVuU1NM
IDQuMCB0byBtYXRjaCB0aGUgCmFjdHVhbCAobW9yZSBzZWN1cmU/KSBkZWZhdWx0LgoKTG9va3Mg
Z29vZCB0byBtZSwKCkFja2VkLWJ5OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hl
cnJ5LmRlPgoKVGhhbmtzIQpRdWVudGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
