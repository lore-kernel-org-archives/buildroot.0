Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7FBECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9387C61075;
	Sun, 11 Sep 2022 09:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9387C61075
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8W5VeKC3-ZO; Sun, 11 Sep 2022 09:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97F861037;
	Sun, 11 Sep 2022 09:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A97F861037
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 407771BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E27D08135B
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E27D08135B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynWeYuBvr48s for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E396183EB2
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E396183EB2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD9BC835E4; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:31:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75cb88ae667002454aa3a3ec2b927cd171f3bfff
X-Git-Newrev: 4c2f0b918c65b1de934800bcc82e571ca4f96b86
X-Patchwork-Hint: ignore
Message-Id: <20220911084826.CD9BC835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: allow
 ddr firmware version override
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c2f0b918c65b1de934800bcc82e571ca4f96b86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for selecting a specific version of the DDR firmware
version. For example Variscite's imx8mp-var-dart SOM requires the
"_202006" version of the lpddr4_pmu_train_* binaries.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/Config.in       | 10 ++++++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 39 +++++++++++++++-------
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 06c4d8036c..0c1913e227 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -82,6 +82,16 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR3
 
 endchoice # DDR training FW
 
+config BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION
+	string "DDR3/DDR4/LPDDR4 firmware version"
+	# Needed for backward compatibility, the package used to
+	# unconditionally use HW version 201810 when DDR3/DDR4 was
+	# selected
+	default "201810" if BR2_PACKAGE_FIRMWARE_IMX_DDR3 || BR2_PACKAGE_FIRMWARE_IMX_DDR4
+	help
+	  Use a specific version of the imx ddr binaries. Leaving this
+	  field empty will select the default version.
+
 config BR2_PACKAGE_FIRMWARE_IMX_IMEM_LEN
 	hex "(LP)DDR IMEM padding length"
 	default 0x8000
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 4884079d5c..99fe71a91c 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -36,6 +36,11 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(3)).bin
 endef
 
+FIRMWARE_IMX_DDR_VERSION = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION))
+ifneq ($(FIRMWARE_IMX_DDR_VERSION),)
+FIRMWARE_IMX_DDR_VERSION_SUFFIX = _$(FIRMWARE_IMX_DDR_VERSION)
+endif
+
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
 
@@ -44,9 +49,13 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 	# lpddr4_pmu_train_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
 	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
-		lpddr4_pmu_train_1d_imem,lpddr4_pmu_train_1d_dmem,lpddr4_pmu_train_1d_fw)
+		lpddr4_pmu_train_1d_imem$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		lpddr4_pmu_train_1d_dmem$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		lpddr4_pmu_train_1d_fw)
 	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
-		lpddr4_pmu_train_2d_imem,lpddr4_pmu_train_2d_dmem,lpddr4_pmu_train_2d_fw)
+		lpddr4_pmu_train_2d_imem$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		lpddr4_pmu_train_2d_dmem$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		lpddr4_pmu_train_2d_fw)
 	cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_1d_fw.bin \
 		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
 		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
@@ -67,13 +76,17 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 	# ddr4_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
 	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
-		ddr4_imem_1d_201810,ddr4_dmem_1d_201810,ddr4_1d_201810_fw)
+		ddr4_imem_1d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		ddr4_dmem_1d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		ddr4_1d_fw)
 	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
-		ddr4_imem_2d_201810,ddr4_dmem_2d_201810,ddr4_2d_201810_fw)
-	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_1d_201810_fw.bin \
-		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_201810_fw.bin > \
-		$(BINARIES_DIR)/ddr4_201810_fw.bin
-	ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
+		ddr4_imem_2d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		ddr4_dmem_2d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		ddr4_2d_fw)
+	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_1d_fw.bin \
+		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_fw.bin > \
+		$(BINARIES_DIR)/ddr4_fw.bin
+	ln -sf $(BINARIES_DIR)/ddr4_fw.bin $(BINARIES_DIR)/ddr_fw.bin
 
 	# U-Boot supports creation of the combined flash.bin image. To make
 	# sure that U-Boot can access all available files copy them to
@@ -90,10 +103,12 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 	# ddr3_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
 	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
-		ddr3_imem_1d_201810,ddr3_dmem_1d_201810,ddr3_1d_201810_fw)
-	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr3_1d_201810_fw.bin > \
-		$(BINARIES_DIR)/ddr3_201810_fw.bin
-	ln -sf $(BINARIES_DIR)/ddr3_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
+		ddr3_imem_1d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		ddr3_dmem_1d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
+		ddr3_1d_fw)
+	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr3_1d_fw.bin > \
+		$(BINARIES_DIR)/ddr3_fw.bin
+	ln -sf $(BINARIES_DIR)/ddr3_fw.bin $(BINARIES_DIR)/ddr_fw.bin
 
 	# U-Boot supports creation of the combined flash.bin image. To make
 	# sure that U-Boot can access all available files copy them to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
