Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4C0C7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 15:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6920960AD7;
	Thu, 19 Jun 2025 15:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKJtEALLrhrU; Thu, 19 Jun 2025 15:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F85360B1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F85360B1B;
	Thu, 19 Jun 2025 15:39:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E8B416B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 15:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 854C660AD7
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 15:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4ASa5FY65hF for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 15:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::62d;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C270B60B1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C270B60B1B
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C270B60B1B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 15:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQs4JPv5GQmGIXWzIV/oEWiU2iRcT4UZEPOlmeaoa8Rk1lyXOjMfkYYKAEhU6+tiIl206ail3xNUoUVd1p+VgFeEF8ZxL026z3xVVxXdnW30YY1nedfvtWRYKbo866vYEhyPkWGEdRo/tTghes9j7BBjSItUIm/YUB4A7GchQLXjmfKXc2LkGo1H0dawuS4b44Wt5/efp8bd+U2/u2ZwAXszi0NuuQCIssZiposaNm3TFT3Su0nx9pPUV+ClQ7nbe/lAoApjwGXvfDrhgpysnG7CbMMWZgfMxkAYzHTdluVtU0kVR9OVsmkxFcOThcuqK1AkvQDtTinpvWzOHAqI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF1cyaecb/cPFUv2VdGvXdYjcyspXIuOwWLCSO3IqZ8=;
 b=qCv7o09qXeKRA1ukPIK7xy6jhp0bOFXST8VmzD5Egv7tXD22HC6YR7jYzAR+ToXpWHlmgZzzCwZ3A87z2iheJrYxNVKWA/kAbZkjZRV8twcpQd026N5dm3WlONvVk7Rgz0IrldOBcbz45EmXYc1pEzgzu6HqySvHD+mW4ezjrJucudsj7M8pI+A92tYh+sH9e/vdWMOeeXDHJuBAGTmNPq/aCPaVsnIk7LsCdNbOpwiH7fs/fKQ8YggxRQWlOHVBGevsxRVUf07iyNohn1qHRpZBS6vNJvA3oqw/d5HKMQaDlAJHznM+XhdhjiHxQfDivSRPaEHfhi8YKOla+YjSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA1PR04CA0013.namprd04.prod.outlook.com (2603:10b6:806:2ce::19)
 by CY8PR12MB8298.namprd12.prod.outlook.com (2603:10b6:930:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 15:39:27 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::15) by SA1PR04CA0013.outlook.office365.com
 (2603:10b6:806:2ce::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.23 via Frontend Transport; Thu,
 19 Jun 2025 15:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 15:39:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 10:39:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 10:39:26 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Jun 2025 10:39:24 -0500
To: <buildroot@buildroot.org>
Date: Thu, 19 Jun 2025 16:39:22 +0100
Message-ID: <20250619153922.891360-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|CY8PR12MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 316279f0-afe5-4aac-4bed-08ddaf477950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/5aN2l+Ly3wsmkt4sU7A90A0y5xm5LzoBdlZ19uHImytJ0C5Cv3BOFlw/uan?=
 =?us-ascii?Q?R8gPazaILEdmvYXvfZFI8kCcXK6jqeN5DNOwdcEP/DIUw7T12dZuzn8nDh1a?=
 =?us-ascii?Q?hEkWI6Wd7i/+AJVHOJA/c8d8+TYPzz5MbXhH8I2rnVop5yq2LoHr2SsPhzz3?=
 =?us-ascii?Q?4D7f4BqzMiFIfhcf21lOSt+tA/E+gzFOwoUKXYLJ/o+xPWIk60xw9budQ7u4?=
 =?us-ascii?Q?qUO5zhlemMhbJG8K9FgYbvXt0yTZa8A9TEFT6YkOvTZjSZeU8WMcn35iFsN7?=
 =?us-ascii?Q?nj/TZpx6JWs8PDJIfmxIOxzF9vDU8IW0xinkPrU8XD9pFerY8/QFo9U4Hraq?=
 =?us-ascii?Q?245zdLDckBs9n7TTM604ddCvkrlyEXdDNmXLenxX2VMl4Qb9cPdPSvbZITWv?=
 =?us-ascii?Q?TLvRSw/UJ57+K0gu7iDHonWWPBPvHScJMxftbV/EhM4dGTo4Ppqfo8fgJ/Kj?=
 =?us-ascii?Q?NcItP8QFiX9ZCE8NX0a4Vbrg3Qw7Pm0krFAZS5X1SvV3Yygh2JZNFsh2fxfn?=
 =?us-ascii?Q?8JAIuWJfF9xMjK0j1ophTt8QJGu6rFr0+gaoOi8lk1WOnouVyWxA23ZrmEiZ?=
 =?us-ascii?Q?3woglMUPNqjUV7+kCKfK7uAld1rlIuzb0HDoiVoYBzWSZHGCNy8aGISaxG+V?=
 =?us-ascii?Q?UO8bHa+JSfW0UX9W2wRwjUqjxIApLuhmIyhGGgYK+AiIaQjypgstQmKLqtH+?=
 =?us-ascii?Q?e0I5ZDiVrY36bGbRkn4VxRA9NjKTOSLYfCtDyEnLQIrsj8HfOJIYYw1rvFYg?=
 =?us-ascii?Q?fBWOgXaS0FPYATy0RCIe6PfZbKB+TNHa50gxHzIMUx3QzUtF21g+z/EgMCmx?=
 =?us-ascii?Q?1X840pLo/W0rW0od3+XtnmzVbSYb95RK1I33uM080BaWF4/uKprBqqUY3XsA?=
 =?us-ascii?Q?ku74TU5ZY5Ys3EYxJ8+9HxW2fwIvsaIL+/nsdPShRvsviirz3sFUGCjdCTWS?=
 =?us-ascii?Q?e35CAZBr485aDhemq339RVzN2hzjPQkWZtlSbTREB2bfSfXymJSFq5Xd4JTI?=
 =?us-ascii?Q?w0YK9rSciibhAy5YvPGaesJ8HePyf/ioj0gsgM5e3navAgsGn/32ftBZVF/R?=
 =?us-ascii?Q?rmrWEC2vb9ZYze/q5Pn1fdgOsolj3V4BM8GsK34Q/QtX8swQzz7Z71jcv5I1?=
 =?us-ascii?Q?HYxW4VuFrGdET3gr9F2QHuYYI9QOqVsk3O5CwebXbC4BrkDZjR4fVwfPM5qs?=
 =?us-ascii?Q?W5SUe4VNYrRx49MzLpFrBbE84qbmr6CjRE7jGaN8UL4c6EkBpGR4gC5U7hHV?=
 =?us-ascii?Q?CN31tFXp3O+SiVfuvEaX0HEgekxSs1sQxLEtHp2n6ya4Pln0zt7+7Qna86fY?=
 =?us-ascii?Q?9EYsfDW8JKCWw+kApSb7fxt7QQAxBPI/w+1vOLLdPUo4PZIXAkRBllmXQVoT?=
 =?us-ascii?Q?RInhH3ZwUaY2M/cNNa7ete9N2hVF3TV2fqD6HyFTlb54ig/tcd/ZFIzKIP0B?=
 =?us-ascii?Q?FZIjofDQqb9iJcRBOi4HGTJCual/OsLRdAlJWP+U4zjykgK4jDTpISS9Ljg+?=
 =?us-ascii?Q?zYukejJ7oGK8a6iFLIf1IZGnsITr3lj7v50JFwfrD/j5VUxQIAuTTBV9mHNU?=
 =?us-ascii?Q?ffECliH7zRTfsNjl9Xk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 15:39:26.8671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 316279f0-afe5-4aac-4bed-08ddaf477950
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8298
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF1cyaecb/cPFUv2VdGvXdYjcyspXIuOwWLCSO3IqZ8=;
 b=wOjI2Bw2Dd2+TFTPAupPVitfwumCQsIgndPudA3jI2ZIe0Liuhv0ToyFNTUv1VfndfqXB9rUxXKXdxGqDwUGEPGgTIYxaiqF+EW5fmJust9tzyDN2MsFm5Hw4U/3GkjB8sZMEKcq7j/E9MsYPQjI+r1atztYqE5rWjW2YRMS7D4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wOjI2Bw2
Subject: [Buildroot] [PATCH v2 1/1] boot/uboot: add support for custom zynq
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
V1->V2:
- added step for enabling BR2_TARGET_UBOOT_ZYNQ in readme instructions
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
