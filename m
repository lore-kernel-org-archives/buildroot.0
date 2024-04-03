Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE26DCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7167B41936;
	Wed,  3 Apr 2024 19:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxqq1vvVaZtw; Wed,  3 Apr 2024 19:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 078F1418E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 078F1418E1;
	Wed,  3 Apr 2024 19:55:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3F81BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25368817B5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkEUhF88U0EJ for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6DC181FF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DC181FF5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6DC181FF5
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41551639550so1522145e9.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174056; x=1712778856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHTr0cyJR6+sqdoS0fNwi5/C4OqhrlHztl/fhSEv5zo=;
 b=HJah+dkU/X2JHlfIvi1Wqi7zgQ82dw5/NNwslqeRpwal9bP/O1xutVpZpgzfVIiRN0
 upzjswnc6ObDQw7SLCGKeXCTPn2SLER79DAL4bh0WYlw98IzXEBnFCczVaom25bM6PG/
 1pwSIuBf/9wqR5dpW7OEU49CG+FV9xd7FUU7AvXcnf+CzvYy95ssag9fGPZx4w51d0v5
 E0j64gJUqrBGHa4HEtqWudvIZ4MFHbn2qtMxkrIWprme32obWGUSLQXI3vqEsUupJZyZ
 ZYtIyz/y4BoDxaQxXYFVa4zzzGYYaC0k4pVAxwPuF/X9I+d0FE4CpxWLVNbEVK57/QKR
 zntg==
X-Gm-Message-State: AOJu0YwTVQfcICbKpgp6suw3MnEFQ5q5PIIptwx+I+yg9cT+vQUD3pGT
 VjafUysBtdwuQIMhXoFWMGPgRUzOtLeFGCf8uhUNXEsQQdoEbEb1mh1gadTa1uq3NYGb9sg/gms
 f
X-Google-Smtp-Source: AGHT+IHYwl2bi72gMTS4/mo7v1YebKnyb8LB9S3qqk+fq/PC8pqKN7rj0w+RyHXRi5sEEk45om/K6g==
X-Received: by 2002:a05:600c:55c9:b0:414:cc98:6093 with SMTP id
 jq9-20020a05600c55c900b00414cc986093mr547550wmb.10.1712174055881; 
 Wed, 03 Apr 2024 12:54:15 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:15 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:50 +0200
Message-ID: <20240403195403.1359007-17-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174056; x=1712778856;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHTr0cyJR6+sqdoS0fNwi5/C4OqhrlHztl/fhSEv5zo=;
 b=iIyW0JCHPyRb2UrrBZ3sbPJ0nlJt/kyG34TJmLs7Dtns3JqceFcHOw44iiVWA1CFCQ
 Ifjz0k+bKgPh/F96J7oEIzGU0T7GmBNnV2Dxi8A3dBzE1J2NvUbae+V95AR6BWE29EYe
 08IQoqwaTGk1WTOqTRpcQ4CEJpzpoYf8Q8ZjvO54c9wphJ4ur6jkK3BNyOBLAOkJqEmV
 eEwhXRd/Zt4z9M0IzB6iNB9dr8N1dYHHbOD3WW0OWMuu8iCTVTPmY7jxChvFynVhtJuz
 W2GNpGRJ2v9S5Pu5/kHSH3OqvCmJ/irO897+jDRhckYnGaP0zjU522irTUjyJKcCxdWK
 /LMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=iIyW0JCH
Subject: [Buildroot] [PATCH v11 16/17] boot/ti-k3-r5-loader: remove
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
 boot/ti-k3-r5-loader/Config.in          |  9 +------
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 33 ++++++++++---------------
 configs/ti_am62x_sk_defconfig           |  1 -
 configs/ti_am64x_sk_defconfig           |  1 -
 4 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index a580b6ca61..faf7129248 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
 	help
 	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
 	  Usually used to build tiboot3.bin with k3-image-gen.
@@ -93,14 +94,6 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
-config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
-	bool "ti-k3-r5-loader use binman"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
-	help
-	  Use binman tool for generation and signing of boot images.
-
-	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
-
 config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
 	string
 	default "tiboot3-am62ax-gp-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM62AX && BR2_PACKAGE_TI_K3_SECTYPE_GP
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index ef7f8df6f7..b3c48109c8 100644
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
@@ -58,31 +67,15 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 	ARCH=arm \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
-	HOSTLDFLAGS="$(HOST_LDFLAGS)"
+	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
+	BINMAN_INDIRS=$(BINARIES_DIR)
 
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
-define TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN
-	cp $(@D)/$(TI_K3_R5_LOADER_TIBOOT3_BIN) $(BINARIES_DIR)/tiboot3.bin
-endef
 # sysfw*.itb are only generated for Split binary based Boot Flow (eg: am65, j721e)
 ifneq ($(BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB),)
 define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
 	cp $(@D)/$(BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB) $(BINARIES_DIR)/sysfw.itb
 endef
 endif
-endif
 
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
@@ -92,7 +85,7 @@ TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3
 
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
-	$(TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN)
+	cp $(@D)/$(TI_K3_R5_LOADER_TIBOOT3_BIN) $(BINARIES_DIR)/tiboot3.bin
 	$(TI_K3_R5_LOADER_INSTALL_SWSFW_ITB)
 endef
 
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index a1110597b3..a31a712f32 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -32,7 +32,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
-BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 8a3de181d4..0f13de302e 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -32,7 +32,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
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
