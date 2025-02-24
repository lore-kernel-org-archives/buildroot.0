Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1196C021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C789480F65;
	Mon, 24 Feb 2025 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eo26gY3AcYvT; Mon, 24 Feb 2025 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E4D80F66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E4D80F66;
	Mon, 24 Feb 2025 19:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2C06943
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97637402A7
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V52It2h9aMoy for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 19:36:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 024964016C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 024964016C
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 024964016C
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:36:14 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2f44353649aso7120569a91.0
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740425773; x=1741030573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSDdxBhYQxg82mO4zU3wBjFu4OjPexE0FcLQRAba0fM=;
 b=qPsIreoIYi+Qr+Ck7oLQbXMyWvEuGzMV9pmOTdAv5NSSvoBIjqLND3h/QB6E9K4MS2
 Mdm4job81p8oVGDSUvAjpXwxAH5g76FFC8av1ofkoFL0epdpqYf1FhoCsnw47Om0y0gu
 JQIx1gDt/nCFvn98o2WW3C9tH5WHL1MU6/0LQm969pRax/NfS9qhwwEsN20hVij5+3lG
 ahx+9OifMAi8hBjkU5uHIEhKCU1xzvHiNaPXd529E4sROMzUvUVlWgVrlTht9rFf+jt1
 729cTwXPh/z8S80SB+rvvR8+YU8BZ2HgOXHqCSTfHtSUGux53RW+511Mpvcd0Ywg6+AE
 buOQ==
X-Gm-Message-State: AOJu0Yx1ac2ue0mbYvpKidcCI9N6/48LFHAvpWkHy5VaLaqV2VAac1Dq
 IeAE6Bw3WbY2uPZ3H86Gb3KUBA0IY3kQUYMK2H2r9nEjhvUyvondyaCFBA==
X-Gm-Gg: ASbGncs7x2W5IkxvESXLZviPDldp/U/vjZ7oWGttiU79k3Vet0hNUB8a0+eOp+GPLY4
 SL9fu8U8IlazKuDKoVaHVrTVgl70nL+WtuKHR2GpC6vbG9eocXTwCVhz6dK11ihoK+97yMkNqs2
 3Bm660OeCYgLc5Kl3o2/OcGabwoTYKvjwVku8jpfMlYvqJKd74Jn7ugwF9wkk4pGbrU3WCAEl38
 9FyZxvu8tjcJy2LDSAAIuSQqKJjphN/eOzfTpl/n4AN1iZhRxgA7lrPYKMJTnzSj7XCNo2lhbxF
 nGmXvZRn4rQpTa8Y3L/38WwNLa5yujE1+z2UUWa9
X-Google-Smtp-Source: AGHT+IHPWCHkea0AnGppI6G2GkWn+D6XMX/OFJosekFdJwiDJKs9fUeTp+FAiplyNJHTgM7dv+HE6Q==
X-Received: by 2002:a17:90b:5201:b0:2fa:1e3e:9be7 with SMTP id
 98e67ed59e1d1-2fce76a1eb6mr22179476a91.5.1740425773241; 
 Mon, 24 Feb 2025 11:36:13 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5291:bbb9:f462:e26e])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe6a3dccdfsm47763a91.17.2025.02.24.11.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 11:36:12 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Feb 2025 16:36:08 -0300
Message-Id: <20250224193608.1700020-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740425773; x=1741030573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NSDdxBhYQxg82mO4zU3wBjFu4OjPexE0FcLQRAba0fM=;
 b=SbeuvWQK0rnmkiCO8PecEZFeu8KGUXju6KTC3n59h/V5iw9WehIF6iKbzeILjv//Hx
 Z/AXbAli7cPiMKlW2WUGvOxDfAx0vTBRQFFpA0iHNFpIjMWFs2eH4wDE79GhqOAVyhia
 /ZUcZwDaSuz+3OevGl69vawFH1Vaf0iv4GDlFpait0B8jxBv3UtLqEWAG1raAfAVnoji
 YogI6up2Rpa3yXcT3S9CfAsZVROIE9IWEOlrnl8ONiZ1U3fwY/BsjDQ5jc4k167MbcEv
 GyXJ4FcRU32YFEpKRHUCWEn+535dtMoKaXveq1E+AsorwPiCuxU0BvfimFmo0L4zs4V9
 uCCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SbeuvWQK
Subject: [Buildroot] [PATCH] configs/imx8mm-evk_defconfig: new defconfig
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

Add a new defconfig for the imx8mm-evk board that uses upstream
components, such as:
    
- Linux Kernel: Upstream version 6.12.16
- U-boot: Upstream version 2025.01
- ATF: Upstream version 2.12
    
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx8mm-evk/extlinux.conf.in   |  4 ++
 board/freescale/imx8mm-evk/genimage.cfg.in    | 17 +++++++
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx8mm-evk/patches/linux/linux.hash       |  2 +
 .../imx8mm-evk/patches/uboot/uboot.hash       |  2 +
 board/freescale/imx8mm-evk/post-build.sh      |  7 +++
 board/freescale/imx8mm-evk/readme.txt         | 31 ++++++++++++
 configs/imx8mm-evk_defconfig             | 48 +++++++++++++++++++
 9 files changed, 114 insertions(+)
 create mode 100644 board/freescale/imx8mm-evk/extlinux.conf.in
 create mode 100644 board/freescale/imx8mm-evk/genimage.cfg.in
 create mode 100644 board/freescale/imx8mm-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx8mm-evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx8mm-evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx8mm-evk/patches/uboot/uboot.hash
 create mode 100755 board/freescale/imx8mm-evk/post-build.sh
 create mode 100644 board/freescale/imx8mm-evk/readme.txt
 create mode 100644 configs/imx8mm-evk_defconfig

diff --git a/board/freescale/imx8mm-evk/extlinux.conf.in b/board/freescale/imx8mm-evk/extlinux.conf.in
new file mode 100644
index 000000000000..e408dd6a15ff
--- /dev/null
+++ b/board/freescale/imx8mm-evk/extlinux.conf.in
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mm-evk.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/freescale/imx8mm-evk/genimage.cfg.in b/board/freescale/imx8mm-evk/genimage.cfg.in
new file mode 100644
index 000000000000..10c52548cdfa
--- /dev/null
+++ b/board/freescale/imx8mm-evk/genimage.cfg.in
@@ -0,0 +1,17 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "flash.bin"
+		offset = 33K
+	}
+
+	partition rootfs {
+		offset = 8M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/freescale/imx8mm-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mm-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..b5898cba3f96
--- /dev/null
+++ b/board/freescale/imx8mm-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/freescale/imx8mm-evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx8mm-evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/freescale/imx8mm-evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx8mm-evk/patches/linux/linux.hash b/board/freescale/imx8mm-evk/patches/linux/linux.hash
new file mode 100644
index 000000000000..5e0df51126d5
--- /dev/null
+++ b/board/freescale/imx8mm-evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5f81362a694f51520bff9faecb73f1cc9bc7bece6fdd10d5c27e348df39d7dc4  linux-6.12.16.tar.xz
diff --git a/board/freescale/imx8mm-evk/patches/uboot/uboot.hash b/board/freescale/imx8mm-evk/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..50674352d71d
--- /dev/null
+++ b/board/freescale/imx8mm-evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/board/freescale/imx8mm-evk/post-build.sh b/board/freescale/imx8mm-evk/post-build.sh
new file mode 100755
index 000000000000..604f387768d8
--- /dev/null
+++ b/board/freescale/imx8mm-evk/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR"/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf.in" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg.in" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/freescale/imx8mm-evk/readme.txt b/board/freescale/imx8mm-evk/readme.txt
new file mode 100644
index 000000000000..c5b4c05c48cd
--- /dev/null
+++ b/board/freescale/imx8mm-evk/readme.txt
@@ -0,0 +1,31 @@
+NXP i.MX8MM EVK
+===============
+
+This is a Buildroot target for building an image for the imx8mm-evk
+board using upstream components: TF-A, U-Boot and kernel.
+
+How to build it
+===============
+
+Configure Buildroot and build it:
+
+  $ make imx8mm-evk_defconfig
+  $ make
+
+Flashing the SD card image
+==========================
+
+Copy the sdcard.img file into the SD card:
+
+  $ sudo dd if=output/images/sdcard.img of=<your-sd-device>; sync
+
+
+Booting the board
+=================
+
+To boot your newly created system:
+
+- Insert the SD card in the MicroSD slot of the board.
+- Connect a serial to USB cable to the DEBUG port.
+- Open a terminal on the ttyUSB1 port. For example: sudo picocom -b 115200 /dev/ttyUSB1
+- Power on the board.
diff --git a/configs/imx8mm-evk_defconfig b/configs/imx8mm-evk_defconfig
new file mode 100644
index 000000000000..fa38a62f0e97
--- /dev/null
+++ b/configs/imx8mm-evk_defconfig
@@ -0,0 +1,48 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mm-evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx8mm-evk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX_LPDDR4=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
