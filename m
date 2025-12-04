Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CEDD1F9DC
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 12:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E15D83F68;
	Thu,  4 Dec 2025 12:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ferMdQWvtW1m; Thu,  4 Dec 2025 12:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399DA83F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764852650;
	bh=a6Q6loKEFS2KDhbo+/a9h27RGiBQ1p1GfVG+WpQoZm4=;
	h=Date:To:CC:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MZjy9U0iRU4DcXELtwOOzHTuL2jxBuIqdO9v3LDjCcN1G8r6UmCxgqlJuVBLdGuXm
	 WU0p7VAhff32S8HbmD6e+jsN2+5NIh9m81iw7BsaYcsSTBXMsMxaSFgtZolIHBWtyU
	 i4q9yMnh2VNWx+RM3EPMSRvtrwqsmGas7gOKebKzOQL9cdlr9MprvPo9d3ipLjnR1A
	 /j5tQnseNz+29O2tPTZLVegvnIiZIBJ7xZ2JAfkgKHLfNf9iDLHH8hts0takVx1AHw
	 DwvOQ3sXmSFOANi/bp2vQvEwZRsP4OgpMMGKkbS7XL7ZEUzYbEmXjWhmSnmvL67GI0
	 8S8hhVH2b6T9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399DA83F15;
	Thu,  4 Dec 2025 12:50:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F74E4
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 12:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 919A040FD3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 12:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GT1i55k86ONH for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 12:50:48 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=bb@ti.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F12040FCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F12040FCD
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F12040FCD
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 12:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVBZsqjLECdxdYM7z5jN68rW1Pdmy6duQNnGClelA/pS00gW2eZm7Aaalu9S7YFs5yxqL1Q6ZU76BLfDl9whrUFEsLs9jU47VRIWKLrQNZiS3KOrP+gDK/bYZ/ZdeRN4uYN4EJp9tCgD1xu8sq1AEJOYVkSkhGlCMgfGXTZSa15u1nqnLiowJ1WVK4UNX460mguX0aqiRoZTPPwC9lS+d8zouwMQKGBT5XFYr8qszZ9TV6ehpOh2/kK7Ls4DlSuNVJGAb/iGATj/bECH9EtQBfJ+DwvJVspLmN8UBaI8XsFlwCMKN280Wn0FLS9kzL8MJ0bdE3oa2iKQMNvFOkxE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCWWOIrOjca0sEh8MmYpzS7FYbei9Xk9jqlEWjmavms=;
 b=dDnv68Z0t/XfYUMOVGioqAcqj1P8mxvcuYcw/6IUQU02wgNmGQiFJF1M9WqPCQjd25WCNx5lW0GCGkWIjNWCT470PKq7YBqFmfpFHk1LdJvVu43+z81dzUJN2+ngCrhBgmMyMLeyELvnsbUJ8yx/ZMKVvH0PyJrzcKbNmz/kWptr5mbh503JUQy/LR5QO0xb6vjElU4UDtlgN7SEbduBe3v+urHeNLvujANYUYPdHuT+s88Zv4fpFeY8phWGegV7tm3lxACH7qbIsYXlQpDbQ6BbC/I0Eb1T0geScVaMutW5db+U+Rz0Z19sOqaBH83jobOItb9ghgNmqz12X8bn4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=buildroot.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0110.namprd05.prod.outlook.com (2603:10b6:a03:334::25)
 by BLAPR10MB5121.namprd10.prod.outlook.com (2603:10b6:208:334::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 12:50:42 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::d) by SJ0PR05CA0110.outlook.office365.com
 (2603:10b6:a03:334::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 12:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 12:50:40 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 06:50:40 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 06:50:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 06:50:39 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B4CodbH1564661;
 Thu, 4 Dec 2025 06:50:39 -0600
Date: Thu, 4 Dec 2025 06:50:38 -0600
MIME-Version: 1.0
Message-ID: <20251204-k3-r5-loader-fragments-v1-1-08755f22c4f2@ti.com>
X-B4-Tracking: v=1; b=H4sIAJ2DMWkC/x3MQQqEMAxA0atI1gZsWoXxKoOLaqMGxzqkIoJ4d
 4vLt/j/gsQqnKAtLlA+JMkWM0xZwDD7ODFKyAaqqDZUOVwsao2/zQdWHNVPK8c9oW0MOQq9Gz4
 EOf4rj3K+42933w8zbXLMaAAAAA==
X-Change-ID: 20251204-k3-r5-loader-fragments-361242db4c92
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, "Bryan
 Brattlof" <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996; i=bb@ti.com;
 h=from:subject:message-id; bh=DKxSPcDdy/U41SVGTOpw1hcE4HhRcrxk1xDhE98YICE=;
 b=owNCWmg5MUFZJlNZIjdVxgAAYv////bddz87/+3//uLl3j5y/fm+f77Z+3frfp19tPrX/f0wA
 RsYyHqZDQAAGgNBoABoA0ZAADQAaAADQ0AAAGmjQADQB6gD1PUNH6SbNFDoANA9QaABoAAGg0eo
 NAAGhoAGj1ABoBkBpp6mQNB6j1NqaGh6h6jTQ8oaA09ICHqGjQ0MI0yAaA00aGTTRhNBkANMCZM
 gBkaGjIA0A0aaDQAAADIaBphNA0wECWBDb83vOkM/vcGkEfU31SIPE15oR1whGIhnqmHd4GKoXW
 SySu/MDDItKXYDh064g4G7h3VifVoiBiV9xoDsVVzlGPVE9lZwDOhBiku0ZT/w+2WkPurcwN6qw
 IVeZgS98Ai+VdJ1gen03Jg6ykYEmXEHrzYntB+G5lhE41JempXAqCZwMtdmQh7IGkw8NAhCWoOU
 VKKoYKOxGdh0YiD7NAFLVJgrmOcQ4McD5K02KsY2STNyAG+sayBTVjcE4pFcu416pXU1/ILxNAH
 OVnO2/x1BSJuRmExz6UgNdmYqBOKsHG2Tt6iLVbctF+OojyvBUbuEZ4v8BGLFr4OtlCWJomsTgv
 1qIlWG7EGC9lDiEgKtlPEKXn8dUIAg+ooi/IxIDOIXKE+Se1iyiY8wLC4DqwmLhTMahjQF7urNv
 kaUeC7kinChIERuq4w=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|BLAPR10MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f5d2a8-7380-49b3-1cdc-08de3333bb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1M1ZW1rblZsc1Q1RUVvdDlMUkFnN0tUSUNmOHB4WnRIbGJZYnpKUkVVRXF0?=
 =?utf-8?B?ZFoyYzVENW5FbUZOM1BZWjF3dGQxa3ZoMEEybkgraTR5cy9DNXpxMHhQYU04?=
 =?utf-8?B?RGdwajJHNWxUZWdEQ3NrVWpxWXpEWUhFblIzVFBQUHBJaTlvdkcxTlI0OTVT?=
 =?utf-8?B?TnE3bjBOME5XU1NHRCtzQVBlaWhjQWNUaEgvWnl0Q3RwSlpSYldub2MzekdL?=
 =?utf-8?B?R2hYZUQ1ZTk4R2V4U0RsbU9laXFmdFBRaG42SnJzOWtUcnBtdTgwdmVTeWFr?=
 =?utf-8?B?djhUR0NWQW9jNmJ5S25qZ0hqbWVFR2xDanBqbW1EdGNpL3JJZlVDNXk1ZGU3?=
 =?utf-8?B?dkk4dzZ5V0ZDRkdUNWJHc2dReCtPdjFzYm9KNGhYL09KOFdFVkJVdEp6aVYv?=
 =?utf-8?B?TzNSYWJjNm8xSHkwbm9aY0RzZTZ5eTAzT2xhSUtvTy9qMWJKTmdId2FmN09v?=
 =?utf-8?B?bFpvMm0xTEpPa2ZXOVJLS1VZNEdzSFpLOFhidFhJajRVRFp0aGFnVTZkSDJW?=
 =?utf-8?B?eU90cG5NbXlDVzN6SmFIU0NxV3ZDNkxKT01MMFZZeDhGRHI0S1pJWXc5NlJR?=
 =?utf-8?B?dGdpSXFTTVdOUGtZNG9pSHgyZzltWEhjemF4THhucW5tekZZK2xncWU1ek1z?=
 =?utf-8?B?THJ1cUZWVjh2V05IUzZmbDBKWlJSbmt0ODB3SUVNbzFMQjhoWkJmQlNVM0dn?=
 =?utf-8?B?cU5LODIxZjRqcDVkbXFmazl1Y0o3Ty9PaDVGdHluN091b0ZOelozWE0wdTFF?=
 =?utf-8?B?eEZZV0oxZHVxMVVHbkNzSHN4S2pQcXJOTjQ0QWFIMU9rcVRYMzRYZWt3eGx2?=
 =?utf-8?B?d1MwMzF0YXNSazNKcktSeFNkTXE5MW9BeVppL0t5S0x1cVRqcTkvS0lLWllx?=
 =?utf-8?B?TWw1MlJaOVh4M01ObmpLNFlDSm9UTjdhcWkxWDhEQ2VENU55VFVuL3R1dmRQ?=
 =?utf-8?B?dEJEQUpQWVVzUTRsc0NPbVBtanZKSG9lQ3V6Q1NWUXhjcmZSMXNvMTZXRmN1?=
 =?utf-8?B?MUtBRTNkL2tBOGZleWlVQlpNZHNBWDFraHFiaDFwMHoyM05mWlZ0cmVrWkJw?=
 =?utf-8?B?K1kwVjNZRFd4d3VpV0k2OFBoM01JSVlGTHVHeUVDN3dRcU55K3dwNCtDUGNB?=
 =?utf-8?B?SjhYMGhrTDg4TXN4YWx2a2kwVVJxR1loNTVhb2xQRHd1NmdNTmV5UWFWL0Jn?=
 =?utf-8?B?UCtRM0h1TEhUczhCZlZpdjk5OXhQcTdVRThzZnBDSmt2VVhyZE9JR08za0t1?=
 =?utf-8?B?b0ZMd2FhQ21ZS1B6MkM1emRRcm9MTEp6blRrU3NTYkhzNFBlRFEvQzhaenJH?=
 =?utf-8?B?YXZTbnFScXhjZGxXRVZUYkNpRmhhS3VlN1grM29HVnNTNndzRnhlSVdhZ2tQ?=
 =?utf-8?B?K3NSb1FZY2NzVUpMOGNsdnpmNEVIUEYyczdqczFjUTh1akE0S0djSjJ3VDZH?=
 =?utf-8?B?eHo3NWVQRFVDVTJzWHZVRVVKRDlDaktKdDdzQXB6THRoK1M5dzN2MkM0SWxI?=
 =?utf-8?B?MDVIWjFwZVdQNUtLVWE4Vlk0R0o0OGNuRjk4YkNFWmJmS1E5bjF4Qnp1QStF?=
 =?utf-8?B?Y1NHTGlPUUdZaG9vVWdla1VZMFdBRzBVUG9ISjNsY3BTR1JIOVZ3a0ZzMFBT?=
 =?utf-8?B?VUlqaldwNXZ5czZLQXpmV2owbkUxNHV1bmtjcm9SMXZSaVZqaHhTamZuak9j?=
 =?utf-8?B?SFU0aWppRW9VY1BkZ25EQWRvWDNPN04rQTg2UmlSWjQxWU1rRGZVbUFnSHRo?=
 =?utf-8?B?Y3M4dkhac2k0YUFOQjM3NXJid0x4WlNHd2c5aTdSWW82dUxWd0F5ZlVTb1k1?=
 =?utf-8?B?QXNNMmsranJlZlkwZEY5QkVoQ0NNV2FNejVtWUI1M3RKeTN4cFlVNzA2T0xG?=
 =?utf-8?B?eXgrNzFVdE9Lakw0aERwNElUR3pOWHptSnhrbDJ5bnR5STlLMExTZEx0WUd3?=
 =?utf-8?B?cXhIMUx1ZG5Nelc3RXVNM2dmVXJ2RnlrVTRqRzRpR0R1cFdWZWgrb0ZFY3Zs?=
 =?utf-8?B?ZGZRYVR3U1hOMDlvTUN0WFF6ZGZ3OUJib29NMUwwUEtIVzRBV3k2UFFaTS9m?=
 =?utf-8?B?QVVCdlozaE5OY2Z0Skthd1MwV0h3MURmNlBldXpucUliWU0xVlFNSWJtVnhn?=
 =?utf-8?Q?XQ9Q=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:50:40.7054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f5d2a8-7380-49b3-1cdc-08de3333bb17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCWWOIrOjca0sEh8MmYpzS7FYbei9Xk9jqlEWjmavms=;
 b=l7srqLyinMsAGwdHNaaeGENZhrJVDGvtTrxgdE5FYBTAUDVa1qEdJdgKXuj0qWjB0yeOMu66DT6/+RKPZDu+TERPsmBLbxABIs0zJkMt7j13wO6Ej+9OGc3ag89NB7i22dcosXvm0FgQY0P8KN9PpHZgo7iJpnFQCT38Fx+mtQ8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=l7srqLyi
Subject: [Buildroot] [PATCH] boot/ti-k3-r5-loader: add defconfig fragment
 support
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are multiple defconfig fragments we can select to modify the final
tiboot3.bin image to support different boot methods or enable features
supported by a board. Allow the ti-k3-r5-loader package to select
defconfig gragments during a build

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-r5-loader/Config.in          | 6 ++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 +
 2 files changed, 7 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index b4fb46e55b83b47f72971168ab1acd964ff390e3..7eb471e6d504f8d6c72ea0577eb45eb7c366286d 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -95,6 +95,12 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
+config BR2_TARGET_TI_K3_R5_LOADER_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the tiboot3.bin configuration file.
+
 config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH
 	string "Device Tree Source file paths"
 	help
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index db5c3cdaf8b658028c696eb3720327bfb5d6e0da..178db5c0f35adc5140e4e41a54cc23cd4971b6d9 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -77,6 +77,7 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
 	BINMAN_INDIRS=$(BINARIES_DIR)
 
+TI_K3_R5_LOADER_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CONFIG_FRAGMENT_FILES))
 TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
 
 define TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN

---
base-commit: bd1831d161586947141542fdd5a47f10de3e83f2
change-id: 20251204-k3-r5-loader-fragments-361242db4c92

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
