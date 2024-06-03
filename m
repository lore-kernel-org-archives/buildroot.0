Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F50C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 12:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B565540363;
	Mon,  3 Jun 2024 12:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN0UTuxH5Cz4; Mon,  3 Jun 2024 12:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74288401CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74288401CE;
	Mon,  3 Jun 2024 12:14:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CCF21BF3EA
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0960E6061C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBIz24ecQ9wS for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 12:14:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::601;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D55CD600C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D55CD600C6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D55CD600C6
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 12:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSVQJhr2WbKa0AVVrcp/g2JSr3kB+nYw0gIb6pP0L1r2WhBe8IT9M3KoX/mfUCHp2p/OF5JW0BjlA2HGcVm93rf2qyDJqU4Ju+obBk2iTAhOOhnHMemfUkHNw4wJfijaOAFCLRkHNfcnbtg3Km+87tyJ7PBqIuOtrtfiEVtAw9jewWtKT9iK/GXRc+/TuxDFtTR+MA+zT13+gi/rQ4e0JzV454P6Gew0eAA1zWuhYDXzDZsdOT0WW1psBwMmrRr5ulYBZXJFHqxfiyyYjuZmZyPYhr4SNT5574d7t6VVsIIWLQBVcAqURoqSUqTkQZmk0pe4NUArc6MRguILpvX7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxqzmGykNE+3tbww8M/yoflDdyIBS/YWr6UjOjvT9FQ=;
 b=FYfU7qD//qc0b2WFDvj1v0g3CEsGdrY/SY92AhjwjlKc9+2EHBL07xMTNYK5IwUzrQkyJnpWpCOc1vTscxkQsVbiaR80alW624hzvLcUwtlO9snGtKmuNLMHbH6DGteYhwwiVF2ZZaBBvKJSJExEv+kTprj2AJi/MduRCRmvnyQugoYKGpFeG8q6m05eZs6+Bv9DkxS+ky+j+6WLQRYDrw/PyIrFBn5niEkTWBW2TUV5NUEqdnXQW21HfHJK9inTkwMbDFylHkblMM1Oloh/HiocsKbbRCHpace5+i9YEAXLj9atjq91z6WDaNeYCcw35R1PR5divy5cm8PoEeJWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR17CA0046.namprd17.prod.outlook.com (2603:10b6:930:12::11)
 by PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 3 Jun
 2024 12:14:45 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::c6) by CY5PR17CA0046.outlook.office365.com
 (2603:10b6:930:12::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.28 via Frontend
 Transport; Mon, 3 Jun 2024 12:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 12:14:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 07:14:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 07:14:44 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 07:14:43 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Jun 2024 13:14:34 +0100
Message-ID: <20240603121435.197680-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH7PR12MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 6861fde6-7c6a-4342-ee72-08dc83c6c157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|82310400017|1800799015|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NFEL3RoaybXuG4YvpHyIoUX5pwBmp6Dw4GlP35UCTxTYYkNWB9gbmW+9TJyZ?=
 =?us-ascii?Q?ipJdf6miWHexqfykz4SBov2phpTpWI2+29I0Y2UBmlvUjXn4nE3533rIroXh?=
 =?us-ascii?Q?uE4sUH2c8Xy17mhX6OufZ+7ZUyKKAo4GuQnP1eBAkh92Oz3zulcwjw7T5AI7?=
 =?us-ascii?Q?aIP8tIBicgD8V4Uy/flYPcE8CwwG+vOV6MrBFtzErWmN9CS2CDKIcaQ8U1Ud?=
 =?us-ascii?Q?2MZhLX4vgrUqvRZsSqHqSk8gKxNW5QL0HX1XoNeRF2V4K8pHg83gmR2CDekA?=
 =?us-ascii?Q?k65KdIhAJVxQK7cjMUhq31FP7Jc5n90CvEg1MhIkJM11PyDiI/GoYhccf5ht?=
 =?us-ascii?Q?DObkorBtxkXOK9F6/Fm9IE7TbIiERwYbssYwu8iwR4g/Sk0VYGYBivrOtruT?=
 =?us-ascii?Q?lrCLO42uBRhtKUWPou3ZH75dXZa3Qjhjl1Y9Fc4aiuV2pa0RnuBWN1oj0INZ?=
 =?us-ascii?Q?BdTrvlv66uANqUmY3TtCvl/r1jjS4TebtZAT11wJcxumiwb31P2TFQqkNU1c?=
 =?us-ascii?Q?Ksms8Vp5AU5Yt647qnWfeXFg20CCNyKe1J6MWwh8F/AZnZb+hBrNlDbveG3+?=
 =?us-ascii?Q?CH6llYhjkVYyM+j+KC40UNRkJptVRY0aLfKezVOnYpMwA4JeGZ8fAwV9pPnG?=
 =?us-ascii?Q?WayVi3CHt21JqVb6p03tBOl1pw7MWJ3VVHBiSWh5LVuAl/CKact3uclkLOMd?=
 =?us-ascii?Q?yl4d+bo/zMY0PfrZTk+giqg3y8ZXw4XIE8b0rGbGAAdm8CqiRce3ntKn66jR?=
 =?us-ascii?Q?xyJV6/lojjOJkpdi4zWSfjJcUQC+OxV08PqmQFYEocsBkEPJYAoTVvdcpuEd?=
 =?us-ascii?Q?YfC9JE4ikjHwB9QYuDgwEqgdscmp6xOZCgKkCVPDqoQEZ6qt5LBhdarUMe6B?=
 =?us-ascii?Q?s2Pe06QpzqveyqeM6HU8LUuNJ1CO3K+k0aDpkcvNslbbK0iHygzLtlYGu/gK?=
 =?us-ascii?Q?hDoPtLiYfl7uLlmwSvrH9EVhVRRCC9syF/s/Z+xPtUu7dfcujFeAvpKgGC34?=
 =?us-ascii?Q?l5weiOA11yrfOnGFODSDe1Z2A3DHgGyAwp6NOCDIdggLTw/jSXswzimaqa/k?=
 =?us-ascii?Q?BAhnFiRk8yWlIHvyGAF3H/q6iI1vUPqKO+lYMcu1rHPuPLwVkLU2sXEWH7Zd?=
 =?us-ascii?Q?0U5IplNboLctjnLBfR1FlhPuyfVN4cM9JCe77MNE6Z21ga7+VFlx1tO8dPVA?=
 =?us-ascii?Q?j3xp4Ct4Q94IrNOr8y52vclzMQUt2VobtkU/LOJJwIoq9AG/hgE8i/yCBOIN?=
 =?us-ascii?Q?Fc4eqg9EOCjq/Bc6/l2lfkPs//UTINV3tf//eqGK1O6N7IMCHozw9mDgaZxx?=
 =?us-ascii?Q?5Nxz+PWwOJSdPpoEefrq0OxZx9ufiNF7/D1YLwcrEH9O9Z8GDv1cA/9Nw1SP?=
 =?us-ascii?Q?hjp1u4P6REUUSNk0KjTRgtTJYg83?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 12:14:44.9358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6861fde6-7c6a-4342-ee72-08dc83c6c157
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxqzmGykNE+3tbww8M/yoflDdyIBS/YWr6UjOjvT9FQ=;
 b=BrUPwEJ9BcSQCsv14R6x6T1MPGZBoRqjJ9/gSrYWo2w9dSbLfMsjs9RoqfSzhEcmWjySCK+C/zF9moSx43S7VGOW5OlwwK488Pbj8PL/z44uj7NHdpZ+0YurFbLq0jIZm0YubBWpkHk1XQ7C3ARz0utZJuC4TwqCO7dARq8wd0Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BrUPwEJ9
Subject: [Buildroot] [PATCH v1 1/2] configs/zynqmp_kria_kv260_defconfig:
 bump to xilinx-v2024.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PMUFW xilinx-v2024.1

Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
needed.

With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
the offset between the base address of the boot.bin and u-boot.itb instead of
a raw base address of u-boot.itb. This allows for A/B firmware updates since
the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.

Thus, Kria SOMs come with the following QSPI address table.

Partition A:
0x200000 - boot.bin
0x280000 - u-boot.itb

Partition B:
0xF80000 - boot.bin
0x1000000 - u-boot.itb

This patch updates the addressing in the readme.txt accordingly.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/readme.txt        |  4 ++--
 configs/zynqmp_kria_kv260_defconfig | 14 ++++++--------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index 96009804b3..c6be22133c 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -90,8 +90,8 @@ KV260 Flashing Instructions:
 Flashing u-boot.itb:
     $ sf probe
     $ fatload mmc 1 0x1000000 u-boot.itb
-    $ sf erase 0xf80000 +$filesize
-    $ sf write 0x1000000 0xf80000 $filesize
+    $ sf erase 0x280000 +$filesize
+    $ sf write 0x1000000 0x280000 $filesize
 
 Flashing boot.bin:
     $ sf probe
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index a3a157267c..7b402e032c 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
@@ -15,16 +15,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -32,11 +31,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kv260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kv260-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
