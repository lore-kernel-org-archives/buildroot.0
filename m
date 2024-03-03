Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E0CC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69B1B414C8;
	Sun,  3 Mar 2024 09:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LjwmrRpaKfpz; Sun,  3 Mar 2024 09:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50D35410CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D35410CA;
	Sun,  3 Mar 2024 09:21:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF561BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7970960ABE
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bZkds4HXW2W for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::600;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B21C60647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B21C60647
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B21C60647
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyJ3O2BydSMP6QQY072eemOnq2Piil9IlJMynaXsyn5jv4oF5atFSCzWgEgztOfeoF5pIzdqaYEJ99lggxdqCziw+oe7XoEgBCRdp47UAZi90TD9FuY87LP/++jHL5F394MA0LH8QVuL1+M17KdQ+v4DvlogqIijRkKE3p2Px4sahZz4AqTeiidUAXug5NF7NDSky4XYXGFJuW2xeTJP8/hyCNohFEe9s/DJjel6KLOvi6/cfCQVty29FWsKxn0EQqoGEDl/ejQLSBQilj5hMcbpJJ2J3G4meuca/gLv2rhQn8TRkegPmF1hGDznzQ9sp3PqgsTZzSYMF3vtk9goiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp+lmdp68/MX2Q2FmN/wubiMqmQau48tOgIx7uukmTI=;
 b=j8wEmgNGI1/T/uOStVcaEq51ntM3CPpU5zYHBpi50F6hi/X4bQS2mYeG+6DMenDjItHJLyTSv52Vt+zKbQp3s9ZLfB9l4YiYKvev9c/R32JsgU3J+8UP01DccYJFa7KYUdxp3CHltVW7SwS32xCY+ziPvdhWzYA2xrDxI+nJrJIv7gwG1uLjjfexuiv6ORHXAVuhdy2J4BtFwcbO1FV51Cl0RGjoCZ2/wdnEyvjGEAfAUrKmWqJ9P1EVXy6oxwnSogOTGRODAtQ+TO9hLM+crjXcy5fmS+wygjWTjTwru+c+FMDsImsQ/TVL8QgFsnGJ0AH3/aA0SkoDTgo9p/NsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH7P220CA0034.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::7)
 by BY5PR12MB4162.namprd12.prod.outlook.com (2603:10b6:a03:201::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37; Sun, 3 Mar
 2024 09:21:08 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::48) by PH7P220CA0034.outlook.office365.com
 (2603:10b6:510:32b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37 via Frontend
 Transport; Sun, 3 Mar 2024 09:21:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Sun, 3 Mar 2024 09:21:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 03:21:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 3 Mar 2024 03:21:06 -0600
To: <buildroot@buildroot.org>
Date: Sun, 3 Mar 2024 09:19:54 +0000
Message-ID: <20240303091956.352661-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240303091956.352661-1-neal.frager@amd.com>
References: <20240303091956.352661-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|BY5PR12MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: 74961911-7017-4ff1-ba83-08dc3b63429e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T0kohaOTYZly7Lgix8yNddDBbq2UYwQcMUVZC3HWgkoSP7T86HENIVkPEoNqJcXXnVbZc8dNY+E89n7iY5goPiCWsO28QUiUz12tMuQ9O2lk+4PEqzRPz52fXchwYN5O+MjwAMVhjSLSxaw4JxVdJo5ewRbLn4bYwcMKjgLqrk9d7iINSa22sCo3vpUMoAZ0GKLDeIpHCrWNe/yjk86WMV1ndpzfYEvalAjK7TmUff9jwjSuvnFgJqsNFg8Q6Rzbg1kN70H+JHl3qYxqhHaDgoxHgC4Wa9CuBWVtREvUDgXgr0EOcj3arF8AOy5e+DVMnVirbfdPdbkfEfRr4qOC8+rPcZodTETcMl9J8F5Rjh2F3rgKEJjxDa+UIhVdGKjJlGP549MKdLuW+1GXuIFkSs4EyficI+B02Z6msHMJkHCbOO1TImYGGOvKZFd2MWQ4zbnw8SN1/zkFQ6VQiAdSlXHATqz3/1sKiqM2HaAOdGcl95RYo2afTOf5VFwY4CsFozdErVcpqql47GkI3LjSgZJNE7gHXzjTW5IwPGv1F/eEbYQM/x/czUOeGEVzrsWG0tIC7V/5cAjuHW/9bpouGPw80Cl2t74ROG+s86ShkbUIP9f2hLoThVj7MkshrZcgj+mwDVvKMP09rXg7zoIbzwBNj2gdgp+WRkvidFAkO43k9DJKvmBKjUeEI4MIrJ7qrkWYoFT7vsgiJrFZD8gnBw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2024 09:21:08.4798 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74961911-7017-4ff1-ba83-08dc3b63429e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4162
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp+lmdp68/MX2Q2FmN/wubiMqmQau48tOgIx7uukmTI=;
 b=Yqzvg5ELan3XiBBr/vmTtsy1Djsh+dd7VRup/Q5hBwi2TTLrWS07wC+WZbCb82BwrJOrk3+R+4QgXbQ4an4gorrCNy+cpScSESP9Qpji96tZBitSgunUVTJ3MPxK8gLhFYcsDsbd4AsXAD3bZuXt1AKMz6XX+evkR5Rujt8oooA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Yqzvg5EL
Subject: [Buildroot] [PATCH v10 4/6] boot/versal-firmware: new boot firmware
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

This patch adds a new boot firmware to buildroot for building the versal plm
and psmfw.  It requires the toolchain-bare-metal package that includes a
bare-metal binutils, gcc and newlib which can be built for the microblaze
architecture.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V5:
 - automatically select bootgen as a needed tool
 - reduce all lines to <80 chars
 - add help for PDI file location which could be URL or local
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
---
 DEVELOPERS                              |  1 +
 boot/Config.in                          |  1 +
 boot/versal-firmware/Config.in          | 38 ++++++++++++++++++
 boot/versal-firmware/versal-firmware.mk | 52 +++++++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 boot/versal-firmware/Config.in
 create mode 100644 boot/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b677d9cd5b..fa3424074e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2283,6 +2283,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/versal-firmware/
 F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index c7478fef2e..da5ccb6b9c 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -23,6 +23,7 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
+source "boot/versal-firmware/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/zynqmp-firmware/Config.in"
 
diff --git a/boot/versal-firmware/Config.in b/boot/versal-firmware/Config.in
new file mode 100644
index 0000000000..cda72c7704
--- /dev/null
+++ b/boot/versal-firmware/Config.in
@@ -0,0 +1,38 @@
+config BR2_TARGET_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	select BR2_PACKAGE_HOST_BOOTGEN
+	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	help
+	  This package builds the boot firmware apps for Xilinx versal
+	  boards, so that they can boot u-boot and Linux.
+
+if BR2_TARGET_VERSAL_FIRMWARE
+
+config BR2_TARGET_VERSAL_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.2"
+	help
+	  Release version of versal firmware.
+	  Only versions xilinx_v2023.2 and newer are supported.
+	  
+config BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building versal firmware.
+
+config BR2_TARGET_VERSAL_FIRMWARE_PDI
+	string "pdi file location"
+	default "https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/vck190-versal/vpl_gen_fixed.pdi"
+	help
+	  The PDI file defines everything which is board specific for versal.
+	  It gets parsed by the plm.elf during boot.  To boot a custom target
+	  based on versal, this should be configured to point to your Vivado
+	  generated PDI file.
+	  
+	  The location of the PDI can be either a URL for download or a file
+	  in the local repository.
+	  
+	  This config should never be undefined, so default configuration is
+	  for the vck190 evaluation board.
+
+endif # BR2_TARGET_VERSAL_FIRMWARE
diff --git a/boot/versal-firmware/versal-firmware.mk b/boot/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..fa932510a1
--- /dev/null
+++ b/boot/versal-firmware/versal-firmware.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = \
+	$(call github,Xilinx,embeddedsw,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = MIT
+VERSAL_FIRMWARE_LICENSE_FILES = license.txt
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS))
+VERSAL_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
+
+VERSAL_FIRMWARE_PDI = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_PDI))
+
+ifneq ($(findstring ://,$(VERSAL_FIRMWARE_PDI)),)
+VERSAL_FIRMWARE_EXTRA_DOWNLOADS = $(VERSAL_FIRMWARE_PDI)
+BR_NO_CHECK_HASH_FOR += $(notdir $(VERSAL_FIRMWARE_PDI))
+VERSAL_PDI = $(VERSAL_FIRMWARE_DL_DIR)/$(notdir $(VERSAL_FIRMWARE_PDI))
+else ifneq ($(VERSAL_FIRMWARE_PDI),)
+VERSAL_PDI = $(shell readlink -f $(VERSAL_FIRMWARE_PDI))
+endif #VERSAL_FIRMWARE_PDI
+
+define VERSAL_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(VERSAL_FIRMWARE_CFLAGS)
+		
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(VERSAL_FIRMWARE_CFLAGS)
+endef
+
+VERSAL_PLM = $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf
+VERSAL_PSMFW = $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(VERSAL_PLM) $(BINARIES_DIR)/plm.elf
+	$(INSTALL) -D -m 0755 $(VERSAL_PSMFW) $(BINARIES_DIR)/psmfw.elf
+	$(INSTALL) -D -m 0755 $(VERSAL_PDI) $(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
