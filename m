Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C257C02188
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 08:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2E51816E9;
	Fri, 17 Jan 2025 08:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ufdg5-LN0mKk; Fri, 17 Jan 2025 08:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 650B582CFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 650B582CFA;
	Fri, 17 Jan 2025 08:00:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28EA81EDA
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0583441A27
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PO7gI-u1saKG for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 08:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::603;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5ED1F41697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED1F41697
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::603])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ED1F41697
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9Pl2hZ8lBbrAZYm68NHQrrmpfu0tVyVmH6XVDHIHM7VYy8AXGoD0+7Z7XCFYFAcXJfQ+xflxtzVGkOhtHakuGPR4z6BZLW0OuS6WnhHbx69bk+yzWDxG7dY8tBXb10VoApe5F6kb9FZkgenGwboDH5h6rMfs+nSYK2Ke8mgVgQei7P5io/WtXKlWEOBOk67pdqf4ohTaXsjQVSLkg0PnP518EU9abF6VJ9PcYAal4Dgb4c7x7saL7bx170Ts5F5FB0uBdkQQXIOd0ibBbZgifqA85IpHyDpNS6VKKtlvUM1pxj+dmdUWM8Lj3tC7S/4HXPXGUVoxLMDq58tzcY0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/emNCOunG9lR2l0HcM1zGerwTjHI7Q2EPD9I2lkoAGo=;
 b=BxZqqsXMS2RYKTBXm2sDDVbafiQ5QAukcBXphi1kfXz+OxnFyWV93GDZXOljmm0V3eOBnCTcYK/3ufFkMkxBOersFdlzpFJYquR3INC1h1/a02v1HP2PLeMTgccNH+wun1sdbZunGbAiKgIP/ZaWpbEmCwlzrr0VETVN/+DeTLBUOXeCFt8G1HPs1KQh1lA6oGfhoYuXc1IO4IycEVIr60ytOlJaVS8B9+Ne61Ivh3tNuyyiv3DeG/Ls4OSJq3YkxWM63Gjpp07jV58w1C02cDHyJxm99U+LB2O1mrQm0V0OnQ2Po7Xy2SOEwwKpR/FIaidQi+H5xN1xKYzY2L1MbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0146.namprd03.prod.outlook.com (2603:10b6:303:8c::31)
 by SJ0PR12MB6688.namprd12.prod.outlook.com (2603:10b6:a03:47d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 08:00:21 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::78) by MW4PR03CA0146.outlook.office365.com
 (2603:10b6:303:8c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Fri,
 17 Jan 2025 08:00:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Fri, 17 Jan 2025 08:00:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 02:00:20 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 02:00:19 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 17 Jan 2025 02:00:18 -0600
To: <buildroot@buildroot.org>
Date: Fri, 17 Jan 2025 08:00:07 +0000
Message-ID: <20250117080009.774814-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250117080009.774814-1-neal.frager@amd.com>
References: <20250117080009.774814-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SJ0PR12MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7271c8-45c2-47ad-8759-08dd36ccfd7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vdrSdwMcJ4NISKJ7zKN+tmB6Yl0KF4bthjxRNPioXOPSdEXd81rcrs9ZOYJN?=
 =?us-ascii?Q?iWc/870tGJHtUOiBSObHnOuKsDJ0v/zOgfBzkhLh7olqFso+CKPA/3CwD4DW?=
 =?us-ascii?Q?9QmY3cd9Om0mE/9R7nyx1aWUla2cTt8KGtxorakwne4BindXBu+lpRIw7kKl?=
 =?us-ascii?Q?6S8NUlUA7TpsPVprRYlQgEjc2rXkmxLn/x6lFw93g80MFP0+72jnnG/kUNJ5?=
 =?us-ascii?Q?cmuxnfPhFdK53SnuBGOgZg9Hq0bmRqoUFKhMFSV32izgj7rfwZrXszi2F/f5?=
 =?us-ascii?Q?U8mWLjEm4qm4eAWjBTd5jW98F4lSxx+SapXD7Fds7jjv25CFoovyJ5w8RWZr?=
 =?us-ascii?Q?HQZ/nMabbWorDJBBz4Croh+wKEZnWVNP670hB/eATGNXEwvnhsrvI0XU+XsG?=
 =?us-ascii?Q?z6I8evsOan3J7fRIPX+Fvrt0h1WPw+LK7+K4z05/JlqmeVbs8tPVJ0bQ6+Nx?=
 =?us-ascii?Q?gl3JLESQlrULcnP60UgXST6jeGEipoA92OCINW8wn6+X8JFKCRJnnxF00cR4?=
 =?us-ascii?Q?0ov8DVdG+6cEoeEhL1rYjcYmUqAiRiwwEAkrC+HwggoR0t9oq2MJGm2kus1g?=
 =?us-ascii?Q?jRVXTNOtUgHGDbc54E5LyhE2XrZ2aWOUoR/0eH19u7lwLJOMh6AsxDpj6LMs?=
 =?us-ascii?Q?6X0Ix/3eN6FvEGfiphdtXHXrkdCzIvKoJ/Ob3xjMEDek/YcrLd5Cvltm/L3j?=
 =?us-ascii?Q?QXWTtq5e9UWCewbrqa1NHi0uXhu7br4AMKHlpCKNkkBclULB1DGHKgR52F85?=
 =?us-ascii?Q?fcJyRHs3FINc6UNYl3k1defS7pr+hIhh7uIAm3wekLkYeOVhIjIGKCgarBOq?=
 =?us-ascii?Q?4G2NAsJuHhg3ZwljOwkk26g1x/3AdjjjzVp+WnZ7AAsz+xYJ+R94epCQq8G3?=
 =?us-ascii?Q?U+W0VGOV7Av6MFZrxkIFbHh6fd4D1sM63WdmCxaSqo2XDVmNtaPS+RWOhRyA?=
 =?us-ascii?Q?4qKa+22NN40yIZNlXXdsqnCaujJb3IRpqj3W8KPXJLzgUbaT6yLWpdmQXTbA?=
 =?us-ascii?Q?0fHClT3T96iAcwTlewWH1Ps8G/zwcM8w5X0QnJdgbFu9tQG/cxQ7bTm6ksRA?=
 =?us-ascii?Q?4M8Gj+6j2/0EGvf+ErzuujEIEwBkqOZVkBvDpommXdb52b3Whn5T1yDSb8Ql?=
 =?us-ascii?Q?CFOiRNkSJQLAYR9aMedZel2X6qS3y5Bc1v++v3UqEaJv1Ui7q1jnL+OD9Aq0?=
 =?us-ascii?Q?L8Yec5cLluyQAp/im/Oj3To/qEhDZ3UdlX5fdibGxanuiZe5CvDMie4u4wgf?=
 =?us-ascii?Q?SLesygv3of573pNU9zpmsO6xi2zAkchJDWT7l3Z/+V9CnnN0J+YMxdzZhy0K?=
 =?us-ascii?Q?wgfI3Q1khRgwpY4MHyaaz3YvSbn75PTHkVoY/LA+ulJkOefwiqVqVHWyH5oc?=
 =?us-ascii?Q?yb7BekzE1lE2irye1vBYhcVngNASjhZKoNEALKbcXT4BdUFfMMmhlpaCq/O0?=
 =?us-ascii?Q?6y3P4mequhZW9fAvJs4ayRJ2FF2MJR/VbQqnPDEv5LQ2Y0EdGNwA2R+4+9GU?=
 =?us-ascii?Q?ssJwCOpLF1yrCOZ28pPcXt18knoUhd1TsRSs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:00:20.9006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7271c8-45c2-47ad-8759-08dd36ccfd7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6688
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/emNCOunG9lR2l0HcM1zGerwTjHI7Q2EPD9I2lkoAGo=;
 b=lEccYfYlSIGhMRvaTO9v8/7pvDIytBPdpefB6eVm9z1hto3IQMiDzO5UY4lCRy6hKK/qJZ/1dGl3dODe5wJ06ZOiuSTITKRzIrUezkjLnBRmHCv+L1ombv2S7T/jLllh/PnJEVav0usUNVej15HPoEw0KOsmjFp3f++oN5uMnUw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lEccYfYl
Subject: [Buildroot] [PATCH v5 4/6] configs/zynqmp_*: migrate to binman
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the zynqmp defconfigs to binman applying the necessary
upstream uboot patches.

With binman, u-boot can now build the correct u-boot.itb files for kria
natively.  So the post-build fixup scripts are no longer needed and can
be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
V2->V3:
 - squashed patch that removes the kria post-build fixup scripts
V3->V4:
 - no changes
V4->V5:
 - rebase Buildroot for zynqmp_kria defconfig changes
---
 board/zynqmp/kria/kd240/kd240.sh    | 16 ----------------
 board/zynqmp/kria/kr260/kr260.sh    | 16 ----------------
 board/zynqmp/kria/kv260/kv260.sh    | 16 ----------------
 configs/zynqmp_kria_kd240_defconfig |  7 ++++---
 configs/zynqmp_kria_kr260_defconfig |  7 ++++---
 configs/zynqmp_kria_kv260_defconfig |  7 ++++---
 configs/zynqmp_zcu102_defconfig     |  3 ++-
 configs/zynqmp_zcu104_defconfig     |  3 ++-
 configs/zynqmp_zcu106_defconfig     |  3 ++-
 9 files changed, 18 insertions(+), 60 deletions(-)
 delete mode 100755 board/zynqmp/kria/kd240/kd240.sh
 delete mode 100755 board/zynqmp/kria/kr260/kr260.sh
 delete mode 100755 board/zynqmp/kria/kv260/kv260.sh

diff --git a/board/zynqmp/kria/kd240/kd240.sh b/board/zynqmp/kria/kd240/kd240.sh
deleted file mode 100755
index 2203536a52..0000000000
--- a/board/zynqmp/kria/kd240/kd240.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kd240 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kd240 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kd240 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k24-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kd-g-revA.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kr260/kr260.sh b/board/zynqmp/kria/kr260/kr260.sh
deleted file mode 100755
index ac49fa5ee4..0000000000
--- a/board/zynqmp/kria/kr260/kr260.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kr260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kr260 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kr260 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
deleted file mode 100755
index dc92c51d43..0000000000
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kv260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kv260 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kv260 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 38a5aa378a..48717eaea0 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,10 +1,10 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index a5d308a4d5..cd1b6e6f7f 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,10 +1,10 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 711f43c3a6..cd5ff8b07a 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,10 +1,10 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 849f5bd811..0a4c4bd9cd 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index c52bac1462..2bf00b1b75 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 2f3edf7972..0117ce0d51 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
