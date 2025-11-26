Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9D9D1118E
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 20:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D152411EE;
	Wed, 26 Nov 2025 20:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmG_MC7nxUic; Wed, 26 Nov 2025 20:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC0CD41210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC0CD41210;
	Wed, 26 Nov 2025 20:23:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C1835E
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F057440695
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOHT2QpZgLJT for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 20:23:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B24F40659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B24F40659
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B24F40659
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucII7gbBKvOFA2tiWw7/n/1FM1BW1a+sxGAOGX2QCEGlAWB2m9oQaMeX4BgFX5O8aBImsBmCB5i0STh0dP/4AAPSxMyxgggtaYtillwcsOYf9gXO82PHN9wz9SU5CZ6ACzrCSdpA2e9pxDZNaXWfYmtcUpRTpHxVSm1NtBIuf+7PxS314emX6yKYWm5fsBTuomfN+QPLk6BC6E6EYQQp4XSbSqSQuWp/ZxnQz5mSwSf4TwLvXTL9N2DvVPd8qmCNamiV54aShCSzC9+TXqMVV5PmFqXNnDYbm87g8G9GcZz7m0JcSMnvlIE70JGyLAXHEC6JpRuwtFscp21fJYO5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTdGM7JSd/18ad1GAsnEOMhipnnY012ncF0CWW8BOYI=;
 b=AbajaiP0r45SMaWZT95oGujQybuCGasO6WkJGLgith1RfnYb0qHvFJbtwH9jRnjs37tW+Crs0bVbO4aWDpav8xWYdRppOxhbwIeLZrdj3mM80+wGRt4Q6zRCtWWn1ziSpOo1TQe3KMbyXVVxqLG4jULp0ouKj3saj2en0cKdE8/sZ/1lpBnVtxVdWFYcXfz59YwlcJHGcrmILVnLhCpVTeC9bUnIIwDHvvOOF4Zxn3ECpcWgKr5BX7HrNjN9z6cKL7VWP8Tz8AbcXzUR1DUqgXFHf2/KpTkNQYX0uhFls0NAZZzubFtIAlE10GfCGTMtyNIAF/j0purCtVapoMUwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0140.namprd03.prod.outlook.com (2603:10b6:a03:33c::25)
 by PH8PR12MB7352.namprd12.prod.outlook.com (2603:10b6:510:214::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 20:23:21 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::2b) by SJ0PR03CA0140.outlook.office365.com
 (2603:10b6:a03:33c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Wed,
 26 Nov 2025 20:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 20:23:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 14:23:20 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 26 Nov 2025 12:23:18 -0800
To: <buildroot@buildroot.org>
Date: Wed, 26 Nov 2025 20:23:06 +0000
Message-ID: <20251126202307.1269790-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126202307.1269790-1-neal.frager@amd.com>
References: <20251126202307.1269790-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|PH8PR12MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 0229c6cb-4ec9-4079-9df0-08de2d29a4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8GxrVIRvAjdTPUMn9MJaTwVF3p0mC8CPiGCrq3Tr5xmmRhp6k73LEBv3Se9W?=
 =?us-ascii?Q?b22qoaT+qTFgJsrJxPUoeAThhQm0iv0iS6SUoEo/1yfbqL4KhlSBqiRAOQqe?=
 =?us-ascii?Q?b9IXVv8AgvXFdPfB+oYbQKkMyuA0xgf9I5cGqFz5axpurTdx21B3PSLt0krq?=
 =?us-ascii?Q?xLp6sLFbjI2wtCDzbx0n6kkIJfZrLiAZS15h4XngUUkS4ChvGoO2ErT8nMTC?=
 =?us-ascii?Q?iFU2UcyKmBzwbUN3/2m/GyVIS7Tm179bsYRb9MCGGQKicj+boZrFrYLH/njU?=
 =?us-ascii?Q?DnB7EXeqKIjIowgNbDYjubHtMoPQUkWiU4kprKYfwQSgJwgBLxVaKUe2JIj0?=
 =?us-ascii?Q?VLBD3xmh/zl4Q1Cgz8rZiqTwr+JLKwTDPAAxF0a4/KcUSe/P8sNObJ3S37gR?=
 =?us-ascii?Q?0Kq4BewmqgL/dBvMbhQAGfiQFqWqGDKhXZo0jQbUCYMFv8jSI+RsgqZONJ5e?=
 =?us-ascii?Q?zc/7Wu/6eFOhfuDlxrgDRzWHgzgo2hT/m7pMnnEt8AkjgN/Ww6AUrH5HN6xD?=
 =?us-ascii?Q?aipN5tMhX2XIgiYgKg9fdSgXanvcVB/C20P+r1KavwJLgW9cD9np+JTRAZvu?=
 =?us-ascii?Q?/STlslk+W8BnmW2N7nGJUwWO4JZVdEiXOjOVR+IA+xy8VHyF56g//RJBK6YM?=
 =?us-ascii?Q?iZKTe+ukCOoRNznjR+3LspJmRrVt4L2FdM3si/NHdwGosg+kDoed0zpKKlQN?=
 =?us-ascii?Q?JnWwBxmjwGynqjOyfYNdnfYcLp7KpHl2Z9oYq2IYY4X3y+V8/OcLerebp1rF?=
 =?us-ascii?Q?TaoWbKXVl8ja1isqM5opsOY9Y5qgk2HDOwoP9qPUo+5iDxhLbyUZx11CAUly?=
 =?us-ascii?Q?vuh0D01aX/x8TugI0sB8fmUSxdUKSLfHpHgD7xs/fV7FEQO7c0q85tuQ+A0+?=
 =?us-ascii?Q?+PN9UfE9rtH/OhaHxdc9uBDuA0Tc+oxxic11svNkTR8X8Y6v2LRFNUjJmfh/?=
 =?us-ascii?Q?qbn0B1NTg7oKKyXuaWntXwoMXpjrBEBhNQZ+ZrCibsQUkQ81rsUo1G7bX0rA?=
 =?us-ascii?Q?KFmHn1+Zd484i/QTbYwawfYDPWSSWxgX94B1rwASXVxxmxHL+2X8acHxqpdN?=
 =?us-ascii?Q?2LRxQZ6lIOamejpXKPuOQ9Hc0Zgg7iYBA8Z/AIPydSpF4xM5VTzOYat7C91F?=
 =?us-ascii?Q?ETacfH3+adhVghoT4Exti7rOr3aF/zEs/qM7g6JLRBcYPOFebsLlOmRTdBwb?=
 =?us-ascii?Q?iSkBJNPHGqWnSr8RjYRnN1NgLTfS7LmkwyayarrsDU6+IUgj/xiLhXaGzKyO?=
 =?us-ascii?Q?Q46McYDgVHK3eJeK0BAWsFj7N8mTyCFL8ogVEbPwkx/SFqWRAXeufcIHCzOH?=
 =?us-ascii?Q?LLlSMb2fnJlYCFY0H8FNvPilkmOJc5bS8ynmha3lBlYsDE4Wkvyb99IgaoCK?=
 =?us-ascii?Q?CvpOv/Bu30/4mU5vML560W3JSySS5JFeUYZsJa4x7OdoTtnxKh7TsEYAq8f+?=
 =?us-ascii?Q?CUrj4VSs7Bz7rge121V0Aav1SgsdJmLxGpNgd8pTsTQ2uR3FO7O0lu7HuvaH?=
 =?us-ascii?Q?9SweKw9HYAVTHykvSzZpHTHT4WoCRJLrBafOHOWQkuekxy2moKy6w6QWyM9K?=
 =?us-ascii?Q?Kjnj/cq08Y2m4Zmvbf5DKnPNd6gxFvZwtrxuxlyy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:23:21.2063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0229c6cb-4ec9-4079-9df0-08de2d29a4b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7352
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTdGM7JSd/18ad1GAsnEOMhipnnY012ncF0CWW8BOYI=;
 b=skCF62Kv+hoXqxwugmU0LukwvtEVmez16GN1NT6EhlAK2yYGP8oSM+T+iu1YrsmvafDmhdVfgp5jD+T4LTbCXcIJIfog+taQPiTSPl39W5gjVZ5uDHUq2nqzR4i8m0ZTi4zv/hoKN4hF0ZC1l61lbLcLA+D0R/L5JDtTxhsGuK0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=skCF62Kv
Subject: [Buildroot] [PATCH v1 2/3] boot/xilinx-embeddedsw: bump default to
 xilinx_v2025.2
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

Now that all Xilinx board configs have been bumped to xilinx_v2025.2, bump the
default version of xilinx-embeddedsw to xilinx_v2025.2.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
To be applied to next branch
---
 boot/xilinx-embeddedsw/Config.in                             | 2 +-
 boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash | 5 -----
 configs/versal_vck190_defconfig                              | 1 -
 configs/versal_vek280_defconfig                              | 1 -
 configs/versal_vpk180_defconfig                              | 1 -
 configs/zynqmp_kria_kd240_defconfig                          | 1 -
 configs/zynqmp_kria_kr260_defconfig                          | 1 -
 configs/zynqmp_kria_kv260_defconfig                          | 1 -
 configs/zynqmp_zcu102_defconfig                              | 1 -
 configs/zynqmp_zcu104_defconfig                              | 1 -
 configs/zynqmp_zcu106_defconfig                              | 1 -
 11 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 3826f2e18e..526c7adf07 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -21,7 +21,7 @@ if BR2_TARGET_XILINX_EMBEDDEDSW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 	string "xilinx-embeddedsw version"
-	default "xilinx_v2025.1"
+	default "xilinx_v2025.2"
 	help
 	  Release version of Xilinx/embeddedsw.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
deleted file mode 100644
index 0a42bab314..0000000000
--- a/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  867b7c7652f754d1a3d6edfe76e53223670e2b4c7e4144d4db1604403d68f616  xilinx-embeddedsw-xilinx_v2025.1.tar.gz
-
-# Locally calculated
-sha256  fbee87edd32cf203fdd7925f0bab15c98e2dc1e0d61e70867f1190dc4a605b12  license.txt
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index ee7377ba96..f0b9f1298c 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index fc0918da75..474fd1e8cb 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 461b97f3e9..2e4a6db51d 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index dd23e0b8be..95cb7ea50a 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK24_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index ab7c9548e7..00862b07b8 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 3a3c8a62c5..bd7c43e2fa 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 5485b3d568..8e9cc3be36 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 9365166191..d425ee13c7 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 7310e9a740..c8652d5502 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
