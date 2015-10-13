From: Sanchayan Maity <maitysanchayan@gmail.com>
Date: Tue, 13 Oct 2015 19:04:53 +0530
Subject: [Buildroot] [RFC PATCH] configs: Add support for Toradex Colibri
	Vybrid modules
Message-ID: <3d9749d36f928b2e22bf75ff9091b871b3d1c689.1444739401.git.maitysanchayan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minimal default configuration for Colibri Vybrid modules
tested on Colibri Vybrid VF50 and VF61.

Vybrid is well supported in mainline kernel by Toradex however we
use the custom git branches maintained by Toradex. The configuration
only builds a minimal root filesystem and u-boot plus flash scripts
support is not added at the moment.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
---
 board/toradex/colibri-vf/readme.txt | 21 +++++++++++++++++++++
 configs/colibri_vf_defconfig        | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 board/toradex/colibri-vf/readme.txt
 create mode 100644 configs/colibri_vf_defconfig

diff --git a/board/toradex/colibri-vf/readme.txt b/board/toradex/colibri-vf/readme.txt
new file mode 100644
index 0000000..f0b90c7
--- /dev/null
+++ b/board/toradex/colibri-vf/readme.txt
@@ -0,0 +1,21 @@
+Build instructions
+------------------
+
+As a regular user configure and then build:
+
+$ make colibri_vf_defconfig
+$ make
+
+This configuration will use a linux kernel from the git trees
+maintained by Toradex and build a minimal root file system.
+
+Flashing the board
+------------------
+
+Details can be found at:
+http://developer.toradex.com/knowledge-base/flashing-linux-on-vybrid-modules
+
+The above configuration would result in building of rootfs.ubifs image. After
+preparing the SD card as per the instructions on the above article, replace the
+ubifs.img file in the SD card with rootfs.ubifs image file, renaming it to
+ubifs.img and follow the updation procedure on the above article.
diff --git a/configs/colibri_vf_defconfig b/configs/colibri_vf_defconfig
new file mode 100644
index 0000000..d7c82fc
--- /dev/null
+++ b/configs/colibri_vf_defconfig
@@ -0,0 +1,36 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_EABIHF=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_PACKAGE_HOST_GDB=y
+BR2_PACKAGE_HOST_GDB_PYTHON=y
+BR2_GDB_VERSION_7_8=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_TARGET_OPTIMIZATION="-pipe"
+BR2_TARGET_GENERIC_HOSTNAME="colibri-vf"
+BR2_TARGET_GENERIC_ISSUE="Colibri VF 20151007"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="db509ca6ce2a4c04fe0d2a2e0611bb917ebe4aa8"
+BR2_LINUX_KERNEL_DEFCONFIG="colibri_vf"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="vf610-colibri-eval-v3 vf500-colibri-eval-v3"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_IPROUTE2=y
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
+BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
+BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=8112
+BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y
+BR2_TARGET_ROOTFS_UBIFS_NONE=y
+BR2_TARGET_ROOTFS_UBIFS_OPTS="--space-fixup"
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x20000
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
+BR2_TARGET_ROOTFS_UBI_OPTS=""
-- 
2.6.1
