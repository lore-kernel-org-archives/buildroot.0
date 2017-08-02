From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:23:13 +0200
Subject: [Buildroot] [git commit] package/skeleton: split out into
	skeleton-common
Message-ID: <20170802172038.A8CAF81EBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=120307520f69f801bf05df1d2fd3433c6d498551
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move all the handling of the default skeleton into a new package,
skeleton-common.

We don't name it skeleton-default, because it will be further split
later, into a skeleton for sysv and another for systemd, with some parts
still common between the two. So just name it skeleton-common right now;
this will save us a rename later.

While we're at it, also assign to SKELETON_COMMON_TARGET_FINALIZE_HOOKS
instead of directly to the global FINALIZE_HOOKS. Therefore, we don't
need to do all of that in a condition BR2_PACKAGE_SKELETON_COMMON==y.

Note: it would be technically sound to move the skeleton files together
within a sub-directory of the skeleton-common package. However, we refer
the user to those files, from various locations (manual, packages). It
will indeed be easier for the user to find those files in
system/skeleton/ rather than in package/skeleton-common/skeleton/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: remove the mkdir $(STAGING_DIR)/usr/include which was removed
         in skeleton.mk in master.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/skeleton-common/Config.in          |  3 +
 package/skeleton-common/skeleton-common.mk | 95 ++++++++++++++++++++++++++++++
 package/skeleton/skeleton.mk               | 86 +--------------------------
 system/Config.in                           |  2 +-
 5 files changed, 101 insertions(+), 86 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f409f5a..7d22b47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2,6 +2,7 @@ menu "Target packages"
 
 	source "package/busybox/Config.in"
 	source "package/skeleton/Config.in"
+	source "package/skeleton-common/Config.in"
 	source "package/skeleton-custom/Config.in"
 
 menu "Audio and video applications"
diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
new file mode 100644
index 0000000..6c094f6
--- /dev/null
+++ b/package/skeleton-common/Config.in
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_SKELETON_COMMON
+	bool
+	select BR2_PACKAGE_SKELETON
diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
new file mode 100644
index 0000000..07c434c
--- /dev/null
+++ b/package/skeleton-common/skeleton-common.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# skeleton-common
+#
+################################################################################
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_COMMON_ADD_SKELETON_DEPENDENCY = NO
+
+# The skeleton also handles the merged /usr case in the sysroot
+SKELETON_COMMON_INSTALL_STAGING = YES
+
+SKELETON_COMMON_PATH = system/skeleton
+
+define SKELETON_COMMON_INSTALL_TARGET_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_COMMON_PATH),$(TARGET_DIR))
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
+define SKELETON_COMMON_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
+endef
+
+SKELETON_COMMON_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
+SKELETON_COMMON_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+SKELETON_COMMON_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+SKELETON_COMMON_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
+SKELETON_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
+
+ifneq ($(SKELETON_COMMON_HOSTNAME),)
+define SKELETON_COMMON_SET_HOSTNAME
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(SKELETON_COMMON_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+	$(SED) '$$a \127.0.1.1\t$(SKELETON_COMMON_HOSTNAME)' \
+		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
+endef
+SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_HOSTNAME
+endif
+
+ifneq ($(SKELETON_COMMON_ISSUE),)
+define SKELETON_COMMON_SET_ISSUE
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(SKELETON_COMMON_ISSUE)" > $(TARGET_DIR)/etc/issue
+endef
+SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ISSUE
+endif
+
+ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
+ifeq ($(SKELETON_COMMON_ROOT_PASSWD),)
+SKELETON_ROOT_PASSWORD =
+else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_COMMON_ROOT_PASSWD)),)
+SKELETON_ROOT_PASSWORD = '$(SKELETON_COMMON_ROOT_PASSWD)'
+else
+# This variable will only be evaluated in the finalize stage, so we can
+# be sure that host-mkpasswd will have already been built by that time.
+SKELETON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_COMMON_PASSWD_METHOD)" "$(SKELETON_COMMON_ROOT_PASSWD)"`"
+endif
+else # !BR2_TARGET_ENABLE_ROOT_LOGIN
+SKELETON_ROOT_PASSWORD = "*"
+endif
+define SKELETON_COMMON_SET_ROOT_PASSWD
+	$(SED) s,^root:[^:]*:,root:$(SKELETON_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
+endef
+SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ROOT_PASSWD
+
+ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
+define SKELETON_COMMON_BIN_SH
+	rm -f $(TARGET_DIR)/bin/sh
+endef
+else
+ifneq ($(SKELETON_COMMON_BIN_SH),)
+define SKELETON_COMMON_BIN_SH
+	ln -sf $(SKELETON_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
+endef
+endif
+endif
+SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_BIN_SH
+
+$(eval $(generic-package))
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index f44ecf4..1d3e4fb 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,94 +11,10 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
-# The skeleton also handles the merged /usr case in the sysroot
-SKELETON_INSTALL_STAGING = YES
-
 ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM),y)
-
 SKELETON_DEPENDENCIES = skeleton-custom
-
-else # ! custom skeleton
-
-SKELETON_PATH = system/skeleton
-
-define SKELETON_INSTALL_TARGET_CMDS
-	$(call SYSTEM_RSYNC,$(SKELETON_PATH),$(TARGET_DIR))
-	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
-	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
-		$(TARGET_DIR_WARNING_FILE)
-endef
-
-# For the staging dir, we don't really care about /bin and /sbin.
-# But for consistency with the target dir, and to simplify the code,
-# we still handle them for the merged or non-merged /usr cases.
-# Since the toolchain is not yet available, the staging is not yet
-# populated, so we need to create the directories in /usr
-define SKELETON_INSTALL_STAGING_CMDS
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
-	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
-	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
-endef
-
-SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
-SKELETON_TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
-SKELETON_TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
-SKELETON_TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
-SKELETON_TARGET_GENERIC_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
-
-ifneq ($(SKELETON_TARGET_GENERIC_HOSTNAME),)
-define SKELETON_SET_HOSTNAME
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(SKELETON_TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
-	$(SED) '$$a \127.0.1.1\t$(SKELETON_TARGET_GENERIC_HOSTNAME)' \
-		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
-endef
-TARGET_FINALIZE_HOOKS += SKELETON_SET_HOSTNAME
-endif
-
-ifneq ($(SKELETON_TARGET_GENERIC_ISSUE),)
-define SKELETON_SET_ISSUE
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(SKELETON_TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
-endef
-TARGET_FINALIZE_HOOKS += SKELETON_SET_ISSUE
-endif
-
-ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
-ifeq ($(SKELETON_TARGET_GENERIC_ROOT_PASSWD),)
-SKELETON_ROOT_PASSWORD =
-else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)),)
-SKELETON_ROOT_PASSWORD = '$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)'
 else
-# This variable will only be evaluated in the finalize stage, so we can
-# be sure that host-mkpasswd will have already been built by that time.
-SKELETON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_TARGET_GENERIC_PASSWD_METHOD)" "$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)"`"
-endif
-else # !BR2_TARGET_ENABLE_ROOT_LOGIN
-SKELETON_ROOT_PASSWORD = "*"
+SKELETON_DEPENDENCIES = skeleton-common
 endif
 
-define SKELETON_SET_ROOT_PASSWD
-	$(SED) s,^root:[^:]*:,root:$(SKELETON_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
-endef
-TARGET_FINALIZE_HOOKS += SKELETON_SET_ROOT_PASSWD
-
-ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
-define SKELETON_BIN_SH
-	rm -f $(TARGET_DIR)/bin/sh
-endef
-else
-ifneq ($(SKELETON_TARGET_GENERIC_BIN_SH),)
-define SKELETON_BIN_SH
-	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
-endef
-endif
-endif
-TARGET_FINALIZE_HOOKS += SKELETON_BIN_SH
-
-endif # BR2_ROOTFS_SKELETON_DEFAULT
-
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 014aedf..448984e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -5,7 +5,7 @@ choice
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
-	select BR2_PACKAGE_SKELETON
+	select BR2_PACKAGE_SKELETON_COMMON
 	help
 	  Use default target skeleton
 
