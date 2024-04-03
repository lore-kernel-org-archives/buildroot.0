Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A3DCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C88B7418C4;
	Wed,  3 Apr 2024 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F29jf2UwDV_Y; Wed,  3 Apr 2024 19:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAAF141937
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAAF141937;
	Wed,  3 Apr 2024 19:54:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0632B1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6D8C418C3
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4CrHoHxznNS for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B57A417FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B57A417FF
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B57A417FF
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3439ce73766so85438f8f.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174055; x=1712778855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aK0JSiQtM7aP95Or6BoPBmbNlSMeUCsz21J0sTew2EE=;
 b=gbN7hQuuWvvlgXIN309q44jCoR2o5HbsxFZJuPKrWDFNdjuLIpegiIeRL6llpRwgSe
 qYUs7MqqUsuy2SpBhRvJNCvQNbCANyxt1ZQDgF8j7gi7wTXDjtE/k5hLybXAeq8rzC/a
 EeuJfl7v4qbsN7PgguQANgsVmcY0SN8lm4BwOwejUY/ttJO+NejUPPoqPZkakQ4kOkjt
 ZcSgywh1v/UJ9U39s+IbpLoT3Jjm1yVqP99ciA0Vcx4yNROtgJwVeJdmHdroGx/XNnb4
 VRWYo8EEeb1G5l/s+iJk+oYQm4boOJVuh+m3xE7LjFOCuBLre+WL9z+791UKd30YfiO+
 grNQ==
X-Gm-Message-State: AOJu0Yyp+HklZ2KPC1t8GQozJtzzrsvzjJ40blG3xdTBssXLr6XZOgcV
 boG/JNGp44m9nw4hObS9pgRS/APD5jnPMXgDWG5TyXwDPZeDd5QufHXVWdgo8WaBImgTzJUk3GS
 o
X-Google-Smtp-Source: AGHT+IGLzDacjUAqnDK4v1RYjKmYwxC/FkT13t6W7I80lI9k8GZnqw5f14csjeGR+fL7+CQTS0Avrw==
X-Received: by 2002:adf:f605:0:b0:33e:c3dd:3fc5 with SMTP id
 t5-20020adff605000000b0033ec3dd3fc5mr313187wrp.42.1712174055286; 
 Wed, 03 Apr 2024 12:54:15 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:15 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:49 +0200
Message-ID: <20240403195403.1359007-16-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174055; x=1712778855;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aK0JSiQtM7aP95Or6BoPBmbNlSMeUCsz21J0sTew2EE=;
 b=uU9mbj65F7JZjiTwn2+1/2421SfQ3j0QA5cBk2dTAfblsWvNqvZpW3iwE+mCwDTXVk
 2euz7HO20NwKmEe1Aw/HsotuxSE8Dx8biO5390iuSN6gwEW/3X3ljF/CLVQ1C9GST8iA
 GMuC0WWAK/MOD0Koash/FHdEswJnPJRmic6HJhec7HlarJbwc3SfqEcoGWyq63CNBs0u
 GSjpEJsORtwISojR6d6Rf2RvBwKVe1/n8SMIWOqP2eEH+N/Sw1E4sbGF2Ny8djcKO42q
 PVQy6L7fRYaUgM0LYwcsifKwWy9jtH2zX+wvo43gsLnF2DSl1dZSu/FWLp1wRsefXXkz
 Nz0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uU9mbj65
Subject: [Buildroot] [PATCH v11 15/17] boot/ti-k3-image-gen: remove package
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ti-k3-image-gen tool is deprecated an replaced by binman [1].

All defconfig that was using it have been updated to use U-boot
binman tool instead.

So, we can safely remove ti-k3-image-gen package.

[1] https://git.yoctoproject.org/meta-ti/commit/?id=835811cf8586926cf78a961d090f4e6150432235

Cc: Anand Gadiyar <gadiyar@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                          |  7 +++
 DEVELOPERS                                |  2 -
 boot/Config.in                            |  1 -
 boot/ti-k3-image-gen/Config.in            | 37 ----------------
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  3 --
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 54 -----------------------
 6 files changed, 7 insertions(+), 97 deletions(-)
 delete mode 100644 boot/ti-k3-image-gen/Config.in
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7117f8f528..b750bc457d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_TARGET_TI_K3_IMAGE_GEN
+	bool "ti-k3-image-gen removed"
+	select BR2_LEGACY
+	help
+	  ti-k3-image-gen tool  has been removed and replaced by
+	  U-Boot binman tool (requires U-boot >= 2023.10).
+
 config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 	bool "u-boot TI K3 DM option has been removed."
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6b38db0857..5f0e20f1fa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -158,7 +158,6 @@ N:	Anand Gadiyar <gadiyar@ti.com>
 F:	board/ti/am62x-sk/
 F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
-F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
@@ -3225,7 +3224,6 @@ N:	Xuanhao Shi <X15000177@gmail.com>
 F:	board/ti/am62x-sk/
 F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
-F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad43..87e1b7c00e 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,7 +20,6 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
-source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
deleted file mode 100644
index 5cdf52d452..0000000000
--- a/boot/ti-k3-image-gen/Config.in
+++ /dev/null
@@ -1,37 +0,0 @@
-config BR2_TARGET_TI_K3_IMAGE_GEN
-	bool "ti-k3-image-gen"
-	depends on BR2_TARGET_TI_K3_R5_LOADER
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	# We need FIT support in uboot-tools, which is why we select a
-	# host package
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
-	help
-	  Use TI's k3-image-gen to build a separate bare metal boot
-	  binary from a separate SPL that is running on the R5 core.
-
-	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
-
-if BR2_TARGET_TI_K3_IMAGE_GEN
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
-	string
-	default "am62ax" if BR2_PACKAGE_TI_K3_SOC_AM62AX
-	default "am62x"  if BR2_PACKAGE_TI_K3_SOC_AM62X
-	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X
-	default "am65x"  if BR2_PACKAGE_TI_K3_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
-	string
-	default "ti-fs"  if BR2_PACKAGE_TI_K3_SOC_AM62AX
-	default "ti-fs"  if BR2_PACKAGE_TI_K3_SOC_AM62X
-	default "ti-sci" if BR2_PACKAGE_TI_K3_SOC_AM64X
-	default "ti-sci" if BR2_PACKAGE_TI_K3_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
-	string
-	default "gp"    if BR2_PACKAGE_TI_K3_SECTYPE_GP
-	default "hs-fs" if BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
-	default "hs"    if BR2_PACKAGE_TI_K3_SECTYPE_HS
-
-endif
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
deleted file mode 100644
index c968c5648f..0000000000
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  f89ea4b1f5c992455b1a682fde48359221b53f3294135df4bf20feea6aea90e4  k3-image-gen-08.06.00.007.tar.gz
-sha256  f012e8d000d711d0539e5b4c812fc1d3a59c10fc1e3d6ea155556f5b78286845  LICENSE
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
deleted file mode 100644
index 64be9a18f2..0000000000
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-################################################################################
-#
-# ti-k3-image-gen
-#
-################################################################################
-
-TI_K3_IMAGE_GEN_VERSION = 08.06.00.007
-TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
-TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
-TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
-TI_K3_IMAGE_GEN_LICENSE_FILES = LICENSE
-TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
-
-# - ti-k3-image-gen is used to build tiboot3.bin, using the
-#   r5-u-boot-spl.bin file from the ti-k3-r5-loader package. Hence the
-#   dependency on ti-k3-r5-loader.
-# - the ti-k3-image-gen makefiles seem to need some feature from Make
-#   v4.0, similar to u-boot.
-TI_K3_IMAGE_GEN_DEPENDENCIES = \
-	host-arm-gnu-toolchain \
-	host-python3 \
-	host-openssl \
-	host-uboot-tools \
-	ti-k3-r5-loader \
-	ti-k3-boot-firmware \
-	$(BR2_MAKE_HOST_DEPENDENCY)
-
-TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
-TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
-TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE))
-
-TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
-
-define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
-	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
-endef
-
-define TI_K3_IMAGE_GEN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) \
-	$(BR2_MAKE) -C $(@D) \
-		SOC=$(TI_K3_IMAGE_GEN_SOC) \
-		SOC_TYPE=$(TI_K3_IMAGE_GEN_SECTYPE) \
-		CONFIG=evm \
-		CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
-		SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
-		O=$(@D)/tmp \
-		BIN_DIR=$(@D)
-endef
-
-define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
-	cp $(@D)/tiboot3.bin $(BINARIES_DIR)
-endef
-
-$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
