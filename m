Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAE0E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 14:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA60B40638;
	Mon,  6 Jan 2025 14:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DV39R85PCDx; Mon,  6 Jan 2025 14:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75769406D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75769406D5;
	Mon,  6 Jan 2025 14:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50AF1DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31B58406A5
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id futkkXuPbXr8 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 14:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=jean-christophe.bauduin@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3488406D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3488406D5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3488406D5
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:47:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862e570832so1616769f8f.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 06:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736174836; x=1736779636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+sZ7yOLB52vbuGrwEpK+FyImCkuQhi2XpyyKx68Dz6w=;
 b=PKIF7Aq8roJv05fWiHHgaKfTPwfmZ3RFbzs2mGWqr/86jIJ1mf+eIcrCOj+w02AgOm
 mZj5G4QNbmHFj2NKZKh1jc80fEVjOkKn1HfyuAUVjjIQW+hWGabEGHeI7mj8VS5Wu0tm
 Tn5WAPAshNluSO1Lb4DWZ6difnUWqA1dNs4Bl1spj+PB/5TQxiP7yCDfidNn9QEl3l6W
 ciZ3qTtMJjdDYff0vDuuytwtzqWpNLXCbaPLn6v4FBvzEUCe8FfT8AyEh6i172N39OKZ
 2XjiczpOklCjabmLs1bcw+zpNusT1R8V9ohB8aPez9y3eZJG2wnEoGoRu7+EoNf3aiTu
 xYTA==
X-Gm-Message-State: AOJu0Yyw0Jz720fSsY2+J8jcqx4atxxey45aszWgbrd+Q3zMWX/h/Uty
 DV3DMIHGibao7HTNrMsfcbW5YvVLuA6xThKRZ4WeLmYOEwMspVFkmzKvzDr4mB/QPKT0OoRIabv
 b3zSXzQ==
X-Gm-Gg: ASbGncvNVTFkqm/ITxHgeDMiClKi1DAnfaGbsz4GQft7C/365ylMhhsDKZMJEzx+lhs
 rT7jLU2woUgFv2avNxAMv1IIyXKydpgYy3oWJDEpPzO/4nuZWYkHKyGdL5APjDsOnHHkVjcCSqF
 BABaO9umtb+/AVP6xNzGq8khwE0wWRLxPmFw2QrOEFuVa+iBb5OhPa7XGLE05++sup9jC6gP2Qy
 D1QK5YKtl0L5ojCquCmkdUqfdBO8tUnHNzqHOstnTx55DAMW6bq0fgMnEyyjmtHz/bllXXEA93l
 0nzxUqqvGA6d6X+u4DLUQUkH9KtIdohzTG2mZ1zDzGy7FYXZN1w=
X-Google-Smtp-Source: AGHT+IFr3W+i+aAyeRW9+XybI0SzUqtTgPI361z3zNqZcFxW5nmImhc5UBiN9dAzEtcL0dO/JuqZ4g==
X-Received: by 2002:a05:6000:70a:b0:385:df73:2f43 with SMTP id
 ffacd0b85a97d-38a221e20ecmr18459289f8f.2.1736174836022; 
 Mon, 06 Jan 2025 06:47:16 -0800 (PST)
Received: from jc.local.essensium.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2dfsm48631435f8f.74.2025.01.06.06.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 06:47:15 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  6 Jan 2025 15:47:10 +0100
Message-ID: <20250106144710.3340188-1-jean-christophe.bauduin@mind.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106102258.3315858-1-jean-christophe.bauduin@mind.be>
References: <20250106102258.3315858-1-jean-christophe.bauduin@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1736174836; x=1736779636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sZ7yOLB52vbuGrwEpK+FyImCkuQhi2XpyyKx68Dz6w=;
 b=TYToUuNh7qi3CUiVJgHZnErNUj9lKfAu/EPTXtmgQgoETUgVOXOVprm35E5/ux12sK
 n73tb1IzrAPMW/4agjFnKw9wfusgBod+jINMQp0pXsJsDKHCTbeUHJQwH8tYiH4ir8o6
 n7PV0kUITHr2g1vwDq/2w0lGDHyhLV4m4s1EdUHHsgB/brBC3xu3Ux62m/5ERiwLc3Nm
 /15WD9mVRacLQBo0OYhQC5ZI6ntNfnKUWjTnIqqwHmGdFt5f/SEL7MMPL9zUoduaZZFO
 n9UyWYAWi/owEUAWzRpU/ult/yEoSWu0CoaUphMd3QSjm2MCVih5z4TnCFwDUoUlFNzz
 dUIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TYToUuNh
Subject: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware add Trusted
 Board Boot option
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
From: Jean-Christophe Bauduin via buildroot <buildroot@buildroot.org>
Reply-To: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
Cc: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the fields to enable trusted boot. Giving the option
to use custom ROT keys. It also provides an option to build and link
a specific version of mbedTLS inside of ATF package.

Co-authored-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Signed-off-by: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>

---
Changes v1 -> v2:
  - adding Javad Rahimipetroudi as co-author

 boot/arm-trusted-firmware/Config.in           | 23 +++++++++++++
 .../arm-trusted-firmware.mk                   | 32 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index c8deede9cd..80efc3e35d 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -273,4 +273,27 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL
 	default "strong"  if BR2_SSP_STRONG
 	default "all"     if BR2_SSP_ALL
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOARD_BOOT
+	bool "Enable Trusted Board boot"
+	help
+	  Enables trusted board boot.
+	  More info:
+	  https://wiki.st.com/stm32mpu/wiki/TF-A_BL2_Trusted_Board_Boot
+
+endif
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOARD_BOOT
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ROT_KEY
+	string "Path to the ROT private key"
+	help
+	  The path to the private ROT key used by ATF.
+	  The private key must be in PEM format.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION
+	string "The version number (ex 2.8) needed for the secure boot"
+	help
+	  This option will enable the build of the specific version
+	  of mbedtls required for TFA trusted boot.
+	  For ATF lts-v2.10.5 use 3.6.2
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 172a930b5c..dfd4480ba6 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -18,6 +18,25 @@ else
 # Handle stable official ATF versions
 ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
+
+ifneq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION),)
+ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE = mbedtls-$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION))
+
+ARM_TRUSTED_FIRMWARE_MBEDTLS_SITE = https://codeload.github.com/Mbed-TLS/mbedtls/tar.gz/refs/tags/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE)
+
+define ARM_TRUSTED_FIRMWARE_MBEDTLS_EXTRACT_CMDS
+	$(WGET) -O $(DL_DIR)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) $(ARM_TRUSTED_FIRMWARE_MBEDTLS_SITE)
+	mkdir -p $(@D)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE)
+	$(TAR) -xvf $(DL_DIR)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) -C $(@D)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) --strip-components=1
+endef
+
+define ARM_TRUSTED_FIRMWARE_MBEDTLS_BUILD_CMDS
+	$(MAKE) -C $(@D)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) \
+	CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" lib
+endef
+ARM_TRUSTED_FIRMWARE_POST_EXTRACT_HOOKS += ARM_TRUSTED_FIRMWARE_MBEDTLS_EXTRACT_CMDS
+endif
+
 # The licensing of custom or from-git versions is unknown.
 # This is valid only for the latest (i.e. known) version.
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION),y)
@@ -190,12 +209,24 @@ define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
 endef
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOARD_BOOT),y)
+ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT_ROT_KEY=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ROT_KEY))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	ROT_KEY=$(ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT_ROT_KEY) \
+	MBEDTLS_DIR=$(@D)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) \
+	GENERATE_COT=1 \
+	TRUSTED_BOARD_BOOT=1
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS))
 
 ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH))
 
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
+	$(if $(BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION),
+		$(ARM_TRUSTED_FIRMWARE_MBEDTLS_BUILD_CMDS)
+	)
 	$(if $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH),
 		cp -f $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH) $(@D)/fdts/
 	)
@@ -212,7 +243,6 @@ define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
 endef
-
 # Configuration check
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR_BUILDING),yy)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
