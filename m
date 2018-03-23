From: Ben Whitten <ben.whitten@gmail.com>
Date: Fri, 23 Mar 2018 18:21:18 +0000
Subject: [Buildroot] [PATCH RESEND 1/2] fs/ubi: decouple ubi & ubifs
In-Reply-To: <1521829279-5156-1-git-send-email-ben.whitten@gmail.com>
References: <1521829279-5156-1-git-send-email-ben.whitten@gmail.com>
Message-ID: <1521829279-5156-2-git-send-email-ben.whitten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As ubi is a container it shouldn't enforce a ubifs rootfs to be built,
it is reasonable to have a squashfs ro filesystem within a ubi.
If ubifs is selected ubi containing ubifs is automatically selected as
to not break existing configs

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
 fs/Config.in       |  3 ++-
 fs/ubi/Config.in   | 34 +++++++++++++++++++++++++++++++---
 fs/ubi/ubi.mk      | 14 +++++++++++++-
 fs/ubi/ubinize.cfg |  4 ++--
 fs/ubifs/Config.in |  2 ++
 5 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/fs/Config.in b/fs/Config.in
index c25b01c..771220b 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -11,8 +11,9 @@ source "fs/jffs2/Config.in"
 source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
-source "fs/ubi/Config.in"
 source "fs/ubifs/Config.in"
 source "fs/yaffs2/Config.in"
 
+comment "Container"
+source "fs/ubi/Config.in"
 endmenu
diff --git a/fs/ubi/Config.in b/fs/ubi/Config.in
index 5fa2f1f..ae91aa2 100644
--- a/fs/ubi/Config.in
+++ b/fs/ubi/Config.in
@@ -1,11 +1,30 @@
 config BR2_TARGET_ROOTFS_UBI
-	bool "ubi image containing an ubifs root filesystem"
-	select BR2_TARGET_ROOTFS_UBIFS
+	bool "ubi image containing a root filesystem"
 	help
-	  Build an ubi image from the ubifs one (with ubinize).
+	  Build a ubi image from the selected filesystems (with ubinize).
 
 if BR2_TARGET_ROOTFS_UBI
 
+choice
+	prompt "UBI Container"
+	default BR2_TARGET_ROOTFS_UBIFS
+
+config BR2_TARGET_ROOTFS_UBI_CONTAINS_UBIFS
+	bool "containing a ubifs filesystem"
+	depends on BR2_TARGET_ROOTFS_UBIFS
+	help
+	  Select this option to have the ubi contain the ubifs filesystem
+	  this is the default behaviour.
+
+config BR2_TARGET_ROOTFS_UBI_CONTAINS_SQUASHFS
+	bool "containing a squashfs filesystem"
+	depends on BR2_TARGET_ROOTFS_SQUASHFS
+	help
+	  Select this option to have the ubi contain the squashfs
+	  filesystem. Useful for readonly systems.
+
+endchoice
+
 config BR2_TARGET_ROOTFS_UBI_PEBSIZE
 	hex "physical eraseblock size"
 	default 0x20000
@@ -14,6 +33,15 @@ config BR2_TARGET_ROOTFS_UBI_PEBSIZE
 	  flash chip the ubi image is created for. The value provided
 	  here is passed to the -p/--peb-size option of ubinize.
 
+config BR2_TARGET_ROOTFS_UBI_MINIOSIZE
+        hex "minimum I/O unit size"
+	depends on !BR2_TARGET_ROOTFS_UBIFS
+        default 0x800
+        help
+          Minimum I/O unit size. The value provided here is passed
+          to the -m/--min-io-size option of ubinize.
+
+
 config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	int "sub-page size"
 	default 512
diff --git a/fs/ubi/ubi.mk b/fs/ubi/ubi.mk
index c78feda..2532a02 100644
--- a/fs/ubi/ubi.mk
+++ b/fs/ubi/ubi.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
+ifneq ($(BR2_TARGET_ROOTFS_UBIFS),y)
+UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBI_MINIOSIZE)
+else
 UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
+endif
+
 UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
 ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
 UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
@@ -12,7 +17,14 @@ endif
 
 UBI_UBINIZE_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_OPTS))
 
+ifeq ($(BR2_TARGET_ROOTFS_UBI_CONTAINS_UBIFS),y)
 ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
+ROOTFS_UBI_ROOTFS_EXT = .ubifs
+else ifeq ($(BR2_TARGET_ROOTFS_UBI_CONTAINS_SQUASHFS),y)
+ROOTFS_UBI_DEPENDENCIES = rootfs-squashfs
+ROOTFS_UBI_ROOTFS_EXT = .squashfs
+endif
+ROOTFS_UBI_DEPENDENCIES += host-mtd
 
 ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
 UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
@@ -23,7 +35,7 @@ endif
 # don't use sed -i as it misbehaves on systems with SELinux enabled when this is
 # executed through fakeroot (see #9386)
 define ROOTFS_UBI_CMD
-	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' \
+	sed 's;BR2_ROOTFS_PATH;$(BINARIES_DIR)/rootfs$(ROOTFS_UBI_ROOTFS_EXT);' \
 		$(UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
 	$(HOST_DIR)/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
 	rm $(BUILD_DIR)/ubinize.cfg
diff --git a/fs/ubi/ubinize.cfg b/fs/ubi/ubinize.cfg
index b0aace7..66e4a0f 100644
--- a/fs/ubi/ubinize.cfg
+++ b/fs/ubi/ubinize.cfg
@@ -1,8 +1,8 @@
-[ubifs]
+[rootfs]
 mode=ubi
 vol_id=0
 vol_type=dynamic
 vol_name=rootfs
 vol_alignment=1
 vol_flags=autoresize
-image=BR2_ROOTFS_UBIFS_PATH
+image=BR2_ROOTFS_PATH
diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index e79ab9a..30929ee 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -1,5 +1,7 @@
 config BR2_TARGET_ROOTFS_UBIFS
 	bool "ubifs root filesystem"
+	depends on BR2_TARGET_ROOTFS_UBI
+	select BR2_TARGET_ROOTFS_UBI_CONTAINS_UBIFS
 	help
 	  Build a ubifs root filesystem
 
-- 
2.7.4
