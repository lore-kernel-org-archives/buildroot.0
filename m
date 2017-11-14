From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 14 Nov 2017 12:43:51 +0100
Subject: [Buildroot] [PATCH v2 2/2] board: Add Vyasa RK388 board support
In-Reply-To: <1510659831-22535-1-git-send-email-jagan@amarulasolutions.com>
References: <1510659831-22535-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1510659831-22535-2-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Vyasa board, from rk3288 family SOC.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- Bump to U-Boot v2017.11
- Bump to linux-next

 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  2 ++
 board/amarula/vyasa/extlinux.conf      |  4 +++
 board/amarula/vyasa/genimage.cfg       | 21 +++++++++++++
 board/amarula/vyasa/post-build.sh      | 10 +++++++
 board/amarula/vyasa/readme.txt         | 31 +++++++++++++++++++
 configs/amarula_vyasa_rk3288_defconfig | 55 ++++++++++++++++++++++++++++++++++
 7 files changed, 124 insertions(+)
 create mode 100644 board/amarula/vyasa/extlinux.conf
 create mode 100644 board/amarula/vyasa/genimage.cfg
 create mode 100755 board/amarula/vyasa/post-build.sh
 create mode 100644 board/amarula/vyasa/readme.txt
 create mode 100644 configs/amarula_vyasa_rk3288_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0e69288..ba4653f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -62,6 +62,7 @@ acmesystems_aria_g25_128mb_defconfig: *defconfig
 acmesystems_aria_g25_256mb_defconfig: *defconfig
 acmesystems_arietta_g25_128mb_defconfig: *defconfig
 acmesystems_arietta_g25_256mb_defconfig: *defconfig
+amarula_vyasa_rk3288_defconfig: *defconfig
 arcturus_ucp1020_defconfig: *defconfig
 arm_foundationv8_defconfig: *defconfig
 arm_juno_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 942abcf..a1ea87f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -878,6 +878,8 @@ F:	package/keepalived/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
+F:	board/amarula/
+F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
 F:	configs/engicam_imx6qdl_icore_qt5_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_defconfig
diff --git a/board/amarula/vyasa/extlinux.conf b/board/amarula/vyasa/extlinux.conf
new file mode 100644
index 0000000..5710260
--- /dev/null
+++ b/board/amarula/vyasa/extlinux.conf
@@ -0,0 +1,4 @@
+label Vyasa Linux-4.13
+	kernel /boot/uImage
+	devicetree /boot/rk3288-vyasa.dtb
+	append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/amarula/vyasa/genimage.cfg b/board/amarula/vyasa/genimage.cfg
new file mode 100644
index 0000000..e9d826a
--- /dev/null
+++ b/board/amarula/vyasa/genimage.cfg
@@ -0,0 +1,21 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "u-boot-tpl-spl-dtb.img"
+		offset = 32K
+	}
+
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot-dtb.img"
+		offset = 128K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/amarula/vyasa/post-build.sh b/board/amarula/vyasa/post-build.sh
new file mode 100755
index 0000000..5298848
--- /dev/null
+++ b/board/amarula/vyasa/post-build.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+
+BOARD_DIR="$(dirname $0)"
+
+$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
+cat $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-tpl.img > $BINARIES_DIR/u-boot-tpl-spl-dtb.img
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/amarula/vyasa/readme.txt b/board/amarula/vyasa/readme.txt
new file mode 100644
index 0000000..b95889e
--- /dev/null
+++ b/board/amarula/vyasa/readme.txt
@@ -0,0 +1,31 @@
+Vyasa RK3288
+============
+
+Vyasa is RK3288 based Single board computer with fully supported opensource software.
+
+https://openedev.amarulasolutions.com/display/ODWIKI/Vyasa+RK3288
+
+How to build it
+===============
+
+  $ make amarula_vyasa_rk3288_defconfig
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
+Finally, you can insert the SD card to the Vyasa RK3288 board, close J4 and boot it.
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
new file mode 100644
index 0000000..3e24cbf
--- /dev/null
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -0,0 +1,55 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a17=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.13 series
+BR2_KERNEL_HEADERS_4_13=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
+BR2_TARGET_UBOOT_TPL=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-vyasa"
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="vyasa-rk3288"
+BR2_TARGET_GENERIC_ISSUE="Welcome to VYASA RK3288!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/vyasa/post-build.sh"
+
+# qt5
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_MALI_T76X=y
-- 
1.9.1
