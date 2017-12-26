From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Dec 2017 00:20:46 +0100
Subject: [Buildroot] [PATCH 2/3] fs/ubifs: UBI image is not another type of
 filesystem
In-Reply-To: <cover.1514330428.git.yann.morin.1998@free.fr>
References: <cover.1514330428.git.yann.morin.1998@free.fr>
Message-ID: <35726b12293b1e5e82d609366eec966c29eb95e4.1514330428.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the UBI image is treated as if it were a filesystem on its
own, yet it shares almost all of its directory structure with ubifs.

However, the UBI image can very well be seen as a "container" of the
ubifs image, and we can treat it as a post-gen hook instead of a
separate filesystem.

Move the code from ubi.mk to a post-gen hook in ubifs.mk.

Rename all the options accordingly and add legacy entries.

Update the runtime tests infra.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
---
 Config.in.legacy                     | 59 ++++++++++++++++++++++++++++++++++++
 fs/ubifs/Config.in                   | 23 ++++++++------
 fs/ubifs/ubi.mk                      | 32 -------------------
 fs/ubifs/ubifs.mk                    | 27 +++++++++++++++++
 support/testing/tests/fs/test_ubi.py |  6 ++--
 5 files changed, 103 insertions(+), 44 deletions(-)
 delete mode 100644 fs/ubifs/ubi.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index decbaceb76..cf2f181cd8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,65 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.02"
 
+config BR2_TARGET_ROOTFS_UBI
+	bool "UBI image option renamed"
+	select BR2_LEGACY
+	select BR2_TARGET_ROOTFS_UBIFS_UBI
+	help
+	  The option to embed the ubifs into an UBI image has been renamed.
+
+config BR2_TARGET_ROOTFS_UBI_PEBSIZE
+	hex "UBI image physical eraseblock size option renamed"
+	default 0x0
+	help
+	  UBI image physical eraseblock size option has been renamed.
+
+config BR2_TARGET_ROOTFS_UBI_PEBSIZE_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_UBI_PEBSIZE != 0x0 \
+		&&  BR2_TARGET_ROOTFS_UBI_PEBSIZE != 0x20000 # deprecated default value
+	select BR2_LEGACY
+
+config BR2_TARGET_ROOTFS_UBI_SUBSIZE
+	int "UBI image sub-page size option renamed"
+	default 0
+	help
+	  UBI image sub-page size option has been renamed.
+
+config BR2_TARGET_ROOTFS_UBI_SUBSIZE_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_UBI_SUBSIZE != 0 \
+		&& BR2_TARGET_ROOTFS_UBI_SUBSIZE != 512 # deprecated default value
+	select BR2_LEGACY
+
+config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
+	bool "UBI image use custom config file option renamed"
+	select BR2_LEGACY
+	select BR2_TARGET_ROOTFS_UBIFS_UBI_USE_CUSTOM_CONFIG
+	help
+	  UBI image use custom config file option has been renamed.
+
+config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
+	string "UBI image custm configuration file path option renamed"
+	help
+	  UBI image custm configuration file path option has been renamed.
+
+config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE != ""
+	select BR2_LEGACY
+
+config BR2_TARGET_ROOTFS_UBI_OPTS
+	string "UBI image additional ubinize options renamed"
+	help
+	  Option to specify UBI image additional ubinize options has been
+	  renamed.
+
+config BR2_TARGET_ROOTFS_UBI_OPTS_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_UBI_OPTS != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_GNUPG2_GPGV2
 	bool "gnupg2 gpgv2 option removed"
 	select BR2_LEGACY
diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index ff604c5c38..6294cba645 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -95,23 +95,25 @@ config BR2_TARGET_ROOTFS_UBIFS_OPTS
 	help
 	  Any additional mkfs.ubifs options you may want to include.
 
-config BR2_TARGET_ROOTFS_UBI
+config BR2_TARGET_ROOTFS_UBIFS_UBI
 	bool "Embed into an UBI image"
 	help
 	  Build an ubi image from the ubifs one (with ubinize).
 
-if BR2_TARGET_ROOTFS_UBI
+if BR2_TARGET_ROOTFS_UBIFS_UBI
 
-config BR2_TARGET_ROOTFS_UBI_PEBSIZE
+config BR2_TARGET_ROOTFS_UBIFS_UBI_PEBSIZE
 	hex "physical eraseblock size"
+	default BR2_TARGET_ROOTFS_UBI_PEBSIZE if BR2_TARGET_ROOTFS_UBI_PEBSIZE_WRAP # legacy
 	default 0x20000
 	help
 	  Tells ubinize the physical eraseblock (PEB) size of the
 	  flash chip the ubi image is created for. The value provided
 	  here is passed to the -p/--peb-size option of ubinize.
 
-config BR2_TARGET_ROOTFS_UBI_SUBSIZE
+config BR2_TARGET_ROOTFS_UBIFS_UBI_SUBSIZE
 	int "sub-page size"
+	default BR2_TARGET_ROOTFS_UBI_SUBSIZE if BR2_TARGET_ROOTFS_UBI_SUBSIZE_WRAP # legacy
 	default 512
 	help
 	  Tells ubinize that the flash supports sub-pages and the sub-page
@@ -119,7 +121,7 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	  The value provided here is passed to the -s/--sub-page-size
 	  option of ubinize.
 
-config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
+config BR2_TARGET_ROOTFS_UBIFS_UBI_USE_CUSTOM_CONFIG
 	bool "Use custom config file"
 	help
 	  Select this option to use a custom ubinize configuration file,
@@ -133,17 +135,20 @@ config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
 	  So the volume defined for the root filesystem can specify the
 	  image path as:  image=BR2_ROOTFS_UBIFS_PATH
 
-config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
+config BR2_TARGET_ROOTFS_UBIFS_UBI_CUSTOM_CONFIG_FILE
 	string "Configuration file path"
-	depends on BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
+	depends on BR2_TARGET_ROOTFS_UBIFS_UBI_USE_CUSTOM_CONFIG
+	default BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE \
+		if BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE_WRAP # legacy
 	help
 	  Path to the ubinize configuration file.
 
-config BR2_TARGET_ROOTFS_UBI_OPTS
+config BR2_TARGET_ROOTFS_UBIFS_UBI_OPTS
 	string "Additional ubinize options"
+	default BR2_TARGET_ROOTFS_UBI_OPTS if BR2_TARGET_ROOTFS_UBI_OPTS != ""
 	help
 	  Any additional ubinize options you may want to include.
 
-endif # BR2_TARGET_ROOTFS_UBI
+endif # BR2_TARGET_ROOTFS_UBIFS_UBI
 
 endif # BR2_TARGET_ROOTFS_UBIFS
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
deleted file mode 100644
index 2baece5fb0..0000000000
--- a/fs/ubifs/ubi.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# Embed the ubifs image into an ubi image
-#
-################################################################################
-
-UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
-UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
-ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
-UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
-endif
-
-UBI_UBINIZE_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_OPTS))
-
-ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
-
-ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
-UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
-else
-UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
-endif
-
-# don't use sed -i as it misbehaves on systems with SELinux enabled when this is
-# executed through fakeroot (see #9386)
-define ROOTFS_UBI_CMD
-	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' \
-		$(UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
-	$(HOST_DIR)/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
-	rm $(BUILD_DIR)/ubinize.cfg
-endef
-
-$(eval $(call ROOTFS_TARGET,ubi))
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index 4f45acdc4a..5f7846ff73 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -27,4 +27,31 @@ define ROOTFS_UBIFS_CMD
 	$(HOST_DIR)/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
 endef
 
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_UBI),y)
+
+UBIFS_UBINIZE_OPTS = \
+	-m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE) \
+	-p $(BR2_TARGET_ROOTFS_UBIFS_UBI_PEBSIZE)
+
+ifneq ($(BR2_TARGET_ROOTFS_UBIFS_UBI_SUBSIZE),0)
+UBIFS_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBIFS_UBI_SUBSIZE)
+endif
+
+UBIFS_UBINIZE_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_UBI_OPTS))
+
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_UBI_USE_CUSTOM_CONFIG),y)
+UBIFS_UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_UBI_CUSTOM_CONFIG_FILE))
+else
+UBIFS_UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
+endif
+
+define UBIFS_UBINIZE
+	sed 's;BR2_ROOTFS_UBIFS_PATH;$@;' \
+		$(UBIFS_UBINIZE_CONFIG_FILE_PATH) > $(FS_DIR)/ubinize.cfg
+	$(HOST_DIR)/sbin/ubinize -o $(@:%.ubifs=%.ubi) $(UBIFS_UBINIZE_OPTS) $(FS_DIR)/ubinize.cfg
+endef
+ROOTFS_UBIFS_POST_GEN_HOOKS += UBIFS_UBINIZE
+
+endif # BR2_TARGET_ROOTFS_UBI
+
 $(eval $(call ROOTFS_TARGET,ubifs))
diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 015d82f769..dff2a2ac1e 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -10,9 +10,9 @@ class TestUbi(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_UBIFS=y
         BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x7ff80
         BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1
-        BR2_TARGET_ROOTFS_UBI=y
-        BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x80000
-        BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
+        BR2_TARGET_ROOTFS_UBIFS_UBI=y
+        BR2_TARGET_ROOTFS_UBIFS_UBI_PEBSIZE=0x80000
+        BR2_TARGET_ROOTFS_UBIFS_UBI_SUBSIZE=1
         """
 
     # TODO: if you boot Qemu twice on the same UBI image, it fails to
-- 
2.11.0
