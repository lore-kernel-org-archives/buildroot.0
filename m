From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 23:22:31 +0100
Subject: [Buildroot] [git commit] board: add support for nexbox a95x
Message-ID: <20170301170422.ADA2B80279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=688c9aab75c740919ddab80dff769986846c8f6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nexbox A95X is a low cost Android STB based around an Amlogic s905(x) SoC
(quad A53), 8/16GB eMMC and 1/2GB RAM.

Both the s905 (gxbb) and s905x (gxl) variant is supported.

This defconfig uses mainline Linux.  As the mainline support for s905 is
quite young, use the latest release candidate.  There is currently no
support for this board in U-Boot or sources available for the vendor U-Boot,
so the defconfig doesn't build a u-boot and instead uses the existing U-Boot
available in the eMMC.  This also means that we need to wrap the kernel as
uImage, which isn't suppported for aarch64.  Instead this is done in the
post-build script.

Mainline aarch64 defconfig builds most drivers modular, so add mdev for
module autoloading.

[Peter: explicitly set BR2_cortex_a53=y]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/nexbox/a95x/boot.txt      | 11 ++++++++++
 board/nexbox/a95x/genimage.cfg  | 28 ++++++++++++++++++++++++
 board/nexbox/a95x/post-build.sh | 12 +++++++++++
 board/nexbox/a95x/post-image.sh | 14 ++++++++++++
 board/nexbox/a95x/readme.txt    | 48 +++++++++++++++++++++++++++++++++++++++++
 configs/nexbox_a95x_defconfig   | 20 +++++++++++++++++
 6 files changed, 133 insertions(+)

diff --git a/board/nexbox/a95x/boot.txt b/board/nexbox/a95x/boot.txt
new file mode 100644
index 0000000..b538b4a
--- /dev/null
+++ b/board/nexbox/a95x/boot.txt
@@ -0,0 +1,11 @@
+setenv bootargs console=ttyAML0,115200 earlyprintk root=/dev/mmcblk1p2 rootwait
+
+fatload mmc 0:1 0x01080000 uImage
+
+if itest.s "${aml_dt}" == "gxl_p212_2g"; then
+	fatload mmc 0:1 $dtb_mem_addr meson-gxl-nexbox-a95x.dtb
+else
+	fatload mmc 0:1 $dtb_mem_addr meson-gxbb-nexbox-a95x.dtb
+fi
+
+bootm 0x1080000 - $dtb_mem_addr
diff --git a/board/nexbox/a95x/genimage.cfg b/board/nexbox/a95x/genimage.cfg
new file mode 100644
index 0000000..c6c80f8
--- /dev/null
+++ b/board/nexbox/a95x/genimage.cfg
@@ -0,0 +1,28 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"meson-gxbb-nexbox-a95x.dtb",
+			"meson-gxl-nexbox-a95x.dtb",
+			"boot.scr"
+		}
+	}
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/nexbox/a95x/post-build.sh b/board/nexbox/a95x/post-build.sh
new file mode 100755
index 0000000..9f4cc04
--- /dev/null
+++ b/board/nexbox/a95x/post-build.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+
+$MKIMAGE -C none -A arm64 -T script -d $BOARD_DIR/boot.txt $BINARIES_DIR/boot.scr
+
+# vendor u-boot uses uImage
+if [ -e $BINARIES_DIR/Image ]; then
+    $MKIMAGE -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 \
+	     -n linux -d $BINARIES_DIR/Image $BINARIES_DIR/uImage
+fi
diff --git a/board/nexbox/a95x/post-image.sh b/board/nexbox/a95x/post-image.sh
new file mode 100755
index 0000000..359b4c9
--- /dev/null
+++ b/board/nexbox/a95x/post-image.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/board/nexbox/a95x/readme.txt b/board/nexbox/a95x/readme.txt
new file mode 100644
index 0000000..e08b4e4
--- /dev/null
+++ b/board/nexbox/a95x/readme.txt
@@ -0,0 +1,48 @@
+Nexbox A95X
+
+Intro
+=====
+
+Nexbox A95X is a low cost Android STB based around an Amlogic s905(x) SoC
+(quad A53), 8/16GB eMMC and 1/2GB RAM.  To use this defconfig, wires to the
+internal UART solder pads must be added.  See the linux-meson page for
+details:
+
+http://linux-meson.com/doku.php?id=nexbox_a95x_s905
+
+Both the s905 (gxbb) and s905x (gxl) variant is supported.
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the A95X.  With the current configuration it will
+bring-up the board from microSD, and allow access through the serial
+console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make nexbox_a95x_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto a microSD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+How to boot
+===========
+
+Insert microSD card and connect serial cable. Power board and stop
+U-Boot by pressing any key. Boot the system by typing:
+
+fatload mmc 0:1 0x1070000 boot.scr
+autoscr 0x1070000
diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
new file mode 100644
index 0000000..906a22b
--- /dev/null
+++ b/configs/nexbox_a95x_defconfig
@@ -0,0 +1,20 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_KERNEL_HEADERS_4_9=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/nexbox/a95x/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nexbox/a95x/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10-rc8"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-nexbox-a95x"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
