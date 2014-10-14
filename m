From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 14 Oct 2014 11:23:46 +0200
Subject: [Buildroot] [PATCH 1/2] Use package framework to manage skeleton
Message-ID: <1413278627-8063-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove usage of build/.root stamp files and replace it with a package
called rootfs-dirs.

Test cases:

$ make clean && make rootfs-dirs
make: Circular /home/jezz/buildroot/test/target <- rootfs-dirs dependency dropped.
[...]
 -> OK

$ make clean && make rootfs-dirs-build
touch: cannot touch ?/home/jezz/buildroot/test/build/rootfs-dirs-undefined/.stamp_target_installed?: No such file or directory
 -> KO

$ make clean && make toolchain
make: Circular /home/jezz/buildroot/test/build/rootfs-dirs-undefined/.stamp_downloaded <- dirs dependency dropped.
[...]
 -> OK

$ make rootfs-dirs-rebuild
make: Circular /home/jezz/buildroot/test/target <- rootfs-dirs dependency dropped.
 -> OK

$ rm output/build/rootfs-dirs-undefined/.stamp_target_installed && make toolchain
make: Circular /home/jezz/buildroot/test/build/rootfs-dirs-undefined/.stamp_downloaded <- dirs dependency dropped.
rootfs-dirs is reinstalled, but toolchain isn't

$ rm -r target && make toolchain
Do nothing

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
In this version:
  - Rebase on lastest master
  - Retitle patch
  - Add test-cases results in commit message
  - Try to keep it simple in order to make review process easier. Plenty of
    improvements may be examined: same mecanism for staging directory, moving 
    out sysvinit stuff, merging system.mk with rootfs-dirs.mk, moving system/ to 
    packages/system/, support for "rm -r target && make", etc...

 Makefile                          | 24 ++----------------------
 system/rootfs-dirs/rootfs-dirs.mk | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 22 deletions(-)
 create mode 100644 system/rootfs-dirs/rootfs-dirs.mk

diff --git a/Makefile b/Makefile
index 907a0fc..828981c 100644
--- a/Makefile
+++ b/Makefile
@@ -332,12 +332,6 @@ HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
-TARGET_SKELETON = $(TOPDIR)/system/skeleton
-
-# Location of a file giving a big fat warning that output/target
-# should not be used as the root filesystem.
-TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
-
 ifeq ($(BR2_CCACHE),y)
 CCACHE := $(HOST_DIR)/usr/bin/ccache
 BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
@@ -391,6 +385,7 @@ include $(sort $(wildcard package/*/*.mk))
 include boot/common.mk
 include linux/linux.mk
 include system/system.mk
+include system/rootfs-dirs/rootfs-dirs.mk
 include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
@@ -465,26 +460,11 @@ $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/usr/bin
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 
-ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
-TARGET_SKELETON = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
-endif
-
 RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
 	--exclude CVS
 
-$(BUILD_DIR)/.root:
-	mkdir -p $(TARGET_DIR)
-	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-		--chmod=Du+w --exclude .empty --exclude '*~' \
-		$(TARGET_SKELETON)/ $(TARGET_DIR)/
-	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
-	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
-	@mkdir -p $(TARGET_DIR)/usr
-	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
-	touch $@
-
-$(TARGET_DIR): $(BUILD_DIR)/.root
+$(TARGET_DIR): rootfs-dirs
 
 STRIP_FIND_CMD = find $(TARGET_DIR)
 ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
diff --git a/system/rootfs-dirs/rootfs-dirs.mk b/system/rootfs-dirs/rootfs-dirs.mk
new file mode 100644
index 0000000..4a85dff
--- /dev/null
+++ b/system/rootfs-dirs/rootfs-dirs.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# rootfs-dirs
+#
+################################################################################
+
+ROOTFS_DIRS_SOURCE =
+ROOTFS_DIRS_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+ifeq ($(BR2_ROOTFS_ROOTFS_DIRS_CUSTOM),y)
+TARGET_ROOTFS_DIRS = $(BR2_ROOTFS_ROOTFS_DIRS_CUSTOM_PATH)
+else
+TARGET_ROOTFS_DIRS = system/skeleton
+endif
+
+# Location of a file giving a big fat warning that output/target
+# should not be used as the root filesystem.
+TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+
+define ROOTFS_DIRS_INSTALL_ROOTFS_DIRS
+	@mkdir -p $(TARGET_DIR)
+	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
+	   --chmod=Du+w --exclude .empty --exclude '*~' \
+	   $(TARGET_ROOTFS_DIRS)/ $(TARGET_DIR)/
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
+	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
+	@mkdir -p $(TARGET_DIR)/usr
+	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
+endef
+
+define ROOTFS_DIRS_INSTALL_TARGET_CMDS
+	$(ROOTFS_DIRS_INSTALL_ROOTFS_DIRS)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
