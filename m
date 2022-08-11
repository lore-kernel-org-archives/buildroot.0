Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC93FC25B0C
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 12:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2976182451;
	Thu, 11 Aug 2022 12:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2976182451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zt8huKajPHMp; Thu, 11 Aug 2022 12:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E8982496;
	Thu, 11 Aug 2022 12:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E8982496
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C56A1BF41F
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 12:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07E7C401C5
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 12:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07E7C401C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJkvztsAv1Bd for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 12:20:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 305D84014D
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 305D84014D
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 12:20:15 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o22so22688243edc.10
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 05:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=fGQBQ/Esk3UoMXQR9xHVzDSH3q4l3Ln9QNHRaGy1JII=;
 b=vpe+FxosTUdfLJA7feJqRTcQjizBEGZHm7ZqsWwQNpWH9uu6CsGkWObJevUIWANPCk
 bvrqqUvl3jSSivO3O+9z2H0V85guiAlgZM1BEwYFpD/hPtcllzryeGfE2eLz6mtGjYYi
 /jmISz/yOyaENELGqJAbu4X2q7EfNg3jdjxXA6eUm4A1G8dqrvUb8h0tjBFZE6qgz1v8
 FEkK4aGKNyM9QZxixdUeQtbIPIuDEdO3TLHTBn1Ls9HhMPvB5AG4WdkNNTrutKU8jWsk
 SkPJ5WBZftreyxfrIegT2xAHVrg5RhIyrMFrRQN8GUy6ivGiX/n5AOdy8j/urhiw9j+Z
 rZYQ==
X-Gm-Message-State: ACgBeo3uYqwsZXxAdQhf6lwlNmqqCMgp1EPZnFqlMzg5jU95rYQYWQO1
 tps66/5rCDunTyOxh6CFhvVhVAaFJS23mg==
X-Google-Smtp-Source: AA6agR5LeA1IHzd9W7DB3yFhSQu9qXYXCnj1fPIjoZlI2ytIeme0eGA2HexdliHwMFQz/8i/hNIlTQ==
X-Received: by 2002:a50:fc89:0:b0:43c:bf1e:165d with SMTP id
 f9-20020a50fc89000000b0043cbf1e165dmr29745364edq.161.1660220413802; 
 Thu, 11 Aug 2022 05:20:13 -0700 (PDT)
Received: from nitrogen.local (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 d3-20020aa7ce03000000b0043e67f9028esm8992562edv.20.2022.08.11.05.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 05:20:12 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 14:20:11 +0200
Message-Id: <20220811122011.716045-1-bram.vlerick@openpixelsystems.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=fGQBQ/Esk3UoMXQR9xHVzDSH3q4l3Ln9QNHRaGy1JII=;
 b=2N8Co2zdO5NMMFdIOKFbxyh/oCrfG/hMGZXBRUPSqx7In3yHxs/He/gHyRk9UlW66s
 Ckc0cHcrSA8JipzBr44mzLMlXeuB27ahJBkQ/cHtbSOf8EG8s2qR81JSE//KoVZFZgcq
 RoCa5oE9paT2gbniV2nB94HwSMO/Ncsa7idN+XEHZSF4sDZbyBE+b7d9OxrZctX+smT2
 FlVyt+eMGonMY4sF91pEbGnmmF8QxYJuNVYM9bykcACN6z2GLi7IgFiCqTGazkGsQnQQ
 cEN80WMWW0awdUHeQ9c/VjMebVFb+bxLu5J4y1+Uv997SRBp3pjFAtIDbCM5r78rJvIV
 9GXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems-org.20210112.gappssmtp.com
 header.i=@openpixelsystems-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2N8Co2zd
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: allow
 lpddr4 firmware version override
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for selecting a specific version of the LPDDR4 firmware
version. Variscite's imx8mp-var-dart SOM requires the "_202006" version
of the lpddr4_pmu_train_* binaries.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 package/freescale-imx/firmware-imx/Config.in       | 10 ++++++++++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 12 ++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 06c4d8036c..f894d87250 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -82,6 +82,16 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR3
 
 endchoice # DDR training FW
 
+if BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
+
+config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4_VERSION
+	string "LPDDR4 Version"
+	help
+	  Use a specific version of the lpddr4_pmu_train_* binaries such
+	  as "202006".
+
+endif # BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
+
 config BR2_PACKAGE_FIRMWARE_IMX_IMEM_LEN
 	hex "(LP)DDR IMEM padding length"
 	default 0x8000
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 47c21585aa..40aa84e162 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -38,15 +38,23 @@ endef
 
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
+ifneq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4_VERSION), "")
+	FIRMWARE_IMX_LPDDR4_FW_VERSION = _$(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4_VERSION)
+endif
 
 define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_fw.bin.
 	# lpddr4_pmu_train_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
+	@echo lpddr4_version: $(FIRMWARE_IMX_LPDDR4_FW_VERSION)
 	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
-		lpddr4_pmu_train_1d_imem,lpddr4_pmu_train_1d_dmem,lpddr4_pmu_train_1d_fw)
+		lpddr4_pmu_train_1d_imem$(FIRMWARE_IMX_LPDDR4_FW_VERSION),
+		lpddr4_pmu_train_1d_dmem$(FIRMWARE_IMX_LPDDR4_FW_VERSION),
+		lpddr4_pmu_train_1d_fw)
 	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
-		lpddr4_pmu_train_2d_imem,lpddr4_pmu_train_2d_dmem,lpddr4_pmu_train_2d_fw)
+		lpddr4_pmu_train_2d_imem$(FIRMWARE_IMX_LPDDR4_FW_VERSION),
+		lpddr4_pmu_train_2d_dmem$(FIRMWARE_IMX_LPDDR4_FW_VERSION),
+		lpddr4_pmu_train_2d_fw)
 	cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_1d_fw.bin \
 		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
 		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
