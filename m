Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC974C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 15:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BBCE40388;
	Wed, 18 Jun 2025 15:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYK_hRIylhue; Wed, 18 Jun 2025 15:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46405403A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46405403A2;
	Wed, 18 Jun 2025 15:55:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85D6F151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 15:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BF7F60A5A
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 15:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v83mEQUszBaq for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 15:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::629;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E55460A59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E55460A59
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E55460A59
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 15:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfGzSrieUqO7/WAmzewXB39pFLdUUWHE6L5zHsD6hmXEyiYU+RAc3kcWfBi4oY97z1BnBis0Cmg6uK+hyduUTkeeSqGBjCOYbhtHGM94tutweCuhIfa77wJayaNR6bOtTgM/dUlFb7moXQtjVvrbkBEqK698+dv0yxXIfGgJvBcmU8FxjVINXcLdUA2QV8FxnSQDdnScszgjXeJDE1+49SebvAa9aDVmL25JOgtNWy/Vc8fb55e5el50hASZEST/VQfutT9K8ZeOeg79pKGHJ27DOpNRL49pcAP/VJv8gmTsMpu5ULe+izFOklsRvXy/8nBEyPPYqKo99AKkUViwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ddoUOvAKRPypfs8A6RBPhTdMaxhjwzLMzNGea7MgtY=;
 b=wGkweISapDRxPAuykevjkbDT/Uvurs2H+tt/tc1IHEJwQagFD9GS/fT0a3Ii4NRI9j6EBfETA0d/e7qm+foviK87VnAkFzs5JE37ulpxdQww0XIUVsSGNftgFvuCgswXXTR/lKjirVvl321qP7l4k30KVts25PZu3CQ1PiNEVybrzQzTC03ezdCme1Wq352XmNNZgvwDnkNKjBLdtq9jFLpJq/+BOklQBYCN5t2hG6d8jgritEqW/Cq7WhWpNoqV5zkKdEzoRRyy2iNhF1al3wowO/wTSDYO7Pi7i5vADu/pvpAPHUdAeYhLLEXpIzfAIsSSCql7SkmrOSOq8Y4B5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR07CA0023.namprd07.prod.outlook.com (2603:10b6:408:141::6)
 by BN7PPF49208036B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 15:55:00 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::e2) by BN0PR07CA0023.outlook.office365.com
 (2603:10b6:408:141::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.25 via Frontend Transport; Wed,
 18 Jun 2025 15:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 15:54:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 10:54:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 10:54:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Jun 2025 10:54:57 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Jun 2025 16:54:56 +0100
Message-ID: <20250618155456.3289136-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|BN7PPF49208036B:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd585bb-912d-4790-7408-08ddae807afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XkAv2Q6jZ5FuWM0yCD1rNqJQmFSwc5zmZE8uatDNb6CavI1edRSlUh4UXcDz?=
 =?us-ascii?Q?Dp7vClj8v2fN/xNcNTl2YWV7uKHC/8ujQh2RV9i6LcK6nbDFcZQmT3SOVMzd?=
 =?us-ascii?Q?H27k/hN0HRKe9V8vJ90n5xaz3ow97sSOYfFMbJ9i6Gtp6prBrvfeRd7SFr0X?=
 =?us-ascii?Q?kOsVUq/FVZ8OU6wrLKuJwXUjpe2wFJp250ZIqgw9clT2em+DervapSyWyBfi?=
 =?us-ascii?Q?YLD2AIb7W4oYWlugxmRcAeuBbtsz7Uj1l6crbmr/GXqiMjOPqoynFkxLSguB?=
 =?us-ascii?Q?f/E9P4hRBgRCK81dLb3rcxuGiWqDhFv9ND1b2seUY3UsXHOBGlFGs3Wb/lvH?=
 =?us-ascii?Q?UdkOuNKBbxs0w4yJkO5UVcgjmWcoaX+e6Cm6tGf4f+qQxXNwjvZyGaRlw/8o?=
 =?us-ascii?Q?2+KunqKpplbcwFkf5MmsOyISIbRvlT2HvcOPDPHhX4TI/6iEkpc89HiSM4tE?=
 =?us-ascii?Q?1emw0HChAxTbhOS5zcTjKqywx0DFDLM+IHPhQkaegIK/C4wQSTGGvG2BH7lN?=
 =?us-ascii?Q?WUrVyEbp32h6In5FwfiSaaBmuEMqJ5RFX23LGfYZvjAGB6OsHqKzXIi32ceu?=
 =?us-ascii?Q?HJ6HWYrBbLzk59/6mNcRgVXv4cdfivMAXfBMPiM0w5GnAlHq7v+7/RPzlbsP?=
 =?us-ascii?Q?EysdwXMKCiTbYUWg+wvFTgbe92HdZPIGQbFylp5sGL7vBuEm3b7OrB7tV04m?=
 =?us-ascii?Q?DjpRuAo/Jzm6lKaoWmPJ/TVR1fzCy2LNCi+2tgzQH65KIAn/tgassCjg2C3w?=
 =?us-ascii?Q?OdiU/HSLqK2q4Us/NFoSEUhgQjyDe9myQihVNVjMxQAjxS1UcEAD80RlClKm?=
 =?us-ascii?Q?y/A3NcJgiH8YAQbQ3kyS0AtTcFSsqji4oDvfLvUQeGvpuINT07+BOVTVRgqC?=
 =?us-ascii?Q?RvKu+/84mpjRSIBK/awQjODrosS4wXRSClIzeGWDD0ohHVtUtvR245v5t9f1?=
 =?us-ascii?Q?2+8Bn/M1kkYCgftWmto9IKVHsEVdZPdlmM+t3Zc+rkk4OfYXBFf5HSBGsa0f?=
 =?us-ascii?Q?bGlvgqH+u0XcD1hOh84bfv1d8FNvzps1vbp3xYOA8AL8hyNAL+G/GlIaJG+E?=
 =?us-ascii?Q?qpMGr0Vrn6tDjEaWHnZjCqT/s7VD3C5JjIoHVpW4gvK1AVDBd2cqzpXQPA1w?=
 =?us-ascii?Q?1yZtfLxSceIwH11Jf5uCs9Ocv6J4oRgxX7iLfbhcXiePyofI4roGnpMMDvor?=
 =?us-ascii?Q?onZXHU/BKqUwvqTdyuHSORUjU9J0vw4KEIn1aooAu9jmZxufaKDVJfj3GYsh?=
 =?us-ascii?Q?lztt89Oce2GPobSJIh+qixHDWBvLSzZQzklddv4t4swD7mHfedxH1vF0MyPE?=
 =?us-ascii?Q?FYxgKvEnJr8DyoMu58f48Cqfkrtz5yha/5MRoEZ4mLu826lr1W+cejnzNJOb?=
 =?us-ascii?Q?V3a98FnabW/K6OizDWTfcJHWLHZLA9c3zE9cA5wyVZ52EDdKHnbTtSSclG63?=
 =?us-ascii?Q?sufanPounOVoBLKtel7t0gX1EHAVuDrpd03vN0iQglI82Uw7a5MMSPg/OlH6?=
 =?us-ascii?Q?TRWO+om18N6nz2XMv4BtlFKv2J1WT4ANSCuUU5KNjtcv5D7I2AEViG4GHug6?=
 =?us-ascii?Q?3Dx2jOijsdJNYcpI/tk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 15:54:59.8599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd585bb-912d-4790-7408-08ddae807afe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF49208036B
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ddoUOvAKRPypfs8A6RBPhTdMaxhjwzLMzNGea7MgtY=;
 b=wQQRuK4iAwA9hL8pAH4WJ7tsgh3Mjv80OzetGlF30+a8H44N+BT4p5FidrAHFbRLlikNqPqcTBcAjxxNPO3s73riNfbiJt616iYqxu637fZRtuEeKA3v4ltLEm76iCcOeo/54jvq4i3By4WVoM1fiYXVP2s2l8OPOMkACwTU3bA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wQQRuK4i
Subject: [Buildroot] [PATCH v1 1/1] boot/uboot: add support for custom zynq
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
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
---
 board/zynq/readme.txt | 18 ++++++------------
 boot/uboot/Config.in  | 34 ++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk   | 12 ++++++++++++
 3 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index 87df7236f0..5a68d32fee 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -71,17 +71,11 @@ you need to add them by yourself.
 1) Start with a defconfig supported by Buildroot (e.g. Zedboard)
     make zynq_zed_defconfig
 
-2) make uboot-menuconfig
-    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
+2) make menuconfig
+    Visit the following menu to configure BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
 
-    ARM architecture  --->
-       [*] Zynq/ZynqMP PS init file(s) location
+    Bootloaders  --->
+       U-Boot  ---> 
+          (<Path to ps7_init_gpl.c>) Custom ps7_init_gpl file
 
-3) Copy ps7_init_gpl.c/h generated by the Xilinx Vivado tools into
-   output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
-
-4) make
-
-Note: The files in step 3 will need to be re-copied after cleaning the
-output directory and at this time, there is no way to save them as
-part of the buildroot configuration, except as a U-Boot patch.
+3) make
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
