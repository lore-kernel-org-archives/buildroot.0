Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5523C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 795DC60AD1;
	Sat, 12 Feb 2022 22:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DipF-Hhb4YNl; Sat, 12 Feb 2022 22:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A996079E;
	Sat, 12 Feb 2022 22:12:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8DC91BF3AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A47806079E
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPIxHKaVzfqG for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:11:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA8F0606F9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:11:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1E558825C1; Sat, 12 Feb 2022 22:04:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 23:09:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92dc22dd6823b93b5989a704a2440e724d954bd3
X-Git-Newrev: c0312f71cc89434e2f29e37b4586186240aa4d14
X-Patchwork-Hint: ignore
Message-Id: <20220212220421.1E558825C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_zero_defconfig: switch to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c0312f71cc89434e2f29e37b4586186240aa4d14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
* Exclude FAT partition, it is no longer needed for U-Boot.
* Switch the rootfs partition from MBR to GPT for partition-uuid to work.
* Switch to extlinux, this is convenient for debugging.
* Create common scenarios for multiple boards to create an SD image:
  board/orangepi/common. Currently only orangepi_zero makes use of the
  common infrastructure.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Arnout: remove rootfs size = 63M and remount rw]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/orangepi/common/extlinux.conf       |  4 ++++
 board/orangepi/common/genimage.cfg        | 20 +++++++++++++++++
 board/orangepi/common/post-build.sh       | 34 +++++++++++++++++++++++++++++
 board/orangepi/orangepi-zero/boot.cmd     |  9 --------
 board/orangepi/orangepi-zero/genimage.cfg | 36 -------------------------------
 configs/orangepi_zero_defconfig           |  9 +++-----
 6 files changed, 61 insertions(+), 51 deletions(-)

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
index 0000000000..a61c4a039f
--- /dev/null
+++ b/board/orangepi/common/genimage.cfg
@@ -0,0 +1,20 @@
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
index 5aaa1566c5..464e075e5c 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -20,6 +20,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
@@ -39,16 +40,12 @@ BR2_TARGET_UBOOT_SPL=y
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
