Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E173DCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76546417D2;
	Sun,  7 Apr 2024 10:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKoCgxoteM6v; Sun,  7 Apr 2024 10:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A9841B51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A9841B51;
	Sun,  7 Apr 2024 10:36:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33BB81BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20F0F403E9
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adSCtRf9bTkG for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6CB040614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6CB040614
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6CB040614
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41650de9e1eso2013655e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486124; x=1713090924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3QmAOpyr34xuquXPEhJN5lDLk55Ljs55ZVIpCzAK1Z0=;
 b=f33dZaStPWWZEvgDQjdhK+RCYJlEsZKdW4T4xuqwHhAzynV2eLVfJMB7aYoTmhl+Cm
 i5Bp6EGAFKOTWPQcn5Et5qXEiyeuVoOlawZ63JRtyc6GmiS9QjC7uekH+gqN6VdC622A
 3mvXswCQCVVBeYVaBZZR9RFiXkYmFhv8isSYhfF4sfiVgTy+jGD7496zzKln+EFpwUAs
 Yp1AKJ5Syazh0VZMqoo7S18MXRhqAKdFpr8hKxzUAyvBr3GWZFVUxI+jSwDWhTlbK1FL
 kF0dYx7/LoYiAZu/xwxmbR7pJQnnDqQ82XYxAtzQMU8Tlv1D3a+N+9USzD8MQUmKw/w7
 qGmQ==
X-Gm-Message-State: AOJu0Yx9eK1n8yxDkDIp+9qQrAr2QgzXWrJVhpArsOnh8aYoWSCfstUI
 ISgBarNN7T3hL9tXwt9pd7w0Ri8y7fm1Y/DZlgPfm7pzsQDRAcOAi33SEombIK+yfY4p+AeI55Z
 A
X-Google-Smtp-Source: AGHT+IEzj8WudiDyX7KMn7wQScw0KPD4TjfV15L55024O+8d4oewYk12jqQyB6GZcMN6GAabK0XTtg==
X-Received: by 2002:a05:600c:4592:b0:415:4379:d36d with SMTP id
 r18-20020a05600c459200b004154379d36dmr5975980wmo.2.1712486123755; 
 Sun, 07 Apr 2024 03:35:23 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:23 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:35:08 +0200
Message-ID: <20240407103512.1112712-16-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486124; x=1713090924;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3QmAOpyr34xuquXPEhJN5lDLk55Ljs55ZVIpCzAK1Z0=;
 b=3C1xL3p5NUYwODt4msni734wSHVW3Q2QlsJyh1nqbmFbtpkijIeFZrbMUt9bS0S70M
 6GTQZGYRBRMM7y/9jrKkFbTNj34BcN8sO7hKQztgSEQZe7SU/uxbXMKMG6ccAkWzc7sq
 SpMTUhPtDeQw4T6tFAogRVO2Lbvi8L7mjdX/zX3Ad+CPJEBpVvd2lmb0AlhSIRYKywrA
 yFUj1uUnG+5QMezFNmdLIuXHuFpQXbuoGjzCpwC4SaMJhgmCKvd0pBpdvjhCYWI5ibU7
 eYQpqF4SqHdxgy+TqB4vgn2mWG2wr+nai9IPfjtxI4mRXStKxRduuqbUuFA974RyxW69
 7BWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=3C1xL3p5
Subject: [Buildroot] [PATCH v12 15/16] boot/ti-k3-r5-loader: remove
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since all AM62 and AM64 defconfig has been updated to use binman
and ti-k3-image-gen has been removed, binman is now mandatory
for all TI K3 SoC. So remove BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
option since since it can't be disabled anymore.

We can remove BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN without
legacy handling since this option is not part of any Buildroot
release.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/Config.in          | 11 ++-------
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 30 ++++++++++---------------
 configs/ti_am62x_sk_defconfig           |  1 -
 configs/ti_am64x_sk_defconfig           |  1 -
 4 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index c0c7222a10..d91aefed79 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,6 +1,8 @@
 config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE # binman
 	help
 	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
 	  Usually used to build tiboot3.bin with k3-image-gen.
@@ -93,15 +95,6 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
-config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
-	bool "ti-k3-r5-loader use binman"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	help
-	  Use binman tool for generation and signing of boot images.
-
-	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
-
 config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
 	string "tiboot3.bin binary name"
 	default "tiboot3.bin"
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0191a2501c..93d9e0b134 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -35,11 +35,20 @@ TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
 TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
 TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
 TI_K3_R5_LOADER_INSTALL_IMAGES = YES
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+# Make sure that all binman requirements are build before ti-k3-r5-loader.
 TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	host-arm-gnu-toolchain \
-	host-openssl
+	host-openssl \
+	host-python3 \
+	host-python-jsonschema \
+	host-python-pyelftools \
+	host-python-pylibfdt \
+	host-python-pyyaml \
+	host-python-setuptools \
+	ti-k3-boot-firmware
 
 TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
 TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
@@ -58,21 +67,8 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 	ARCH=arm \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
-	HOSTLDFLAGS="$(HOST_LDFLAGS)"
-
-ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
-TI_K3_R5_LOADER_DEPENDENCIES += \
-	host-python-jsonschema \
-	host-python-pyyaml \
-	ti-k3-boot-firmware
-# Make sure that all binman requirements are build before ti-k3-r5-loader.
-TI_K3_R5_LOADER_DEPENDENCIES += \
-	host-python3 \
-	host-python-pyelftools \
-	host-python-pylibfdt \
-	host-python-setuptools
-TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
+	BINMAN_INDIRS=$(BINARIES_DIR)
 
 TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
 
@@ -90,8 +86,6 @@ define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
 	fi
 endef
 
-endif # BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
-
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index b62f624d82..fa2c008d4c 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -30,7 +30,6 @@ BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
-BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 56e1b23335..f7c6d16b35 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -30,7 +30,6 @@ BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am64x-gp-evm.bin"
-BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
