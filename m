From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 14 Sep 2016 09:49:07 -0300
Subject: [Buildroot] [PATCH] configs: Add support for Solidrun's MX6
	Cubox/Hummingboard
Message-ID: <1473857347-17215-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Solidrun's MX6 Cubox/Hummingboard.

For more information about these boards, please check:

https://www.solid-run.com/freescale-imx6-family/hummingboard/
https://www.solid-run.com/freescale-imx6-family/cubox-i/

U-Boot is capable of detecting the version of the board in run-time
and loads the correct dtb.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Hi Thomas,

Currently board/freescale/common/post-image.sh does not handle
SPL, so I can not use it for these boards.

I will see if we can extend board/freescale/common/post-image.sh
to support SPL as well.

 board/solidrun/mx6cubox/boot.scr.txt  |  7 +++++++
 board/solidrun/mx6cubox/genimage.cfg  | 29 +++++++++++++++++++++++++++++
 board/solidrun/mx6cubox/post-build.sh |  8 ++++++++
 board/solidrun/mx6cubox/post-image.sh | 14 ++++++++++++++
 board/solidrun/mx6cubox/readme.txt    | 18 ++++++++++++++++++
 configs/mx6cubox_defconfig            | 28 ++++++++++++++++++++++++++++
 6 files changed, 104 insertions(+)
 create mode 100644 board/solidrun/mx6cubox/boot.scr.txt
 create mode 100644 board/solidrun/mx6cubox/genimage.cfg
 create mode 100755 board/solidrun/mx6cubox/post-build.sh
 create mode 100755 board/solidrun/mx6cubox/post-image.sh
 create mode 100644 board/solidrun/mx6cubox/readme.txt
 create mode 100644 configs/mx6cubox_defconfig

diff --git a/board/solidrun/mx6cubox/boot.scr.txt b/board/solidrun/mx6cubox/boot.scr.txt
new file mode 100644
index 0000000..7a8aa4b
--- /dev/null
+++ b/board/solidrun/mx6cubox/boot.scr.txt
@@ -0,0 +1,7 @@
+setenv finduuid "part uuid mmc 0:1 uuid"
+run finduuid
+run findfdt
+setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
+load mmc 0:1 ${fdt_addr} boot/${fdtfile}
+load mmc 0:1 ${loadaddr} boot/zImage
+bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/solidrun/mx6cubox/genimage.cfg b/board/solidrun/mx6cubox/genimage.cfg
new file mode 100644
index 0000000..490986a
--- /dev/null
+++ b/board/solidrun/mx6cubox/genimage.cfg
@@ -0,0 +1,29 @@
+# Minimal SD card image for the MX6 Cubox/Hummingboard
+#
+# U-Boot SPL and u-boot.img are flashed in the first 1MB raw partition.
+# A single root filesystem partition is used (Ext4 in this case).
+#
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "SPL"
+		offset = 1K
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 69K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 1M
+		size = 512M
+	}
+}
diff --git a/board/solidrun/mx6cubox/post-build.sh b/board/solidrun/mx6cubox/post-build.sh
new file mode 100755
index 0000000..07c480e
--- /dev/null
+++ b/board/solidrun/mx6cubox/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+-n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
+
+install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/solidrun/mx6cubox/post-image.sh b/board/solidrun/mx6cubox/post-image.sh
new file mode 100755
index 0000000..b4ac460
--- /dev/null
+++ b/board/solidrun/mx6cubox/post-image.sh
@@ -0,0 +1,14 @@
+#!/usr/bin/env bash
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
diff --git a/board/solidrun/mx6cubox/readme.txt b/board/solidrun/mx6cubox/readme.txt
new file mode 100644
index 0000000..630ab6c
--- /dev/null
+++ b/board/solidrun/mx6cubox/readme.txt
@@ -0,0 +1,18 @@
+Solidrun's MX6 Cubox/Hummingboard
+
+https://www.solid-run.com/freescale-imx6-family/hummingboard/
+
+https://www.solid-run.com/freescale-imx6-family/cubox-i/
+
+To build a minimal support for these boards:
+
+    $ make mx6cubox_defconfig
+    $ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on an SD card:
+
+dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
+
+For details about the medium image layout, see the definition in
+board/solidrun/mx6cubox/genimage.cfg.
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
new file mode 100644
index 0000000..e27a2bb
--- /dev/null
+++ b/configs/mx6cubox_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_cortex_a9=y
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/mx6cubox/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/mx6cubox/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6cuboxi"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.3"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-cubox-i imx6dl-cubox-i imx6q-hummingboard imx6dl-hummingboard"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.4
