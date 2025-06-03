Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8DCC5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 07:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BCB2615FC;
	Tue,  3 Jun 2025 07:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hA1-NlA8ag5A; Tue,  3 Jun 2025 07:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8450D615FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8450D615FD;
	Tue,  3 Jun 2025 07:36:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 177B71F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC59615D6
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnGqYOa2wOOa for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 07:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::60a;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 286CA615D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286CA615D1
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 286CA615D1
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6JVQ/jaZBPvvTujk59PnNT0Zc6foLBxHM9TcbYSjmWMRC6or27x4J0eskV55rKbnwws5f86hKAo5mqJ3UzB4f+CrmChQ9YFHUjcIE6vmz4qBbBgq5hTI/XC26Oyjet49FcDp7sTsFZTvEJChn2U4p4pzFg/c6wvzDr/OUGZ54O9l70OxyXAs/PBgv8XaT+kKsFIHjsmi2YWjTmyQX/WcuIml8sj+3v0c0wO9hP2c5QUECavxw/EEYTLsr60UvpYt8JMePJQCdVeAvJ1wwlgS1Rm5B4CTPLLDvhrg8ImPJax/oUkfXOoRiejTI4XKoxnZpr6Fr/IDiX3tn84cfuNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rXU8b2mBSmeWXWKjvd9n7Yri+sUEv3s3AMz1mMlpKI=;
 b=P16Zqdi9liCpoDLSK5euUps6/CdpLxJ5oovc6kFIRYb1zDpWMF5drYeOH2MTSQinLZgcwXpeMaedmNRoj0nmr+SRvTJJwvBuhpRBOVf1a9VM4ZZmm8i5Qp3WxC6YLoCoG2IDgK69/eGhaQac6tM8shHliOBCZiwyqQp+4bYLuZpMJ9rkl6ZJyVPs2TIgVaUqjo+resld+6USpDaHmzCLwIHTdRwmYrws1kPuzrDNRHdSRYNxwz3X0ae6c+Ti6qAJPtXTO0OwTSEzopy2KooCCUBIPbPFbuQgknJRBr2Non0f8Rzw9+OkCq5VvRVZlxYVZ183WtcxdD55pF5yAoKY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0240.namprd13.prod.outlook.com (2603:10b6:208:2bf::35)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 07:36:34 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::8b) by BL1PR13CA0240.outlook.office365.com
 (2603:10b6:208:2bf::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Tue,
 3 Jun 2025 07:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 07:36:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:32 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 02:36:31 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 08:36:05 +0100
Message-ID: <20250603073606.2679424-8-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603073606.2679424-1-neal.frager@amd.com>
References: <20250603073606.2679424-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 4425d700-6902-4ba1-726e-08dda2715d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W8csl3j6LLKsOM7ISj5PWhRuDGzrjF7Ye0p6k79CKPkDs55yJdtcbj8uGKnD?=
 =?us-ascii?Q?sDw5BOASB65PLVD4WPslPH+VbFKNxBgc7sUiFsd2KKAADBGcHM/qLpx4QSrB?=
 =?us-ascii?Q?hcnkSfJ7OJE+PZ5nUsI040oG6uUIR5KxXKoqs1mcZTJqlcCy9xdz+BF+HX/S?=
 =?us-ascii?Q?sWPz0lZGcfncMvsWOo9NojeY1vnIihxzojmmHMFQDi+WIfSiCWxdzU8Ex0qI?=
 =?us-ascii?Q?BxQnt+iFTXWJTcq/A1PBs5PmZTl27RlykWuaSEsb0Ek7hlC3eC/aKU8g/aM/?=
 =?us-ascii?Q?LQRaLpA5wf7l0+O5532daoJidWDRXUz26kSZIfqT/sMESFY94B2C7O1J8FXD?=
 =?us-ascii?Q?P2RCllVmyElmG3tZ4onUV0i2SnrG/x5Vtg/uCnWMRglhBcfVN8v7KNC4SXMU?=
 =?us-ascii?Q?Di3jUqVAv4gcy7XgBilqppmuU5aJE3J050QpoCulWumpXcJgSaUwREzFa5Gt?=
 =?us-ascii?Q?QOjrVfrGOTYJhGMvDp0A0KrpQtgo9wW1mPXefvzn2IQdcGdduNIHHzygGVUS?=
 =?us-ascii?Q?WzPr+4ekCRXZ98i3B+LKS71W1SqeNQ76SkOA5hjjEy6+aLfmfp49e0HsGjyz?=
 =?us-ascii?Q?5DAE4C9s5eyUcIpOs/n+rhIK6aKsXlWbWcelvPe0VHYv7H1l0XzscXDFoJSl?=
 =?us-ascii?Q?96CCeWN3JZeuwGJ3EWp1LfH/2d41SHm/bOOZwt4HTR2FfwlUXJtO1a7fvkVH?=
 =?us-ascii?Q?Bqe1l4rW54InoR/aFnyis2+hhnxwi09i5MIxPbS3WNFtdvYAz4L0qqqUOgRr?=
 =?us-ascii?Q?nnfafDpFShtG1htB6nrdcQvmNlBDDPZInMq8afeEQ4EskKRhJQsvfG4oXsqQ?=
 =?us-ascii?Q?HQLYGnXlti6sElb6r1xgf7VjpSkPUY6P3rKgi2OV/pcJXqWWeLOXXjvXF0gk?=
 =?us-ascii?Q?i590Uzls12QaGyDVb3grKperT07Ljmg4c3VRLn/PHJdIi/NeBMarClYIF2N8?=
 =?us-ascii?Q?lDoalh8ZfMZk3AAwVf51etuELdPDwQ/hoMNHmsVgsVtdz6LewuR5cAQScTXO?=
 =?us-ascii?Q?h6a/NEwEcD0+CAamv+wRw1r8X6+0/KIxoRg2X2VobmFsMffayv228GIj6wEQ?=
 =?us-ascii?Q?uoZFHTq8PPbxCesy4cM2S26gQzasiA/fAjRIZ8BMzt/pvq534e2tHAk3Edyt?=
 =?us-ascii?Q?zr7O+fpWNQS00CxDYo+vXGAmKx91IEHmC1BcyLo8RpVQJTWTBqtyDXxpXyAK?=
 =?us-ascii?Q?nO2uuJgy2bdPZUJ1uSudkuY8Ywi1BpMGCPLI+CFOpIdDFGR+DKxeLdmlAura?=
 =?us-ascii?Q?2ptHgpC6me3AroppkXZp7fgjUBAzaE2sCRPTnEYBog8lw1MJv5RCWntzNbwh?=
 =?us-ascii?Q?MeNhly57sGnZi/arhdqpvB8pTPx4ENOiiQcFwwsHb9/ildJwa10ulqC81+s3?=
 =?us-ascii?Q?Znxl965zbkU8TkGA+q1wk+iZQKjFtA9CBjR3bqqXlBDdVsMl1SG3l1EvmST4?=
 =?us-ascii?Q?6ALnu8paiuRbobqAMWbLZi/44bQfsQztqPkhZR8CNLE+F1+rkx2uwtjqc21V?=
 =?us-ascii?Q?JJ3+/cJDMuyjMx7uQt0+gsuZUmleLMlTRc3gjdGdAFClJVHjEBLfVx57U2DG?=
 =?us-ascii?Q?gVyEDjQXq1Xv1u/S+ks=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:36:33.1356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4425d700-6902-4ba1-726e-08dda2715d00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rXU8b2mBSmeWXWKjvd9n7Yri+sUEv3s3AMz1mMlpKI=;
 b=l0RCuJjciBf2LZklrASbBpvYBeBRhzTYqZB6e8N5FBQhK9gV4eDag3sUqHvzP2yFuR7a8kk1hzetBNmnvKGJttm9w1PdYGUUPAVABRWOcNiaOkV/1EgcRpVhwx1qa148Db/EH4o8VONuKNmZRqep7pg7M6WGV5TcHk2Z9M8qIh8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=l0RCuJjc
Subject: [Buildroot] [PATCH v1 8/9] configs/zynqmp_zcu106_defconfig: bump to
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

This patch bumps the zynqmp_zcu106_defconfig to xilinx-v2025.1 which
includes the following updates:

- ATF v2.12
- Linux v6.12.10
- PMUFW xilinx_v2025.1
- U-Boot v2025.01

The Xilinx specific Linux 6.12 patch has been added to this defconfig:
board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch

The zynqmp specific u-boot binman patches are also included with the
xilinx-v2025.1 release tag, so these patches can also be removed.

The following patches have thus been removed from the defconfig:
board/zynqmp/patches/uboot/*

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following series has been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
---
 configs/zynqmp_zcu106_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 5e13c39a1a..5fd22b9606 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,15 +1,15 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
@@ -20,13 +20,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.1)/xlnx_rebase_v2.12_2025.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -43,6 +43,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
