From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  5 Jul 2017 15:00:59 +0200
Subject: [Buildroot] [PATCH v6 1/2] fs/ext2: rename
	BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
Message-ID: <20170705130100.441-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change deprecates the ext2/3/4 rootfs size in blocks symbol in
favor of one that mimic the fs-size argument behavior of mkfs (i.e.
size in a human readable format accepting k, m, g or t suffix or their
upper-case variants).

This change also updates the defconfigs that used to set
BR2_TARGET_ROOTFS_EXT2_BLOCKS symbol.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5->v6:
- rebase
- fix typo (Peter)
- add comments in legacy (Arnout)
- quote EXT2_SIZE usage (Arnout)
- use more human-friendly size (defaults + defconfigs) (Arnout)
- trigger legacy when using the deprecated valid (Arnout)

changes v4->v5:
- new patch (Arnout)
---
 Config.in.legacy                            | 15 +++++++++++++++
 configs/at91sam9x5ek_mmc_dev_defconfig      |  2 +-
 configs/beaglebone_qt5_defconfig            |  2 +-
 configs/firefly_rk3288_demo_defconfig       |  2 +-
 configs/minnowboard_max-graphical_defconfig |  3 +--
 configs/nanopi_neo_defconfig                |  2 +-
 configs/pc_x86_64_bios_defconfig            |  2 +-
 configs/pc_x86_64_efi_defconfig             |  2 +-
 configs/raspberrypi3_64_defconfig           |  2 +-
 fs/ext2/Config.in                           | 13 ++++++++-----
 fs/ext2/ext2.mk                             |  7 ++++++-
 11 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 12362da6f..853e2f913 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,21 @@ config BR2_PACKAGE_HOST_MKE2IMG
 	  We now call mkfs directly to generate ext2/3/4 filesystem
 	  image, so mke2img is no longer necessary.
 
+config BR2_TARGET_ROOTFS_EXT2_BLOCKS
+	int "exact size in blocks has been removed"
+	default 0
+	help
+	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.
+	  It has been set automatically to the value you had before.
+
+config BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0
+	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 61440 # deprecated default value
+	select BR2_LEGACY
+
+# Note: BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP still reference in fs/ext2/Config.in
+
 config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
 	int "ext2 extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
 	default 0
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 0060111fc..d704b8152 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -81,7 +81,7 @@ BR2_PACKAGE_VIM=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 34063739a..4135f718e 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -25,7 +25,7 @@ BR2_PACKAGE_TI_SGX_KM=y
 BR2_PACKAGE_TI_SGX_UM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=126976
+BR2_TARGET_ROOTFS_EXT2_SIZE="124M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
index 0f4dd368c..d394ede30 100644
--- a/configs/firefly_rk3288_demo_defconfig
+++ b/configs/firefly_rk3288_demo_defconfig
@@ -25,7 +25,7 @@ BR2_PACKAGE_QT5BASE_EGLFS=y
 BR2_PACKAGE_MALI_T76X=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=250000
+BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 1a2cd33be..3540f9fa8 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -68,6 +68,5 @@ BR2_PACKAGE_STARTUP_NOTIFICATION=y
 # Filesystem image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index a22705269..aa464917b 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 # Build an sdcard image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=32768
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_ROOTFS_EXT2_INODES=8192
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index d64f09a1d..7e852f365 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_GRUB2=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index ea2abc39b..f558c3e8c 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_GRUB2_X86_64_EFI=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 13a505b03..23db9ccb0 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -30,7 +30,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 9c58ac62e..aeee91748 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -44,12 +44,15 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 config BR2_TARGET_ROOTFS_EXT2_LABEL
 	string "filesystem label"
 
-# 61440 = 60MB, i.e usually small enough to fit on a 64MB media
-config BR2_TARGET_ROOTFS_EXT2_BLOCKS
-	int "exact size in blocks"
-	default 61440
+config BR2_TARGET_ROOTFS_EXT2_SIZE
+	string "exact size"
+	default BR2_TARGET_ROOTFS_EXT2_BLOCKS if BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP # legacy 2017.08
+	default "60M" # default size
 	help
-	  Specify the file system size as a number of 1024-byte blocks.
+	  The size of the filesystem image. If it does not have a suffix, it is
+	  interpreted as power-of-two kilobytes. If it is suffixed by 'k', 'm',
+	  'g', 't' (either upper-case or lower-case), then it is interpreted in
+	  power-of-two kilobytes, megabytes, gigabytes, terabytes, etc.
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index ff04b78ef..b609d36ae 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -4,6 +4,11 @@
 #
 ################################################################################
 
+EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
+ifeq ($(BR2_TARGET_ROOTFS_EXT2)-$(EXT2_SIZE),y-)
+$(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
+endif
+
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
 EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
@@ -21,7 +26,7 @@ ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 define ROOTFS_EXT2_CMD
 	rm -f $@
 	$(HOST_DIR)/usr/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
-		 $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
+		"$(EXT2_SIZE)"
 endef
 
 rootfs-ext2-symlink:
-- 
2.13.0
