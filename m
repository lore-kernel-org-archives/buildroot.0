Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DBDCD98F2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB96485BCB;
	Wed, 17 Jun 2026 05:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5vPjw7a0vQd; Wed, 17 Jun 2026 05:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA6485BF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781672770;
	bh=73DvvaLfwVLA9v5I0MfWKUls9ATYhuOm6wVt//3yBMs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AeZyHkvk9yQnDbCidlITVrqUr+5L6YwOhHn03BN85bWg7Ny6qjss0KmBYFwdddSDX
	 uAIlVrrxRJc7VhVxmiCp3fpY0mqLGdYxsRjYRPQCi310mP0myVvuOHcgK6vJ2k1u6K
	 GRevEHpZnHWmWrnTqmkcXhcCGGtwAWD385Fvdr3o+JLcnnYJsejiwQM+NQaZJqYS1e
	 u5eNvHSB/byCFxwoXsQU275lz+hi9Dn/IiAC9hjPx5kgYiJ0jUFVThR6Z7ksDNup0r
	 29CGiQCQQP6OfSMWZlyrNy6oL9wmw2BlO72Jf3vklIPXFqiopFbNT+baXnz9RMWjbm
	 vfuREfIHBsyVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA6485BF6;
	Wed, 17 Jun 2026 05:06:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B38C933C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 994EA406D6
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqNAtcMtderz for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c110::1;
 helo=bn1pr04cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91A3840317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91A3840317
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91A3840317
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4ij8JHdr/QVZOF5vsw6ouFzJSo1TBQG4TW88Hz8DQL1mJYCkTIYLFjDj1EpxZ/8JpHbi+F3zDuOALFPapc+Lf1nvSzoFpSfA/UcWfH39DueM8izTw2NFdPCMvZQX5EDu4qFM8StuVwmQCSJfd7RcWYgEPyRX4iu/5artYSwtl7Q9H9WoeeBuP6uNeqx9vJvtsVSiUuQtX5StNqKhWfVGKKiv1BBAzO35s5ugr7L5gOio+qcn7JnL5ExOviANzPgHfVpxkRyOeWukZ6wV/Kv7lzhdfayeHNxfE2q/UnttabBjxrcNI5gTk0kCobk25s3dv2+zJ8HUMSjG4KFziQGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbfd766NTeobQxdhEvzkQWd6o3Uw9CnzM3S/2GALN2c=;
 b=lKqBxjNgFoghkCgeEej+HU4O6JKi2PvNuRpeNb6uZ9Mpn5PY+Og1TpkwXuR5buxkuokOXO7HkH6Pjku9s4bY0iqM/Jmjk7pxLCroufqGxER17UbUZRLP7EAdWXqNOL4CWW7ZuMF1Jqwrzyh5z83vZLlAT5bAWSDC3TjBA6Wxn685nF1bGn3ZdjX9rd42otELvjLDZMJpS47TzPzFcLUomtnfNAo3QrVGMr2Qy9HICs7TCBaSPWZibw+yasBxyIZUjs7F+7jm1hfsJGr/E6kxh39jpKHQmORb5nfmEcn32JezGGDR5jNgU3jItVUHGoFxtKMbfFER123q+9bnP0qvjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:33b::35)
 by PH7PR12MB7378.namprd12.prod.outlook.com (2603:10b6:510:20d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:05:57 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::28) by SJ0PR05CA0030.outlook.office365.com
 (2603:10b6:a03:33b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:05:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 00:05:51 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 00:05:49 -0500
To: <buildroot@buildroot.org>
Date: Wed, 17 Jun 2026 06:05:32 +0100
Message-ID: <20260617050535.2670810-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617050535.2670810-1-neal.frager@amd.com>
References: <20260617050535.2670810-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|PH7PR12MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 11609528-c08b-4ce6-5210-08decc2e1dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|11063799006|56012099006|22082099003|18002099003|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info: 3f+mTjAsdqcHLZzYf0z5Ve8/CKyyl7jB6bbnCLWUhiIsv2Vd+2JR2noZUr3MMguJQio25YSOmdyhIjGv4OCkKsO03SOaArGjnDlI9mpLpZ7CoWb5FmgDIYlhRIby9BaY3NwvKVnd+fvZgWz/wqc7J27ib3pjLIeadDm+RY4D/jm3ZJI/MRDX+xICLR9/oRNyT3xLUWgWBBEu5wGAygK41u2M8DM8V8J+Shqmbh9Ni307pb/fbgwEK+nIySTSMb0sVA5avcuXIs/ipIhMgi8X+A4UYDyAZOS8co6nZcVKPWSMuj0mMjkBgt93BAFaZxS6VoBzJzP48BChLHYHfoSRNZPW1vuQ+NFNG5nh3oj2QYnLG1dhvDfR0lIE4svBLkvL0SDbmvOoPKwpCOgPLCAOoNv0tNeJE7GLRg8h3nacHFlwlJWGlIGSfrvxOnIQi4ba2R97QS0w/nvWGYUiw1pLaG+/7TSWMOcJAeZkIgZ0JAky/YqIRi5xWMF6oGZE+Tj16imHh7IrLfovzcQ+7DYuluvUDvqO/ANebmtGBYzWMXD+rgxAV+RufJUe2wMlXIVPv/89QvHJloIrLxqPDgB5QiKZ71R1OHkPQK4W9qBTnOfAUno3dNaXdy2zjwefzFM3FNlNQHL34YNULX8NJPSMR2EWHsI6tfDS+j9brol5jj7EYKwvMcQIX64SfKmyJs9pFsk2ElfSeakK5jBamsf3IN9O7yytoC/vw9zl/YyI0IcxTWUIDRuTSVaW9lQHNcj+4Slomne0TPPEz7LD8+tfWuHCbJpdtnlKuUVhYv4X3gs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gmgIDbbl4bGz4KN6dEmAek47lwI+uXBOtcVCZvEnvXyTSiemuKVJXFX/qYF2eJTD64piQlpn5ao6euArSUwrGaWVWYjykQLU9LcVZblz7pLf9INoxZA5rvYqCmhs31ZQrli57/KAsp/Hz0r9oFFo9cMHJR4Rkni2QOKcRpyYAUu/45gcktcxP6BVq9Ue5upNqOl1DGO45tjv+C4C8PaTNTEbZfmbm3ZkJd2RAf3gFUZoLYv4VM2saJR0l3nYFlx0Y6Rn73Zc/0XjNAH1tXGGM5LuIAXPcGEL0NsUNn6M5yXQ8owHCkm1TpiDMahrpRlzQRQ8Pv6VSmQD09Ng/n0TXYFbWuVwD8d8CNjpuf8NBkCS04KI6MnrfGOnTgvjLT+zGL2eoir1jEBG9KkyUBzMzYf4tA3TXBiu07wUa5St2CTYzFhvVrJpipO2epgMfExp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:05:57.2167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11609528-c08b-4ce6-5210-08decc2e1dc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7378
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbfd766NTeobQxdhEvzkQWd6o3Uw9CnzM3S/2GALN2c=;
 b=Khp1HxeBcsfm/wWg5qT41Sz19mhch+jmJTOM0QnDEJ39Wsg7W+Ra9miDyd83KheZanWph2TM0cT1OisPZJLZFCLULo2aNwN+CRF4Wa6dTrWPDZFIA8Vh7Vd3mxmHLIPMczNSPEGt+Rng2LQDbYgztYgGZM5cxpJAQj0WLGexIco=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Khp1HxeB
Subject: [Buildroot] [PATCH v1 07/10] configs/versal2_*: bump to
 xilinx_v2026.1
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump versal2_vek385_defconfig to xilinx_v2026.1.

xilinx_v2026.1 includes the following software versions:
arm-trusted-firmware v2.14
linux v6.18.10
optee-os v4.9
plm xilinx_v2026.1
psmfw xilinx_v2026.1
uboot v2026.01
with all Xilinx downstream commits included with xilinx_v2026.1.

xilinx_v2026.1 was run tested on a vek385 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal2_vek385_defconfig | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 3096cd9b7a..0b1834fa4a 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -6,14 +6,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf riscv32-buildroot-elf"
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_XILINX_FPGAUTIL=y
@@ -22,20 +22,20 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.2)/xlnx_rebase_v2.12_2025.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx-rebase-v2.14_2026.1)/xlnx-rebase-v2.14_2026.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
-BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,optee_os,xlnx_rebase_v4.5.0_2025.2)/xlnx_rebase_v4.5.0_2025.2.tar.gz"
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,optee_os,xlnx-rebase-v4.9.0_2026.1)/xlnx-rebase-v4.9.0_2026.1.tar.gz"
 BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
 BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="versal2"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx-rebase-v2026.01_2026.1)/xlnx-rebase-v2026.01_2026.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="amd_versal2_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -46,9 +46,11 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal2-vek385-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.1"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
