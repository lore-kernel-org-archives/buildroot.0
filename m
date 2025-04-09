Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F8AC36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 06:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E8F406AA;
	Wed,  9 Apr 2025 06:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UaJo1q9zTKz; Wed,  9 Apr 2025 06:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6811240DE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6811240DE1;
	Wed,  9 Apr 2025 06:17:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41205108
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E8D880FA7
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHB21DW9ibB8 for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 06:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 126DE80E28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 126DE80E28
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 126DE80E28
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:17:42 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e614da8615so785839a12.1
 for <buildroot@buildroot.org>; Tue, 08 Apr 2025 23:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744179460; x=1744784260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iMjBSG3WErI57rGF9Q3GacNkdqhqvNGEc9B8sWYLL5M=;
 b=gGjTVxQYjhfQm5eySCm2ejqrjST1PjSj8TKWyk1fk7ECFSDWdcVRsvJB74SYOPtgTd
 E0fPi/MWzwvjS1GObRuNNTziJJMT/bSr0f43KkHnVtCXdQgpGMXBVxKXID6m1Sz1oBZx
 NPZXs0a+5+EjPLiYFWenk5Wb+MVMo2HVzKuV916m/WZ+EkzPewyH5bdw7fSQzdcpNuid
 ssiGsr5fu1l1iqxXmi1sCnGwf8I224aSHcNiSKHonRV3L8sHIUrEJIe4xm8gXIgz/pLn
 uChsRarGOCqWGotXZJCSH9iVfoWaX+Ito1e5zG5Ljc/bnMfLv3Am0Bo4ONVtYWBH+eKL
 m7Bg==
X-Gm-Message-State: AOJu0Yzw8gClI0z4R2r3y6x2vJGchp8n2K3FRCT7rfpwnTeMlilUuWtd
 m9Ys7OcLFa5MDHKY37tNjfuM1A0oVKNAx4KpFRbVZqJldlmJ9IaqfetqLf6zFfjlWCwVMvU/twt
 g
X-Gm-Gg: ASbGncuQHRtqYI5ZKqFjNlPcDx4nJB5EA6erkTfJTRr96oqT89vZaLLuRZ4gxJgMqFF
 8n2jz984Oza+rIsj/t9wYo4KrEJkPi9q2JejaD0gzloL2omRcrmLaUuDNeEQI10JNgt4izhZnz6
 PCoNPGLCX77Yc7daI/cX6E49k/IUlTDY1goxYtcWsy1m2g82R8ZDmyf+V3bZHbM1cZPMJXpdwYy
 6yFYoXRdz9lZ5gqlM2n+ZrRVlxaIXYzHF+uySf6KuiPyal5kBF0q2HfyzNUQ4cfa9jgK8sVQMkq
 I/t0ligvmjb3WsT/DZH8V2rLjglE4khHeo6ZgAnP4kbXWpC6WoN1T34T+g7ALhbtbIzkIqvkIfy
 B/Hsb94VFbPu+Gim4eVOihb88HCXkFUSdXm3zz4Q8F4vducAe5snARk9gg4nQTwMrCBUcPUf1v2
 uMb5LfuBQ=
X-Google-Smtp-Source: AGHT+IHTlx0f2t0+ARLfMdmG0+DDfPF1E5MW94NbMyKx7IirLNDFcK+7HBHjBL2UzqTQ9xw8UOVnrw==
X-Received: by 2002:a05:6402:51d1:b0:5ec:8a77:7f2d with SMTP id
 4fb4d7f45d1cf-5f2f766a81cmr1495586a12.5.1744179460557; 
 Tue, 08 Apr 2025 23:17:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f2fbc0673dsm289258a12.19.2025.04.08.23.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 23:17:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  9 Apr 2025 08:17:36 +0200
Message-ID: <20250409061736.2335242-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744179460; x=1744784260;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iMjBSG3WErI57rGF9Q3GacNkdqhqvNGEc9B8sWYLL5M=;
 b=EEK62lPQjYeDFawvt/QQiGNyKV+8u2J03S031I596WO35AIiuiY0ErJWejkAxiDuYV
 M9aQhVHoRDx1ZSzMDmaae0bvtnl6VNKYuPz4az/BL/L6Z8pwB6PdneRuADMI0B3vd9jy
 SXmqKWKbQjkR4c6NGGtsHRTa1I40g9EolFXmI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EEK62lPQ
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.179
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

The patch bumps the Linux kernel to version 5.15.179 and, for the SD
configuration, also updates U-Boot to version 2025.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f469-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f469-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f469_disco_sd_defconfig                          | 4 ++--
 configs/stm32f469_disco_xip_defconfig                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index 57c69adb36ce..4e0aeb77d880 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
+sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index 50674352d71d..80ea21b7cb4c 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 3aa27f10ad02..6193855bd25c 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 67db22f9332f..f014f77d7653 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
