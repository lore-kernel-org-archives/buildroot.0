Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8674C5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 07:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B642A40A19;
	Tue,  3 Jun 2025 07:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ln-IYo2kTPf; Tue,  3 Jun 2025 07:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C060740CBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C060740CBE;
	Tue,  3 Jun 2025 07:36:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCBBB15F
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEBDD41196
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFM4VsEwTfDP for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 07:36:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::61c;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 090EA4115D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 090EA4115D
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::61c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 090EA4115D
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxraZL3+JxEp3N9q3Od+7PSoQNgWU/02N/livu06iCM1rwbVFn0RlaaqaxMlM8+aUiXP15DOE7qWWhDaZI9mdpeRg1H/9TMsIeNjnl89RSt0+Pjml5i7ekUktOw0F7QAgQrxlylDfC9823f5KRLOau4u20YxCpS20r6lgFjwug2K99T4wclQEIR1dU3x04CFvpDvUeF+REluI82I//G76q7HfzgpyxEiXBLOmtbX+aXqHcEY7WU/VaedJ5Ve3FIpsjfnftdLR+Lcl6MHmVkTlmvrqDBCZo4NuxdsDKsLmv8aj1LEdi7cv/1knXJYztzGIJMvoOk8WwniN+/Ph3chWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tcpGGjBxMGYAO9OMbmEGtlGRswKTj+YxQ5btqvIqJo=;
 b=wkMgP22YkC8iE3Q6J0nxuhyk+fqIx2QCZqGt9x/OfamfgEoE0VPxY79oBV+HnivTgT6dZIsMeSUDn3eGo4gDl15BJK95xC14Yg7Kd38dztzLt9wIgVc1hiOaYi0EmchDqFsYlg3LKg1SeYgCfinD+kkKxJ47rAEZX0y7vX94kPQLchkMMIyWL9O3NyZob6HsgvMJSlL4BqF0IJ6Lb/P+v7gdMqpv41G05UueV1vtkBRCJMBpha43VsDGacjRZt8lYB/hB5ezaCI5/s24nqGYWoZmrsXIza3qlF3xrxhbf86LC7bIcbJU34ospB5QxqD1SshljwReeCP9sB5vNQsT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0234.namprd03.prod.outlook.com (2603:10b6:408:f8::29)
 by CH3PR12MB8995.namprd12.prod.outlook.com (2603:10b6:610:17e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 3 Jun
 2025 07:36:31 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::b0) by BN9PR03CA0234.outlook.office365.com
 (2603:10b6:408:f8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 3 Jun 2025 07:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 07:36:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:30 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 02:36:29 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 08:36:04 +0100
Message-ID: <20250603073606.2679424-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603073606.2679424-1-neal.frager@amd.com>
References: <20250603073606.2679424-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|CH3PR12MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f573fa2-fc40-44db-fba7-08dda2715bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P24kZnky8SLmLel3dMNoU+aO5ky90POwcuqVua3f8qMGOlrhf3Y6OK1cWU/3?=
 =?us-ascii?Q?mwXUu09YMstqcCrHQg2VoNOgA1euCRaXHEufM8kpDW65Uxg5WaFZ+Y/BQfZx?=
 =?us-ascii?Q?PG2iYrJ5UzchoDfNbBLheF/szku28agt3PMx50xUV6L4lQ1Z2Q9GxKSGyiLx?=
 =?us-ascii?Q?c9+WZ6pwfHtbQU+5DKDjM/VlctSz5wegEpDeqVVaneYt0DdEXJJslDElL2tC?=
 =?us-ascii?Q?NRFjOKOyWksDLr5AR+XvYsa2f/80OZwi1gn20Xd9uR+KBlPFlE7EjeqYqVsp?=
 =?us-ascii?Q?trEbc7CRak6Tk9H/9xnAGUxihTkmmy2EyP+LywgVtidIQR3qhQaAvhfe58SB?=
 =?us-ascii?Q?c1RV5/VZgX90qHOCG6BKGGmN/YHUg48t24aPy0qbHAgCLU9tiJS0IVMxBBMd?=
 =?us-ascii?Q?4W7wSIptvN9w8O8cKUFVueBnZl6d1v/N3BU/4tNI48ik1Nm+vNz14QxFYJQz?=
 =?us-ascii?Q?tZ9aDwQ5Ox6FolTeiTP7/i1KnDntCYB0S6NkEPYoVTdoRSUUPExMZwvVLYBl?=
 =?us-ascii?Q?hIkoqsQYdpMCFI3oBWL7LfEEyr9MrmI245gQuMAPglqNLh70vthJ7RityDcO?=
 =?us-ascii?Q?XSTHEwjbFVCZPkggvV1U9JKTNjNk+WiFfMjdHl8hRU0Z6pwD8kRs+FOfCMwp?=
 =?us-ascii?Q?F6BeBSs2FKEAg4IoIKV4ZnEvHftsD+smbo4+zTWiE7v1G0vsgRpfgNsJKtMM?=
 =?us-ascii?Q?dc/7gS8ev9/2iO+RMlqwpRuuxXSoBNzrjDkqGIr2u6ccvlYM9OVCMuc5zEMi?=
 =?us-ascii?Q?g1sqoOgBX4AoIgWzC9YG4C+Pjs8daEfTl0mkwsRm5PjVjoiScR8sjTSFO36b?=
 =?us-ascii?Q?bl1onOKiwi2/3uLND5y1TY7TLPNp/qH2UlAkqx3mEvOy7tgEe3sdEjhxdyXE?=
 =?us-ascii?Q?+QJ1t7Z+f5Y4gkXx6JAhlJ8DHX78GGC5DhP4m9TtW2ch0diXwVUNHSlz1GUO?=
 =?us-ascii?Q?b8CnEvztiyzgF1CnLuL6H7DuOmCn94WriTSvVnW4QbZ3n5F7l4tMm6Z0QqyG?=
 =?us-ascii?Q?/Gx2M67d2oYOTujbLY+tSHgjpj4tc6Snw4dP62hb6zbwHwAfVYvXjtx/r39k?=
 =?us-ascii?Q?9qDsJ0dqzFf34xldQC8dO/t40LJ6EzN68ayR4yC9KSZQt4LpxswYP+vO+UCB?=
 =?us-ascii?Q?3yjJuyF/vLlrDOxqmud8e3Dy6oxvw1EMqAdHcvptAw2VAf5tLFju+oEIb7sG?=
 =?us-ascii?Q?y12xFt2bkyKR9VuiIeHLNVLDNT5wpXhTBaqCUyHY0l8GXE28MBft0/nkBxKd?=
 =?us-ascii?Q?5YEIX65ZXyjiPxYDb2rbfPG+CobYnj8BOm251bf1/wAxu4KNqig+uR4tRKQT?=
 =?us-ascii?Q?fASenwpj793cXDYm7aLtmLVg5li5/4o1r3pzY4lRt9n2lN5tKeR+xGe8WyvA?=
 =?us-ascii?Q?yMbqFzFcPmtl88xCeVD42ad/o1FCU5q9YgW0tG4OQIOVJIp2jcCJP7SyDkB+?=
 =?us-ascii?Q?PZjJvjR0OgaGMX6iHy7WmAcyY72gasrPQZektyN7ljHndCBndNk0xpDOJc51?=
 =?us-ascii?Q?do3Ki4rOSyyQnTHtAX/VwcM7LwLBokht6e6Y3jZP22+MVpoY2jFfEwrfZjJs?=
 =?us-ascii?Q?CPl51e2SRJ5T6E3tW+c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:36:31.0557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f573fa2-fc40-44db-fba7-08dda2715bc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8995
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tcpGGjBxMGYAO9OMbmEGtlGRswKTj+YxQ5btqvIqJo=;
 b=Rk3fp3o4AqgpsagkXbn2K+trpAqwg6EIFaiWrZzuVgmPV5vIHiyMFEs5X6OGx6xBPEGntN+dsxA6ytFob4x/mRK7su6/rtVWQGqpwPl/t3EKG/NmPZ1S3PYxuQxGo1NDDFygG288Q/X8VDgfac8rT85DAvgYPAzSKK8rPa70cds=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Rk3fp3o4
Subject: [Buildroot] [PATCH v1 7/9] configs/zynqmp_zcu104_defconfig: bump to
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

This patch bumps the zynqmp_zcu104_defconfig to xilinx-v2025.1 which
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
 configs/zynqmp_zcu104_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index c21058be74..e0900e69a3 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
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
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
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
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
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
