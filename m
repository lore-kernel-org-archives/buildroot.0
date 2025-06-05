Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B55C5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 05:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCD9607B3;
	Thu,  5 Jun 2025 05:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vhIoU_RbDkg; Thu,  5 Jun 2025 05:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E80607B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E80607B9;
	Thu,  5 Jun 2025 05:48:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06DA31A4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB90E607C5
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tATgfVOllLgQ for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 05:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::60d;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12C0E607B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C0E607B9
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::60d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12C0E607B9
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpveInm0acGGqjfVkuA1Xe7+P8AkJiT7VLZeWsCaPjenaZ3tJ+L36SVegBWfOdF8t42N5cX2C6LB5F2swEjbB3aH5BdeyzroCth7qETTqEPStLO0B7ytV+Io/2OQPfiKCY7QIoEVtXIC9bzkmlF+bNjTd+txENrNJ3AkKIYd0zKIkbqfWN43VK3za1PWTeWYTXD6VemMMmjRDlLDE0lolPMJiZnWXRa9Uf42wGvEjXAAulhbMkS5iqMCkxoEVQKbHucIDj4J9G+GFi1gJ7HncjWpPs1hetxMvmwXVkmorVc/D+r/6PNiohP+RwUFMHs4okxw4WVZjG372pX7nl4D4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UyyCetdAVMoxtrmncwI3QokQT1gDR5LcL94MoO7yKs=;
 b=n64MxG0Ro80MLOP//uSkEkqahdQXPY7xof4BJTN4k2S+OZ3Xi8IIwpGu2H2utTK8gdjWwe+lsXZN9SM74oIKmeAPEf935yQ2yLxr/uekmJSHzQvlRTVc/r/t7GRNnEJz6L/Sk7OyTEqM2XHPUk6BbopBHweD6nXcKf8wqGhSbsZ688Regf1nCIpgr9SkwTCZeOwKQjjehjNJGwB0lqAlOnXKx6An5ewCgKigP1Unxl79slzm9Lj9t4+k6wbbd6FUOCwhSjeFilW55DbIS6+gcMwmKHnKyVumtA4JZRXE571Ef04c6L6xbjNzW6YUXXqirY4ONejsSNri/h2XROsD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR08CA0027.namprd08.prod.outlook.com (2603:10b6:610:5a::37)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 05:48:40 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::e) by CH2PR08CA0027.outlook.office365.com
 (2603:10b6:610:5a::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 5 Jun 2025 05:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 05:48:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 00:48:38 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 00:48:36 -0500
To: <buildroot@buildroot.org>
Date: Thu, 5 Jun 2025 06:48:27 +0100
Message-ID: <20250605054828.4181912-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250605054828.4181912-1-neal.frager@amd.com>
References: <20250605054828.4181912-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0448d0-026a-4873-7017-08dda3f49ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4LPgwOmNRzdJaRnZd+iZ0YhmLVvdNT3Za+oIczQD/h68PLX9o1xctciZxWWj?=
 =?us-ascii?Q?jN/I4RwEf50n0hYSb4WNlMkzbIED+5Aofsp8NdSQ7hKuIe5yMV3exnpI1A9K?=
 =?us-ascii?Q?F1X8i6iSovY8p3ihnbPBNDJJJcCrJBnDqccpcHgryoF2t8jropcMb1aMkSUT?=
 =?us-ascii?Q?5eG+ZmePUqKnnn0Yyybi39mJ+gfr+Q1+ag8WiFTmjLmMe9qDbkrjidHw4gTw?=
 =?us-ascii?Q?sn5xF03ThH1l/J5kyYZ2ucmnAbvToGO0H4B1VlBHgTwck4lJaj/dvJTt8twZ?=
 =?us-ascii?Q?jBhbBo5DU7ZeoA+ZT+oLZGG5Xm5MvYgjJkiWU9CTG7IbfeBBtZagR7k7z+Yd?=
 =?us-ascii?Q?CyKqOi2Asigy/k0PVDGS183LqUX6CN3Kmflxs8qfjO88SUzcn3S1Ixhg9deg?=
 =?us-ascii?Q?M3GHaguez/aJlTEkNgnNQ/QqIcvdVf3XxzUniTlEGiyp+oF2hHWPivCY7b79?=
 =?us-ascii?Q?I28nWQDjaSYa/mx8O7xZasyQ6KnMoPUIlZvgzWcBSt9SXv5U6noMNUNw9ElW?=
 =?us-ascii?Q?88eWGMRnmOzcEXHhKnFC8TLidl/K9Zxpo1t47jgny9J+o8urbBXT2KoI+dix?=
 =?us-ascii?Q?bRd+G1gIpmGmki11dlYRnrFjJLCcCV+vDLUlnLQlrJunDnDRbXt20y2eY5dv?=
 =?us-ascii?Q?3JukQqnAVM7E/J/YV9mNGV9jT0HN4wzTHeYpDq9bmymtteTyf4NqFpR+S/GD?=
 =?us-ascii?Q?nA6VbRG1cUtMnHPYStBPHK8N7l/duHoO2b1pofqSkj8Pj2MZCuksHTl32smj?=
 =?us-ascii?Q?zxEmc40dYCnLGomCbkKQ3ahsznozc/MHZJssOFauSGfPfSUz54c572gNOaTL?=
 =?us-ascii?Q?l70VZagruJleQ4H1Lem1oO9WbMZMinub7qytcTQo7ggWcpr+2TjgKmQDVTw0?=
 =?us-ascii?Q?MAe/igeFXTib9ZhAwubFjwUre23y7VpIGQ6PnloSCB0Bxv4crHcE4b9XC3OW?=
 =?us-ascii?Q?WRsiyg4P9RrS9dsPn2nKi7vb2kLjkeWg5/lNQukMHw5m9KQg2DPqpjlMAxSF?=
 =?us-ascii?Q?Kod02+35KwckiioO1ya2wIDRvEGYrg8mT1VULRd58O4Y8UzMBJqda84o1Kvw?=
 =?us-ascii?Q?MNgqjf29ivZzExY+BAGv5UqcFDBBg/TvTFK9OfQk1AuYpcAiEPxHOwUYzNnp?=
 =?us-ascii?Q?5xdYXdvMK176HAI9Fp66776Qzgcw29uacHr/XabNhi0EgK+W+B+2dZ8x4HoW?=
 =?us-ascii?Q?vKyDMUkF3uJcJfvbhpEsQE/mj5+8AM5Fj+Xt5xGLKbNXA5GXNznX5PzV7J7W?=
 =?us-ascii?Q?akGIIkp1ME9VkWnHBIJoThFH0WvWIC9cRlxO1/xqPRbGxlxgrWijR1izYJ1T?=
 =?us-ascii?Q?CVQtMPDzRaAVE63j3wesTJoWxbhN808LNgjhDwUxP5K9FfYgIxZLmRHXNCK8?=
 =?us-ascii?Q?88Yaj/fO9kq2V8GgNc2YA1sh3gTpsiB58emxYOWzHudVAz9xx75hRjqYX6Ax?=
 =?us-ascii?Q?ACYBKhUAJ8xOC03vGdl3HIdn+hXe2cVzYGCJy+JQRO+OIA5ynD61OXp1CfKs?=
 =?us-ascii?Q?8slH2zlVSBYfmouXlWs1L0QoWqkJkUKnx3vvg6lwECuDP38f/4I0Fy2v5ScS?=
 =?us-ascii?Q?3MVRML0RzJlmy2lVR6w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:48:39.0167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0448d0-026a-4873-7017-08dda3f49ef9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UyyCetdAVMoxtrmncwI3QokQT1gDR5LcL94MoO7yKs=;
 b=MZOxNoWI+fJMDURJ2iQyJNICCvR4T/oMEdh+Z0KhiVBxqM18Zg1W7oWjY4xOFv61Q7oivds9BZLkHmmYkYHfdhkoeUtfCP0Ud4IniE5sIaveLGAYVgcB+B9zTzz/t3ww4nonGs9EnxBjlU1Ni/ZxUnSBaigDRYh24IfDm9yduzI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MZOxNoWI
Subject: [Buildroot] [PATCH v1 4/5] configs/versal_vpk180_defconfig: bump to
 xilinx-v2025.1
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the versal_vpk180_defconfig to xilinx-v2025.1 which includes
the following updates:

- ATF v2.12
- Linux v6.12.10
- PLM xilinx_v2025.1
- PSMFW xilinx_v2025.1
- U-Boot v2025.01

The Xilinx specific Linux 6.12 patch has been added to this defconfig:
board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following two series have been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
https://patchwork.ozlabs.org/project/buildroot/list/?series=459345
---
 configs/versal_vpk180_defconfig | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 7729c655c3..d9e246fe27 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -1,16 +1,16 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.1)/xlnx_rebase_v2.12_2025.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -38,9 +38,11 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
