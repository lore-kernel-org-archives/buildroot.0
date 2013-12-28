From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:56:34 +0100
Subject: [Buildroot] [PATCH 3/9] grub: replace string option for filesystem
	selection by booleans
In-Reply-To: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388242600-2580-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 1cece2813bf635ae29e9a8287322439b9c5992f7 (grub: add option to
configure the list of supported filesystems), we introduced the
BR2_TARGET_GRUB_FS_SUPPORT option which allows to provide a
space-separated list of filesystems that Grub should support.

However, it turns out that this not very practical, because the
iso9660 filesystem logic in Buildroot should force the ISO9660 support
to be enabled in Grub, which is not easy to do with a string option.

Therefore, this patch changes this option from a string option to a
list of boolean option, one per filesystem supported.

A few useful details:

 - Since Grub legacy is dead, the list of filesystem, and therefore
   the number of options, will not grow.

 - We have only added options for filesystems that are likely to be
   used in an embedded Linux context. Filesystems such as VSTAfs,
   Minix, UFS2 or FFS2 are not supported.

 - There is no need to add some Config.in.legacy support for the
   previous option, since it was added after Buildroot 2013.11, and
   was therefore never part of an official Buildroot release.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/Config.in | 44 ++++++++++++++++++++++++++++++++++++--------
 boot/grub/grub.mk   | 24 +++++++++++++-----------
 2 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index c3a729f..3ae8448 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -45,19 +45,47 @@ config BR2_TARGET_GRUB_SPLASH
 	  A splashimage is a 14-color indexed .xpm picture which
 	  is displayed as background for the grub menu.
 
-config BR2_TARGET_GRUB_FS_SUPPORT
-	string "Filesystem to support"
-	default "ext2fs fat"
-	help
-	  Space separated list of filesystems to support. Possible
-	  values are ext2fs, fat, ffs, ufs2, minix, reiserfs, vstafs,
-	  jfs, xfs and iso9660.
-
 config BR2_TARGET_GRUB_DISKLESS
 	bool "diskless support"
 	help
 	  enable diskless support
 
+menu "filesystem drivers"
+
+config BR2_TARGET_GRUB_FS_EXT2
+	bool "ext2"
+	default y
+	help
+	  Enable support for the ext2 filesystem in Grub
+
+config BR2_TARGET_GRUB_FS_FAT
+	bool "FAT"
+	default y
+	help
+	  Enable support for the FAT filesystem in Grub.
+
+config BR2_TARGET_GRUB_FS_ISO9660
+	bool "ISO9660"
+	help
+	  Enable support for the ISO9660 filesystem in Grub.
+
+config BR2_TARGET_GRUB_FS_JFS
+	bool "IBM JFS"
+	help
+	  Enable support for the JFS filesystem in Grub.
+
+config BR2_TARGET_GRUB_FS_REISERFS
+	bool "ReiserFS"
+	help
+	  Enable support for the ReiserFS filesystem in Grub.
+
+config BR2_TARGET_GRUB_FS_XFS
+	bool "SGI XFS"
+	help
+	  Enable support for the XFS filesystem in Grub.
+
+endmenu
+
 menu "network drivers"
 
 config BR2_TARGET_GRUB_3c595
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index eb066af..43121ff 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -46,18 +46,20 @@ GRUB_CONFIG-$(BR2_TARGET_GRUB_undi) += --enable-undi
 GRUB_CONFIG-$(BR2_TARGET_GRUB_via_rhine) += --enable-via-rhine
 GRUB_CONFIG-$(BR2_TARGET_GRUB_w89c840) += --enable-w89c840
 
-GRUB_POSSIBLE_FILESYSTEMS = ext2fs fat ffs ufs2 minix \
-	reiserfs vstafs jfs xfs iso9660
-GRUB_SELECTED_FILESYSTEMS = $(call qstrip,$(BR2_TARGET_GRUB_FS_SUPPORT))
+GRUB_CONFIG-y += $(if $(BR2_TARGET_GRUB_FS_EXT2),--enable-ext2fs,--disable-ext2fs)
+GRUB_CONFIG-y += $(if $(BR2_TARGET_GRUB_FS_FAT),--enable-fat,--disable-fat)
+GRUB_CONFIG-y += $(if $(BR2_TARGET_GRUB_FS_ISO9660),--enable-iso9660,--disable-iso9660)
+GRUB_CONFIG-y += $(if $(BR2_TARGET_GRUB_FS_JFS),--enable-jfs,--disable-jfs)
+GRUB_CONFIG-y += $(if $(BR2_TARGET_GRUB_FS_REISERFS),--enable-reiserfs,--disable-reiserfs)
+GRUB_CONFIG-y += $(if $(BR2_TARGET_GRUB_FS_XFS),--enable-xfs,--disable-xfs)
+GRUB_CONFIG-y += --disable-ffs --disable-ufs2 --disable-minix --disable-vstafs
 
-# Calculate the list of stage 1.5 files to install. They are prefixed
-# by the filesystem name, except for ext2fs, where the stage 1.5 is
-# prefixed by e2fs.
-GRUB_STAGE_1_5_TO_INSTALL = $(subst ext2fs,e2fs,$(GRUB_SELECTED_FILESYSTEMS))
-
-GRUB_CONFIG-y = \
-	$(foreach fs,$(GRUB_POSSIBLE_FILESYSTEMS),\
-		$(if $(filter $(fs),$(GRUB_SELECTED_FILESYSTEMS)),--enable-$(fs),--disable-$(fs)))
+GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_EXT2),e2fs)
+GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_FAT),fat)
+GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_ISO9660),iso9660)
+GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_JFS),jfs)
+GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_REISERFS),reiserfs)
+GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_XFS),xfs)
 
 define GRUB_DEBIAN_PATCHES
 	# Apply the patches from the Debian patch
-- 
1.8.3.2
