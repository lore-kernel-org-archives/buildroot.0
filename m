Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D994C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC7F983C0A;
	Wed,  7 Feb 2024 16:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wq-oGALJlrNp; Wed,  7 Feb 2024 16:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77AEF83BDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77AEF83BDA;
	Wed,  7 Feb 2024 16:17:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5171BF3DF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAF3E41020
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4jDflAlQUDy for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8090140CB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8090140CB3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8090140CB3
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:17:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b4e6972f6so570412f8f.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707322642; x=1707927442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AeFJtebO+7yvGzdKii84CASM7yjUWX3eb0kGr4h9r5o=;
 b=M0fuzVcCSN0+UZ9Hmu5arP7bKgphNNsBWHBl7TB/oIEp6FPDNJGoPIpXaZfjlJT+pu
 Rt+4MwIJOXdiwYMjQrK/k8PF3P13txNnlnnfGedty4socRt12oRS19YxfnXvq/Q/jh6h
 BG2gg2vDCRqtszRqsuPgQUBG5as1c2PBzUqP2xCTlOozXgh5lTk12OS8GbDg7thEpIiw
 6MUfoTcRtR1VrO7uRz3c/mF09F7Pfbxse6lV7cLCAGSSdHcQiaZgw6c8GlyTUKylnwFZ
 6ONsyzNK2DRiAr9wmz+xAe+XjtayaeSTHR5Bt9DQK7A9M2RzR2g3aQMsRgLm1k7AZw/+
 pACg==
X-Gm-Message-State: AOJu0YyocgCd/aSabZnvmw+XdRMeu/LzRMlyDMLoSbWxOrE4ZVaoYEwT
 4cSKIu2CLzll0Eif9GLHkTIUi9x1cLarJVnzuSf4UrP4n6zLVf7ACGOEmxJL2L0DC5VRAaWVsti
 1P8M=
X-Google-Smtp-Source: AGHT+IEThNtpG6CPWrGNjgv4ToX3gH9WKmx4c7GeYjhVyQKgSswCrLKfbfhaXntZUmkEWZSC9+wylw==
X-Received: by 2002:a5d:4850:0:b0:33b:2fba:1ea7 with SMTP id
 n16-20020a5d4850000000b0033b2fba1ea7mr4137385wrs.67.1707322642230; 
 Wed, 07 Feb 2024 08:17:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUuGh8ggbcS4l7tmhLnO6udEy7gZku59a5LGxZ61PgYcq5l42L4chOEgs8RixCopQxF9VchDdrjBVU+zujx/57YmuSGfZtsbsq2lUJXvmOsB1n1HLB/2JrqeUt+UATk3NdcDeiA/f9GaeNYvX5pTCNNGsJpQcOCsYlbzN+1W+2/QVC2CqbEnoNre5wo4Dws+4nfo1hgIevCq14rx8rduzWcLP7WWwIwhPN25FVMFwRuyTcz7k2388Evmesqt0UF4E4on/YmLibHQtbGWXt6dPSo+ej6Z4CEyxM49VLuEyNSfOjV1KkWZ2Lm6vD5x2iToDQq9Q==
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b0033b4335dce5sm1827782wro.85.2024.02.07.08.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 08:17:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 17:17:04 +0100
Message-ID: <20240207161704.2981151-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707322642; x=1707927442;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AeFJtebO+7yvGzdKii84CASM7yjUWX3eb0kGr4h9r5o=;
 b=h4cnE6jdrFL0mrxF9XHo8AJB0xFI/XN4tX8FAaudx+VeIKtSu85u2+vVBFtoOmsu23
 PonRGSqnIqMakOjlqRsTh/KkzBsHCC7jhvsVnaNysxaLTnwJPZd12mlhdpEE0eI/ZH/i
 SY5Pfg+3lByh7UxQtiQv82m4+b19QyLwXUZNs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=h4cnE6jd
Subject: [Buildroot] [PATCH 1/1] configs: drop redundant configuration for
 no MMU platforms
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Thomas Huth <huth@tuxfamily.org>,
 Jesse Taube <Mr.Bossman075@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package/busybox/busybox-minimal.config is the default configuration
for MMU-less systems, so the setting is redundant and can be removed
without effect.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/canaan_kd233_defconfig            | 1 -
 configs/imxrt1050-evk_defconfig           | 3 ---
 configs/qemu_m68k_mcf5208_defconfig       | 3 ---
 configs/qemu_riscv64_nommu_virt_defconfig | 3 ---
 configs/qemu_xtensa_lx60_nommu_defconfig  | 3 ---
 configs/sipeed_maix_bit_defconfig         | 1 -
 configs/sipeed_maix_bit_sdcard_defconfig  | 1 -
 configs/sipeed_maix_dock_defconfig        | 1 -
 configs/sipeed_maix_dock_sdcard_defconfig | 1 -
 configs/sipeed_maix_go_defconfig          | 1 -
 configs/sipeed_maix_go_sdcard_defconfig   | 1 -
 configs/sipeed_maixduino_defconfig        | 1 -
 configs/sipeed_maixduino_sdcard_defconfig | 1 -
 configs/stm32f429_disco_xip_defconfig     | 1 -
 configs/stm32f469_disco_sd_defconfig      | 1 -
 configs/stm32f469_disco_xip_defconfig     | 1 -
 configs/stm32f769_disco_sd_defconfig      | 1 -
 17 files changed, 25 deletions(-)

diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 3335195f2589..672fee57a185 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 947abe5df206..b493c1109820 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -23,9 +23,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
 
-# NOMMU Busybox
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index e35f3546fed4..0c95756a8e16 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -29,9 +29,6 @@ BR2_LINUX_KERNEL_VMLINUX=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
-# use minimal busybox with hush and networking tools
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 2a0aea01d703..9999bcf7f336 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -6,9 +6,6 @@ BR2_RISCV_64=y
 # Linux headers same as kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
-# Busybox with hush
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
 # System
 BR2_TARGET_GENERIC_GETTY=y
 
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index c3224576f76b..d1d59b95254f 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -4,9 +4,6 @@ BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 # BR2_XTENSA_USE_MMU is not set
 
-# Use minimal busybox with hush and networking tools
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index 03ae57e1b7fd..e45996879a6a 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 720d2169205a..7e293e5a490c 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
 
 # Packages
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index 045967f5899b..0352382fcd86 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index eb7294d55911..20658813bad1 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
 
 # Packages
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index c320d19703ab..27272dac4c44 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index d2392ba822fb..1bc12dd05819 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
 
 # Packages
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index ba83dd76ee7f..3e04ea3a046a 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 09bc1b4ab15a..253ee7d7cfc3 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
 
 # Packages
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index d4e000487a80..99ae8cc7533b 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 8b10bc674176..66840a774230 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index e362a9985116..6e6ead0fdebb 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 2ae27fb2d852..725c985ec04e 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f769-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
