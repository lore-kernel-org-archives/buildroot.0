Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9942CE7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F344078F;
	Sun, 15 Dec 2024 10:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhSVzQGitjsc; Sun, 15 Dec 2024 10:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 225AA40799
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 225AA40799;
	Sun, 15 Dec 2024 10:14:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FD0869
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FBE36118D
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkU7ZI1IUaqK for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:14:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D695B607EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D695B607EF
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D695B607EF
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so3424501e87.0
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 02:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734257653; x=1734862453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39rvVuWTjOuG8v9ZEPl9r0Jioy1sXtHva7Ed1qv3aWg=;
 b=udGZ4OW1YrWqloKCYFkxLVL/JBCxGfnLMbTGdIhwNVOr66BEnYL913Dk7qh77WZZJR
 rtrce9tDAwsVQX1KzRwBXhVZqDALKuaB+w8cA35PNPzpUwpt7av7oFKDFZSMEW31wMkL
 qkb7pSNbT6IN9bDA4TNGAmY8KezZ/ZmOR9wMCHgM6xFz4hsYWzDe8mQZovpJ0Trg4uQ6
 Do+FF22FKdtXX6ZEkZukxTwJS6xzge358ZAbOtI9vwRZ0f8D6mmPssKHJTbpq+TZDWl7
 gLFdACY7E/Jv7sSNG6dcTL2e/EZgdX0z8itQ/dfHTD9l180LyQ0LZCpsKmHeNB3O36lv
 PG+A==
X-Gm-Message-State: AOJu0Yz26p5JsS5fsQj7+jx7CB62NYafVpDR24vMSUyM7wWJHwucgP1e
 2na8rPkjLgGmmbGCjlcu/T2cz/16fFmha1ACc60imL5aujyKBsFDYF1ZTbfrkj0=
X-Gm-Gg: ASbGncsgXhBof+hS3Z85LlCiPxvDOtuLxjAwiiVVJJyyr1ccXHAq8ooI2Aud0ouk4d0
 1FpBY7F3iPc0G4cJCB6nZAaT9kk/0/FEaeEvExhqPCAGtj36HDK46PKZm6TRVeOj4edkrKwGwOi
 hGs/0x+kiGUuhTNAFAWlnMIGfITJd8WSFHuH4r9GW+RgeG5LSLfXad9nVQG/59zMXwapPwz9nA1
 XjlBTL4qVtAYbtFGyaI2lNVgcW7B2eHjQwC9Z8y3HsAwl6l3EJlr33iuDqcxJDA
X-Google-Smtp-Source: AGHT+IH+/5j43vsKcZL15Q7VfBzxo4Xqm9XoGxm+tVIn4/5YCDpIYYPeYvtmK9lSFDlphhZSIEGnrA==
X-Received: by 2002:a05:6512:3082:b0:540:357a:4aa3 with SMTP id
 2adb3069b0e04-54090567ee6mr2738909e87.28.1734257652533; 
 Sun, 15 Dec 2024 02:14:12 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54120c13d69sm462646e87.217.2024.12.15.02.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 02:14:10 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 13:12:58 +0300
Message-ID: <20241215101353.3214256-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215101353.3214256-1-geomatsi@gmail.com>
References: <20241215101353.3214256-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734257653; x=1734862453; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39rvVuWTjOuG8v9ZEPl9r0Jioy1sXtHva7Ed1qv3aWg=;
 b=APIHY2QPjgw2GgMGx1QTeLb3U2PpNWy0cJK+Z2t+w2kbe2cxQHiduiIgJTfbioGAgu
 yTeVQ1VvhXwDwuDRSEUMwXOxBMzm8I1450gGDTX0ajDvo4NDvCpHeD/jgcNvXAVqdUNh
 gyerYJ1SfoMI/3kh8I9uL5S9M/e5YRNq9QIRbNPgAAczdJ0PH73C/7MXNnpCKjhDC3Dv
 ClZ4GLu6dD06CGy7/U4z63DcNDtMFclWIsr7gyXUo7KUdt5uZdMBTrxFbkaNXYBb0NBl
 SW3dmjZ0BHBxAhiaGhW/2OA3OxkZQBpjTA4oAz/anCIUrXC5jfUELbP+5jiYV8vQGn16
 bRMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=APIHY2QP
Subject: [Buildroot] [PATCH 4/4] configs/orangepi_zero2w: update BSP versions
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.12.3. Switch to U-Boot 2024.10 and
ATF 2.11. Force check of hashes for Linux kernel, headers, U-Boot, ATF.
Finally, add BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash       | 4 ++--
 board/orangepi/orangepi-zero2w/patches/linux/linux.hash  | 4 ++--
 board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash  | 2 +-
 configs/orangepi_zero2w_defconfig                        | 9 +++++----
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b3df439a0..8b77e1f165 100644
--- a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/orangepi/orangepi-zero2w/patches/linux/linux.hash b/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
index 5a6f308c7b..aea771e7bf 100644
--- a/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
+++ b/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  9e723232d603ab45ebf043c34714c48f277ab195c29abcb8472f2a4c3a5a1995  linux-6.8.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash b/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
index 97a2b4eaf9..904fa56c02 100644
--- a/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
+++ b/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
index 9da9c94754..c2030b05c2 100644
--- a/configs/orangepi_zero2w_defconfig
+++ b/configs/orangepi_zero2w_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero2w/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero2W"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h618-orangepi-zero2w"
@@ -23,16 +23,17 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h616"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero2w"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
