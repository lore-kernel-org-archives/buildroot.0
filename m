From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jul 2017 23:14:25 +0200
Subject: [Buildroot] [PATCH 04/14 v4] package/skeleton: split out into
	skeleton-custom
In-Reply-To: <cover.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <af2a3c603d857f4012889fb60931a514bdbd93a8.1501017251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the custom skeleton, we practicaly do nothing, except ensure it
contains the basic, required directories, and that those are properly
setup wrt. merged /usr.

Furthermore, our current skeleton is not fit for systemd, and we'll
have to split things out into various skeletons.

So, off-load the custom skeleton into its own package.

Thus, the existing skeleton package is now limited to:

  - when using our default skeleton, install and tweak it properly;

  - when using a custom skeleton, do nothing except for depending on
    the skeleton-custom package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: this calls for making skeleton a virtual package. This will come
in follwup patches, after skeleton has lost all its code to the various
skeleton packages.

---
Changes v3 -> v4:
  - lib{32.64} are also tweaked in the skeleton  (Arnout)
---
 package/Config.in                          |   1 +
 package/skeleton-custom/Config.in          |   3 +
 package/skeleton-custom/skeleton-custom.mk | 105 +++++++++++++++++++++++++++++
 package/skeleton/skeleton.mk               |  51 +-------------
 system/Config.in                           |   2 +-
 5 files changed, 112 insertions(+), 50 deletions(-)
 create mode 100644 package/skeleton-custom/Config.in
 create mode 100644 package/skeleton-custom/skeleton-custom.mk

diff --git a/package/Config.in b/package/Config.in
index 484c75327a..5e6e53d42b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2,6 +2,7 @@ menu "Target packages"
 
 	source "package/busybox/Config.in"
 	source "package/skeleton/Config.in"
+	source "package/skeleton-custom/Config.in"
 
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
diff --git a/package/skeleton-custom/Config.in b/package/skeleton-custom/Config.in
new file mode 100644
index 0000000000..b12bd8f73c
--- /dev/null
+++ b/package/skeleton-custom/Config.in
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_SKELETON_CUSTOM
+	bool
+	select BR2_PACKAGE_SKELETON
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
new file mode 100644
index 0000000000..ed7b7ac7c5
--- /dev/null
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -0,0 +1,105 @@
+################################################################################
+#
+# skeleton-custom
+#
+################################################################################
+
+SKELETON_CUSTOM_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_CUSTOM_ADD_SKELETON_DEPENDENCY = NO
+
+SKELETON_CUSTOM_INSTALL_STAGING = YES
+
+SKELETON_CUSTOM_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
+
+ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
+ifeq ($(SKELETON_CUSTOM_PATH),)
+$(error No path specified for the custom skeleton)
+endif
+endif
+
+# Extract the inode numbers for all of those directories. In case any is
+# a symlink, we want to get the inode of the pointed-to directory, so we
+# append '/.' to be sure we get the target directory. Since the symlinks
+# can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
+# all of them.
+#
+SKELETON_CUSTOM_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/lib/. 2>/dev/null)
+SKELETON_CUSTOM_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/bin/. 2>/dev/null)
+SKELETON_CUSTOM_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/sbin/. 2>/dev/null)
+SKELETON_CUSTOM_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/lib/. 2>/dev/null)
+SKELETON_CUSTOM_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/bin/. 2>/dev/null)
+SKELETON_CUSTOM_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/sbin/. 2>/dev/null)
+
+# Ensure that the custom skeleton has /lib, /bin and /sbin, and their
+# /usr counterparts
+ifeq ($(SKELETON_CUSTOM_LIB_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /lib
+endif
+ifeq ($(SKELETON_CUSTOM_USR_LIB_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /usr/lib
+endif
+ifeq ($(SKELETON_CUSTOM_BIN_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /bin
+endif
+ifeq ($(SKELETON_CUSTOM_USR_BIN_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /usr/bin
+endif
+ifeq ($(SKELETON_CUSTOM_SBIN_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /sbin
+endif
+ifeq ($(SKELETON_CUSTOM_USR_SBIN_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /usr/sbin
+endif
+
+# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
+# counterparts are appropriately setup as symlinks ones to the others.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+
+ifneq ($(SKELETON_CUSTOM_LIB_INODE),$(SKELETON_CUSTOM_USR_LIB_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /lib
+endif
+ifneq ($(SKELETON_CUSTOM_BIN_INODE),$(SKELETON_CUSTOM_USR_BIN_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /bin
+endif
+ifneq ($(SKELETON_CUSTOM_SBIN_INODE),$(SKELETON_CUSTOM_USR_SBIN_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /sbin
+endif
+
+endif # merged /usr
+
+ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
+ifneq ($(SKELETON_CUSTOM_MISSING_DIRS),)
+$(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is \
+	missing those directories or symlinks: \
+	$(SKELETON_CUSTOM_MISSING_DIRS))
+endif
+ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
+$(error The custom skeleton in $(SKELETON_PATH) is not \
+       using a merged /usr for the following directories: \
+       $(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS))
+endif
+endif
+
+# Provided by the 'skeleton' package:
+# - SKELETON_RSYNC
+# - SKELETON_LIB_SYMLINK
+
+# The target-dir-warning file and the lib{32,64} symlinks are the only
+# things we customise in the custom skeleton.
+define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(TARGET_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(TARGET_DIR_WARNING_FILE)
+endef
+
+# For the staging dir, we don't really care what we install, but we
+# need the /lib and /usr/lib appropriately setup. Since we ensure,
+# above, that they are correct in the skeleton, we can simply copy the
+# skeleton to staging.
+define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(STAGING_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
+endef
+
+$(eval $(generic-package))
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 4ec1ecbb51..717bd65ada 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -14,57 +14,14 @@ SKELETON_ADD_SKELETON_DEPENDENCY = NO
 # The skeleton also handles the merged /usr case in the sysroot
 SKELETON_INSTALL_STAGING = YES
 
-ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
+ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM),y)
 
-SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
-
-ifeq ($(BR_BUILDING),y)
-ifeq ($(SKELETON_PATH),)
-$(error No path specified for the custom skeleton)
-endif
-endif
-
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-
-# Ensure the user has prepared a merged /usr.
-#
-# Extract the inode numbers for all of those directories. In case any is
-# a symlink, we want to get the inode of the pointed-to directory, so we
-# append '/.' to be sure we get the target directory. Since the symlinks
-# can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
-# all of them.
-#
-SKELETON_LIB_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/lib/.)
-SKELETON_BIN_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/bin/.)
-SKELETON_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/sbin/.)
-SKELETON_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/usr/lib/.)
-SKELETON_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/usr/bin/.)
-SKELETON_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/usr/sbin/.)
-
-ifneq ($(SKELETON_LIB_INODE),$(SKELETON_USR_LIB_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR += /lib
-endif
-ifneq ($(SKELETON_BIN_INODE),$(SKELETON_USR_BIN_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR += /bin
-endif
-ifneq ($(SKELETON_SBIN_INODE),$(SKELETON_USR_SBIN_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR += /sbin
-endif
-
-ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR),)
-$(error The custom skeleton in $(SKELETON_PATH) is not \
-	using a merged /usr for the following directories: \
-	$(SKELETON_CUSTOM_NOT_MERGED_USR))
-endif
-
-endif # merged /usr
+SKELETON_DEPENDENCIES = skeleton-custom
 
 else # ! custom skeleton
 
 SKELETON_PATH = system/skeleton
 
-endif # ! custom skeleton
-
 define SKELETON_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_PATH),$(TARGET_DIR))
 	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
@@ -87,10 +44,6 @@ define SKELETON_INSTALL_STAGING_CMDS
 	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
 endef
 
-# The TARGET_FINALIZE_HOOKS must be sourced only if the users choose to use the
-# default skeleton.
-ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-
 SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 SKELETON_TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 SKELETON_TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
diff --git a/system/Config.in b/system/Config.in
index 9b42fbbbac..5f8770d6c9 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -17,7 +17,7 @@ comment "default target skeleton needs an init system"
 
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
-	select BR2_PACKAGE_SKELETON
+	select BR2_PACKAGE_SKELETON_CUSTOM
 	help
 	  Use custom target skeleton.
 
-- 
2.11.0
