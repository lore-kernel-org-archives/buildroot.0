From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  1 Apr 2014 17:33:21 +0200
Subject: [Buildroot] [PATCH] New attempt to move $BUILD_DIR/.root
Message-ID: <1396366401-6534-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since $STAMP_DIR does no more exist[1], I suggest to embed
$BUILD_DIR/.root in a package infrastructure.

This patch add a special package called rootfs-dirs. Toolchain
package was used as exemple for this work. rootfs-dirs package
create and populate $TARGET_DIR and $STAGING_DIR.

[1] http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/79825

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

---
I have a few questions:
  - I dislike the name "rootfs-dirs". I think "skeleton" would be
    better, but it conflicts with system/skeleton directory. However,
    I may force name of this package by calling inner-generic-package
    macro directly, but I am not sure everyone agrees with that.

  - I moved the management of a few variables to rootfs-dirs.mk. These
    variables are only used during creation of $TARGET_DIR and
    $STAGING_DIR. But now, rootfs creation related stuff is splited
    between main Makefile, system.mk and rootfs-dirs.mk. Should
    rootfs-dirs.mk should be merge with system.mk? Or, maybe some
    other Makefile targets should be moved to rootfs-dirs.mk?

---
 Makefile                          | 42 +------------------------
 package/pkg-generic.mk            | 10 +++++-
 system/rootfs-dirs/rootfs-dirs.mk | 64 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 42 deletions(-)
 create mode 100644 system/rootfs-dirs/rootfs-dirs.mk

diff --git a/Makefile b/Makefile
index 41c51c6..8f8da1f 100644
--- a/Makefile
+++ b/Makefile
@@ -332,12 +332,6 @@ HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
 
-TARGET_SKELETON=$(TOPDIR)/system/skeleton
-
-# Location of a file giving a big fat warning that output/target
-# should not be used as the root filesystem.
-TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
-
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
 BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
@@ -391,6 +385,7 @@ include $(sort $(wildcard package/*/*.mk))
 include boot/common.mk
 include linux/linux.mk
 include system/system.mk
+include system/rootfs-dirs/rootfs-dirs.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
@@ -466,45 +461,10 @@ world: target-post-image
 $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
-# We make a symlink lib32->lib or lib64->lib as appropriate
-# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
-ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
-LIB_SYMLINK = lib64
-else
-LIB_SYMLINK = lib32
-endif
-
-$(STAGING_DIR):
-	@mkdir -p $(STAGING_DIR)/bin
-	@mkdir -p $(STAGING_DIR)/lib
-	@ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
-	@mkdir -p $(STAGING_DIR)/usr/lib
-	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
-	@mkdir -p $(STAGING_DIR)/usr/include
-	@mkdir -p $(STAGING_DIR)/usr/bin
-	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
-
-ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
-TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
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
-
 STRIP_FIND_CMD = find $(TARGET_DIR)
 ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
 STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 339c3eb..6e316b7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -351,6 +351,11 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
+# When a target package is rootfs-dirs (which is used to create TARGET_DIR
+# and STAGING_DIR). this variable to 'NO' so the 'dirs' dependency is not
+# added to prevent a circular dependency
+$(2)_ADD_DIRS_DEPENDENCY	?= YES
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency
@@ -449,7 +454,10 @@ $$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
 $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
 $$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)
 
-$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
+ifeq ($$($(2)_ADD_DIRS_DEPENDENCY),YES)
+$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs
+endif
+$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | prepare
 ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
 endif
diff --git a/system/rootfs-dirs/rootfs-dirs.mk b/system/rootfs-dirs/rootfs-dirs.mk
new file mode 100644
index 0000000..7bdf7ad
--- /dev/null
+++ b/system/rootfs-dirs/rootfs-dirs.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# rootfs-dirs
+#
+################################################################################
+
+ROOTFS_DIRS_SOURCE =
+ROOTFS_DIRS_ADD_DIRS_DEPENDENCY = NO
+ROOTFS_DIRS_ADD_TOOLCHAIN_DEPENDENCY = NO
+ROOTFS_DIRS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
+TARGET_SKELETON = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
+else
+TARGET_SKELETON = $(TOPDIR)/system/skeleton
+endif
+
+# Location of a file giving a big fat warning that output/target
+# should not be used as the root filesystem.
+TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+
+# We make a symlink lib32->lib or lib64->lib as appropriate
+# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+LIB_SYMLINK = lib64
+else
+LIB_SYMLINK = lib32
+endif
+
+define ROOTFS_DIRS_INSTALL_SKELETON
+	@mkdir -p $(TARGET_DIR)
+	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
+	   --chmod=Du+w --exclude .empty --exclude '*~' \
+           $(TARGET_SKELETON)/ $(TARGET_DIR)/
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
+	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
+	@mkdir -p $(TARGET_DIR)/usr
+	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
+endef
+
+define ROOTFS_DIRS_CREATE_STAGING
+	@mkdir -p $(HOST_DIR)
+	@mkdir -p $(STAGING_DIR)/bin
+	@mkdir -p $(STAGING_DIR)/lib
+	@ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
+	@mkdir -p $(STAGING_DIR)/usr/lib
+	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
+	@mkdir -p $(STAGING_DIR)/usr/include
+	@mkdir -p $(STAGING_DIR)/usr/bin
+	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+endef
+
+define ROOTFS_DIRS_INSTALL_TARGET_CMDS
+	$(ROOTFS_DIRS_INSTALL_SKELETON)
+endef
+
+define ROOTFS_DIRS_INSTALL_STAGING_CMDS
+	$(ROOTFS_DIRS_CREATE_STAGING)
+endef
+
+$(eval $(generic-package))
+
+$(STAGING_DIR): rootfs-dirs-install-staging
+$(TARGET_DIR): rootfs-dirs-install-target
-- 
1.9.1
