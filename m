Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92720C83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 15:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BEE14116B;
	Sat, 12 Jul 2025 15:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rffal_OHoWR0; Sat, 12 Jul 2025 15:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D2E41160
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D2E41160;
	Sat, 12 Jul 2025 15:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F15A106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 805686081B
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUam0gS3qrMV for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 15:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CC9260813
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC9260813
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CC9260813
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:17:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-60c5b7cae8bso4822797a12.1
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 08:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752333430; x=1752938230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wv4/MMPH9wDq+Tpc6bxVuay9SXgsXb5SUpjqQ0iQjIA=;
 b=Cni+zFjvWQM1VzuYfRBIINFtIblDdIkMBWqJ/LCRpWyHHqnxD2XFa1grOl5OvUR+ph
 5IjPr0+US4LktRNNzMrTm4X7jpBYtP5LvlgP3b0LmLczOQD/mokTJ5OcX4pT3MZrAVWa
 Mx8u27wGnLothZyCIm0ZdWUWXwNAI487917/5tUHu9b/cX62F9KvaSuWRW73pkV9M76P
 Yjlb4j3y5PBZH152KRMWM4t21c0XmBjxVIjW+krGDXHRtzXso0HZE0AAINHBrJxAtOzH
 EdE+OB9wNgUqSUVjoSbysnNo8fKzc/3kMBKbvjopmEDptZvoWzDP04bwRLGnFCanN1gI
 HUzg==
X-Gm-Message-State: AOJu0Yy2oHIFO/cXnxz7PQq4VfwRMZMIqm9+ifIqE8KqkTOVqAEmi48u
 m0RYPLW/6cbRebhkBzoEKdb7fCwDcJN+fG5PPkCibnNCjYrAaBS0gAyuHwH4rqd9XRTWT5yl2lr
 nuzD7
X-Gm-Gg: ASbGncuG/6KR+Pfxayoz9GXfCE3aPWXsdoOyCbOhyvJiNX8cngFMQuYlNqJR69QZol7
 9Dut06udiOrQRzxcv55qimWR/o4RuwDgbtu5LCKwapel2G+vR9f+m8aNcxXUW7bVXOvzHN+Q8wk
 /A+IVqa5XIdsquPZ49DJg0HLGjxlGge2f+xuDXTZmg59EQUDVD/eXseMmwiwiJ3kx2GPOy3IKhC
 Bm6G93+ufKEafnVb01gUF4p8iI90c9PHyDKY03F+j/quhUIwXaw3HHETjvFSKg+THL2ZwXb2fPI
 X6shfRBoK/dU8pCPnfuh7b7leyzHVnbUwK5u9ZswMpFynEJZyKJSBItnlu4mVyQEKuAlO99tFsk
 4VoxphqVPc3iLE7018bT85qbAcTR2pfGDqctYxyXS0V91u6kpD+8t5Rian/nGR6MSwOTcta7J9R
 2G+W1TPlEw+LiR3zxlnkolp/3im+/ezsYb+CluWjGEmXx6iSFDt6c9A3bdMw==
X-Google-Smtp-Source: AGHT+IFyBatsHaYKMyW5nVPXeqJToK1y4GrypsW/ySTGpGWAILHcW8C488USsiMiGejY+6XWLkKDGA==
X-Received: by 2002:a17:907:7288:b0:ae0:db23:e3e3 with SMTP id
 a640c23a62f3a-ae6fbc88551mr812819466b.16.1752333430063; 
 Sat, 12 Jul 2025 08:17:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e91a0bsm496941966b.7.2025.07.12.08.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 08:17:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 12 Jul 2025 17:17:06 +0200
Message-ID: <20250712151706.1816792-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752333430; x=1752938230;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wv4/MMPH9wDq+Tpc6bxVuay9SXgsXb5SUpjqQ0iQjIA=;
 b=QLxuZ1aZ018DBiLsqTX4HUCoyT6pk+xrqV5eG17aS/mfTKyR8//Wl4SkOBTt7y7u0y
 nqvEcAYxjmQsqfbC5OkPtwPJgrvLesIjuwj7XsZCRhy9g4jwNQbSq4bIr/HwjhQ5Bb68
 ifyLR6lGeklS59mDIoeaiRfhW4wnldcoUQPrw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QLxuZ1aZ
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.186
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

The patch bumps the Linux kernel to version 5.15.186 and, for the SD
configuration, also updates U-Boot to version 2025.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f469-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f469-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f469_disco_sd_defconfig                          | 4 ++--
 configs/stm32f469_disco_xip_defconfig                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index 4e0aeb77d880..68e85f8a21d1 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
+sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index 80ea21b7cb4c..440526977bd9 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 6193855bd25c..704e8ecc16b3 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.186"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index f014f77d7653..5d6c5ba7527f 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.186"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
