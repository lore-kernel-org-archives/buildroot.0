Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EAAC5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 07:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 411E261062;
	Tue,  3 Jun 2025 07:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xb2hjy7nnaxJ; Tue,  3 Jun 2025 07:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F5960F8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47F5960F8E;
	Tue,  3 Jun 2025 07:36:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1A5E15F
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C699160F8E
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WKd0e2ReCJ4 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 07:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::613;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9BFA60EC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9BFA60EC9
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::613])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9BFA60EC9
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EujYTVOCA+opnYo30xrR7RM3ioybize16F7zEwVcfNRiqjX355+OKuMVoLPOgdj/iS6vEGQTyN9Ek3HEDLMbPxKXserUSWGmwcSBb08C/xb1TRqGotbKbkNrVCDCU3mhdi0F5cIyuE4Y+Zf6rg8bFJATsvXv3X6DWWrXmBp3nIa+DmYjt+5F4qcbiwDQ2KeTtGODN3VW1AgNWIkBBTUFPL3N/NRi752ijA5e0SSr/cN7BShS7ikKLrAynBKYfyay9ZCIM0IlMA8erJFrzj0pL5NakP1JtWFTGPYHZKrMoBALhTMZQ3thcxjw9ErVll28AkclO42os8bcJxhshX5zBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi5P2D1fUiMcmlEpAcnns2/L0U6nvSlMhS+q/V6+Q8s=;
 b=CN/T19ApOS+1IORDtPj1QsYHfXWhaf2oYKmjbuSbSco5YcxPngpbHVp8fisW3OdA8QuZRV2sPK4za6sOzNZQaFM49lyKN15Bh7VCQsGbZtp9Rk4QpRu0FyCDPyT4WGS+QVlrQUQxX2vYXPqeZD04lQ7bRrAXz3UQeV7pdYooVEwY3GKTEbR/0gCrev6m1qfZ8U2HL2DtAcO4lJIwAtWsqHioex9gVJw51/CMrvpK9HfQoHWPp5SnGEvQ0TKmBW9JVvwLZK2pCheTpKJRVfwpv75sT4ZXCSwuVEKCYx9R0djgBCpDurLnCGj2H7E4PiY9UuG4Di0d1hSFJpXnNG7QRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:a03:331::27)
 by PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 07:36:23 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::97) by SJ0PR03CA0082.outlook.office365.com
 (2603:10b6:a03:331::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.33 via Frontend Transport; Tue,
 3 Jun 2025 07:36:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 07:36:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:21 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 02:36:19 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 08:36:00 +0100
Message-ID: <20250603073606.2679424-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603073606.2679424-1-neal.frager@amd.com>
References: <20250603073606.2679424-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|PH7PR12MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: f5536dd4-f96b-4e37-7d8a-08dda271568f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Og/uk36kScshWBqPaRH4UZ9nq9lQsP2R1e+/aNrBO6X01FdgM74JVXuPeuWV?=
 =?us-ascii?Q?5gRzf3l9wO4mjT6tYemskUSy1CB/EeZBfjY7L2Z8WHjIyb3qlkPxM6BFflu0?=
 =?us-ascii?Q?uc0AXyUMDAMvntAIN/0RYePEQtdOUZ3W92c8GeB/47l8YBEU9jqDILuOzsoG?=
 =?us-ascii?Q?hNL1GRWiAPE0oFX/QDkzPS2ELxV60gzpHNrxeVYZQLtZ6ONInAVJ2W0dk+np?=
 =?us-ascii?Q?foAv/ZtxkONdO7f6CMCV58U4Eiy9FU7PAPTXD0T8YSSgNtCuIEkqKFDBgu5T?=
 =?us-ascii?Q?BZbCnpTqO/gvoGo6d31vux7E33KHiEpL61w/VbOWWi/FymuuCd8gK2kkoyNr?=
 =?us-ascii?Q?5lBou7mQhXKlSSxMZ7fIVwgyEM3JcGX7+jvONiS92ckuNcKO8xzpxC1Ixu4W?=
 =?us-ascii?Q?hxsLvs+t6/dw34X5TKR/DX/qPiLO0mlNnPMyryUgXWL4faeG2ub1MsMPHyKp?=
 =?us-ascii?Q?Rt66txEDqN6KjOuR2bJ67pbJ4OA1Gcsr/ef+XnoJdlQhe3WAFTmngX5gnynF?=
 =?us-ascii?Q?y/CAsBWVcjk6KoBi1kUFsiO5uoxD47qR8lGiqD0+c5eIpOXCnypdbwEkRZdi?=
 =?us-ascii?Q?iIA4YNl1rsTSUKsUKFPjJ4mXdG3akYDgl2vVkZ1y28RV6E0sVGpgb374lwOs?=
 =?us-ascii?Q?qabFtaYE2QqvRJTKRfC4JQCDrhNdfrlpkT2J2EVDsrvQ31ABsdblzMyz2B99?=
 =?us-ascii?Q?06Om+oNiyJjBbgW2eMy9vQrlM/c61kfwa/DwlG7EGdPkc/N/XODMGa9epASh?=
 =?us-ascii?Q?7/OlPZM+SblzM61cw7RWUJGkG2EqyEQrBplD1F7Zt3WGhgApO/8nBqkmYX7K?=
 =?us-ascii?Q?pHlzqoETUQiIbH1vlvUfsZE4e1ditW1x7rrgm6tCPHxksVNAdnmnWy13CFzi?=
 =?us-ascii?Q?Psqc8YgYsiLhGJDxaHwRqiGYdBsmN5ocfHWbckKwCHziikfEf73QIogDpnPF?=
 =?us-ascii?Q?d7llvf7i2wfl0fiB9OPWveXeUmki2Ybz57rjmCYYgDy9gEK15E0tMF3AEoyu?=
 =?us-ascii?Q?p/yhyj4ohRW/j6CSAQ/rVyARjyR8OvtG718Xw3ZwqtNEjj+IAe6yqhGMEC2h?=
 =?us-ascii?Q?WeNyPuYUccOlQXTMOiiZ5ZKOCvz0HgDFw88K33JRDp4fVnHTCr0fN0SlMS6F?=
 =?us-ascii?Q?7wkm+UF1vsEoEOdrYRWBNJvzla12JcJg/2GwNaA6L56ffmb2UDdIVfy486LJ?=
 =?us-ascii?Q?OLQ1bkh205BSHDZ0Yw1zG4qRN+l2jNQ6cmF0S7QGDIu/m03rxA7FyD5/tTf3?=
 =?us-ascii?Q?IW8vnZWCq4sGPb4gVIUoC+liqp2c6q5EDFIjh90xJw9Kcq+LjqejEAGu5D3x?=
 =?us-ascii?Q?HzQTKO5MyRfEZemS4EBwxO8GXEyMkP+PN7U+MSacdB4+55lbtRu8H+AD3D0J?=
 =?us-ascii?Q?4EdrKfF9FRnyD7TjwR3KXW2KJTBZWBygtdDPqfd4U58VPzHsqe0s1QNNmWKx?=
 =?us-ascii?Q?sJvVvbDCSoQxBHbzuKPipFWlbwhlFZ9V79Zg/4orSoVc3C6p/nDY7Y8o2HWE?=
 =?us-ascii?Q?bSivoiz7EEpAA3DFL2QWB8NsVn5lz/YI5Asp+RAbVzMgjMOtixXNJDzjx2rO?=
 =?us-ascii?Q?AoTF/hJIybrkDORTynQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:36:22.2265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5536dd4-f96b-4e37-7d8a-08dda271568f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi5P2D1fUiMcmlEpAcnns2/L0U6nvSlMhS+q/V6+Q8s=;
 b=VQGHbZCZBrCDyVLsAeXGjhp6q+AxAJUR4KMOIvfgmL0ZM9LW1rvOoR2/DhDwKZfXccbeiWAKDl+h6uy3qY/MevHHfXVa/vmYPyqsWh8OnwFu+z3nQm+PxS3qy87CjHtWUN/49nqZQPYxYKmrAqpkDyf99vaxdjYJZ+mH5hwOFgs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VQGHbZCZ
Subject: [Buildroot] [PATCH v1 3/9] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2025.1
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

This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2025.1 which
includes the following updates:

- ATF v2.12
- Linux v6.12.10
- PMUFW xilinx_v2025.1
- U-Boot v2025.01

The Xilinx specific Linux 6.12 patch has been added to this defconfig:
board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch

The kria specific u-boot patch is no longer necessary, as it is
included with the xilinx-v2025.1 release tag.

The following patch has thus been removed from the defconfig:
board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch

The zynqmp specific u-boot binman patches are also included with the
xilinx-v2025.1 release tag, so these patches can also be removed.

The following patches have thus been removed from the defconfig:
board/zynqmp/patches/uboot/*

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following series has been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
---
---
 configs/zynqmp_kria_kd240_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 4ba4be861f..cdd6ee1d53 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,15 +1,15 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
@@ -20,14 +20,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.1)/xlnx_rebase_v2.12_2025.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK24_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
