Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9869CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9548481180;
	Mon,  1 Sep 2025 08:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WX_GJASKL-48; Mon,  1 Sep 2025 08:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B08F580FA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B08F580FA2;
	Mon,  1 Sep 2025 08:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8926F10E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 863BB40455
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKjPswpB4yXy for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::62d;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB4D14020F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB4D14020F
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB4D14020F
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vovwJDOdwMN86zyZx9uQGkUFk7mi0GYKZhnwcbs+j10zoGRYitjJQVRGjOXAPq49PMMbm5ZekDLtUu1rCLUGwh7r2yw4Mu8kkIjZPqt17pEo/yeV2e7GmrlJwYbB6PnJ/Cfr5v3nl5Pu+KGR7Ykf0Sm1lIWNiYroRIHWgAJdHIOqM5MB0NdI8TR9RKrTcG3yeSqw3mKu8wbWiF80cQt7hrebjfMv46RSfznQJJ37g22+7r7k92c1LdUw+dtNO+8QHo2uu/jZsHNEGJpXrjiAS8Tw+FlVhlLg22GWOfJXZEd5PYBiuEJ/YL+sXvZ4gKuHN5CRmTo86r5uQjgolHA60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9TkMilxmaW7uH9726KLHv4O5Ekpt/UGOdgZcVzYspk=;
 b=mlmSPWSx8hBu/n+jZ5Fmj1wYODU3594WfrfGQYduDU585CrENoNlxq7XTdHuEZYO6rJH1HddgI/kP7U9tjdd4+bMokFtjwSIE/UZ29FaFRmmaNTu+/nYUdUzjNfIEOxnqH99y3e88iCmHcCg5zBRP/5wMwblOWtHb8WKlqqkd3eA7eJJGvMUUBhfLSHfuuhJ8kWKAymR13cdIBINFI9SiVgZzrRVr44dxFjRw1SG0d+heP+JAKKzdE8P6qYdQKh5MswKrGmk15E2id4AjS8a1ZtVr95k9wB/lNYWHD58IIDU1u4UZzwl9MsTsTLTLMWyl4efdNmoc3TdE0NlkSKASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR15CA0153.namprd15.prod.outlook.com (2603:10b6:930:67::23)
 by DS7PR12MB6263.namprd12.prod.outlook.com (2603:10b6:8:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 08:03:10 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:67:cafe::f8) by CY5PR15CA0153.outlook.office365.com
 (2603:10b6:930:67::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 08:03:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 08:03:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:03:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:03:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:03:01 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:02:47 +0100
Message-ID: <20250901080249.454090-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901080249.454090-1-neal.frager@amd.com>
References: <20250901080249.454090-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DS7PR12MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: d107eb4c-de2d-4121-ff81-08dde92dfdb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ap03M1C9cy4L0JGjlugF489YWxCIuuPjFvRtuO0NUq/1bg/5GNIoQBTwzc0J?=
 =?us-ascii?Q?WjoAdhhDXN/svLoc/b2TFXWdxdkwqs2RTu9s1Ny6u5ixJ2/rr0iPFqfQR3Ho?=
 =?us-ascii?Q?ZHdXqWWsjIdEHrnIYD1RAN94yL8KCAJdWWLg01RQjqffEDAaxtm3SNpRC8Rd?=
 =?us-ascii?Q?QeS5xw+oPOaVWFx/6j0q/3D0h2Bln9VnD/PDlQXBkHMhp6JkOhWC5kkQkeK9?=
 =?us-ascii?Q?G8jE2EdKI2wlkprM4oTZaJm7ABIHmZNe1Gf6aKreov8VGxO/h1mEhMraQK71?=
 =?us-ascii?Q?H4BYopT2iSxsNMwllBcCCPD9qTYwgAFyOBRI4Skb81aKkoTT6D8gVoFxgH7E?=
 =?us-ascii?Q?SyKzbAx84+auD+Cq9//OYZOW0tM6uuopQNfO/taEHy+zk4nMUR8QdF5gpDbG?=
 =?us-ascii?Q?m3HI/3zDK0CT27zKcoiZXMPeuqORh0KoBs0KQ1kLbIvWOwJIF3YIUBzRDASF?=
 =?us-ascii?Q?bLDf103Jct4Q2r+QLaaldtj+urzRswYZDKWpNUbITostQ9CovsS36aGVngo3?=
 =?us-ascii?Q?zU917BB0svW4Xe+gFhkQ76lgH5TjcMM7oeOo8cAg1n6pK8SpsguG/BVWXVd1?=
 =?us-ascii?Q?JQKngVerGrQzeZudr2L0r4rIXGCEaspuhlhm5q1jH589WJ8v52wnhktV6nXy?=
 =?us-ascii?Q?AObEq5E3pRL/oBOv8vW1CLu5y9T9HEFRrdvnp8+U2i6eCthijo2ZPvoUjCr8?=
 =?us-ascii?Q?vWoAR7+JfSddidQ24BNg/gJShdAelPd1cQdLv/dgVIGWLuhab6sETsViwXi2?=
 =?us-ascii?Q?PktgytiedtC1J/TLxT4nYi7pxW23M6YS0hSdrX4BRoG+RWqTtXASjLvYue12?=
 =?us-ascii?Q?pm+fROtqws8BNlmZ5UyuWE5FOQPKS/kUWXKqJM9QcxP/EaaS0TO2YkxLYnWf?=
 =?us-ascii?Q?JZT9InXPO4QeeYk2+cgDToW/RWZcDlg1ywOhCN9vG/JEw3O/RjCW3RwlsaLg?=
 =?us-ascii?Q?baBpb8ythf99EbppToJM4r5zMc6bPB/1DNOipsPmTIx8Y77zoMnrom85PYl+?=
 =?us-ascii?Q?Tx9M+zbzesJ0sDWifLZ2+kMLzB8rnFC8qrUqSPewxbV+kZ7Li3C4Q7FR0m8b?=
 =?us-ascii?Q?zhund3GJa2QuTXqWAWLEfq83LZg5p76Ij8df5NpCtXYQu1aAPYHHcbQ+0IaI?=
 =?us-ascii?Q?jSs/bsqCx1lMC0ItddntOBFdVaEo2psHUzmtC38QjkmljJkEkCRMjgsoIPrG?=
 =?us-ascii?Q?YS/2E/BgHD6fRG8vCnRC/7/jbbcAPMAN9EQJfsVZOLzpQEoxNVkZnsNFRWc7?=
 =?us-ascii?Q?wVwvQiIqBuKdpsedR/dqaUT6k2qMI9acP3WttVq/170qzrz6EAyPvD14Dz6a?=
 =?us-ascii?Q?8hHHMxItykTyVE5C+Oz1gHSEfgDA7R599rjxN1wDlLrZqkkfGtodP+UjGqpY?=
 =?us-ascii?Q?9BZpM1EtYyhHKuUm1kZu/EYiGvgW8S5dvwCuOMvNO7UYWx7thG5kznBa+80P?=
 =?us-ascii?Q?0139/r7egxPLw9W5UUa6UOr7oRd0qkGGQfxt7kM/vEXVWsO1uPaXWX4VMyMe?=
 =?us-ascii?Q?WVTFU5QnuXlmK+XGZdHxC9BYMhK92RF4/ZO0K8BS8KeXFkedPTlWav4Om/U9?=
 =?us-ascii?Q?iiBEWYR9OSjavpBsjZE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:03:09.4691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d107eb4c-de2d-4121-ff81-08dde92dfdb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6263
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9TkMilxmaW7uH9726KLHv4O5Ekpt/UGOdgZcVzYspk=;
 b=b/OCkWUKbffB8KRiTTXttnOYM4y4dOJHoV/lSt6XQlfqcR6AnhitleBTV9raiTK7TR8hJt5J94YPmFxSFJkpoXFVuOX1BeOEwu/jEPLvkpoJZBqpDC+bG2Qw0ze5N5qU9XuEYASOpEgv3WPoPxrHgRiqABKgxvc5LA3XcajAN/c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=b/OCkWUK
Subject: [Buildroot] [PATCH v7 3/5] boot/xilinx-prebuilt: only allow
 binaries for device family
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an architecture cpu dependency to each family to make sure that users can
only install prebuilt firmware which is applicable to their target device
family.

The versal family is based on BR2_cortex_a72.

The kria and zynqmp families are based on BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V6:
- new patch added to series
V6->V7:
- aarch64 dependency removed in first patch of series
- improved commit message
---
 boot/xilinx-prebuilt/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index a37bdba540..5ebfb83c25 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -25,16 +25,20 @@ config BR2_TARGET_XILINX_PREBUILT_VERSION
 choice
 	bool "family variant"
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_PACKAGE_VERSAL_FIRMWARE  # legacy
+	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_cortex_a72
 	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 	bool "zynqmp"
+	depends on BR2_cortex_a53
 
 config BR2_TARGET_XILINX_PREBUILT_KRIA
 	bool "kria"
+	depends on BR2_cortex_a53
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL
 	bool "versal"
+	depends on BR2_cortex_a72
 
 endchoice
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
