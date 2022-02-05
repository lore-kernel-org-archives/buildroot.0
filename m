Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D45DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 21:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A20440591;
	Sat,  5 Feb 2022 21:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nxum2XWpkyZM; Sat,  5 Feb 2022 21:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8E64054A;
	Sat,  5 Feb 2022 21:56:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33D1C1BF2CF
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 21:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AFD560758
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 21:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZeCZatQhDRD for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 21:56:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEFEA60640
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 21:56:05 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id k18so1927990lji.12
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 13:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rnf1bbxOCVom2LBSIiY08TAm3z3XFXNOODI9XMbLo98=;
 b=pcMhxpfNRMJMaArB7YCpNBlPCIKrS/Jyp2c24HWqC32hGcKbS31tULnWTIBqY/TCWY
 y03VOA3TLsww6FBwmiCPgAJkwHJVVScAkV5a1rmjguMVswkRqqsR3JNoZxdKVElLbxOG
 O6Rly+6pGIjKoYF6m0g6gCEpU/V22826TecgFEqYZhVT7DdJMFRMEsyBTQy0c7fCCoC+
 FigTsJ1SlwcGQaE9xDPpSXBawT8vJYiPPYQnWPAbUeevIJbO3GWMW0dCuD1eeL23Ptio
 ZmFlTjdVNlmvBysGHxOxier6ZI3hyF9Hngz8TesnWq4Bx+krteHqo8H+RO4zj6c5KUTX
 q1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rnf1bbxOCVom2LBSIiY08TAm3z3XFXNOODI9XMbLo98=;
 b=l+7ik7CfsXX+GR+a2I2VIOzvEIeKd2cVHQKbcMFpjQqzAFPIRWQvhECiTq5XjFcQWc
 7qQUtZZ6WQTLxCzgQBF6KPgqMBaMw8AyW3UnmvpmJ1+cjSO4xQgeBOdRDFpH7Ua3fayJ
 oWar7lHC+lg+ZmGhkEfkM5mRNXtrDvtrtBTpGiByB0udR/DKzUlu4sX+/jXUMKhm8T5E
 CD/aDofzRuWaU7yu8ZzDFU9zGMHggj9zFZUh2iku8zr9LO78Dgb90aTD8741Eq+/kEP4
 m8P+wE+qwKdkj15iGMe8L+qrB3eTlHDOIlSRwCeAsp8ZXH+663cP3iTTkInJ6eFNeX1o
 LmHw==
X-Gm-Message-State: AOAM532cnvnL2HLvWqJuvcjAw/nvae3H+E829NtTy4Se+u7pZY46113t
 XJVkL3RG0rkc1nlCJwYJvrBKsvtFHj8=
X-Google-Smtp-Source: ABdhPJxva0oy5s20JYp3KORLvmWcD41VZz5LhsrSjpo4UV9tuJ6tO4FxMx4Zq+4Ct64vWxKU5DUW1A==
X-Received: by 2002:a2e:7f03:: with SMTP id a3mr3942363ljd.525.1644098163278; 
 Sat, 05 Feb 2022 13:56:03 -0800 (PST)
Received: from hellfire.local ([178.155.5.31])
 by smtp.gmail.com with ESMTPSA id y15sm856936lfk.195.2022.02.05.13.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 13:56:02 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 00:55:58 +0300
Message-Id: <20220205215558.30751-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] configs/orangepi_zero_defconfig: switch to
 extlinux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
v1:
- Exclude FAT partition, it is no longer needed for U-Boot.
- Switch the rootfs partition from MBR to GPT for partition-uuid to work.
- Switch to extlinux, this is convenient for debugging.
- Create common scenarios for multiple boards to create an SD image: board/orangepi/common.

v2:
- Fix typo in first line of changes (s/he/it).
- Add BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y.
- Exclude one boot option from extlinux.conf.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 board/orangepi/common/extlinux.conf       |  4 +++
 board/orangepi/common/genimage.cfg        | 23 +++++++++++++++
 board/orangepi/common/post-build.sh       | 34 +++++++++++++++++++++
 board/orangepi/orangepi-zero/boot.cmd     |  9 ------
 board/orangepi/orangepi-zero/genimage.cfg | 36 -----------------------
 configs/orangepi_zero_defconfig           | 11 ++++---
 6 files changed, 66 insertions(+), 51 deletions(-)
 create mode 100644 board/orangepi/common/extlinux.conf
 create mode 100644 board/orangepi/common/genimage.cfg
 create mode 100755 board/orangepi/common/post-build.sh
 delete mode 100644 board/orangepi/orangepi-zero/boot.cmd
 delete mode 100644 board/orangepi/orangepi-zero/genimage.cfg

diff --git a/board/orangepi/common/extlinux.conf b/board/orangepi/common/extlinux.conf
new file mode 100644
index 0000000000..12f496b1fa
--- /dev/null
+++ b/board/orangepi/common/extlinux.conf
@@ -0,0 +1,4 @@
+LABEL default
+  kernel /boot/%LINUXIMAGE%
+  devicetreedir /boot
+  append root=PARTUUID=%PARTUUID% rootwait console=${console} rootfstype=ext4 quiet panic=10
diff --git a/board/orangepi/common/genimage.cfg b/board/orangepi/common/genimage.cfg
new file mode 100644
index 0000000000..fa0d988991
--- /dev/null
+++ b/board/orangepi/common/genimage.cfg
@@ -0,0 +1,23 @@
+image sdcard.img {
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
+	}
+
+	hdimage {
+		partition-table-type = gpt
+		gpt-location = 1008K # 1MB - 16KB(GPT)
+		gpt-no-backup = true
+		# After writing the image to the SD card,
+		# backup GPT data structures at the end of the disk:
+		# gdisk /dev/mmcblk0 then press the buttons: x, e, w, y
+	}
+
+	partition rootfs {
+		offset = 1M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/orangepi/common/post-build.sh b/board/orangepi/common/post-build.sh
new file mode 100755
index 0000000000..296f94b174
--- /dev/null
+++ b/board/orangepi/common/post-build.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+linux_image()
+{
+	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
+		echo "uImage"
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
+		echo "Image"
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" ${BR2_CONFIG}; then
+		echo "Image.gz"
+	else
+		echo "zImage"
+	fi
+}
+
+generic_getty()
+{
+	if grep -Eq "^BR2_TARGET_GENERIC_GETTY=y$" ${BR2_CONFIG}; then
+		echo ""
+	else
+		echo "s/\s*console=\S*//"
+	fi
+}
+
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+
+sed -e "$(generic_getty)" \
+	-e "s/%LINUXIMAGE%/$(linux_image)/g" \
+	-e "s/%PARTUUID%/$PARTUUID/g" \
+	"board/orangepi/common/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+
+sed "s/%PARTUUID%/$PARTUUID/g" "board/orangepi/common/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/orangepi/orangepi-zero/boot.cmd b/board/orangepi/orangepi-zero/boot.cmd
deleted file mode 100644
index d094a64fe5..0000000000
--- a/board/orangepi/orangepi-zero/boot.cmd
+++ /dev/null
@@ -1,9 +0,0 @@
-setenv fdt_high ffffffff
-
-part uuid mmc 0:2 uuid
-setenv bootargs console=ttyS0,115200 root=PARTUUID=${uuid} rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-zero.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-zero/genimage.cfg b/board/orangepi/orangepi-zero/genimage.cfg
deleted file mode 100644
index 32f5454ae6..0000000000
--- a/board/orangepi/orangepi-zero/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the OrangePi Zero
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h2-plus-orangepi-zero.dtb",
-			"boot.scr"
-		}
-	}
-	size = 10M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 5aaa1566c5..96f0c3f600 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -20,10 +20,13 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="63M"
+BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloader
@@ -39,16 +42,12 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
 # Required tools to create the SD image
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
 
 # Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 
 # Wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
