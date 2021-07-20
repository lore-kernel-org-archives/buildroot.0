From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:27:29 +0200
Subject: [Buildroot] [git commit] board/mx6cubox: Switch to extlinux.conf
Message-ID: <20210720185328.D4D6588517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=981bc738a498cc9355fe71a54b239bc4119091c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently mx6cubox uses a custom boot.scr.txt script
and custom image generation scripts: genimage.cfg, post-build.sh
and post-image.sh.

Switch to using the more standard extlinux.conf solution
and remove the custom scripts in favor of the standard
board/freescale/common/imx/post-image.sh one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/solidrun/mx6cubox/boot.scr.txt               |  7 ----
 board/solidrun/mx6cubox/genimage.cfg               | 29 ----------------
 ...6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch | 29 ++++++++++++++++
 .../0002-mx6cuboxi-Fix-the-console-variable.patch  | 40 ++++++++++++++++++++++
 board/solidrun/mx6cubox/post-build.sh              |  8 -----
 board/solidrun/mx6cubox/post-image.sh              | 14 --------
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  4 +++
 configs/mx6cubox_defconfig                         |  5 +--
 8 files changed, 76 insertions(+), 60 deletions(-)

diff --git a/board/solidrun/mx6cubox/boot.scr.txt b/board/solidrun/mx6cubox/boot.scr.txt
deleted file mode 100644
index e4cf814783..0000000000
--- a/board/solidrun/mx6cubox/boot.scr.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv finduuid "part uuid mmc 1:1 uuid"
-run finduuid
-run findfdt
-setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 1:1 ${fdt_addr} boot/${fdtfile}
-load mmc 1:1 ${loadaddr} boot/zImage
-bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/solidrun/mx6cubox/genimage.cfg b/board/solidrun/mx6cubox/genimage.cfg
deleted file mode 100644
index 490986ac86..0000000000
--- a/board/solidrun/mx6cubox/genimage.cfg
+++ /dev/null
@@ -1,29 +0,0 @@
-# Minimal SD card image for the MX6 Cubox/Hummingboard
-#
-# U-Boot SPL and u-boot.img are flashed in the first 1MB raw partition.
-# A single root filesystem partition is used (Ext4 in this case).
-#
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition spl {
-		in-partition-table = "no"
-		image = "SPL"
-		offset = 1K
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.img"
-		offset = 69K
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		offset = 1M
-		size = 512M
-	}
-}
diff --git a/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch b/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
new file mode 100644
index 0000000000..b9755a042b
--- /dev/null
+++ b/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
@@ -0,0 +1,29 @@
+From 96db7c072b96f9b7a1d9a986eff20353f7459004 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Sun, 18 Jul 2021 19:08:36 -0300
+Subject: [PATCH] mx6cuboxi: Fix the mmc device for the rootfs
+
+After the comversion to DM_MMC, the rootfs is mmc 1, so
+adjust it accordingly.
+
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ include/configs/mx6cuboxi.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
+index 55717c77ab38..1a06f29b8c17 100644
+--- a/include/configs/mx6cuboxi.h
++++ b/include/configs/mx6cuboxi.h
+@@ -57,7 +57,7 @@
+ 	"console=" CONSOLE_DEV ",115200\0" \
+ 	"bootm_size=0x10000000\0" \
+ 	"mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
+-	"finduuid=part uuid mmc 0:1 uuid\0" \
++	"finduuid=part uuid mmc 1:1 uuid\0" \
+ 	"update_sd_firmware=" \
+ 		"if test ${ip_dyn} = yes; then " \
+ 			"setenv get_cmd dhcp; " \
+-- 
+2.25.1
+
diff --git a/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch b/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
new file mode 100644
index 0000000000..c02134101f
--- /dev/null
+++ b/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
@@ -0,0 +1,40 @@
+From ab1dd9332c379164925aee755a013dbd8839501b Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Mon, 19 Jul 2021 16:48:07 -0300
+Subject: [PATCH 2/2] mx6cuboxi: Fix the console variable
+
+Do not pass the console baudrate to the 'console' variable
+to avoid the baudrate being passed twice when using extlinux.conf:
+
+cat /proc/cmdline
+root=PARTUUID=00000000-01 rootwait rw console=ttymxc0,115200,115200
+
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ include/configs/mx6cuboxi.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
+index 1a06f29b8c17..9e5083b0d876 100644
+--- a/include/configs/mx6cuboxi.h
++++ b/include/configs/mx6cuboxi.h
+@@ -38,7 +38,6 @@
+ /* Command definition */
+ 
+ #define CONFIG_MXC_UART_BASE	UART1_BASE
+-#define CONSOLE_DEV	"ttymxc0"
+ 
+ #ifndef CONFIG_SPL_BUILD
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+@@ -54,7 +53,7 @@
+ 	"ramdiskaddr=0x13000000\0" \
+ 	"initrd_high=0xffffffff\0" \
+ 	"ip_dyn=yes\0" \
+-	"console=" CONSOLE_DEV ",115200\0" \
++	"console=ttymxc0\0" \
+ 	"bootm_size=0x10000000\0" \
+ 	"mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
+ 	"finduuid=part uuid mmc 1:1 uuid\0" \
+-- 
+2.25.1
+
diff --git a/board/solidrun/mx6cubox/post-build.sh b/board/solidrun/mx6cubox/post-build.sh
deleted file mode 100755
index 6ddc113702..0000000000
--- a/board/solidrun/mx6cubox/post-build.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -d -m 755 $TARGET_DIR/boot
-
-$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
-	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
diff --git a/board/solidrun/mx6cubox/post-image.sh b/board/solidrun/mx6cubox/post-image.sh
deleted file mode 100755
index b4ac4608ff..0000000000
--- a/board/solidrun/mx6cubox/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf b/board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..d011066357
--- /dev/null
+++ b/board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6qdl-cubox Buildroot
+	kernel ../zImage
+	fdtdir ../
+	append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate} 
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index 24226ba30d..60bfd17092 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -11,8 +11,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # System configuration
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/mx6cubox/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/mx6cubox/post-image.sh"
+BR2_ROOTFS_OVERLAY="board/solidrun/mx6cubox/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_GLOBAL_PATCH_DIR="board/solidrun/mx6cubox/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
