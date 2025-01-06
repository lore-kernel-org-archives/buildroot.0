Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E6FE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 10:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E772040196;
	Mon,  6 Jan 2025 10:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-CoCCnzzbgY; Mon,  6 Jan 2025 10:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A65194019A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A65194019A;
	Mon,  6 Jan 2025 10:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 461B4D92
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 10:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2700060661
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 10:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3X3u6NCCw-t5 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 10:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=jean-christophe.bauduin@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89F95605F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89F95605F7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89F95605F7
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 10:23:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43616c12d72so22670185e9.2
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 02:23:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736158988; x=1736763788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sM1KSaUXBxdcby0cIZTdoPMG+C/ieO+/FiOknBnLtmQ=;
 b=d0pStFeoxIIfEDwHjHcOquJVLl0F+OjPYxrPNzdVYOsnvZ4idRcz34STCxYkPPDEt0
 2UVSkakk3U3RxsaFg+TrIfG7cjlg3B+leS/np3O5/GD0nUlj9FWWocoDV1mwsucY5hT5
 7+z6Toy84s01A7+FYVBpK8fboQK4H2A1M4OcGoNWhRQx7U1NF8o8djLN051pOiQoibma
 fDKFn9DkC2uix1AzKwGbKXUA7keBc4f9Ha1vLXttDjJk1oXN3HWvHOHQixYVeBmM/+N+
 30R8i6zCfvMmVG6Mmvw1s/ZlezR4g/mkmPkyDdqFJg164oy1lxLiA/p03Svz5ToiZQ1J
 bBJA==
X-Gm-Message-State: AOJu0YzXBpyedV66NApjHBJtVzhKIBrYcvK7OzegmPFevuJgU4rFcAaZ
 w0Ubr41WEt0UGrQpQ4CxuvGC90qcNKlwo/aPqc65rwb8U/uzgewA6MwX1GCkNKPcqmggGRxsYQN
 gtPQ=
X-Gm-Gg: ASbGncu4uLl4oso4a+mELralry2YOhm+EkMZkm4qPnkLfexHcvuDmp/hdYEOgp7ZJZY
 FgHDx9cLJTvxoz6bjOmW9iGjd87VtQNnwiyM8qHDZ/u21dHBGkTFgKiY4zOCVUn7e0VGB3jtJDA
 V/MemCDujEG+U/2R5Gxda5qnItiXa9m63O55GaYbgV0tlxoSnyFznnZP+5Rp2hcTPMG2PBCaa10
 DVJ82cSkojN5I49tIazCjxFnm8sF4N/1RFc8sKIiYfoWVYclQko/0Fk5yBNfk7LdDOAVIKIJdlH
 1uPVqo3TC4+Qwy8KnQPAa9CaG4BvakwvU3U/gedS06tb2IDPVX8=
X-Google-Smtp-Source: AGHT+IEi0eHu3tyxRVyNXnPMWT4DgWkF3fb43iCcqYMmDPceuj5/knhsvKXioM2j0StULng8U152DA==
X-Received: by 2002:a05:600c:3511:b0:436:17f4:9b3b with SMTP id
 5b1f17b1804b1-43668b78733mr195803055e9.6.1736158987498; 
 Mon, 06 Jan 2025 02:23:07 -0800 (PST)
Received: from jc.local.essensium.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b2a4sm598387215e9.27.2025.01.06.02.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 02:23:07 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  6 Jan 2025 11:22:57 +0100
Message-ID: <20250106102258.3315858-1-jean-christophe.bauduin@mind.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1736158988; x=1736763788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sM1KSaUXBxdcby0cIZTdoPMG+C/ieO+/FiOknBnLtmQ=;
 b=fzbeLKjOwWRVkkpgecsDiHytFr6BOkToyMmengssMLh+/Qu+4MUcvQYtOxmYMXOn3f
 gcFcqGLM+AA/Q8JKqfbGKqPD2Osf+qbrrojkmQwMDfYjOu4yl6Jzqhsl62cpmtEqbCiQ
 47onY4HyFuSiBM5xwBvtTc2oALwPSu/ARVZYi+B1Cyh2WqAAJV5uDirCtImNaKrZd4v4
 C0+ceyX0nimj4EYqV0BKjPZSl/sfz8HBMVjvDR1U72aE/ben9bFbIZjxXGkcro1/oQdl
 q9EHU5JHBp7FCgEr+EvDdug6/P6vLrYJDtZJ0g1yOkJ9xeZpMxcJmecCZkmDxmPG0yNV
 KGxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fzbeLKjO
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware add Trusted Board
 Boot option
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
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the fields to enable trusted boot. Giving the option
to use custom ROT keys. It also provides an option to build and link
a specific version of mbedTLS inside of ATF package.

Signed-off-by: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
---
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
