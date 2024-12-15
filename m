Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A18E7717F
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D58060808;
	Sun, 15 Dec 2024 10:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhnNl5XTPkQQ; Sun, 15 Dec 2024 10:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B7060A9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B7060A9A;
	Sun, 15 Dec 2024 10:14:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E17B5CE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C216260808
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5y8a-GmfR6E for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D663607EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D663607EF
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D663607EF
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:13 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so3104799e87.0
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 02:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734257650; x=1734862450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9/PUq9SBYHEy2/WAt7GUZjSTvrrq3HAgZiiHZ3lZ9o=;
 b=DXYN5YFNLiNt+r1VXB6wMz0EUZD9ApksaSy/16F5ivYbDid0MCCDOUGerC668TrHhX
 3rdHonmpOnTZTo3sfTCkfoPlb9Q+MltXSSXnGAhOoO2TnQN8uvdwQXsOSL2MCiDufDd1
 v+wvLcaHWm0pE7P897VGZXPcBeD/l/ziWlrtn2B6gGLlcYk2NF2A2Gjl+LuIztxpR31J
 336ouOz/4Hxvaat2xalUnHp41mgdRcXrEXRQhI7bXwYfasj2gvOGUUe38Jn6ziOgCaPP
 BUJcrP+VwCmQ9PgDH9JuJFHNNX0BwyucogM/sAK4SGK6IbZVwbOZcgezBav0UgrlJQ/D
 4mFA==
X-Gm-Message-State: AOJu0YxUIW3WxnnZnq9W3VRJXzgl87cewMw45eZPkDlPw2LVdPZcIxoA
 XGICPSBUFfMN9iEBC8GbVlN/CpW8LOmbTqjoeUGwocThsyXNehMYb1edkMeAXf0=
X-Gm-Gg: ASbGncuq3/YzrSXvw4HEaXUMJl/JLNyWpWwvtJ6/qULqZaiIcBQ8f3y45fb54I3i1Ju
 ltJGwNnQgC3vrUQYjJzuhYbuwYEm9SqOAVX5OR6Hj+FFomEDybbNyFoxNLbKh78unKK2ABgMp8m
 vGmvdcYKAYBbFNzlAFwfOpoKoZMyai3LVmratHGZ36Dn/m1p5Jm37bH/8u5hhjHDkgFeeklQCuQ
 13AiNk6ITxAqmZu5Af2ngXBoHMh2moIVelER8I8KFzr3qAbfwIr/J/fX//C61lO
X-Google-Smtp-Source: AGHT+IGbX7kfia898/nppM314Dm0LGmhYs/zxJRnuwr12Lx6qH0QQsvvoJ5FeDHW2wSu4O+F84Q23g==
X-Received: by 2002:a05:6512:3b90:b0:53f:8c46:42a7 with SMTP id
 2adb3069b0e04-54090561558mr2268573e87.26.1734257650040; 
 Sun, 15 Dec 2024 02:14:10 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54120c13d69sm462646e87.217.2024.12.15.02.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 02:14:08 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 13:12:57 +0300
Message-ID: <20241215101353.3214256-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215101353.3214256-1-geomatsi@gmail.com>
References: <20241215101353.3214256-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734257650; x=1734862450; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9/PUq9SBYHEy2/WAt7GUZjSTvrrq3HAgZiiHZ3lZ9o=;
 b=nT3y2RSusxodBxkOepNjeIM/U8hcv6zp6XKn0k1I9wMH1bYy7+yfUEa3G3xZs6Px49
 UtNviyUtU7FohNFUQZdBun9hTrmtbNbr6FcjTtbGSHSm1Nbaaa1vbFnYFlXuyrnIJZN9
 5af1jXQDvd7ww2HRLcI/bNPeCoBf9Lbrp+ioPEpUJ3vwUYURL70XMqerJQ3tgiXBywJb
 qpHO+ygzXMJddPH6QG82VWY1TtGNr/s9Lz2FG5wCanlVXscJzURlgMF1ZoGog761YbS7
 ZwLo9Ftw02UNnbC/eJ9rO9UuQZOP8xBndl6Gq/WgGRM47x5gb40BI7F/3PB1z/wwwQ5T
 7Zxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nT3y2RSu
Subject: [Buildroot] [PATCH 3/4] configs/orangepi_zero_plus2: update BSP
 versions
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
Increase ext2 partition size to fit new software versions. Finally, add
BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .checkpackageignore                                 |  1 -
 .../arm-trusted-firmware/arm-trusted-firmware.hash  |  2 ++
 .../patches/linux-headers/linux-headers.hash        |  1 +
 .../orangepi-zero-plus2/patches/linux/linux.hash    |  2 ++
 .../orangepi-zero-plus2/patches/uboot/uboot.hash    |  2 ++
 configs/orangepi_zero_plus2_defconfig               | 13 ++++++++-----
 6 files changed, 15 insertions(+), 6 deletions(-)
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/orangepi/orangepi-zero-plus2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 7711bbb7f8..41c970efa6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -203,7 +203,6 @@ configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_zero_plus2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-zero-plus2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero-plus2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8b77e1f165
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/orangepi/orangepi-zero-plus2/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-zero-plus2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero-plus2/patches/linux/linux.hash b/board/orangepi/orangepi-zero-plus2/patches/linux/linux.hash
new file mode 100644
index 0000000000..aea771e7bf
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/orangepi/orangepi-zero-plus2/patches/uboot/uboot.hash b/board/orangepi/orangepi-zero-plus2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 84227cb392..2b7ad2064d 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero-plus2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
@@ -9,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero-plus2/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -26,19 +28,20 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
 BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
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
