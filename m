Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED47AC5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 07:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B99886155D;
	Tue,  3 Jun 2025 07:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCoO6dqy1Dq1; Tue,  3 Jun 2025 07:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EB5061098
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EB5061098;
	Tue,  3 Jun 2025 07:36:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E54B1F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F3D160F8E
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bR67QG8qzvOo for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 07:36:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::615;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 266F060EC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 266F060EC9
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 266F060EC9
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGIjK3zn1+kkBcvGbeAIOfB2Mb+Q596gAWdv1HlIkRwHDLlGco2nOdh3jAV3xyKzVt0Y0i4uehwxlo2jG36PyUScmvcagPrgkMhG1rYlSC5nQGuZbvpyYZvIWP5bWyNpabv/4adB4IgkH+SvGYBGa+f0sNJ9dNqn6qQmsQZfGWj4Tvjye+0nD8qI41cuGEO7a4p1MXfhfRMMNioch20FqHbf7WVDcLnEr64nhX9zZmGl4OtDLyRWp+BtYAFULyIwA8gI4WTki5ByAKzXtdC7neIqJMp6FVTfTKm7kQA08/mYWOVhd9DdmvHq07nJDxO3IIRQwcZsiVR11hbyGBknnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdVq9q4pheCmrVfigF/n5DqZ4n4BGcILYI6k98V6hTA=;
 b=cjgakTZYcnCxZoN3eonP+R2W3LwntJ5YmOKvl1E8O3H249LP+NrfTN/QGMNL1CDeG8wAPQbFUhrwqLMkdpa4T7IOc6zS1TaoaNvSLVbx2uoWOigmGN0RJ6eTCOvdxv/mD/NmKIBT7fS+EKp9cxTpXRbVjnbHwpTsoiewSRya5TwQR4pqOrE733ZgFy87dV+NFDte8O/PomYeIx8NGo14Mhyf/S1n5jtTgPvyzSL0V9OozpjJxp+f12wI6gC2un7Yajn2kWNP4dDnRo7i8M+jNm0mEmrluzaa0a35IlQqyDK7d/rqcgDXnV5SGOsn5FdibnTLcZohGT0n9xthSm+Img==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR05CA0004.namprd05.prod.outlook.com (2603:10b6:208:c0::17)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Tue, 3 Jun
 2025 07:36:23 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::1) by MN2PR05CA0004.outlook.office365.com
 (2603:10b6:208:c0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.13 via Frontend Transport; Tue,
 3 Jun 2025 07:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 07:36:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:18 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 02:36:17 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 08:35:59 +0100
Message-ID: <20250603073606.2679424-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603073606.2679424-1-neal.frager@amd.com>
References: <20250603073606.2679424-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf1a51d-0ef0-4df9-2000-08dda27156da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4OundToygHc46SFarI7ddHIjRBazNqNresF1989U+BzWDuYRtEqBF3O+eAYP?=
 =?us-ascii?Q?Kar1ILNDxueRVJMxyCbmJeDiykF7M7uxGP8oPCi9/LQdld4WjAtJJ0B0/N6j?=
 =?us-ascii?Q?0cDsgZDJYkD5hQz1tIESzP99n/TC+2sN99UXR+VGZe5GM2EhJsFXqJEfBY6g?=
 =?us-ascii?Q?4E7TDB3SbQ4JLGhwGatA3kgmt7k7m/HOvfZuh0Yt6zQmLaBGEyhhF+43Jp9i?=
 =?us-ascii?Q?wRMrybA9fnox8gSuZmswwo0W+olV3GPK4VdCICrjG/D2VF79PjET1diDICnP?=
 =?us-ascii?Q?zx/87xEsr1ZUPfKPGqEdY0lqnb7BV4qcpmNLRXwmAS1vzcRNO/X2N7RR+GK3?=
 =?us-ascii?Q?Sfhun3XnMYh2qPOlKtwqg4bdlTxg5ApdRWB+zGHcFjb0mq9+EZcUmtmQGf84?=
 =?us-ascii?Q?mBXxe3PCFlgItQdKF1OPyKFJ7AXg5Ja4nWa++TIWVOqVN8bjwqrPJcxE4efx?=
 =?us-ascii?Q?7zBoKix1CF4cTGXrSxDBGxTh3wwTojHBpPz1Wk2TSQ7cdRuGVQM+8IY3fm+x?=
 =?us-ascii?Q?0JSZ6BXV0FgsVThYiQUkbLDaY3acIW6OaeyAJjUDt95XxOLIrLJS9N4NRenp?=
 =?us-ascii?Q?sWzcPXWT6snJCkmq1Baz7mzdQRwIeh58owGALXmyb/HJm9PoDasViDc5Wpav?=
 =?us-ascii?Q?RdYmtjsOOi8AP1Wol0/2Qybog744VfcA0he1CXpBYs5Qi+26exSuQdhFV81x?=
 =?us-ascii?Q?9CKtQkvdglpkcgPX/q9E1f2Op+DXG0lxUUtXWAtQ/fGUE9ilcXSS2EXIzVBZ?=
 =?us-ascii?Q?ifeIOKACsifJKl9fv7jODzjo3d3M1nABNL6cNmymcII3DW7slDKT8swF14ol?=
 =?us-ascii?Q?z5/ucqeSpxgOL0ZJfw++OBFPxGnrnAOnoJslMfZcSJnAffwovaYM4zrfiA/M?=
 =?us-ascii?Q?STxeeJOE/JgAKMcfaRImTEJXaVa5/DTESQKQpeYVn0+T06dcPR10gOp/9O6v?=
 =?us-ascii?Q?GS7U24f5o+Q9UTkDRAgsq0VtMrYbBWFntZblb2rgiLzgE037OL/MWzkafSPj?=
 =?us-ascii?Q?am3+K/34Q3IRGrGfrnAncorDffbDCJEOQoc2u/Jjuxfxu8bemg+GSHdwrVze?=
 =?us-ascii?Q?0dhQmLP42rcO5o4PvgKS2J+a4hqULMcIJRALM6KFQ/X2MidFe3kiodzf0xHk?=
 =?us-ascii?Q?6zLKR8OKaqxZQ4ChxV+OrxaPNk4hdWDqGEAewApfClr6qlo1fvQF3QROYYj1?=
 =?us-ascii?Q?AGQruJ6oACLBZO5HzsZrHY1X4OZvrVTctBE0OKcgsfRoZO6NGVI87k4IIy6v?=
 =?us-ascii?Q?oKVoodF4M0/Q2Z7fv+PpqRKg4dDTw9k9sWCCOXQAg1hVLGy23lwQQKmpB3jT?=
 =?us-ascii?Q?qdw3gDbZLr12eSBhJTG7ev0hbJTo3RXWqnKB5EekYBqRv0tWP0YKRXRxUUXj?=
 =?us-ascii?Q?KLgak8pDNQ4DsWtaj4NRpkhUjFVv06ttUS3sbk6t1ZtVpjgb/ALEzkZkh7PM?=
 =?us-ascii?Q?up1638wUX99w2vXWqtW6Vj91nYUCRxKm5TIwopXHgCA3NG/D8eXxMOot/blr?=
 =?us-ascii?Q?QwAIXfi/Laz9+jywrLfwIAzs9FlQJErH5LqAhu37jh2xOXMDknI32MNRGf8G?=
 =?us-ascii?Q?JLWKXjzMburPwW3eCFU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:36:22.8169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf1a51d-0ef0-4df9-2000-08dda27156da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdVq9q4pheCmrVfigF/n5DqZ4n4BGcILYI6k98V6hTA=;
 b=XXknXGHtEO69dZ3jJw446QRuDaHx+HMYnUCbrFv5DHLB27ImytyLzyKbWk1DNRW3hPumvJQoIkXo8FKHswAvLqoYof84tZVpBmzU2aoRWPH7+Nbng1nQ+n8R6+erNeymcOHQFJr+10ArdaA95VTumnrsQUuDjVV68Yxu/LBXQ3A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XXknXGHt
Subject: [Buildroot] [PATCH v1 2/9] configs/zynqmp_kria_kv260_defconfig:
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

This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2025.1 which
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
 configs/zynqmp_kria_kv260_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ff03f87b54..aa300e157a 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
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
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
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
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
