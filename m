Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3F9D0C5F4
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 09:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1AD6083A;
	Fri, 25 Oct 2024 09:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsvUaVadJujM; Fri, 25 Oct 2024 09:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C38660A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C38660A89;
	Fri, 25 Oct 2024 09:33:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF6D02316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 09:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3B9406A2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 09:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wS2OfR4szOfZ for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 09:32:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69CA84068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69CA84068F
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69CA84068F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 09:32:59 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so2196573e87.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 02:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729848777; x=1730453577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZAFRtQBWwC3Ke5DLN2rEM45G9beGq1mwOXnnUeXCZo=;
 b=KFakFmWwP/5WuDmIdOSUeM2lOODIG4dvAawfjaY/Zvb2lkceeD53yDutjctU+BiVzS
 9vGBrwIbY+0OYTVI+LG3a3JzEF57PjGiQjxChCBPYhYZsEbbd3n96dhRVmLNFbnBKK9d
 EG+don8FA+bVZI3307sSbtT2oisfwVpc30Dl8NJ0Tl+TDOsriMB17ax4VToCg23etUph
 wIkcGmPuQmXVz5tXgf2eX7DjtM/9G90dvXkC/ZNaFya3AjslexvI1fuALJEVai4jAAxk
 BumWvt2KujDI/W0BmFJkeXHaYjY4qChs1aLSJceXSRjnn0N0MUEa761xmePd8p0M2OtH
 cxcA==
X-Gm-Message-State: AOJu0YwrAedZysnj0F2QDd+zN0YhTKdgP3s9vaL+i/8kxLsS6oy1ilhk
 GoBb5/m6hOe5hmqTru12UzV34BWgAOPkx1MlE/JAVImgWU96vdWtvnVbZMk8xpA=
X-Google-Smtp-Source: AGHT+IGDU9vc7hKN/5+id7Jzhq3rs0VmfeP4fM37E2cTcTgXNaok8NqULgi6GcycRpnfDlOyk+cSWQ==
X-Received: by 2002:a05:6512:31c9:b0:530:ae99:c7fa with SMTP id
 2adb3069b0e04-53b1a2f2128mr5481747e87.10.1729848776377; 
 Fri, 25 Oct 2024 02:32:56 -0700 (PDT)
Received: from Suzaku.home ([2001:bb6:11e3:a300:da4d:c63d:b184:11d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bc31sm1055607f8f.28.2024.10.25.02.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:32:56 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Cc: Roberto Medina <robertoxmed@gmail.com>
Date: Fri, 25 Oct 2024 10:32:48 +0100
Message-ID: <20241025093248.2015508-2-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025093248.2015508-1-robertoxmed@gmail.com>
References: <20241025093248.2015508-1-robertoxmed@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729848777; x=1730453577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZAFRtQBWwC3Ke5DLN2rEM45G9beGq1mwOXnnUeXCZo=;
 b=Y9lmsPq7C/V1nQ0e45r+dquoivJtYiytn7X/koe6/ARjW2RCxdBRwJiu26TvFY2pjW
 39MzZikPm/s+/V2Tc6EOhcTD4UloG3qq8XJyD9KBvPun9bAMkGMJ+PD2Z1wUEHFqIZMg
 tifr/zxihZxXQr0/za0ulqHZfFVo56cHLEk8nksKvgEA3fFh4KMUFAWvbPmEoWAAe196
 NN3FHJHWT+bDVycxXDKktOUpWlDO+sCxXm6k1j5j1mv8xgDrBK9e70r8xeDP/YJqi0Kx
 pEz5XV/1y+AP8qrWBo/e+ilb4B549oHQRVnmnDDL4Cvce32oz/qdnpc1emHHVcODdZ2h
 IWhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y9lmsPq7
Subject: [Buildroot] [PATCH v2 1/1] configs/roc_pc_rk3399: Bump Linux, U-Boot,
 TF-A
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

- Bump Linux to 6.6.56 (LTS).
- Bump U-Boot to 2024.07, so it contains commit ebb0ad4eef0a ("arch: arm:
mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588").
- Bump TF-A to 2.11.
- Enable hash checking: BR2_DOWNLOAD_FORCE_CHECK_HASHES.
- Add relevant hashes in the patches folder for the board.
- Use uClibc for toolchain instead of Glibc.

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash    |  2 ++
 .../patches/linux-headers/linux-headers.hash          |  1 +
 board/firefly/roc-rk3399-pc/patches/linux/linux.hash  |  2 ++
 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash  |  2 ++
 configs/roc_pc_rk3399_defconfig                       | 11 +++++++----
 5 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
 create mode 100644 board/firefly/roc-rk3399-pc/patches/linux/linux.hash
 create mode 100644 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash

diff --git a/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8b77e1f165
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash b/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/firefly/roc-rk3399-pc/patches/linux/linux.hash b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
new file mode 100644
index 0000000000..98edd13a58
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
diff --git a/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 1323752683..920354ba81 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -1,6 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/firefly/roc-rk3399-pc/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
@@ -8,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
@@ -21,14 +24,14 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
