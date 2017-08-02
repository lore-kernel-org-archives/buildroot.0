From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:12:42 +0200
Subject: [Buildroot] [git commit] package/skeleton: split out into
	skeleton-custom
Message-ID: <20170802170841.0BE30817BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c750a027b720e316b9d7fccabb4d86bb2856ec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Arnout: split off in a separate patch doing only this]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/skeleton-custom/Config.in          |  3 ++
 package/skeleton-custom/skeleton-custom.mk | 81 ++++++++++++++++++++++++++++++
 package/skeleton/skeleton.mk               | 51 +------------------
 system/Config.in                           |  2 +-
 5 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 86d714d..f409f5a 100644
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
index 0000000..b12bd8f
--- /dev/null
+++ b/package/skeleton-custom/Config.in
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_SKELETON_CUSTOM
+	bool
+	select BR2_PACKAGE_SKELETON
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
new file mode 100644
index 0000000..4aebe3f
--- /dev/null
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -0,0 +1,81 @@
+################################################################################
+#
+# skeleton-custom
+#
+################################################################################
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_CUSTOM_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_CUSTOM_ADD_SKELETON_DEPENDENCY = NO
+
+# The skeleton also handles the merged /usr case in the sysroot
+SKELETON_CUSTOM_INSTALL_STAGING = YES
+
+SKELETON_CUSTOM_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
+
+ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
+ifeq ($(SKELETON_CUSTOM_PATH),)
+$(error No path specified for the custom skeleton)
+endif
+
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+
+# Ensure the user has prepared a merged /usr.
+#
+# Extract the inode numbers for all of those directories. In case any is
+# a symlink, we want to get the inode of the pointed-to directory, so we
+# append '/.' to be sure we get the target directory. Since the symlinks
+# can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
+# all of them.
+#
+SKELETON_CUSTOM_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/lib/.)
+SKELETON_CUSTOM_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/bin/.)
+SKELETON_CUSTOM_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/sbin/.)
+SKELETON_CUSTOM_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/lib/.)
+SKELETON_CUSTOM_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/bin/.)
+SKELETON_CUSTOM_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/sbin/.)
+
+ifneq ($(SKELETON_CUSTOM_LIB_INODE),$(SKELETON_CUSTOM_USR_LIB_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR += /lib
+endif
+ifneq ($(SKELETON_CUSTOM_BIN_INODE),$(SKELETON_CUSTOM_USR_BIN_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR += /bin
+endif
+ifneq ($(SKELETON_CUSTOM_SBIN_INODE),$(SKELETON_CUSTOM_USR_SBIN_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR += /sbin
+endif
+
+ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR),)
+$(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
+	using a merged /usr for the following directories: \
+	$(SKELETON_CUSTOM_NOT_MERGED_USR))
+endif
+
+endif # merged /usr
+endif # ! building
+
+define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(TARGET_DIR))
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(TARGET_DIR_WARNING_FILE)
+endef
+
+# For the staging dir, we don't really care about /bin and /sbin.
+# But for consistency with the target dir, and to simplify the code,
+# we still handle them for the merged or non-merged /usr cases.
+# Since the toolchain is not yet available, the staging is not yet
+# populated, so we need to create the directories in /usr
+define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
+endef
+
+$(eval $(generic-package))
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 41da177..f44ecf4 100644
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
@@ -86,10 +43,6 @@ define SKELETON_INSTALL_STAGING_CMDS
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
index b2f5be3..014aedf 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -11,7 +11,7 @@ config BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
-	select BR2_PACKAGE_SKELETON
+	select BR2_PACKAGE_SKELETON_CUSTOM
 	help
 	  Use custom target skeleton.
 
