Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C11C369B2
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 16:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2344069A;
	Sun, 13 Apr 2025 16:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofhvcFe20CV2; Sun, 13 Apr 2025 16:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED08406F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED08406F4;
	Sun, 13 Apr 2025 16:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31130108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6E0983365
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRh-E_xoNViC for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 16:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC4C5832C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC4C5832C6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC4C5832C6
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:47:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so649275466b.3
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744562833; x=1745167633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5/7jQ6PYrlM9KyegrVyeht6bVAiLUjzFIQUmRV8YbzA=;
 b=fW/Bs+Q/YC6sVkhFoJlpKsy8bf0o+j0uH1X9cQJ6rXqzpWmHzae09GHKds0ERXAYiO
 gWMEN4WMbsAGj9XgIqXVNNq9z4e1GffndvFPnVh9rlv3koBv8xxaxBPGdo0HN6txFUUS
 cWVrC2DjCKCxag7R0hvcwdKt50fQ+ByHtgfcopVfOWP9psMi0dKk8zMA7sMPLPLQ7asq
 JCLN0WaXig6hoY6yxIQ/rJnKE8mCyKNO0eQFSYXBbLFKOOdevhtjGwIstJIAky3HviJ+
 w/CJMDK3IuBtpCl6CtcbVZ9+4T4KVD8i39PB+58QugRF3b2HrsarImSSRvodZrDMt9js
 vuJA==
X-Gm-Message-State: AOJu0YzDmCn8bQ5Bl17MaeJl3+PdO2xGEApFyj6mKIRXPu2dLAF8HCoq
 xA7FdW7cSkQ6cqQPItKZWgRakdHMl4hvtd/lzBxXxv5Yq0j3BWL5jsZzk1hn31ODekzVUcUFQ4Z
 A
X-Gm-Gg: ASbGnctl5pBqjPDIMyOJRNC8iU5bFU6Aou1l3qNVnxribKu0jDaeaE703XW78pDrY5r
 m/QAtez/XGt0VddOZs8lpC+PFEASW8ZP0RLm0hhKMKXmIeoEv1F25skJRs3OEpHWKIeajIapAHR
 raM4LACefHdFK+XoFs/U5j5J1Ngkh40fz1152yVpbozOyBjbd53gZJP2wp7tYOPIDU5IbTq0gcx
 0dxovvaxLN/+Pvv4xcsK4YOc3UOhAFoz1OuPdFVUU9KEeM7pxr4BwRlZAGzb5jGjQPM2CqFfbNc
 Xj3Tuy+bVLL2qoMVhe9XszVhW2wb9cvcDIQtjLvFCxIHX/06eLRHpMMLvAmY5u30ststQTdfRcP
 oezKM4qiziB5Qhoy5SdHp8ZswHFJSRrE8qNTgcwuXdsiV2rYcYktSJXWOXkX1sjiaaPGceSKPh4
 nmV72zIWY=
X-Google-Smtp-Source: AGHT+IEW8nQUoLNEPgAo5BMlBWT0I/WZkFK8ieKbIfC8gfTBhUrTpUdNdgX2tETe6mF7e+ZUUKmrxQ==
X-Received: by 2002:a17:907:3d12:b0:ac3:17b6:737 with SMTP id
 a640c23a62f3a-acad36a465cmr906578166b.45.1744562832461; 
 Sun, 13 Apr 2025 09:47:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1c0126asm766648066b.78.2025.04.13.09.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:47:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 13 Apr 2025 18:47:08 +0200
Message-ID: <20250413164708.1943803-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413164708.1943803-1-dario.binacchi@amarulasolutions.com>
References: <20250413164708.1943803-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744562833; x=1745167633;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5/7jQ6PYrlM9KyegrVyeht6bVAiLUjzFIQUmRV8YbzA=;
 b=F963Zi+5e49dIxsGEoHZ6vI5diaCXA1tfGZZAoTrc55tQUkr/aHTqpYLzuANedGGss
 UGyz+kAn69YuGruEEEjsA8xrh+FZQl/5PIlqbQ+7ovvzGE1KaRgEtKRoRbWp55nVKUoL
 E7VZvDPVZ0RKMWNSfSDQ6IHIr6Q4kWdQQIQDk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=F963Zi+5
Subject: [Buildroot] [PATCH v4 2/2] configs/stm32mp1*_dk*: bump TF-A to 2.10,
 Linux to 6.12.22 and U-Boot to 2025.04
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps Arm Trusted Firmware (TF-A) to version 2.10 LTS for

- stm32mp157a_dk1_defconfig
- stm32mp157c_dk2_defconfig

the Linux kernel to version 6.12.22 and U-Boot to version 2025.04 for

- stm32mp135f_dk_defconfig
- stm32mp157a_dk1_defconfig
- stm32mp157c_dk2_defconfig

The new version of U-Boot has added EFI Capsule support, which depends on
GnuTLS, thus requiring the activation of BR2_TARGET_UBOOT_NEEDS_GNUTLS
for stm32mp135f_dk_defconfig.

Tested on STM32MP157C-DK2 Discovery Board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes v2 -> v3:
 - Update stm32mp135f_dk_defconfig
 - Update commit message

Changes v1 -> v2:
 - Update U-Boot from 2025.01 to 2025.04
 - Update Linux from 6.12.13 to 6.12.22

 .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 --
 .../common/stm32mp1xx/patches/linux/linux.hash         |  3 +--
 .../common/stm32mp1xx/patches/uboot/uboot.hash         |  2 +-
 configs/stm32mp135f_dk_defconfig                       |  8 +++++---
 configs/stm32mp157a_dk1_defconfig                      | 10 +++++-----
 configs/stm32mp157c_dk2_defconfig                      | 10 +++++-----
 6 files changed, 17 insertions(+), 18 deletions(-)
 delete mode 100644 board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 2bc5030cf2ff..000000000000
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  72df0928138de111bf5e75fae47f88a4d1b4930ad52b7902e2b53e117be650c8  arm-trusted-firmware-v2.9-git4.tar.gz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index f6a5f5e1c90c..df103b819925 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
-sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
+sha256  ab48800ab49985a78d2318ae8ac5f28fd3e123ea17357ef21498105a53337336  linux-6.12.22.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
index fe9b4f53dc63..80ea21b7cb4c 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index 387fe3a41432..3ba1acac8117 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -8,7 +8,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -40,9 +40,11 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index c1ecbd22c198..d96ff54dc9f3 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -18,8 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
@@ -31,10 +30,11 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index c35d75853f06..183e3ab8621f 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -18,8 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
@@ -31,10 +30,11 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
