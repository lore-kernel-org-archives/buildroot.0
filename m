Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AC7C369AE
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0A861006;
	Sun, 13 Apr 2025 09:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01WaCCdLb8uR; Sun, 13 Apr 2025 09:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43666100C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A43666100C;
	Sun, 13 Apr 2025 09:59:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59F16108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BFED40A12
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZ-72OvdYKXb for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6CE2404F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6CE2404F0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6CE2404F0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:59:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so653899266b.1
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 02:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744538345; x=1745143145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BzfOt36i4jOTNS9ZV+xP6Zq3UIlEa/RIGgoHVlcG6Mw=;
 b=BULJRL91KW0A8qSICISZi+N0s4dWyadfgMrCykerRNyl124JxgGFwp4Y29muxBat1R
 Mvq0iBcHaU6lJY60/v8MafEU0amHru4aERt+o0nA05U20HBy9DhmxnZHH9BK1EWsBs7s
 VQiuWwKEMToyY194aahqzBersEKMbN99avf+SHlB1xNdL57jmd4ViiakjWbodVSW4PKb
 D3ZxzAwCroWI3trJBNDSndTf1jf26yfiwSJpSpt7pUB0jE3icBJiRqhKx7f78ItZdad6
 D8oMqOF5N71862/B8jIhLQiaA2EXg93z5Ws8OljM+0CaUtmW72Tdsp1bJt5vmH362RxA
 zrPA==
X-Gm-Message-State: AOJu0Yzp+LlqN5D1KJDAkf7GvMiL2FT7RCkcWNCBATV75SxcyIdCjNO3
 0hyut0vqnNFtggxOwV+DSCEIYk7TMDRpbF6Foj+zw2G7SzM7pry91sIumm4Dj4b0Qj4fh9pj5Bw
 E
X-Gm-Gg: ASbGncvGgJrS1YaZES4eOyhdAzapRReVU9C3OWTMYQWDMNHB8JlFFijCF07SngoWD+B
 C2mLTMP4+XVbyDtgNwcCSoWz4xFgtKSOrL0XIfS5IOKZyKuII830JfQLOgRgYwuSD/KIHm0nvQa
 qWK3I9mIae9UqLS7st8Nz5R0gG0puYlVUXii4sVcXNKgqAHuteYWjSFZ2QGELkobMpzIAM87hNO
 yCmWCVE6X7gDMjym4qxoRwTCflw/p5cnDcobi4tV0cQ731T7cKrSx23ckwgUyp6fjmQ6Bd5lEbJ
 em+7nlt1v/3rf+31lM8p7h+NKV5rFCawsH3KlCC/eoQFmt7echX2bhyXyHfqX5+IXnVmmTiQkHJ
 ufcoYevnRHh3omXtZt2OALEwXnZQq+yHkRVK1tM79Z5auN2t7qch9Jx5rqMU+3FYDZTaHyq1RbO
 gnr822Y/E=
X-Google-Smtp-Source: AGHT+IEDwICGBZNeRwceu9EpDKjmEJWZmvQhs+42oN65yM2tmeLHh+Ogj8xgoAUMeBzDzltmNTCEeg==
X-Received: by 2002:a17:907:f818:b0:ac7:d23d:b3ac with SMTP id
 a640c23a62f3a-acad36d902bmr800579066b.53.1744538344676; 
 Sun, 13 Apr 2025 02:59:04 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb3df5sm711709466b.26.2025.04.13.02.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 02:59:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 13 Apr 2025 11:59:00 +0200
Message-ID: <20250413095900.1940373-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413095900.1940373-1-dario.binacchi@amarulasolutions.com>
References: <20250413095900.1940373-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744538345; x=1745143145;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BzfOt36i4jOTNS9ZV+xP6Zq3UIlEa/RIGgoHVlcG6Mw=;
 b=iXyO/F9++uwSZNjuTtUJIU462Y6DSxPiZ3/VIKMjSep2kkZFl16h+BmIbePFnxKc3c
 3x1xaHrFGfjtMEmw8Tt4dbGSlNMEsCsFPNttrO44FiEVn+PM+sS8UOvsxDoU1+wae+jk
 q6hlLPQfPxFEsM7fMQAkEfmLV9HHhymKZdBdA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iXyO/F9+
Subject: [Buildroot] [PATCH v3 2/2] configs/stm32mp1*_dk*: bump TF-A to 2.10,
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

Changes v2 -> v3:
 - Update stm32mp135f_dk_defconfig
 - Update commit message

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
