Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EEBD20690
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4495C61BAA;
	Thu,  4 Dec 2025 13:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sK7hnlRdI0ps; Thu,  4 Dec 2025 13:27:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5121361BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764854838;
	bh=8pwAwRHHvn8kbZqNXJCCPUEXPAUdyiGWm4eFSZ1lq0M=;
	h=Date:References:In-Reply-To:To:CC:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pIvKOEn0vWdzs0IU7jbLrUdhV2bWrAqEijK7xnV1MSTMGHaH/Ph+0YBOWztWKv3k9
	 TPe5SxzEVo3n7EkPPNNinOhVcBgNPpAonlkxHEVL6VEgCFfCinb5PLj6cyaoSzJ3F2
	 /7+2zDJWVctVU0AR/DQcOR5rjOnViF9DrXinI3YY0ur8v5bv8KzStfwU0Ow0HE5PBq
	 u69XUAbGTzZK/VgeH1T/EB6U8J/FFHLezs2Wy9IawOQT1IiGycdQ9c6VcE+667KrpK
	 j4R2/m5371meN6QywInIqgSPBeKu7WLvhWrt/99L96waTfnt1ZyaWJj/ruP9zieU9L
	 t5FP+iPnbelSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5121361BAD;
	Thu,  4 Dec 2025 13:27:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B241BD
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49FC040384
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbDFb2acgOWy for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:27:14 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::1;
 helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=bb@ti.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FD0E40082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD0E40082
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FD0E40082
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvkdQG0DV3WGwDBZ1urc3WLSe3FLvNytA6EngIIpo3DAq0pQouWeP5+5b8c0jJrNqf1ScjDlbklF9MtT4zp+Jm66SxTsqzi8NIkwi3iAJ/FSH+jaYFzjtdwDn1LSJjzJ31ZPW95UT/qgEbyTefNo7Rw9bRJ9MoG+vznWKGm73Oxjj02Zo+XtokEaDa5M72FJ+jE0u1q+tm+VupUniD5EmlAorh693hPUYHyw2ToxDfrOXYIac3ajCiJl19gz2aav0DM4JkMkMf+8zpCe3SHUFkR62Z7y5zNJnG9Ih0rklkKY7KrN4GFnVVhcHqGxIes0YSMSCPFI1oTWYURYZ4M8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eg7Pn9AHY3I21VRgWcRv0v0j/B8G+dB4+MsQgeu4Lco=;
 b=JzlxITzWxVVsUuJaYGBxqbAQG/T0ONhPnTygLF3zOVb5bqWz3g/STAQviGZeD2mnRnsHJIaEUlN7myZ316rEIcmsRO8zy385s+VkxaMgUR+LDt/dKdWoSQRfb7mWWCZ99r8SztYMwwpbzIdBZAcrrNF4G4DLyG6ksrP5z0o7GUSHBm15SRwk6Z91SdWrrfXWfNGjbvUaHdL0MUWMARiYGUFcW4qlmT26BjYT5ychZhyCh2j1BJPgHtytIHk80E92poyF1X1Xo4tkwk/GQmMNncGY7RPL6n5JL73U2odFw4gA0ZsHXPE0jMbSelJFQWrhtLqgZvnmdH6GyHqzlyDIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=senzilla.io smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from DS7PR03CA0062.namprd03.prod.outlook.com (2603:10b6:5:3bb::7) by
 IA0PR10MB7370.namprd10.prod.outlook.com (2603:10b6:208:3dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 13:27:11 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::15) by DS7PR03CA0062.outlook.office365.com
 (2603:10b6:5:3bb::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 13:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 13:27:09 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 07:27:05 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 07:27:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 07:27:04 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B4DR40Q1612974;
 Thu, 4 Dec 2025 07:27:04 -0600
Date: Thu, 4 Dec 2025 07:27:01 -0600
MIME-Version: 1.0
Message-ID: <20251204-uboot-bl1-v1-2-ce8e01d73906@ti.com>
References: <20251204-uboot-bl1-v1-0-ce8e01d73906@ti.com>
In-Reply-To: <20251204-uboot-bl1-v1-0-ce8e01d73906@ti.com>
To: <buildroot@buildroot.org>
CC: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=bb@ti.com;
 h=from:subject:message-id; bh=/Ha9LLvfFRJ2/gHgjFZUFo+Jt5qWgCQxnLDV+S4jU2k=;
 b=owNCWmg5MUFZJlNZGGcR2AAAZv///rf73z/+e8vcbPyXO/0f296/f716b8d/9rl+0TP/l9+wA
 RswHajQA9QDQA0NBkAAAyaaAMIANBoGg0GgBpkYgBkAMJobUyDIyZANp6UQPUGhiMRgENNNNA0B
 owQDQGQyAADIGQaBoaGIehAGho0wQaMEAA00AcJkGjIBo00yaZDQaZNNBk0aMhpoDQAaBkZGTEx
 ADBNBoAwmRhNAABoNBoAgSXiK4Khx0gUReaYiNVFSENwG+NjFJOKSjwHzq8wHLu6Z99bQYh3yfg
 W7gOSehIc6+pAA953Y2IhsCNldUTnlY+FSxeZ5zyPvELXBo0kFcGGtX8rolcIoAdCAV27cuk9KZ
 ev15wYt5NtV17PfmFvG0AfdFeA5xWYy2wxqWPEPS38DxZcpmuBwLhM3BhKgkhsSPSlZixVKG4P6
 4qlauLczPbMiXSaMWLFRFsr4Fw2STMCJoEq7EN7mHeUMoJOWrnANaTJJ0qDBBtyj37lOi9bwzZd
 h1ebDOZqeVYkz5LkCaADl+7Ct3ClsBi3LyJ7F83MmJ0Zxw8U/l5scxYIihmqGTgFh/e9WiiB/b6
 38Gv1hBbkfcpUYRRHCuJsP8nxWgXwXh+/5KgAAb9lB73BpGDg0gvRVQyqnKzQQOhDsoLsAP1WNG
 lkXb/i7kinChIDDOI7A
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|IA0PR10MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b13c22-bc8c-4d8e-f5b8-08de3338d3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0l3UDFFMTA2Tzk4OWVuWXpsTlVZWEJMMmwrYnl3Tk5HOERQdG5yeEhvbzZh?=
 =?utf-8?B?Y0tJaGQ4YnRodXRrYXRZQUFST2MvNlpqbERkNzJlVnM4Q1FaRnRZR1J2UDFH?=
 =?utf-8?B?QWw1Zm9yNzhhN2dySUtRUXZ0NHNPbHM5OEJTUFlOUUZ5d2hyM1hVMkNmUEth?=
 =?utf-8?B?aVhnQjIrelpyRVp0WFJPQVI2ak5XelV1Q1JkbXQzTWYwT2hiNVE0cElaZndj?=
 =?utf-8?B?M3g3SnIydVA5dkRSeUZHRGw0ZGVGSUlHOUVYaC9TeXo3TmEyZVVtNGtoNnB5?=
 =?utf-8?B?cnpnbDRzMEJjNDdKdHgrbm1nTVBVbjNtOTh5RC8xSStrd1M2NSs2OURqQ3la?=
 =?utf-8?B?bkE4elQ5ZDdJVkdnY2J4OHNXdUw3RXJ0ODVqRzJvNllYYmIvODk1Y0lHR0lr?=
 =?utf-8?B?U1RpSmQxOWpCUXc3VUxJbCt6eFhWWVpxcGZONllBc0Y2TkFTRlBRaGNuRkIv?=
 =?utf-8?B?Z1BSWmZxWTAwb05VbVJCb092Zm0zQXA2dE5GWnoweUsrdFY0ZkI3ZjFFZnlC?=
 =?utf-8?B?dTlZMDZwSU1sRnUyVlZ2SFZHbXBaTU9MVXpueVgrcDhVbVNEODJWR3dReUt5?=
 =?utf-8?B?cHF2Z0d5TEZXTVlrdDE5NFJDNlgzWTVkZStXbjArNFF2alJEaVZUYXFZVkdJ?=
 =?utf-8?B?Y2VZRVJSeEc4ZVBKZDBqWlR2VVplRHhlRTVLaFVpUm50a2F3TW5QQzhHakNm?=
 =?utf-8?B?QWdmRVlNSlVHUFhKVExTZnB0VlBoOGFWTXFGWXJiazluYlQ5dTU3R3l6SEx4?=
 =?utf-8?B?K2lyS2dKVGJDNjFGNmUvQThQVGMrbzYxU05BUFQ5dzB5WTI1aU4zcWJTWUFQ?=
 =?utf-8?B?WTdmUkJXYy8rajVNcE5uMnUyUFdTd0pJRHZMZTBKOXFqQU1JaEJpK1pnZEwy?=
 =?utf-8?B?K2lWNkZpc3I5eG5jV3MvYStwWXhNa2Z6L09zNkRsQTdWaWtxVHF6RXhyS2FR?=
 =?utf-8?B?Y1FndWFHTmlCUDU1NWxweHRQam5FcWFQeDkvSFVLVXNubm1hVXpEUmdzYmN0?=
 =?utf-8?B?cWdnajgzSGJQR2VTYzFsVThuY05sdmVGRTM2Q3hDcmI2NUNqejZJT0xCazFV?=
 =?utf-8?B?bWR3S2ptM0lUcnN1KzIzZFp0WkNuTUswVjZtd09JK0wvcVptRkdHbEhsbkFP?=
 =?utf-8?B?dU4rQ0lScFV4dFBKS09LcWhDOUI0Nyt4ZUNORjlyQTBEbGJtMHFRZ0ZxRHQ2?=
 =?utf-8?B?bTNkOVJMK0k5YVdVbFpOQjhQQWcwQ3Q0R1VnZWJhQmVwNU1oOTRHRjVsaUxP?=
 =?utf-8?B?bzlwVlVoM3JNQXlxOUN1bDdTdVJwMHUxUlZGUWV0VW50UCt1SkNVZWFwNDIw?=
 =?utf-8?B?azJUTkh6dEtnTWNRY0dUWlIzQU9kUGJzRmJRd1RpQUFoTmxhcnFDWFpBL3JR?=
 =?utf-8?B?Znl6L09sbSs1YzRLT0NoMDB6R1Y0bHdEVzdlbVZraE52bkdpa25OWDZ1Y1Jp?=
 =?utf-8?B?QmpJTVMyQTJGam1WT3h6SDllb0xUdEplbFo5Ri9QQjRBZUlpVHEyTnBxQi9N?=
 =?utf-8?B?bXAzQmhQNW1IT1ZUaWNDUXdFY2gzZXZienBWSURxUkl0N0dnb1dMQW5OZ2xL?=
 =?utf-8?B?SUR5Qks4eVN3Syt3cmd1a3V6OXQ2ZGZKd3hMTDNpYmhQQnBFYjV5MTZKc0Qx?=
 =?utf-8?B?VWltTmlkY1hNUEZMa05nZHV2VVRwbXpRdXBlWWt5Q1FiZ0UvWGlMc25vZDNw?=
 =?utf-8?B?U3k3dkVEdTg5MVl1RS81Z1RIRUNvYUNGUzVQblNlUmk4TXJvT1RFUTV3cTNq?=
 =?utf-8?B?cW1RNlJOdDg3S0kzSkxaL2pybWg1NG9CQjN3bGpFRlpxNXNOK0NDTTZiOWpn?=
 =?utf-8?B?VHZZUHVOWGx3UGxoYm9rbVB6TGRvRy95SGdsZHJnTGJjelllbVRnRU5TVExx?=
 =?utf-8?B?M1FBeTgzYTN1Q1FzbFNBdHRYUXRCZVdmNkVIc3hjVWh5RHRUS2Raem8wL3lm?=
 =?utf-8?B?eHprOTg3QUZ2bGQyVEVWSmxFMFptOEhHS25TcHZ5ZzNHazJhYnA4NEd0NldR?=
 =?utf-8?B?Zml0K2dvQmFjUVJJYXFOVExRTEdPdWN1a0Z3dFpFVjdvSHd6eDlLMmZ0VFNm?=
 =?utf-8?B?TEtkQ3l2blFVMjE4VnpSbDBFeWo3WXl3Y3NNeXJQVFMzYWZzZ0o2UVJ6Wms0?=
 =?utf-8?Q?JubM=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 13:27:09.9845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b13c22-bc8c-4d8e-f5b8-08de3338d3f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7370
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg7Pn9AHY3I21VRgWcRv0v0j/B8G+dB4+MsQgeu4Lco=;
 b=C5RWZNds5KIGSn6TORnXeYkxhEm4V9GNXNVXIdQpMSacOtn5rewzlQ861DeGp0BAlC1bO3Gd39sBSN46oG5/vXbPSN+FIIiAglHExDIQvQ3/tM7JOeaaGZjzz19+URGiwUVc7B0TKGe6qJEat0c8nrgeLSDrVw/zG2+jSXeolOY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=C5RWZNds
Subject: [Buildroot] [PATCH 2/2] boot/uboot: add option to add TF-A's BL1 as
 a dependency
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

Some SoCs (like TI's AM62Lx) require the ARM Trusted firmware's (ATF)
Trusted firmware BL1 be packaged with U-Boot to properly boot. Add it as
a selectable dependency to U-Boot.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/uboot/Config.in | 12 ++++++++++++
 boot/uboot/uboot.mk  | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d40e1e95e07a950d3ec4313e712d4d01fa256088..9a7fe8f40b2532a9789b9666bf9a3e3d2fa9fece 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -242,6 +242,18 @@ config BR2_TARGET_UBOOT_NEEDS_XXD
 	  typically the case when the board configuration has
 	  CONFIG_USE_DEFAULT_ENV_FILE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_ATF_BL1
+	bool "U-Boot needs ATF BL1"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
+	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL1
+	help
+	  Some specific platforms (such as TI's AM62Lx)
+	  encapsulate the BL1 part of ATF inside U-Boot. This option
+	  makes sure ATF gets built prior to U-Boot, and that the BL1
+	  variable pointing to ATF's BL31 binary, is passed during the
+	  Buildroot build.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7bd0937df2429692bf53ba7a475f0f19787eab48..56abe1e369741fb13f403d993c5b0c50cde51871 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -185,6 +185,11 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
+else ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL1),y)
+UBOOT_DEPENDENCIES += arm-trusted-firmware
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
 define UBOOT_COPY_ATF_FIRMWARE
@@ -200,6 +205,14 @@ UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL1),y)
+UBOOT_MAKE_OPTS += BL1=$(BINARIES_DIR)/bl1.bin
+define UBOOT_COPY_BL1_FIRMWARE
+	cp $(BINARIES_DIR)/bl1.bin $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_BL1_FIRMWARE
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
 UBOOT_DEPENDENCIES += optee-os
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF),y)

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
