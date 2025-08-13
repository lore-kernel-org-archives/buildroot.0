Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0913CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 17:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 633E7410A2;
	Wed, 13 Aug 2025 17:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwUHMH_NG5zG; Wed, 13 Aug 2025 17:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B54F413DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B54F413DB;
	Wed, 13 Aug 2025 17:30:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E71FE938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 17:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8A44410A2
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 17:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kS8RDq6hvvDk for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 17:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::602;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D230340FD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D230340FD3
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::602])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D230340FD3
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 17:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfygvg79tqlmCsWYyH9tlB8yaz6uj47bdbdfJtafob244CV2SMRkZgOMrD9oXwtYELOD5gHVo2XEHCxCPYW6HhoIJr+ONEz/Cm5Eaz8Pd2U1Dytm6o3sepMBk9T0WCmMr8O4Wvmm++8oS5kuCG0xKQfMGUai1wpDZwummnEB5aOfeyWhk7jhmNTeN3Rr6fk5QIs4BX1EF9wGw6VEqR4+1IhLTbUWhFxdcTTOQ5AvxJUjdzSsYNcmXNHvLro8KglrHZ5qPDAAHkgMjkZCaw1irBoYXxqNIpsGZo1DtAi5Ht6F96rMPKO1YeSAN7BVFYAMR/hcKONueQZcS8xDhlSZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FMEeKOwSAwqkJGnNxUQgZX/a/CXlgvytbBSFdPsV+8=;
 b=c6c0x4hHXsSAONnUJd6mvWjWV/20J1NkyDgA76U/l/zbyh5Srf5s9fldRHdobjH6FYC7yoPyty+SLBiqMK+/lZz4FBRkkg7c8+LIR68lrQ0gGg/2vyuPYRR2hWcdRmraZffTQFUnJ31L1Uv2JE+USUy8Pu9xJG+jC+lVMun40pvxFEAWiQOMaHBc3/7CmK9FQVmUt6Zfg5W4K/qB5eAGi7h4D5N1mh4yrFy1cmEwBeDRQOFV0/Yxk/w3N9IqYEFUuvxlMLjyFkT88LeEKxAGNzyYgPIde5yk6htfBIScex5PnQwwWpFSvi+pd3F/ow4g97zs5Wsyvhys7/IpmW+o7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::27)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 17:30:45 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2c5:cafe::ce) by BL1P221CA0026.outlook.office365.com
 (2603:10b6:208:2c5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Wed,
 13 Aug 2025 17:30:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 17:30:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 12:30:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 13 Aug
 2025 10:30:40 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Aug 2025 12:30:39 -0500
To: <buildroot@buildroot.org>
Date: Wed, 13 Aug 2025 18:30:36 +0100
Message-ID: <20250813173037.3052024-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f808ef7-07fa-4d04-43e0-08ddda8f206f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iPBwFQTHaUqJCXliXKB+PoeeeZFdaX+BX8Y6jBpBCTH2qPHM9TxZz8FdwLtn?=
 =?us-ascii?Q?4PABJMuer6feO1dea4An2ItFybWxg5g5StlJQrmuFEhmNDuPPttBzF8uNEl4?=
 =?us-ascii?Q?DsJXzsIkq95/5DJnk8pQ0IshqaCLYFBjHY2a1lhCi8Xr0xKDXJFKk0KNjq2w?=
 =?us-ascii?Q?OTLgsb83DUus6E7bivWIP2PV9hA18yQ6O8BKBSyeJcH9L+b+MdECk4EQIrsc?=
 =?us-ascii?Q?Aht/oy2isyhCXCKntGHFoVMVf/R9eQZOgm5FBwpGHVLIaBNEiCVgaY54diCB?=
 =?us-ascii?Q?RYAe4pvwG0LQO1ifVdurulUKtQkHtMMx6oBwU+3glCZFmUu15zfq6/mNdXWq?=
 =?us-ascii?Q?Dhx7apCwzRqpnTqqRJncrbobDU4svxZafwcvJBIUXyfXOd2XF6EF4GNGVlRv?=
 =?us-ascii?Q?bakbs03d4mRMRvYQYX2QNww0jIMXYic1f1dp7aNtM6MqP/B2zRJ+QwNdqAKr?=
 =?us-ascii?Q?DYXpML2vr57qip25iCQFDDcmoa8Ckdd5fL1jCywJtzKbvRtBtaL73Kpie4CF?=
 =?us-ascii?Q?25qzjJQzyQpKuX734jkSZbWp8Aj92ggtOa9Ojd2x27Pk9ZMHTPB4eTwipyNj?=
 =?us-ascii?Q?BTq0ET2WhzT7Q+2HyOy1hS7iVP2wRIVE+8husIXxH7PyVmDcle83XloAbqcV?=
 =?us-ascii?Q?02BRhoOTUkVP7KEBDrTslG4M5fLraPl97hTBeHp+/cVtwokAVhpGcVW859+C?=
 =?us-ascii?Q?NVp1HB+BhiM6c9SDAray8nlR9QaRCc+b2dx9qc+BaCr+NSmcN5HKz1nHtmPs?=
 =?us-ascii?Q?k1Zq2DfQ1Ia4NI0Ahiz47OTYxXumZZvKklU3E1M8GEp9OHCUAX8sxTEedhyu?=
 =?us-ascii?Q?zsJ4ciS59oihjP2txAdfOFHAU1M/tHq83W/1knOZ+f2iq5aa0Fxtt/WJ0tew?=
 =?us-ascii?Q?1pxgsNdXwHSI4cWzm1/t+lsbztQA7X1fwW6A09Qfa8cZGjk7jOVg6rOrn6x5?=
 =?us-ascii?Q?86apg+WedP9kQJBi3r34DLZdf873+zUiXARB+tpMhurtYMX5q2yM7CDLTSES?=
 =?us-ascii?Q?f0NgNEDtPF+t8646sCd25wKmw/o2RpXMhhHmVcscaZ4sz8fBHU8hzUqOfMr8?=
 =?us-ascii?Q?zGAOwpEueZrYg9wuT6LLbNz1UI6YrK3Zotj5wJy1rFswCMFvKxEbBv5LjZt7?=
 =?us-ascii?Q?yGIB21l3X0C8y61gbmOouRoq05fvINYFRUFr/LQPePMPNKmMd0wZ2r224v8H?=
 =?us-ascii?Q?z0xcVfEXv+IOy91sxh4gT8gN/k7HhzP7j0CiAWqFNASIbH5m8ob+Rdo/epdG?=
 =?us-ascii?Q?P+E+2hKclAK8htma3nZPkVYom6GywheDxw5chF0FogVWsN46mOb2squ37GJ0?=
 =?us-ascii?Q?C56xfLV6y7jKJHIRUcGjx4STpDChqcasLPyDq0CaZFrQMYZ0/SkCK5zN12X9?=
 =?us-ascii?Q?JINjDAA7GuWTIis5Q3jJtynM+8rLCJc5xaRuoYJn5jpZYbPOlO1hlt+i7QQx?=
 =?us-ascii?Q?09opMZnnbhL8DNIszrk9vlym4MVE+g5ySmEFonhKLBaDa3qFxpSeEXmSUUCX?=
 =?us-ascii?Q?8Q/wVCehHWZPdSiTdZyFOJ3y/NA/+bd9mkYquIOyRXym60dVxX1/blL/2UpS?=
 =?us-ascii?Q?abFfKNAMMLmou+UAuYE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 17:30:41.5372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f808ef7-07fa-4d04-43e0-08ddda8f206f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FMEeKOwSAwqkJGnNxUQgZX/a/CXlgvytbBSFdPsV+8=;
 b=wZ664EiV7rL2HYRPMwpaca1Y6Q9okh3TDQUMTG/PyWGr8iu+/PbsfeI62G7z8Zb7ZgFaegpG410ZIKAMGTTkgFEfQDuHOz6iYLMgODlyO4nK5W1nhmQhLWogz6oj397l2WF8R4EV0i2URB77zgbn7Eo8xocroi5GdgniPuwJBt0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wZ664EiV
Subject: [Buildroot] [PATCH v3 1/2] boot/uboot: add support for custom zynq
 ps7_init_gpl.c
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
Cc: martin.chabot@gmail.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Zynq, the booloader is responsible for some basic initializations, such as
enabling peripherals, DDR and configuring pinmuxes. The ps7_init_gpl.c file
(and optionally, ps7_init_gpl.h) contains the code for such initializations.

Although U-Boot contains ps7_init_gpl.c files for some boards, each of them
describes only one specific configuration. Users of a different board, or
needing a different configuration, can generate custom files using the Xilinx
Vivado development tools.

This patch adds Buildroot support for custom zynq ps7_init_gpl.c files in the
same way that is already done for zynqmp when working with custom hardware
that is not already supported by u-boot.

To test this feature, the following configs can be added to any zynq_defconfig:

BR2_TARGET_UBOOT_ZYNQ=y
BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE=<path to custom board ps7_init_gpl.c>

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
---
V1->V2:
- added step for enabling BR2_TARGET_UBOOT_ZYNQ in readme instructions
V2->V3:
- no changes so reviewers could be kept
---
 board/zynq/readme.txt | 21 +++++++++++----------
 boot/uboot/Config.in  | 34 ++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk   | 12 ++++++++++++
 3 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index 87df7236f0..085f47b09b 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -71,17 +71,18 @@ you need to add them by yourself.
 1) Start with a defconfig supported by Buildroot (e.g. Zedboard)
     make zynq_zed_defconfig
 
-2) make uboot-menuconfig
-    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
+2) make menuconfig
+    Visit the following menu to enable BR2_TARGET_UBOOT_ZYNQ
 
-    ARM architecture  --->
-       [*] Zynq/ZynqMP PS init file(s) location
+    Bootloaders  --->
+       U-Boot  --->
+           [*]   Boot on the Xilinx Zynq SoCs
 
-3) Copy ps7_init_gpl.c/h generated by the Xilinx Vivado tools into
-   output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
+3) make menuconfig
+    In the same menu, configure BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
 
-4) make
+    Bootloaders  --->
+       U-Boot  --->
+          (<Path to ps7_init_gpl.c>) Custom ps7_init_gpl file
 
-Note: The files in step 3 will need to be re-copied after cleaning the
-output directory and at this time, there is no way to save them as
-part of the buildroot configuration, except as a U-Boot patch.
+4) make
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a2301b7747..adbe8d142d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -701,6 +701,40 @@ config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
 
 endif
 
+config BR2_TARGET_UBOOT_ZYNQ
+	bool "Boot on the Xilinx Zynq SoCs"
+	depends on BR2_arm
+	help
+	  Enable options specific to the Xilinx Zynq family of SoCs.
+
+config BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
+	string "Custom ps7_init_gpl file"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on BR2_TARGET_UBOOT_ZYNQ
+	help
+	  On Zynq the booloader is responsible for some basic
+	  initializations, such as enabling peripherals and
+	  configuring pinmuxes. The ps7_init_gpl.c file (and,
+	  optionally, ps7_init_gpl.h) contains the code for such
+	  initializations.
+
+	  Although U-Boot contains ps7_init_gpl.c files for some
+	  boards, each of them describes only one specific
+	  configuration. Users of a different board, or needing a
+	  different configuration, can generate custom files using
+	  the Xilinx Vivado development tools.
+
+	  Set this variable to the path to your ps7_init_gpl.c file
+	  (e.g. "board/myboard/ps7_init_gpl.c"). ps7_init_gpl.h, if
+	  needed, should be in the same directory. U-Boot will build
+	  and link the user-provided file instead of the built-in.
+
+	  Leave empty to use the files provided by U-Boot.
+
+	  This feature requires commit
+	  6da4f67ad09cd8b311d77b2b04e557b7ef65b56c from upstream
+	  U-Boot, available from versions after 2018.07.
+
 config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
 	bool "CRC image for Altera SoC FPGA (mkpimage)"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..c92568a559 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -520,6 +520,17 @@ endif
 
 endif # BR2_TARGET_UBOOT_ZYNQMP
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQ),y)
+UBOOT_ZYNQ_PS7_INIT = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE))
+UBOOT_ZYNQ_PS7_INIT_PATH = $(shell readlink -f $(UBOOT_ZYNQ_PS7_INIT))
+
+ifneq ($(UBOOT_ZYNQ_PS7_INIT),)
+define UBOOT_ZYNQ_KCONFIG_PS7_INIT
+	$(call KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(UBOOT_ZYNQ_PS7_INIT_PATH)")
+endef
+endif
+endif # BR2_TARGET_UBOOT_ZYNQ
+
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
 	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
 endef
@@ -562,6 +573,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
 	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
+	$(UBOOT_ZYNQ_KCONFIG_PS7_INIT)
 	$(UBOOT_KCONFIG_DEFAULT_ENV_FILE)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
