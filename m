Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC33C4829F
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28BF4010C;
	Tue, 13 Feb 2024 17:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVhlCKpu5Pv1; Tue, 13 Feb 2024 17:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36C541794
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F36C541794;
	Tue, 13 Feb 2024 17:29:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB1341BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4D4C41583
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGxGwXO-wF5D for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D52041610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D52041610
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D52041610
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33cddf4b4b5so493941f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845311; x=1708450111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DUpQr2MRmIcjJbWWyjb6ek5HxpXekyRG64XkR5/NPZg=;
 b=oWFNm+eUcJsCfUcSFk2Vz7/9kOkaHozxDFhyENZ1tMamIxEkiQghknB28i0jLWD6I+
 ZsFT/MC97TtkShClm/FONdeHNg5gWwwci/0/dl0npQOWp0hFcfT4rM/Xivo2IbrPdv3e
 9QPxi+9OlnARakzKSKiTYMGIkVJzg3utDJyHTqWXVISX2+whzGNS1g1EfY0n/buCDEaz
 uHiNDW0rR0JrcXYdNu2MDADKJaq0z3gKnCgv7J1JHxYtMF2OhuKuyeEXpCNV28L8spLV
 1cX+eCv+2lM/MP0CKSsyEIMEZQmVGn0Rc+dYnpUcQwVdUQlLZHPe0xmZbIvr0UN+5C/x
 P0KA==
X-Gm-Message-State: AOJu0YyUsOzYFLFcrX3HUFiiVjTw+DuuCWTPGwSEGhJ+O1wr0PSHi0hP
 121AdzJABuSvXMj2xI2TibmO2faPFbJq020DZyMuC+JjgVx+5WxnsfQoNmASwvfUhGQYapBIPDk
 0
X-Google-Smtp-Source: AGHT+IGWc1gt+57VDvT2p0/J2FEBTXZPeQUeUlFEx8OWp8jSwNG40MY7LNhSLAowQnkNLY8Xpa15og==
X-Received: by 2002:a5d:4441:0:b0:33b:66ce:1c with SMTP id
 x1-20020a5d4441000000b0033b66ce001cmr9043747wrr.1.1707845311160; 
 Tue, 13 Feb 2024 09:28:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFWQGspFUydsHn+1bGIwlJ5V2qagkTYs7wMLEaD6U/SVr5hyQmgk3YyzxWu17ivVzGD5GX9VQ3CXXSAQgAo3b30oqSMjakTZRDA2bH6DVm7tj0NQ==
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:30 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:17 +0100
Message-ID: <20240213172817.2872849-22-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845311; x=1708450111;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DUpQr2MRmIcjJbWWyjb6ek5HxpXekyRG64XkR5/NPZg=;
 b=Xrq7A3GVrBGJnCqaE2+BoUtXhbCcNsWxgP3iYGAUnv3BhCljvy1wy+RXyM4gz0q3Vg
 SA6v5UfXudH0TIBPkgEDdZlkU0mSuDE0zuwr++VGJJBcNpCuSRJftATu1RU7KnkzU2U5
 2/Rx/3nfQd0U0IYyBx+0PEFF6e1+JM9Bn1rwccycRZHkCm5wHRNPmhhyfWMmw6Awll+j
 kM0YjyR5LMQA7wcpZeStpMwV63uJGt54llYuViWIfVxc3U4Hxlg4r2WZIndNM+PswOyR
 d0i28CBI+qhqfuRNMLwKyzt6CjjLGBnLko0sNhu6RidaGTBFjHkHhSB9MYCMAenxq+8N
 t8EA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Xrq7A3GV
Subject: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
---
 Config.in.legacy                          |  7 ++
 DEVELOPERS                                |  2 -
 boot/Config.in                            |  1 -
 boot/ti-k3-image-gen/Config.in            | 81 -----------------------
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  3 -
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 54 ---------------
 6 files changed, 7 insertions(+), 141 deletions(-)
 delete mode 100644 boot/ti-k3-image-gen/Config.in
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a869279af7..2b59a65f1c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_TARGET_TI_K3_IMAGE_GEN
+	bool "ti-k3-image-gen removed"
+	select BR2_LEGACY
+	help
+	  ti-k3-image-gen tool  has been removed and replaced by
+	  U-Boot binman tool (requires U-boot >= 2024.01).
+
 config BR2_PACKAGE_TINYMEMBENCH
 	bool "tinymembench removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e5f2dd2327..df6c60704c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -151,7 +151,6 @@ N:	Anand Gadiyar <gadiyar@ti.com>
 F:	board/ti/am62x-sk/
 F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
-F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
@@ -3219,7 +3218,6 @@ N:	Xuanhao Shi <X15000177@gmail.com>
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
index e54f5ec992..0000000000
--- a/boot/ti-k3-image-gen/Config.in
+++ /dev/null
@@ -1,81 +0,0 @@
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
-choice
-	prompt "SoC family"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	bool "am62ax"
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	bool "am62x"
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	bool "am64x"
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM64X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-	bool "am65x"
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM65X
-
-endchoice
-
-choice
-	prompt "Security type"
-	help
-	  The target SoC security type option for image gen.  Valid
-	  options are "gp" for General Purpose devices, "hs-fs" for
-	  High Security - Field Securable devices, or "hs" for High
-	  Security - Security Enforcing devices.  Note for all High
-	  Security device variants the TI_SECURE_DEV_PKG environmental
-	  variable must be defined at build time pointing to a valid
-	  core-secdev-k3 folder location, otherwise the build will
-	  fail, see
-	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	bool "gp"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	bool "hs-fs"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
-	bool "hs"
-
-endchoice
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
-	string
-	default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "am64x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "am65x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
-	string
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
-	string
-	default "gp"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	default "hs"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
