Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D0CC83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 12:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DF3D60A8A;
	Sun, 13 Jul 2025 12:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D95EBGA5Pm60; Sun, 13 Jul 2025 12:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FE960AB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FE960AB9;
	Sun, 13 Jul 2025 12:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67CA0106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5931181770
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4ZddbaFR-41 for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 12:51:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EAF9817F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EAF9817F5
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EAF9817F5
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:51:51 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae0c4945c76so578507066b.3
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 05:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752411110; x=1753015910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dAlh5u/LwHC+jcVOPrSPHwzMp03N89Zaqb9A+SPng2Q=;
 b=KyjwWhmY5BfpvZHA1xuQV/6A4dzOqZP9qRKU+xEWZ3010k5TTYmrvJ8W33CZlGvTZB
 Ffc2mo3og1/0meLxmE3JDJcNLRGNl/vInt9rlBignvGFhnAarAW/w0G+u9dh4yGWJMqA
 FiKVrFm+MPjcHfhWzZSJoB4TjdozLa7FQdeZHsge3kTaMKmQdJjSKqwALt5XB26AMO+G
 ABFlteWGNXC6ERkVW7tC5n+DkSZBG1yHWLA1Pyff0KweWT64vFexX+gHyDGPdCBlsbzC
 JLOr6B+zSAsevxouX33Kh7to165nJ6oNOKGdC3KN9dh47vsYLhOa00nBhB7czjq8eukf
 mmmQ==
X-Gm-Message-State: AOJu0Yx2zLupNzZ/xAsgqUVultaR/x2BOCA2oCKgS2D0ldtgThwmfZvO
 2ZTQD8ACBipkX/NyQ/or2EbAbUnr/Afw9A8qsbZ03f+UvdiuPXOSHgluMrf4spwR/whIudCVFgc
 MC7CC
X-Gm-Gg: ASbGncvV6xh0LE7020yGZ1HGEOi/T4f7lRZsdcq9dshkpe1r9TDdIT9WV5D5He7uWuU
 QiDAuajRa5g1Qrl9UWvAuIRQxk9lU82hqinMSG0W1DA7jqjaNwsGDuXmjFclRLCUbLaevIGAGSK
 wJKYmA2NzuET2OTgZi2yHEVuGMt3QYkzlLh5koyX/+sAXb/dtr0qQtVlcSnpncu8b/NwWljQBj9
 O5FE0/9y6pAPCFhZbkRf5r1efeeUFZYWOrsSU6uMyK+AIJ7wxtz6lo9C4MFXOjahR9LNOR7rlP0
 CDRXWI7BH81OPH5f/izk/AaN1FAh9oQPFK1oO6c+rj2WmpOwPMsoaPsGbBrwOUcEueU5SZsO2MO
 FuUL3BnZaKlB0Tt/jLNbH2G/hy0PEUrMfhaFNhQz0UmVLrAsCpSMHFtyDMjeFxvg/cc87CXh/Gh
 Qwn9Jt437fS2qePGptJbzC8Rrb2qS689MVytf86Be4+P6fEjkltfi9weFL6UH9KcLa3d6A
X-Google-Smtp-Source: AGHT+IFyvkxfIOJOcjXSpEO4I1hm6mC/7h4RTc/OgjP6wyxAxQ2qhxfstS4QcxsuE/zsv8GFjLrDZw==
X-Received: by 2002:a17:907:97d6:b0:ae3:c037:369d with SMTP id
 a640c23a62f3a-ae6fbf4287amr1000639066b.6.1752411109607; 
 Sun, 13 Jul 2025 05:51:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8294013sm646204966b.118.2025.07.13.05.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 05:51:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 13 Jul 2025 14:51:46 +0200
Message-ID: <20250713125146.831278-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752411110; x=1753015910;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dAlh5u/LwHC+jcVOPrSPHwzMp03N89Zaqb9A+SPng2Q=;
 b=JxaIt1HAIdmUFahc3S/MFWeUjLkGbqgM6d2bNQyKkjOxCnw65PVq/VKEtYS/nP79t0
 jPVOZzPTSWgG+NeRpECKgB4JVP1Sdy4cUbblabLzgqhM3UP4OFhAp9jgpNWczoAOgUUZ
 dnCWLx+39X2NYSakz0dbbyLMsMHCt05lbSsVQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JxaIt1HA
Subject: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.36 and U-Boot to 2025.07
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

The patch bumps the Linux kernel to version 6.12.36 and U-Boot to
version 2025.07 for

- stm32mp135f_dk_defconfig
- stm32mp157a_dk1_defconfig
- stm32mp157c_dk2_defconfig

The new version of U-Boot with commit [1] enabled OF_UPSTREAM flag for
STM32MP15 platforms. This required properly updating the DEVICE_TREE
parameter to pass to U-Boot in order to successfully complete the build.

Tested on STM32MP157C-DK2 Discovery Board.

[1] https://gitlab.com/u-boot/u-boot/-/commit/35f90f76f45b186251cd5da0b6f057e0382fb7db

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../common/stm32mp1xx/patches/linux/linux.hash              | 2 +-
 .../common/stm32mp1xx/patches/uboot/uboot.hash              | 2 +-
 configs/stm32mp135f_dk_defconfig                            | 6 +++---
 configs/stm32mp157a_dk1_defconfig                           | 6 +++---
 configs/stm32mp157c_dk2_defconfig                           | 6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index df103b819925..6c7685ad4d07 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ab48800ab49985a78d2318ae8ac5f28fd3e123ea17357ef21498105a53337336  linux-6.12.22.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
index 80ea21b7cb4c..440526977bd9 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index 3ba1acac8117..eb2046670976 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -40,7 +40,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -48,5 +48,5 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp135f-dk"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=st/stm32mp135f-dk"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index d96ff54dc9f3..a42e90bbeb38 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -30,7 +30,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -39,5 +39,5 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=st/stm32mp157a-dk1"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 183e3ab8621f..a14993630304 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -30,7 +30,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -39,5 +39,5 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=st/stm32mp157c-dk2"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
