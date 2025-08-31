Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650BACA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 13:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 273C0605A4;
	Sun, 31 Aug 2025 13:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwbPP7fpZV8i; Sun, 31 Aug 2025 13:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F172605C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F172605C5;
	Sun, 31 Aug 2025 13:35:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19F9310E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BBD2407DA
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dXy4bUgv_Qg for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 13:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::60c;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33B0E4018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33B0E4018A
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::60c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33B0E4018A
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:35:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kt5dQIEOAu0M9m5/3kcgQbNyxO5ajE2RaWl/4c3fpVk482iDaHaGJyd596Kp0gTO3aACcQRqxRr9cn2E7wVcY6WfXNIstgMhwoJF89br/OtHz3MmYsNB7JDFQt0cZL7imF9F+8JBLb219K/g0bm6isyhbRII1GL6grOJvs7FhjK2a9qXfn0yw5o4nTaBa4LCxD91XDMVPe5T/aFIwW9UpDP/3gE/TrtJRBEsUcbdwZklnj7PeZHtG+7QhsqAHAeRCu3Ovf/LIQzwp1Y4UmS9SDrkY/fG61co/+aNIu+Rg9iPbMmc/TLpKWCIRZUf3eobGzAOsPrK2LRI/J6P9jrpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixTvh+jJ6tyQ1bF0mQ1zjCJjs3me7qSnjMzA0Oem7g0=;
 b=PpCt2vMuPDu+1jiQcRyym3lXFLaffEVaJ5u0hX1OFj7izY5m90R3Ngzg3iwVOgYk/GIvfYs9a/4Q4oITx7+qLlcbSu2xrt9s40r/VrdOpnGnwpT2oOFa3gCvqFbTp9MKmf199cp8KDKG+D0F7WkVzhVOii1nSLlM9tmSuWvSEeKqPD/Ymp2HEuORHWPgwBy19rbEt3D9CIo46RlQTaXePXkM1dMWkB5vQ8Ezwzq7UBJ2do4xlN7bTJ1nDpAo0AWP2blxOlvU5Xrrx11vbFS11fuBBouV6o6oreNIBfPwZj5PX5yqifp0jGHmZKzsXToC4SfnGifdFJ0APa6aGQCKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0085.namprd03.prod.outlook.com (2603:10b6:a03:331::30)
 by DM4PR12MB6325.namprd12.prod.outlook.com (2603:10b6:8:a4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 31 Aug
 2025 13:35:33 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::b) by SJ0PR03CA0085.outlook.office365.com
 (2603:10b6:a03:331::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.25 via Frontend Transport; Sun,
 31 Aug 2025 13:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Sun, 31 Aug 2025 13:35:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 08:35:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sun, 31 Aug
 2025 06:35:29 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 08:35:27 -0500
To: <buildroot@buildroot.org>
Date: Sun, 31 Aug 2025 14:35:25 +0100
Message-ID: <20250831133526.332716-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DM4PR12MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e0cfdb-1fb5-4d04-0c04-08dde89341f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+IhaOIlwMyIc7J1Yw/3FpwhNMSjcbZ6FjNNwIRz5+oGJjmf8ntTBo59Wwex+?=
 =?us-ascii?Q?ybZKIht3jR5+iChLaoSf/FtNxxvRXO18z/yPiwm5ZzrplUhNdPfrveAPzmqb?=
 =?us-ascii?Q?AzTAm87K2eo/QeRjbTsBClUKP4B3Mo4c/sL5Bc2JhDbArRbZkUqP1TW7+Nf6?=
 =?us-ascii?Q?54JozOLRHyEbhA18xCNQ7WN9Ubg+Yd1qcTsb8fH6TwjBZafNkm3vVgK7x5E8?=
 =?us-ascii?Q?pgL8uM0ENxUl6ByeZll8ehpsueU5rvM5rosyQitRgMxCQoH8qkI/92CarPOo?=
 =?us-ascii?Q?zk2X8WzUJvgIuIwRHagyUUyoifZ0IWB6AGrAhEBzEI41PP1Eku8P7FHuu6AX?=
 =?us-ascii?Q?L/bmHUANiYZWFWbt1FJ+ixBUjByO1qYbnhtKOnkxmclXrBXRwxvlz3eDU2op?=
 =?us-ascii?Q?qzDSnlaELC9rQSvPeJVIIVZkWRnAoToobskoXe0HvApvhTys6j8F+bHRQZRS?=
 =?us-ascii?Q?8WCUw0KWtVeMrw5Tz7x6sbipptFgCAjecnNb4igHmVwDstkbNGp8ziFwRCBJ?=
 =?us-ascii?Q?31i+iCGdgHI0CF+WdS3DKwImoHAeZH1HxrzlUkmSH3NLM8gfKRAyRN2lE8tE?=
 =?us-ascii?Q?wJOKTMDBcj1oZc+OcfwYH2mjuYOiUiKYhwW/5rxFihFCixFYez8dzyCWBqjY?=
 =?us-ascii?Q?5KhIOJXec15Rcai3rinYIOnLwubFl664EJ6O7cV8DBt/QrYhb+9sEVKywGtZ?=
 =?us-ascii?Q?2xArBtZWLUxNAZKOZvZMa2oxDB/CdhWfzBiz8o4Sh20qvk0FHHJCYPFizXRq?=
 =?us-ascii?Q?RPML4n3Sn21fszCJgufBwi0YnJdjn65QPMpmW/84QCO7a0dFH6sIJ2PJORkM?=
 =?us-ascii?Q?3oMWGo2EjYoqbwqqmz8NP+vqYnyTOCCTnrKZqMdvZNK2q+va4vAuDhR3yj79?=
 =?us-ascii?Q?iURHZN//vDPAahDjBavpaRLOPpxvTHLVf0Chg1sD+RGchKoXwCOpAQBqcPBn?=
 =?us-ascii?Q?Q6zQuFejiAHIDPoSHfPr2qUwYL2Mpoqs2TQoHN35UAU44NhweVJgIBYWpMl5?=
 =?us-ascii?Q?xroTNIChwM2FFX6+H0TqSDljqpn5s+4fH/0Fek4sllYHOW9d8L/uwtzXyWrw?=
 =?us-ascii?Q?2uA05W25SbT6R1yUU95yq8tnh2lojIjoPtDJWpOOdiCGbFXxD4JQzYPsFSto?=
 =?us-ascii?Q?u/lxcrvIaP+rroVEejKx4B/Nh/i8pMDzwMNNBJ7w4qaqdcSaTt842FtNbgXU?=
 =?us-ascii?Q?J8NvTrbCruhHFN6xBtHweWTgvW+DDt1UxciNlKYK/FbC/g4IplHgon57Eh1W?=
 =?us-ascii?Q?myAgmWWSEAESb151rIknMI9AH0gDLBXDEUDRpq5j8AI5JbRknUtc/iNbqBAG?=
 =?us-ascii?Q?h+zaJCQUygVXlU0jnyOzmm6gn7uPqrL8l3IZ1pcXuARUqqMjRshiKbv8DcFu?=
 =?us-ascii?Q?KgZK2Zks94cetr7yb+fEkmk7xfNmDJi2m2vSVU07k3hF9rMXiCwqdLtpr0vB?=
 =?us-ascii?Q?IyUM1EsuXg4nzQUZrY1pdabd/8GzicCwHuZE8IL9iQZGft03QVJb16Pa3tU7?=
 =?us-ascii?Q?PqzzUeBjUnkGePHq+p1fBnFFxnqmSze2j1NkASn2zfR1rqLyPV/3ZdGom1EG?=
 =?us-ascii?Q?JhdYESLskBg38SgTLj8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 13:35:31.9546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e0cfdb-1fb5-4d04-0c04-08dde89341f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6325
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixTvh+jJ6tyQ1bF0mQ1zjCJjs3me7qSnjMzA0Oem7g0=;
 b=Kr5UMmeabgLSK6/0oEZHkKXdgFixl6APCOzg+2U12R71B0xI2U73qCMlS8KNAKOdFCmbUK0RHqUPUmBH6GN1INSe9FQBBPxJ7lVEFg3PlehEpipFA/URoW3RIaN6GJ/+MXcYmTJ43qBMaMyZWsGA4EOEGzk41/OkoT5077lYm9w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Kr5UMmea
Subject: [Buildroot] [PATCH v4 1/2] boot/uboot: add support for custom zynq
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
 thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com
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
V2->V4:
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
