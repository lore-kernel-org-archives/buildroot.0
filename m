From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 11:59:23 +0100
Subject: [Buildroot] [git commit] configs/firefly_rk3288: remove defconfig
Message-ID: <20180306110131.8078982257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0fd706c2fe77157ec9d157568acf535d7d8daca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original submitter of this defconfig:

"""
Sorry, unfortunately we no longer have the firefly board,
so we can't maintain it.
"""

And this defconfig fails to build with gcc 6.x, causing breakage in
the defconfig testing.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306815
  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306814

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                             |  2 --
 board/firefly/firefly-rk3288/extlinux.conf |  6 -----
 board/firefly/firefly-rk3288/post-build.sh |  3 ---
 board/firefly/firefly-rk3288/post-image.sh | 20 ---------------
 board/firefly/firefly-rk3288/readme.txt    | 40 ------------------------------
 board/firefly/firefly-rk3288/sd-image.cfg  | 22 ----------------
 configs/firefly_rk3288_defconfig           | 32 ------------------------
 configs/firefly_rk3288_demo_defconfig      | 40 ------------------------------
 8 files changed, 165 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f52487b35c..5edb19f75d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -111,8 +111,6 @@ engicam_imx6qdl_icore_qt5_defconfig: *defconfig
 engicam_imx6qdl_icore_rqs_defconfig: *defconfig
 engicam_imx6ul_geam_defconfig: *defconfig
 engicam_imx6ul_isiot_defconfig: *defconfig
-firefly_rk3288_defconfig: *defconfig
-firefly_rk3288_demo_defconfig: *defconfig
 freescale_imx28evk_defconfig: *defconfig
 freescale_imx31_3stack_defconfig: *defconfig
 freescale_imx6dlsabreauto_defconfig: *defconfig
diff --git a/board/firefly/firefly-rk3288/extlinux.conf b/board/firefly/firefly-rk3288/extlinux.conf
deleted file mode 100644
index 39ac5b9dac..0000000000
--- a/board/firefly/firefly-rk3288/extlinux.conf
+++ /dev/null
@@ -1,6 +0,0 @@
-default firefly-rk3288
-
-label firefly-rk3288
-kernel /boot/uImage
-devicetree /boot/rk3288-firefly.dtb
-append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/firefly/firefly-rk3288/post-build.sh b/board/firefly/firefly-rk3288/post-build.sh
deleted file mode 100755
index 94e89ce6a4..0000000000
--- a/board/firefly/firefly-rk3288/post-build.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/firefly/firefly-rk3288/post-image.sh b/board/firefly/firefly-rk3288/post-image.sh
deleted file mode 100755
index d89bc7e550..0000000000
--- a/board/firefly/firefly-rk3288/post-image.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-MKIMAGE=$HOST_DIR/bin/mkimage
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/sd-image.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage							\
-	--rootpath "${TARGET_DIR}"		\
-	--tmppath "${GENIMAGE_TMP}"		\
-	--inputpath "${BINARIES_DIR}"	\
-	--outputpath "${BINARIES_DIR}"	\
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/firefly/firefly-rk3288/readme.txt b/board/firefly/firefly-rk3288/readme.txt
deleted file mode 100644
index d6210857f1..0000000000
--- a/board/firefly/firefly-rk3288/readme.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Firefly RK3288
-
-How to build it
-===============
-
-  $ make firefly_rk3288_defconfig
-
-Then you can edit the build options using
-
-  $ make menuconfig
-
-Compile all and build rootfs image:
-
-  $ make
-
-Result of the build
--------------------
-
-After building, you should get a tree like this:
-
-  output/images/
-  ????????? rk3288-firefly.dtb
-  ????????? rootfs.ext2
-  ????????? rootfs.ext4 -> rootfs.ext2
-  ????????? sdcard.img
-  ????????? u-boot-dtb.img
-  ????????? u-boot-spl-dtb.bin
-  ????????? u-boot-spl-dtb.img
-  ????????? uImage
-
-Prepare your SDCard
-===================
-
-Buildroot generates a ready-to-use SD card image that you can flash directly to
-the card. The image will be in output/images/sdcard.img.
-You can write this image directly to an SD card device (i.e. /dev/xxx):
-
-  $ dd if=output/images/sdcard.img of=/dev/xxx
-
-Finally, you can insert the SD card to the Firefly RK3288 board and boot it.
diff --git a/board/firefly/firefly-rk3288/sd-image.cfg b/board/firefly/firefly-rk3288/sd-image.cfg
deleted file mode 100644
index a9eb9f0142..0000000000
--- a/board/firefly/firefly-rk3288/sd-image.cfg
+++ /dev/null
@@ -1,22 +0,0 @@
-image sdcard.img {
-  hdimage {
-  }
-
-  partition u-boot-spl-dtb {
-    in-partition-table = "no"
-    image = "u-boot-spl-dtb.img"
-    offset = 32K
-  }
-
-  partition u-boot-dtb {
-    in-partition-table = "no"
-    image = "u-boot-dtb.img"
-    offset = 128K
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-    size = 512M
-  }
-}
diff --git a/configs/firefly_rk3288_defconfig b/configs/firefly_rk3288_defconfig
deleted file mode 100644
index 017a7ee6d7..0000000000
--- a/configs/firefly_rk3288_defconfig
+++ /dev/null
@@ -1,32 +0,0 @@
-BR2_arm=y
-BR2_cortex_a17=y
-BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
-BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
-BR2_TARGET_GENERIC_ISSUE="Welcome to FIREFLY RK3288!"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mmind/linux-rockchip.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
-BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="firefly-rk3288"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
deleted file mode 100644
index d394ede30e..0000000000
--- a/configs/firefly_rk3288_demo_defconfig
+++ /dev/null
@@ -1,40 +0,0 @@
-BR2_arm=y
-BR2_cortex_a17=y
-BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
-BR2_TARGET_GENERIC_ISSUE="Welcome to FIREFLY RK3288!"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mmind/linux-rockchip.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
-BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_EXAMPLES=y
-BR2_PACKAGE_QT5BASE_GUI=y
-BR2_PACKAGE_QT5BASE_EGLFS=y
-BR2_PACKAGE_MALI_T76X=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="firefly-rk3288"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
