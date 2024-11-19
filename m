Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7C7D6C288
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 18:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D7960A44;
	Tue, 19 Nov 2024 18:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOHiMbBPevbp; Tue, 19 Nov 2024 18:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA55660A8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA55660A8D;
	Tue, 19 Nov 2024 18:53:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE62FDB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 18:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD65C85380
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 18:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uK7ymUwzuHpu for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 18:53:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37FB3852C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FB3852C3
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37FB3852C3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 18:53:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38245e072e8so2282954f8f.0
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 10:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732042382; x=1732647182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1JNzkYnCM6bKl0YQxunejuelV3lDtI/TCUhqIDfxesE=;
 b=rAvN0R3d6mbM/tv/ipA1lUisjGXkWUz0aQaU0m00wGYvyj+eTE7pVZVuTthWgLXfEl
 OrLeyR8Euoxt2cM51m9BA7RIsfs6ahcOatxosneg+m1bWlp0x3y0juVsNHrUiUU8gfQy
 p+7KfD3VW/xe0/KS8AHxM1d1prIqKebPp5u/5wJodLo3a/g96bRK0b2GWbHCuMb8S20O
 eSfGFffoIloCgka32BWEykAj4PHwqsImE71eIlC8gZhRC53c3JayLl6qX23/SknCgEY7
 BcP8uLZUT4/uQITm5freXz1dv1qrLCTF8PSUf1P1i0MUeHwG8dfl9dt0g0QklA/Whr6T
 UhAg==
X-Gm-Message-State: AOJu0YzEAJrKtd4Ffz7cOpUOntff8ax6N23gmBKbrgPhvh9LxiUkTl87
 xmg3USEppbSW3Yy+5l321FDLykjwOZHZ1gEW79wHjaayQZWRVhXk0yANVxwKJe6Os8gGMGgaWD6
 D
X-Google-Smtp-Source: AGHT+IHCqZk+muL7UpKSksbd/HoJR9kuUdb5yeHUIBzl+QJI+OWR0dnSe44U+csLCqkLFH+RBQATZw==
X-Received: by 2002:a5d:598f:0:b0:382:3f77:8584 with SMTP id
 ffacd0b85a97d-3823f7786c1mr8504275f8f.32.1732042382037; 
 Tue, 19 Nov 2024 10:53:02 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.99])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b8a3c9sm5768585a12.8.2024.11.19.10.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 10:53:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 19 Nov 2024 19:52:55 +0100
Message-ID: <20241119185255.487391-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1732042382; x=1732647182;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1JNzkYnCM6bKl0YQxunejuelV3lDtI/TCUhqIDfxesE=;
 b=PJnCV4zwvF1AuK5IFOxhAvEMRh4zo88iIqoqJKwxghNXl82k5y1Feu8icmdR5y73sA
 dT/wxGxOIIKME0h4xGsMlEcWNA3MxTJv4w9pov29LeuXNfe93N3E2rcZGgJ68FQxuKu5
 ccegCyb4Aeoc6TW5d7KxBiorWYS6RRRCV3Aps=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PJnCV4zw
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 U-Boot to 2024.10 and Linux to 6.11.8
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

The patch bumps U-Boot to version 2024.10 and the Linux kernel to version
6.11.8.
The new version of U-Boot has added EFI Capsule support, which depends on
GnuTLS, thus requiring the activation of BR2_TARGET_UBOOT_NEEDS_GNUTLS.
The version of TF-A remains 2.10, but the LTS version is used as suggested
by the maintainers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 --
 .../common/imx8mn-bsh-smm-s2/patches/linux/linux.hash  |  2 +-
 .../common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash  |  2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                    | 10 +++++-----
 configs/imx8mn_bsh_smm_s2_pro_defconfig                | 10 +++++-----
 5 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 6f02bfbb22ef..000000000000
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index 53eb1438945b..28988ed019bc 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
+sha256  aee8a844fe152420bece70ffae8525b9b23089aa4da31fa32f30e1859bf93c3d  linux-6.11.8.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index fe9b4f53dc63..904fa56c02a3 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 2b358cf57b28..ff6539c114e8 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -21,19 +21,19 @@ BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_ROOTFS_UBIFS_RT_NONE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index e903cbf3148a..010dcee17e6e 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -23,18 +23,18 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
