From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 11 Jan 2018 08:20:27 +0100
Subject: [Buildroot] [PATCH v8 3/3] board: Add Tinker RK3288 board support
In-Reply-To: <1515655227-5575-1-git-send-email-jagan@amarulasolutions.com>
References: <1515655227-5575-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1515655227-5575-3-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Tinker board, from rk3288 family SOC.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v8:
- Rebase on master
Changes for v7:
- Rebase on master
Changes for v6:
- None
Changes for v5:
- Add host-uboot-tools
- Fix commit message
- Drop Qt5 configs
Changes for v4:
- enable BR2_LINUX_KERNEL_INSTALL_TARGET
- enable BR2_TARGET_UBOOT_FORMAT_DTB_BINe
- Create single u-boot binary
- Use linux-4.12 along with same headers

 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  2 ++
 board/asus/tinker/extlinux.conf      |  4 ++++
 board/asus/tinker/genimage.cfg       | 15 ++++++++++++
 board/asus/tinker/post-build.sh      |  9 ++++++++
 board/asus/tinker/readme.txt         | 37 +++++++++++++++++++++++++++++
 configs/asus_tinker_rk3288_defconfig | 45 ++++++++++++++++++++++++++++++++++++
 7 files changed, 113 insertions(+)
 create mode 100644 board/asus/tinker/extlinux.conf
 create mode 100644 board/asus/tinker/genimage.cfg
 create mode 100755 board/asus/tinker/post-build.sh
 create mode 100644 board/asus/tinker/readme.txt
 create mode 100644 configs/asus_tinker_rk3288_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 46b76c2..ffe0f67 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -74,6 +74,7 @@ arm_juno_defconfig: *defconfig
 armadeus_apf27_defconfig: *defconfig
 armadeus_apf28_defconfig: *defconfig
 armadeus_apf51_defconfig: *defconfig
+asus_tinker_rk3288_defconfig: *defconfig
 at91sam9260eknf_defconfig: *defconfig
 at91sam9g20dfc_defconfig: *defconfig
 at91sam9g45m10ek_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 5dcb8db..fcb52fa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -773,10 +773,12 @@ F:	package/axel/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/
+F:	board/asus/
 F:	board/bananapi/
 F:	board/engicam/
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/amarula_vyasa_rk3288_qt5_defconfig
+F:	configs/asus_tinker_rk3288_defconfig
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a64-olinuxino/
diff --git a/board/asus/tinker/extlinux.conf b/board/asus/tinker/extlinux.conf
new file mode 100644
index 0000000..136af0d
--- /dev/null
+++ b/board/asus/tinker/extlinux.conf
@@ -0,0 +1,4 @@
+label Tinker linux-next
+  kernel /boot/uImage
+  devicetree /boot/rk3288-tinker.dtb
+  append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/asus/tinker/genimage.cfg b/board/asus/tinker/genimage.cfg
new file mode 100644
index 0000000..a4b1e8d
--- /dev/null
+++ b/board/asus/tinker/genimage.cfg
@@ -0,0 +1,15 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-spl-dtb {
+		in-partition-table = "no"
+		image = "u-boot-spl-dtb.img"
+		offset = 32K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/asus/tinker/post-build.sh b/board/asus/tinker/post-build.sh
new file mode 100755
index 0000000..8108ed8
--- /dev/null
+++ b/board/asus/tinker/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOARD_DIR="$(dirname $0)"
+
+$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
+cat $BINARIES_DIR/u-boot-dtb.bin >> $BINARIES_DIR/u-boot-spl-dtb.img
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/asus/tinker/readme.txt b/board/asus/tinker/readme.txt
new file mode 100644
index 0000000..7372d29
--- /dev/null
+++ b/board/asus/tinker/readme.txt
@@ -0,0 +1,37 @@
+Tinker RK3288
+=============
+
+Tinker Board is a Single Board Computer (SBC) in an ultra-small form
+factor that offers class-leading performance while leveraging outstanding
+mechanical compatibility.
+
+Tinker link:
+https://www.asus.com/in/Single-Board-Computer/Tinker-Board/
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/Tinker+RK3288
+
+How to build it
+===============
+
+  $ make asus_tinker_rk3288_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build rootfs image:
+
+  $ make
+
+Prepare your SDCard
+===================
+
+Buildroot generates a ready-to-use SD card image that you can flash directly to
+the card. The image will be in output/images/sdcard.img.
+You can write this image directly to an SD card device (i.e. /dev/xxx):
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/xxx
+  $ sudo sync
+
+Finally, you can insert the SD card to the Tinker RK3288 board and boot it.
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
new file mode 100644
index 0000000..22e9bcd
--- /dev/null
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -0,0 +1,45 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a17=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="tinker-rk3288"
+BR2_TARGET_GENERIC_ISSUE="Welcome to TINKER RK3288!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
-- 
1.9.1
