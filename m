Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2605BC5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 07:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77CF615DF;
	Tue,  3 Jun 2025 07:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYaAmqzwjilC; Tue,  3 Jun 2025 07:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F8C615DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F8C615DA;
	Tue,  3 Jun 2025 07:36:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29C2C1F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E00C615C6
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaWQouqM020r for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 07:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::606;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4292C615B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4292C615B0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::606])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4292C615B0
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6DE3pm8qHW+vxzI1cJPw023X5SL8whd30OFnJN0pxQipxcJe7errWZAIj4dsVDg9rvYwCUhR84BOzSiE3XZGawOOs3JuPWrVHuYS/SdcvgR57PdHEmOgQwIUPZJpVTszzqMDLz4aP+q5LxlsSV+6gDO480WhnxF4vmHy+MEZbcR3FckX1lFSeGis+6sjARsuuOCLAT6ww/1t5U8NDupqUR435PKPoC+rpWTCATy0/moPpLwMmSrwug3GsMC71VXqKq3eIAXypo0L82MJbMPwbVQzibA12GFmNrR7sPg1yMV3Mxadf0532vb8PpA0bUzSjJ6WhIh5gk40XesRl4vNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy4267d6ZiT7fDVdXgO0nvXX8QEKt7qe3yr98rwRkQs=;
 b=depQJcjJYHQvqL3m6CU9MV2uJW1NdJ8Ri+wKHJCLK0aVOH407kHifwo+H06nHGfz3tR6LSow9fPy73X7XpbdNCIR3uX7Gwqk1fOFCU2etzWiwvf/SMfZ7MtKdJjzBFuRkPeeUF7BNzIHKm46IiSZG0K4bdV42YJ4ifqcaZX+q9Js0eCg3AIi8geBGA7QA9FOdtoX+OBzUq19gbMNpMwKevbSgvNk5RfVrJzdAwTFmD072El1eLBFONWfao1BGNJLNjSnENY761jkM4qXablLgkvCcD0dWalMjWGqBfLZpgD675vvga7gPKcLlhDwHtA986OrhZMtlXIjYo7KQNWJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:a03:331::26)
 by LV3PR12MB9440.namprd12.prod.outlook.com (2603:10b6:408:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 07:36:32 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::2) by SJ0PR03CA0081.outlook.office365.com
 (2603:10b6:a03:331::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 07:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 07:36:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:28 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 02:36:26 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 08:36:03 +0100
Message-ID: <20250603073606.2679424-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603073606.2679424-1-neal.frager@amd.com>
References: <20250603073606.2679424-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|LV3PR12MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d668cd1-ec98-41b9-c009-08dda2715c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CHaKCZUZqiYMysyNvsglu0ddoaD+lYU2ILiNolh1Kk3Vemhx712vDRuS/qj8?=
 =?us-ascii?Q?RjhTvz1m+H5n9QNTj++KobkB0usspPjR6qohDcdskJ5ePb/oD0NRRxQ4Z14A?=
 =?us-ascii?Q?19hIFhYmP6SIxKMpiiRaEHEXQz+utVI/E50IsOJiHQN4Seq4lTIG8AMd5xXl?=
 =?us-ascii?Q?DXc1ZFvlqBWgwv4p87LKt2vouQqiQeqGcnO5SsmojhfSaY/M1+amE+0BByUQ?=
 =?us-ascii?Q?HWHrH5JZ75/tlITRMiZn54deDvYY7kDPuW0jVPccXOr7Fori+ovg9evI2CUN?=
 =?us-ascii?Q?G7inh9Hf3SJO4A7EsFjWnpYp3upUt5T+KqyMCZ/Cc1/ThtD+QKO2JUJPOdSN?=
 =?us-ascii?Q?aUpv4+KLRLRz++5HHdrZgg71sPACZZzAoMiRLK8c11U5SMrZyhfVsouFjNhe?=
 =?us-ascii?Q?5HhBQgB2tv9ovczjwElFoE7OnOit8hXEYRx4b64D+Iw/9mNI8XTy+ZDFJ6HM?=
 =?us-ascii?Q?pi4l8p15xaz+TIyHlXEHaS/DxbEuyRy3vbo2zusbnQ++3QNGUcJ1Dy5gjbew?=
 =?us-ascii?Q?Nh/75pHeSnjdUcqnQzeqnpjJuclBuzahgzVSXmPzuODeRGaqMiY9iXvAHEfx?=
 =?us-ascii?Q?mg/0LrImGRNlAq6THPM3jwId5mfAMZsiSHiSVhdi9a30tsARwokknSkVrWKW?=
 =?us-ascii?Q?B2/w7vy5Tjz61oTEVmrYlcnpFlak5zKIWWrvlsuK7yqlkKUUFUIW9MlUFDrn?=
 =?us-ascii?Q?09x0PFffK/c17T8lhJDZ34p2nBhrFIfg05MrEQs+ohEH60eWA7orQY1OMD5R?=
 =?us-ascii?Q?2QMzjb0PVHf7Jy3qq5uJfy2mhunPEq1lSSNluhQL2PAyX1fp2MRitLdihg8A?=
 =?us-ascii?Q?3OB00bBffoq5yzVQtCC6jgAEYEMKdeKR6frJotnl5mToC6r8G2JezgI6+eDD?=
 =?us-ascii?Q?twwK5KM8cMmTuRolf9mTRoBqD/EYGNrRfzrO2fVGVJm/gsF/29m1+U3L1JsU?=
 =?us-ascii?Q?uR6tsdeMsZApXijjcq7qfou10mHYBVfd095qDfflADYjFqGuPD9OqeMuS2AS?=
 =?us-ascii?Q?1IyV1JKE1gkyUjIiNdzuAmt1bqiGLq374PrXFDUYEQ3UOBVH2KuMn6X2kfMA?=
 =?us-ascii?Q?xJmEY6QqYg3yEpHpjhcLhRx3Wgi51GGMtPdi7/FleEClxjIsXLBZoeWWShUv?=
 =?us-ascii?Q?ItOysbtfh+drCBQb7+h8ZxStgftwktheRTWJuOlJWrmiO2qjrQvfzSRjR6Fb?=
 =?us-ascii?Q?7CHolpjkdll5qw8Vy3T6/EkugNCKnVmqpGKdDR9uyljXsImt3kg/KVFJDbpp?=
 =?us-ascii?Q?/KQRH7zBf++686YfYhNOQ9yuGij+cY3EcfRh7PxK5KeSXmdbiHNMvbDwHJYP?=
 =?us-ascii?Q?9lEwrkfsjBsdYs2KsA3WuNxesW9tr55jDBzGdmo3dgWXt2sU/YuSWQj12fjz?=
 =?us-ascii?Q?ZMXtz/J732fFJ0gfTlxl/fMFGQPDx4Qo0BzSgJODiadeTtsD9R+eCKztW+Ct?=
 =?us-ascii?Q?VFt5+b8vNCevZcTsN+D4+P39ghnoNRPuDRbGq3N373mECLP8iihv6pFiVtKD?=
 =?us-ascii?Q?gIa9Pq57zympbo/9E9X3GRduEC2vo9AQwZOarHo2FosQfHaN9sbARZOHR2Vf?=
 =?us-ascii?Q?icNB3O4kzRSFiOoNCps=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:36:31.9141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d668cd1-ec98-41b9-c009-08dda2715c55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy4267d6ZiT7fDVdXgO0nvXX8QEKt7qe3yr98rwRkQs=;
 b=CVBKFeiEzWHzobZel2mzC6755v1QEKucTjb9YZXepcleY/bKj1l3mdr3V5yyjhWBDR0VTz7RrMgS0TmGYNHaq6hzZyp1b83gcjlIYw3SlZkhRdDGzGPVYI3Lj8WgUirC0uO3EJinJTl3jE759w6YQxFMizlZ3RW/otg4DTA/1D4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CVBKFeiE
Subject: [Buildroot] [PATCH v1 6/9] configs/zynqmp_zcu102_defconfig: bump to
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

This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2025.1 which
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
 configs/zynqmp_zcu102_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 856c1d896d..cb7b3852aa 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
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
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
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
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
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
