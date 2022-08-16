Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F52C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 07:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A20540607;
	Tue, 16 Aug 2022 07:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A20540607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1jWLqS4huNh; Tue, 16 Aug 2022 07:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71DB9405BD;
	Tue, 16 Aug 2022 07:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71DB9405BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47E4F1BF2A7
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 07:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21534408F9
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 07:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21534408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pf7iwqtq_Cc8 for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 07:05:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65B62408DB
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65B62408DB
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 07:05:22 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id a89so12302475edf.5
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 00:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=LY81qhq2TdSnUAHubW+8Hbp381wuFqsUm0feJ6t8scE=;
 b=RrQtlzYcoSnpjNPw8eikP0YtqyIGSxAQ+YgFir5PZt2YMo6Szyi7cLWA4VKqwPUQpa
 TMqe6UNV8/Pm8RV24nvGdD239do8riIKDW+i43Y5kAxO33SQOgrgL4tUOR+tFJSt4P8d
 GAY44sbE08bGrbIEhdb85qRNvSVKxbk574fPCD7AMoSZ4vfB11hhL3O/MiVcDAJGXsLN
 KCooopHYx6lyTbjogX1HobB3DHwmSTzfC2RCaHKjc8TXfORcsAGQFqPm3UdYS3nEp4Vp
 U3CyJNyw01ERy+4GlIFWnOB9EUNwSvY/DTVuzaBWrXtVgy1x0xOXLSnmZjdGTh/1FLc7
 jx3g==
X-Gm-Message-State: ACgBeo0dJt6sByiIiqAXxbjmC5Y9h6vcXHnCWE1YxkBqq4NF2tcmj9s6
 jV3G1rlYZPXJwGIhJ0U7JFp+2wdiqBIqYw==
X-Google-Smtp-Source: AA6agR4xwEJjivaiwGQkVSLamG0WXVgEcJl+BCplyEUFtmf4XseE69rpBsYZ4oxvcclR76qSqXqN4Q==
X-Received: by 2002:a05:6402:280f:b0:43d:f946:a895 with SMTP id
 h15-20020a056402280f00b0043df946a895mr17952537ede.229.1660633519916; 
 Tue, 16 Aug 2022 00:05:19 -0700 (PDT)
Received: from nitrogen.local (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 n16-20020aa7c790000000b0043d5c9281a3sm7917388eds.96.2022.08.16.00.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 00:05:19 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 09:05:17 +0200
Message-Id: <20220816070517.2770099-1-bram.vlerick@openpixelsystems.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=LY81qhq2TdSnUAHubW+8Hbp381wuFqsUm0feJ6t8scE=;
 b=YFzfjliI2LnqurLnZxxZsMf76Hmu3kcbE9OkhmH+vY+BvWDIqKbmd5L4sPKs6RtsCh
 nTBF+3qQbbTgTDSv8OqQazM4XDmskF4qG1qNkLt57jPsg9ESpdSKxpFu0gW0r4E5cK9o
 qegCgKOg4y3pxNOY3uWXuxIF7B8n8pzNyaMB7tJeIVXBs40Z7me0Vc/HqkQ/xdlqTr5D
 kqW2TnsFN6IwpDRMm4SJw8mvV0nQ9TORUZdijohTUN4SFHG0OdEwd/2FKOzmb3Ge3m3m
 RdE/jk0aX4RKcfwFMDCgLbQ3iueOETjWzcD0occbCbnUWWMOtnI3EFPFfC7GOhnlAIpS
 ngSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems-org.20210112.gappssmtp.com
 header.i=@openpixelsystems-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=YFzfjliI
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx:
 allow ddr firmware version override
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for selecting a specific version of the DDR firmware
version. For example Variscite's imx8mp-var-dart SOM requires the
"_202006" version of the lpddr4_pmu_train_* binaries.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 package/freescale-imx/firmware-imx/Config.in  | 10 +++++
 .../firmware-imx/firmware-imx.mk              | 39 +++++++++++++------
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
index 47c21585aa..3fd07617dc 100644
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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
