From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:57:31 +0100
Subject: [Buildroot] [git commit] fs/ubi: add option to use custom ubinize
	config file
Message-ID: <20140208215953.39F299C81A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74a0f963ed364f90b937fc24f06573f5512c612c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, the UBI FS target creates a ubinize configuration
file on-the-fly, for a single volume.  Add an option to specify
a custom config file.

E.g., one might want to deploy a system with a volume for the
built ubifs image, a volume for a future upgrade image, and a
volume for user data.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ubifs/Config.in   |   20 ++++++++++++++++++++
 fs/ubifs/ubi.mk      |   17 +++++++++++------
 fs/ubifs/ubinize.cfg |    1 +
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index 70ea81e..ff604c5 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -119,6 +119,26 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	  The value provided here is passed to the -s/--sub-page-size
 	  option of ubinize.
 
+config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
+	bool "Use custom config file"
+	help
+	  Select this option to use a custom ubinize configuration file,
+	  rather than the default configuration used by Buildroot (which
+	  defines a single dynamic volume marked as auto-resize).  Passing
+	  a custom ubinize configuration file allows you to create several
+	  volumes, specify volume types, etc.
+
+	  As a convenience, buildroot replaces the string
+	  "BR2_ROOTFS_UBIFS_PATH" with the path to the built ubifs file.
+	  So the volume defined for the root filesystem can specify the
+	  image path as:  image=BR2_ROOTFS_UBIFS_PATH
+
+config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
+	help
+	  Path to the ubinize configuration file.
+
 config BR2_TARGET_ROOTFS_UBI_OPTS
 	string "Additional ubinize options"
 	help
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index 08c952c..aba3bea 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Embed the ubifs image into an ubi one
+# Embed the ubifs image into an ubi image
 #
 ################################################################################
 
@@ -14,12 +14,17 @@ UBI_UBINIZE_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_OPTS))
 
 ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
 
+ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
+UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
+else
+UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
+endif
+
 define ROOTFS_UBI_CMD
-	cp fs/ubifs/ubinize.cfg . ;\
-	echo "image=$@fs" \
-		>> ./ubinize.cfg ;\
-	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
-	rm ubinize.cfg
+	$(INSTALL) -m 0644 $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg ;\
+	$(SED) 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' $(BUILD_DIR)/ubinize.cfg ;\
+	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg ;\
+	rm $(BUILD_DIR)/ubinize.cfg
 endef
 
 $(eval $(call ROOTFS_TARGET,ubi))
diff --git a/fs/ubifs/ubinize.cfg b/fs/ubifs/ubinize.cfg
index 6515271..b0aace7 100644
--- a/fs/ubifs/ubinize.cfg
+++ b/fs/ubifs/ubinize.cfg
@@ -5,3 +5,4 @@ vol_type=dynamic
 vol_name=rootfs
 vol_alignment=1
 vol_flags=autoresize
+image=BR2_ROOTFS_UBIFS_PATH
