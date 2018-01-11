From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 11 Jan 2018 08:20:26 +0100
Subject: [Buildroot] [PATCH v8 2/3] board: vyasa: Add qst5 configuration
In-Reply-To: <1515655227-5575-1-git-send-email-jagan@amarulasolutions.com>
References: <1515655227-5575-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1515655227-5575-2-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This configuration build qt5 along with MALI T76X
for vyasa rk3288 board.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v8:
- Rebase on master
Changes for v7:
- Rebase on master
Changes for v6:
- Use custom git repo for linux
Changes for v5:
- New patch

 .gitlab-ci.yml                             |  1 +
 DEVELOPERS                                 |  1 +
 board/amarula/vyasa/readme.txt             | 19 ++++++++++
 configs/amarula_vyasa_rk3288_qt5_defconfig | 59 ++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 configs/amarula_vyasa_rk3288_qt5_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c824703..46b76c2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -67,6 +67,7 @@ acmesystems_aria_g25_256mb_defconfig: *defconfig
 acmesystems_arietta_g25_128mb_defconfig: *defconfig
 acmesystems_arietta_g25_256mb_defconfig: *defconfig
 amarula_vyasa_rk3288_defconfig: *defconfig
+amarula_vyasa_rk3288_qt5_defconfig: *defconfig
 arcturus_ucp1020_defconfig: *defconfig
 arm_foundationv8_defconfig: *defconfig
 arm_juno_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index dc9cf0d..5dcb8db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -776,6 +776,7 @@ F:	board/amarula/
 F:	board/bananapi/
 F:	board/engicam/
 F:	configs/amarula_vyasa_rk3288_defconfig
+F:	configs/amarula_vyasa_rk3288_qt5_defconfig
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a64-olinuxino/
diff --git a/board/amarula/vyasa/readme.txt b/board/amarula/vyasa/readme.txt
index b95889e..167c594 100644
--- a/board/amarula/vyasa/readme.txt
+++ b/board/amarula/vyasa/readme.txt
@@ -29,3 +29,22 @@ You can write this image directly to an SD card device (i.e. /dev/xxx):
   $ sudo sync
 
 Finally, you can insert the SD card to the Vyasa RK3288 board, close J4 and boot it.
+
+Testing graphics on Vysa RK3288
+===============================
+
+Built Mali T76X, Qt5 and demo application:
+
+   $ make amarula_vyasa_rk3288_qt5_defconfig
+   $ make
+
+Test procedure:
+- insert require modules
+# modprobe -a rockchipdrm
+# modprobe -a governor_simpleondemand
+
+- build kernel mali driver as module and insert
+
+- run qt hellowindow
+# cd /usr/lib/qt/examples/opengl/
+# ./hellowindow/hellowindow
diff --git a/configs/amarula_vyasa_rk3288_qt5_defconfig b/configs/amarula_vyasa_rk3288_qt5_defconfig
new file mode 100644
index 0000000..b0aaa17
--- /dev/null
+++ b/configs/amarula_vyasa_rk3288_qt5_defconfig
@@ -0,0 +1,59 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a17=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.14 series
+BR2_KERNEL_HEADERS_4_14=y
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
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/openedev/linux-openedev"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d127129e85a020879f334154300ddd3f7ec21c1e"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-vyasa"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/amarula/vyasa/linux_gmac.fragment"
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
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/vyasa/post-build.sh"
+
+# mali t76x dependency
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+
+# qt5 dependency
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# qt5
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_MALI_T76X=y
-- 
1.9.1
