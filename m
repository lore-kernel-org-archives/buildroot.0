Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14610C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 07:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8CD040674;
	Mon,  4 Mar 2024 07:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZnrHjQn3BDZ; Mon,  4 Mar 2024 07:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9022D402FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9022D402FD;
	Mon,  4 Mar 2024 07:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59A421BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 470F881F8D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJq_RAsbywGj for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 07:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::600;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4E1181F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E1181F8C
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4E1181F8C
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 07:41:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVUS/qgdyIz+odcnr9OZP2pZHC3Qbjt+ishGrCzQHsGa0FkRRwt7m8E/yEFzGIx5fFXG1MlLofkaiMMgPjcYyli2XDQfWgcEnE3IPHy4kM6ToCqX53d5AkKw30A66uFILd9kBCX88LHmipI+iwcW/DKCD+JDKjLampADRuUeMxV60NzWfwtFLCUzuqoAaTsK+dRr4KZy5Ty5vq/1pVcK6bvsJlSvWmgRw4dOMBpt0QYPjhrbnAA6Dqx+TbP43oFyiG9M/o89Y06WTdp3ZXO5hcMIXoBsYw/gJu2ZIg5aaftthneOmHPL49gWqzT8CaEqw8UJsBNJReIa4byRkdUDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC1YZzc0muvIFYxsrXknmNr19PKE16uP3koSGE1MU54=;
 b=exEICJkx9KsWoviEEaIiObblxP7J1WCyCJoSwFike0J483dEJFkimgSyT0xPh5TiUBvD0ZA5Im61PLMd3RYQeuAXo4KTpDT2l9BBjaiA69hzXhvc+MHT/goyAtzKOMtQWzsoZRHMZ/Hyq5qtjt0KT6m7Pe/r+C0elbzYpJ0q3KRnKlsA35d72z3obDQ256JBUpA4e5jGNhcL8eexiCBN3KK51NMxjOLe9Tznm4yxGENqQDI/jjg5Gd6dgejMUgu+iyZDi70uKc2vfAd5MuOFhu0tnNKjpwONbnW4MRc9R/kS+1pk9/M3MHGsh0uxgUbMc74vdpPQOUldUIp0vopU5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CYXPR02CA0014.namprd02.prod.outlook.com (2603:10b6:930:cf::20)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 07:41:51 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::7e) by CYXPR02CA0014.outlook.office365.com
 (2603:10b6:930:cf::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 07:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 07:41:49 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 01:41:49 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 23:41:48 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 01:41:47 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Mar 2024 07:41:35 +0000
Message-ID: <20240304074140.1537910-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b47afea-c156-4eee-6e21-08dc3c1e8d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bGHvqeasW2JibJYzgrCMekArG71wbnhJ5tDuAkSk8DS0dKUmCcvJwmM1fuK7SCEecDCYNmttOgiok1Ic4MJI+3Tefg0JvqJ/4begOuDcaf0N0BEGdC8CsOFhdATcuIOIz4qo+UOX0OMboWyrQxAyQ+HMvgDmCzfDa11618XV/o6UOrxkZFV3GAXVWJ/BveHy552GZFcckOKQ+g8uHXJTTgIZHOxr8qVXCOmvT6CejpJM0sH0HlmyrX+LjlCluCQTS68vH/gGsRg7QBNiPc78+PRPAZf2W5golBt2g2CjoO89G9QrJk+hPkScwCloCItcVBN2FWCFPxzh+7i+8yvn45nOzwN/lRWcK+K4/8xVgxPINajP+BpUYcENO4gID/voNNyqaw3uy5X+VnvzCud2xrLAyar8FB4UA7OBT2JWPI9eDylR0gDa+jWXn/+1Y5sgA/Ie+mhPWhgz2+NS3dHNIBMbncXO2f5fRr+eZF+g4QBYyvX/5eEGOzx54F6rcu3FEl/ILlZw5v3KGzJjTGlY7eSR13MVcQbujEBzs2xSz0m84081UJdiuuECZUIEqnZMnhMFTFRKyA40RMFNtZyv5yB2IxJd1aA/eCY6t0O+SqbgR1lEbjYVT1QzdeHcuEvJjwQ8kSsHeuBTi9a3nSY+kns42LtwBZR4hluc9pQs10BmvSFkAvtrioi2A2ZdJvEOl1U8CbrqKm5k1PU7oP1OZjOF6bSL4gWSwlTmGx+xHdxq8Gj1YE9WW2XLeVFYTBJ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 07:41:49.7685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b47afea-c156-4eee-6e21-08dc3c1e8d64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wC1YZzc0muvIFYxsrXknmNr19PKE16uP3koSGE1MU54=;
 b=xfvCGG5PYYaVTv/kjuQEw7HZyYcfaxNllcxhG1WvfE/vMxjUCglRAaFkMv/J1nYpaU3Q0ukkn6mVgMBcJ9McADIo2D2/UGMbICXJk4T/kcFkAwfqQxu2+o03n4pQOJyqxOqKjkitjO9iBRUvLeHlWngKJopIyI+3H+Il473VqRk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xfvCGG5P
Subject: [Buildroot] [PATCH v11 1/6] boot/zynqmp-firmware: new boot firmware
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
It requires the toolchain-bare-metal package that includes a bare-metal
binutils, gcc and newlib which can be built for the microblaze architecture.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - builds a bare-metal gcc toolchain instead of requiring an external
   microblaze toolchain
V2->V3:
 - corrected custom cflags option
 - added support for xilinx_v2022.2 version
 - added zynqmp-firmware.hash
V3->V4:
 - no changes
V4->V5:
 - reduced all lines to <80 chars
V5->V6:
 - migrated to toolchain-bare-metal-buildroot
V6->V7:
 - removed patch numbers
 - changed dependency to toolchain-bare-metal-buildroot
 - removed hash since version is configurable
V7->V9:
 - no changes
V9->V10:
 - removed patches for supporting versions older than xilinx_v2023.2
V10-V11:
 - set default BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH to
   "microblazeel-xilinx-elf" to avoid stand-alone build failure
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 boot/zynqmp-firmware/Config.in                | 22 +++++++++++++
 boot/zynqmp-firmware/zynqmp-firmware.mk       | 33 +++++++++++++++++++
 .../toolchain-bare-metal-buildroot/Config.in  |  1 +
 5 files changed, 58 insertions(+)
 create mode 100644 boot/zynqmp-firmware/Config.in
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0bfe91f064..b677d9cd5b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2283,6 +2283,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad43..c7478fef2e 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -24,5 +24,6 @@ source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/zynqmp-firmware/Config.in"
 
 endmenu
diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
new file mode 100644
index 0000000000..d68ec2cf6a
--- /dev/null
+++ b/boot/zynqmp-firmware/Config.in
@@ -0,0 +1,22 @@
+config BR2_TARGET_ZYNQMP_FIRMWARE
+	bool "zynqmp-firmware"
+	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	help
+	  This package builds the PMU Firmware application required
+	  to run U-Boot and Linux in the Zynq MPSoC devices.
+
+if BR2_TARGET_ZYNQMP_FIRMWARE
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.2"
+	help
+	  Release version of zynqmp firmware.
+	  Only versions xilinx_v2023.2 and newer are supported.
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building zynqmp firmware.
+
+endif # BR2_TARGET_ZYNQMP_FIRMWARE
diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
new file mode 100644
index 0000000000..383d888fba
--- /dev/null
+++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# zynqmp-firmware
+#
+################################################################################
+
+ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_SITE = \
+	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_LICENSE = MIT
+ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
+ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
+ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
+ZYNQMP_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))
+ZYNQMP_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
+
+define ZYNQMP_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(ZYNQMP_FIRMWARE_CFLAGS)
+endef
+
+ZYNQMP_PMUFW = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf
+
+define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(ZYNQMP_PMUFW) $(BINARIES_DIR)/pmufw.elf
+endef
+
+$(eval $(generic-package))
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 6fe969357f..7d33a68c5c 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -2,6 +2,7 @@ if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 	string "architecture tuple"
+	default "microblazeel-xilinx-elf" if BR2_TARGET_ZYNQMP_FIRMWARE
 	help
 	  This option allows to define the architecture tuple for the
 	  bare-metal toolchain.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
