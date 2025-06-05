Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40580C5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 05:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CBE040B37;
	Thu,  5 Jun 2025 05:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjgBN3EYI_vY; Thu,  5 Jun 2025 05:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D66D40B17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D66D40B17;
	Thu,  5 Jun 2025 05:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F29C022B
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D92C060782
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbamtEOg2qMg for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 05:48:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::620;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FE0A6077A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FE0A6077A
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::620])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FE0A6077A
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6aCTAvJDKZmTxLwHU0GdzWQ7IYkJx2CIOCZWJZL9U/glI79i7/m2XpYxnkyLbU3MEiYtXZmjSeNa6/FNINunoeY47NdPVa30oEADPwH+nqV93Zgkc2omSA5LftCEp8oSd8jQvdFA5AqbTGFYHhcosyGL9FmlTvdFUGaqshQn1VV04pubD1UsaZCVnicWDUP4HqfLn/yU5M+7DQkvh8TGzV30RO4BD5bryyc8iL32ZPM5Z0vgjXFn2z+mlQOt/NJGMXlFQLAf+ZjrDnPQ8tHtCMZDNUKndRrVREYmFnIQDvnNMjVAI2J1oZzX2ZwyrtXNRL2PXAZqzcks5ihYUhQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aySXsHbQzFsF+7874pXUMsrar56nVpulniepMsxJG3c=;
 b=XSj6QMl3erMhMEvXSuqx6trLncrX5lVvqHv871qA85sO3JghsqymyOWQNHDO1CL1SvkVSuAr01kztGXA+eVEMi2L65LoEomuMR/NTh3SDghNCuY4+z6knkvATahtyoCHO6rc8CBNIJo/RhJrISJQq1G3EPal9lp/xvlkQSWBYzuAmuo/g9m76sPPTSbNDEz9gIm+YQFBT3RJRXycn8dIJijnHnErzlk182eyTBBg+P0TyII1DVr4x6i6mx2UCeT+YwBdRRxSJCi68UVMWaTGENtDj23zOculuPB9mFESIsxdYHYJ8ohAAIyNwhbzXOfhfOJ+GJFuVel5B3naCHSViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR15CA0071.namprd15.prod.outlook.com (2603:10b6:408:80::48)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 05:48:39 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::78) by BN8PR15CA0071.outlook.office365.com
 (2603:10b6:408:80::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Thu,
 5 Jun 2025 05:48:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 05:48:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 00:48:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 00:48:35 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 00:48:34 -0500
To: <buildroot@buildroot.org>
Date: Thu, 5 Jun 2025 06:48:26 +0100
Message-ID: <20250605054828.4181912-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250605054828.4181912-1-neal.frager@amd.com>
References: <20250605054828.4181912-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: 7356e949-7e16-45a5-1dfc-08dda3f49e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Tt8Gy7siFxUPCCzDjPGeRavosiMH+dJ9iEy9411qJQ8pvLQW76ouaJFUldk?=
 =?us-ascii?Q?IDWUjg3UopsnGGbS2g5w1k/Lf+aYp8D4/MYBawSeyCcScaTULej67VpEBj66?=
 =?us-ascii?Q?wn9B6Q36wc3sAEdpMDqI6ZflwsWO3gsGPD2di0PeNb+zDuPTb+r716CsnbIn?=
 =?us-ascii?Q?GeqcfxBEMWlYftYsNV9Jv2eQVBfhOoEFLEnOxpQq0vzVoNXj9245f1ZRrhTR?=
 =?us-ascii?Q?BMYmv5PvmQ+iZwowI1iphRWapdKf5/aGXiaPEyInE3JX1AN3PibijrKh8H+I?=
 =?us-ascii?Q?by1lEacfPDgSRs7NBSoKam2OsYAvTiRs6kHK3lPeYzDu7a19YInwyiiW97M/?=
 =?us-ascii?Q?i4fTXiBRSNB6wnCwR6q6d48S3WdLfWB85eGKSjiafTUiRpzLX7fYlBQujDTT?=
 =?us-ascii?Q?srOQNqYNmBZVA0dSbpt+CfSkjBpTGdEV9NOGzucK+8xbqqGyVYsx+YVt81nH?=
 =?us-ascii?Q?Zijx+CkBhGWKF7iI/dTIMkoE1YIETjSuvFniCP8z9BlOOZf1Q33sGVEFDsiL?=
 =?us-ascii?Q?siNBGLZWnkej7ozPTkOgXRs19e2s8Gmmel2WJ2dNhv7QjcCGhm5zcUjaqJKZ?=
 =?us-ascii?Q?X1lhzxOUBUporacxhe2mW/c9PKPQREzBAUCGv0BPFO34TgUGq+Ko/lZNFE4m?=
 =?us-ascii?Q?G8skeu26K65JEvsYUGBqzmU87hQvJu8Mk9/wYFoqH+x3XWA1H7hqPPooVIhb?=
 =?us-ascii?Q?cpDWUtLuyKrTRKa1mPPBs0dk1nQl+RGTOzJrYavXc2UMPGtXNSLA/pQSiWP+?=
 =?us-ascii?Q?201hs+VhekF5IslhdFX0/9OtNg/thAFwiZLx0LN6NuZr4I24NhuPvxzOLB7b?=
 =?us-ascii?Q?H+fKTsbQZqRQBy0xdsmZxHg0EbNoMnuGdLe5AhuyFM1hbaIkCs98l5xcGMTH?=
 =?us-ascii?Q?X4WwBwGdCMtFJD+n4No5LSef/7DanLrMNLcLonkfXTJj2h0uDQldID/y1fx4?=
 =?us-ascii?Q?t7hmB0oEjgrgMr4J3ieoo19lZ06fFEZVz6DxI1Jj89nuo+U0M3s1JT4mw0KF?=
 =?us-ascii?Q?p8VSS/8wiZfkKKjxiFIpf+n2xb16cdhwfYRzveUgG3DnETf4TAnE74GDIpho?=
 =?us-ascii?Q?I7iiOUVPEmMVI7twhlu+tr2giQvIUefplIrm/x7tagsuL6Sq6Ff6E+90EsQ4?=
 =?us-ascii?Q?+Kb/RDcIQOXIMLbTmIuJtHknFBAnfOwalOZ1fheLeFCFNytucorHf4ciX1tm?=
 =?us-ascii?Q?xB0PryXm0hyGAtYBy6krFJ44OJsxfvU9NYjD0rGS7DvskVe0mUAC5XLXAngu?=
 =?us-ascii?Q?ZHgaLFMaybAI5mCDAygdss7yBe5h9jxgl7xz4RmV04Ts3u7kegG2y/4VV260?=
 =?us-ascii?Q?5Ve//wp5/uo3RMKucswCSHraKmP+nuJi2yNFYUeN0xb5RgTbcQrToWYpmAi/?=
 =?us-ascii?Q?Z77b+U8u9MnFMILRcR99GpHKbFAxiC4w0FoytSOUiGWKpFylF3i3231OU8QL?=
 =?us-ascii?Q?hGoI4lWQr9/AkiKuUn+WCfegpMhCPRDO5iKrkgk7lAVJCxhU4LpTU6qxWaUy?=
 =?us-ascii?Q?sWEwKpKEvlFlOiyo8+cT3PKJtxdmcA1z+fUaWlCIhQiGizYDxHXGNf6qCpuu?=
 =?us-ascii?Q?ZsBm/UFHJkzTy3ufQe4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:48:38.2400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7356e949-7e16-45a5-1dfc-08dda3f49e7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aySXsHbQzFsF+7874pXUMsrar56nVpulniepMsxJG3c=;
 b=D2WGEc/uKMUdMSmJH+QDyNSokhQW35G7y7c5b+S21RUHN5938MrMc/jQiBuztjMUyl6CEw5N2JY9W4pfTenDrb1CTS94F3Dg/rr2CwBQZ6gjzdJ1qZlcfPQYn6GVHycNFqlIzRfuonIqFIS1RZtzdXnDTFjYNNEK+cMioeETBqs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=D2WGEc/u
Subject: [Buildroot] [PATCH v1 3/5] configs/versal_vck190_defconfig: bump to
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

This patch bumps the versal_vck190_defconfig to xilinx-v2025.1 which includes
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
 configs/versal_vck190_defconfig | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 368133e916..4bcdc32fc8 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
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
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
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
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
