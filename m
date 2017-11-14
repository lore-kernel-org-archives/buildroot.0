From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 14 Nov 2017 14:01:35 +0100
Subject: [Buildroot] [PATCH] board: Add Tinker RK388 board support
Message-ID: <1510664495-32650-1-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Tinker board, from rk3288 family SOC.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  2 ++
 board/asus/tinker/extlinux.conf      |  4 +++
 board/asus/tinker/genimage.cfg       | 21 ++++++++++++++
 board/asus/tinker/post-build.sh      |  8 ++++++
 board/asus/tinker/readme.txt         | 37 ++++++++++++++++++++++++
 configs/asus_tinker_rk3288_defconfig | 54 ++++++++++++++++++++++++++++++++++++
 7 files changed, 127 insertions(+)
 create mode 100644 board/asus/tinker/extlinux.conf
 create mode 100644 board/asus/tinker/genimage.cfg
 create mode 100755 board/asus/tinker/post-build.sh
 create mode 100644 board/asus/tinker/readme.txt
 create mode 100644 configs/asus_tinker_rk3288_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ba4653f..e5113e9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -69,6 +69,7 @@ arm_juno_defconfig: *defconfig
 armadeus_apf27_defconfig: *defconfig
 armadeus_apf28_defconfig: *defconfig
 armadeus_apf51_defconfig: *defconfig
+asus_tinker_rk3288_defconfig: *defconfig
 at91sam9260eknf_defconfig: *defconfig
 at91sam9g20dfc_defconfig: *defconfig
 at91sam9g45m10ek_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index b5a2dfe..ae75cc4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -878,8 +878,10 @@ F:	package/keepalived/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/
+F:	board/asus/
 F:	board/engicam/
 F:	configs/amarula_vyasa_rk3288_defconfig
+F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
 F:	configs/engicam_imx6qdl_icore_qt5_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_defconfig
diff --git a/board/asus/tinker/extlinux.conf b/board/asus/tinker/extlinux.conf
new file mode 100644
index 0000000..eb8f88c
--- /dev/null
+++ b/board/asus/tinker/extlinux.conf
@@ -0,0 +1,4 @@
+label Tinker linux-next
+	kernel /boot/uImage
+	devicetree /boot/rk3288-tinker.dtb
+	append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/asus/tinker/genimage.cfg b/board/asus/tinker/genimage.cfg
new file mode 100644
index 0000000..e65c9dc
--- /dev/null
+++ b/board/asus/tinker/genimage.cfg
@@ -0,0 +1,21 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "u-boot-spl-dtb.img"
+		offset = 32K
+	}
+
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot-dtb.img"
+		offset = 8M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/asus/tinker/post-build.sh b/board/asus/tinker/post-build.sh
new file mode 100755
index 0000000..040a063
--- /dev/null
+++ b/board/asus/tinker/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+
+BOARD_DIR="$(dirname $0)"
+
+$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
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
index 0000000..8122e90
--- /dev/null
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -0,0 +1,54 @@
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
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
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
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
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
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
+
+# qt5
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_MALI_T76X=y
-- 
1.9.1
