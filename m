From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:33 +0100
Subject: [Buildroot] [PATCH 09/15] grub: add option to configure the list of
	supported filesystems
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384188459-1332-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grub can be configured to enable or disable the filesystems supported
in the stage 2. In addition, there are filesystem specific stage
1.5. In order to save space and build time, we provide a new option
that allows to give a space-separated list of filesystems that Grub
should support.

We default to support FAT and ext2, since most of the other
filesystems are fairly unlikely to be used.

We use this option to:

 1) Pass --enable-<fs> or --disable-<fs>, which enables/disables the
    support of <fs> in Grub stage 2.

 2) Install only the stage 1.5 that correspond to the selected
    filesystems.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/Config.in |  8 ++++++++
 boot/grub/grub.mk   | 17 ++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index ee92250b..65b95e1 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -15,6 +15,14 @@ config BR2_TARGET_GRUB_SPLASH
 	  A splashimage is a 14-color indexed .xpm picture which
 	  is displayed as background for the grub menu.
 
+config BR2_TARGET_GRUB_FS_SUPPORT
+	string "Filesystem to support"
+	default "ext2fs fat"
+	help
+	  Space separated list of filesystems to support. Possible
+	  values are ext2fs, fat, ffs, ufs2, minix, reiserfs, vstafs,
+	  jfs, xfs and iso9660.
+
 config BR2_TARGET_GRUB_DISKLESS
 	bool "diskless support"
 	help
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index f15d915..6ba02cd 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -46,6 +46,19 @@ GRUB_CONFIG-$(BR2_TARGET_GRUB_undi) += --enable-undi
 GRUB_CONFIG-$(BR2_TARGET_GRUB_via_rhine) += --enable-via-rhine
 GRUB_CONFIG-$(BR2_TARGET_GRUB_w89c840) += --enable-w89c840
 
+GRUB_POSSIBLE_FILESYSTEMS = ext2fs fat ffs ufs2 minix \
+	reiserfs vstafs jfs xfs iso9660
+GRUB_SELECTED_FILESYSTEMS = $(call qstrip,$(BR2_TARGET_GRUB_FS_SUPPORT))
+
+# Calculate the list of stage 1.5 files to install. They are prefixed
+# by the filesystem name, except for ext2fs, where the stage 1.5 is
+# prefixed by e2fs.
+GRUB_STAGE_1_5_TO_INSTALL = $(subst ext2fs,e2fs,$(GRUB_SELECTED_FILESYSTEMS))
+
+GRUB_CONFIG-y = \
+	$(foreach fs,$(GRUB_POSSIBLE_FILESYSTEMS),\
+		$(if $(filter $(fs),$(GRUB_SELECTED_FILESYSTEMS)),--enable-$(fs),--disable-$(fs)))
+
 define GRUB_DEBIAN_PATCHES
 	# Apply the patches from the Debian patch
 	(cd $(@D) ; for f in `cat debian/patches/00list | grep -v ^#` ; do \
@@ -79,7 +92,9 @@ define GRUB_INSTALL_TARGET_CMDS
 	install -m 0755 -D $(@D)/grub/grub $(HOST_DIR)/sbin/grub
 	mkdir -p $(TARGET_DIR)/boot/grub
 	cp $(@D)/stage1/stage1 $(TARGET_DIR)/boot/grub
-	cp $(@D)/stage2/*1_5   $(TARGET_DIR)/boot/grub
+	for f in $(GRUB_STAGE_1_5_TO_INSTALL) ; do \
+		cp $(@D)/stage2/$${f}_stage1_5 $(TARGET_DIR)/boot/grub ; \
+	done
 	cp $(@D)/stage2/stage2 $(TARGET_DIR)/boot/grub
 	cp boot/grub/menu.lst $(TARGET_DIR)/boot/grub
 	$(GRUB_INSTALL_SPLASH)
-- 
1.8.1.2
