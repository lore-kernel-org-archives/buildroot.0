From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 21:52:47 +0200
Subject: [Buildroot] [git commit] skeleton: Rename skeleton-common to
	skeleton-init-common
Message-ID: <20170814194941.604B282150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e5547a73de02c13cd80c5cd2e221f508a408bca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The skeletons are based on the selection of BR2_INIT_*, so add init- to
the package name to make this clearer. The name skeleton-common implies
that it is common to all skeletons, yet it does not apply to
skeleton-custom. It is only common to the skeleton-init-* packages, so
name it the same way.

Signed-off-by: Cam Hutchison <camh@xdna.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  2 +-
 package/skeleton-common/Config.in                  |  2 -
 package/skeleton-common/skeleton-common.mk         | 90 ----------------------
 package/skeleton-init-common/Config.in             |  2 +
 .../skeleton-init-common/skeleton-init-common.mk   | 90 ++++++++++++++++++++++
 package/skeleton-init-none/Config.in               |  2 +-
 package/skeleton-init-none/skeleton-init-none.mk   |  2 +-
 package/skeleton-init-systemd/Config.in            |  2 +-
 .../skeleton-init-systemd/skeleton-init-systemd.mk |  2 +-
 package/skeleton-init-sysv/Config.in               |  2 +-
 package/skeleton-init-sysv/skeleton-init-sysv.mk   |  2 +-
 11 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ed2a472..a0868d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2,8 +2,8 @@ menu "Target packages"
 
 	source "package/busybox/Config.in"
 	source "package/skeleton/Config.in"
-	source "package/skeleton-common/Config.in"
 	source "package/skeleton-custom/Config.in"
+	source "package/skeleton-init-common/Config.in"
 	source "package/skeleton-init-none/Config.in"
 	source "package/skeleton-init-systemd/Config.in"
 	source "package/skeleton-init-sysv/Config.in"
diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
deleted file mode 100644
index 9abed42..0000000
--- a/package/skeleton-common/Config.in
+++ /dev/null
@@ -1,2 +0,0 @@
-config BR2_PACKAGE_SKELETON_COMMON
-	bool
diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
deleted file mode 100644
index e94dd6e..0000000
--- a/package/skeleton-common/skeleton-common.mk
+++ /dev/null
@@ -1,90 +0,0 @@
-################################################################################
-#
-# skeleton-common
-#
-################################################################################
-
-# The skeleton can't depend on the toolchain, since all packages depends on the
-# skeleton and the toolchain is a target package, as is skeleton.
-# Hence, skeleton would depends on the toolchain and the toolchain would depend
-# on skeleton.
-SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
-SKELETON_COMMON_ADD_SKELETON_DEPENDENCY = NO
-
-# The skeleton also handles the merged /usr case in the sysroot
-SKELETON_COMMON_INSTALL_STAGING = YES
-
-SKELETON_COMMON_PATH = system/skeleton
-
-define SKELETON_COMMON_INSTALL_TARGET_CMDS
-	$(call SYSTEM_RSYNC,$(SKELETON_COMMON_PATH),$(TARGET_DIR))
-	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
-	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
-		$(TARGET_DIR_WARNING_FILE)
-endef
-
-# We don't care much about what goes in staging, as long as it is
-# correctly setup for merged/non-merged /usr. The simplest is to
-# fill it in with the content of the skeleton.
-define SKELETON_COMMON_INSTALL_STAGING_CMDS
-	$(call SYSTEM_RSYNC,$(SKELETON_COMMON_PATH),$(STAGING_DIR))
-	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
-	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
-endef
-
-SKELETON_COMMON_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
-SKELETON_COMMON_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
-SKELETON_COMMON_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
-SKELETON_COMMON_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
-SKELETON_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
-
-ifneq ($(SKELETON_COMMON_HOSTNAME),)
-define SKELETON_COMMON_SET_HOSTNAME
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(SKELETON_COMMON_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
-	$(SED) '$$a \127.0.1.1\t$(SKELETON_COMMON_HOSTNAME)' \
-		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
-endef
-SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_HOSTNAME
-endif
-
-ifneq ($(SKELETON_COMMON_ISSUE),)
-define SKELETON_COMMON_SET_ISSUE
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(SKELETON_COMMON_ISSUE)" > $(TARGET_DIR)/etc/issue
-endef
-SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ISSUE
-endif
-
-ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
-ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_COMMON_ROOT_PASSWD)),)
-SKELETON_COMMON_ROOT_PASSWORD = '$(SKELETON_COMMON_ROOT_PASSWD)'
-else ifneq ($(SKELETON_COMMON_ROOT_PASSWD),)
-# This variable will only be evaluated in the finalize stage, so we can
-# be sure that host-mkpasswd will have already been built by that time.
-SKELETON_COMMON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_COMMON_PASSWD_METHOD)" "$(SKELETON_COMMON_ROOT_PASSWD)"`"
-endif
-else # !BR2_TARGET_ENABLE_ROOT_LOGIN
-SKELETON_COMMON_ROOT_PASSWORD = "*"
-endif
-define SKELETON_COMMON_SET_ROOT_PASSWD
-	$(SED) s,^root:[^:]*:,root:$(SKELETON_COMMON_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
-endef
-SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ROOT_PASSWD
-
-ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
-define SKELETON_COMMON_SET_BIN_SH
-	rm -f $(TARGET_DIR)/bin/sh
-endef
-else
-ifneq ($(SKELETON_COMMON_BIN_SH),)
-define SKELETON_COMMON_SET_BIN_SH
-	ln -sf $(SKELETON_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
-endef
-endif
-endif
-SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_BIN_SH
-
-$(eval $(generic-package))
diff --git a/package/skeleton-init-common/Config.in b/package/skeleton-init-common/Config.in
new file mode 100644
index 0000000..0fd95de
--- /dev/null
+++ b/package/skeleton-init-common/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_SKELETON_INIT_COMMON
+	bool
diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
new file mode 100644
index 0000000..8228a81
--- /dev/null
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -0,0 +1,90 @@
+################################################################################
+#
+# skeleton-init-common
+#
+################################################################################
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_INIT_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_INIT_COMMON_ADD_SKELETON_DEPENDENCY = NO
+
+# The skeleton also handles the merged /usr case in the sysroot
+SKELETON_INIT_COMMON_INSTALL_STAGING = YES
+
+SKELETON_INIT_COMMON_PATH = system/skeleton
+
+define SKELETON_INIT_COMMON_INSTALL_TARGET_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_INIT_COMMON_PATH),$(TARGET_DIR))
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(TARGET_DIR_WARNING_FILE)
+endef
+
+# We don't care much about what goes in staging, as long as it is
+# correctly setup for merged/non-merged /usr. The simplest is to
+# fill it in with the content of the skeleton.
+define SKELETON_INIT_COMMON_INSTALL_STAGING_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_INIT_COMMON_PATH),$(STAGING_DIR))
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
+endef
+
+SKELETON_INIT_COMMON_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
+SKELETON_INIT_COMMON_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+SKELETON_INIT_COMMON_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+SKELETON_INIT_COMMON_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
+SKELETON_INIT_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
+
+ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),)
+define SKELETON_INIT_COMMON_SET_HOSTNAME
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(SKELETON_INIT_COMMON_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+	$(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTNAME)' \
+		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
+endef
+SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_HOSTNAME
+endif
+
+ifneq ($(SKELETON_INIT_COMMON_ISSUE),)
+define SKELETON_INIT_COMMON_SET_ISSUE
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(SKELETON_INIT_COMMON_ISSUE)" > $(TARGET_DIR)/etc/issue
+endef
+SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_ISSUE
+endif
+
+ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
+ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_INIT_COMMON_ROOT_PASSWD)),)
+SKELETON_INIT_COMMON_ROOT_PASSWORD = '$(SKELETON_INIT_COMMON_ROOT_PASSWD)'
+else ifneq ($(SKELETON_INIT_COMMON_ROOT_PASSWD),)
+# This variable will only be evaluated in the finalize stage, so we can
+# be sure that host-mkpasswd will have already been built by that time.
+SKELETON_INIT_COMMON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_INIT_COMMON_PASSWD_METHOD)" "$(SKELETON_INIT_COMMON_ROOT_PASSWD)"`"
+endif
+else # !BR2_TARGET_ENABLE_ROOT_LOGIN
+SKELETON_INIT_COMMON_ROOT_PASSWORD = "*"
+endif
+define SKELETON_INIT_COMMON_SET_ROOT_PASSWD
+	$(SED) s,^root:[^:]*:,root:$(SKELETON_INIT_COMMON_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
+endef
+SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_ROOT_PASSWD
+
+ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
+define SKELETON_INIT_COMMON_SET_BIN_SH
+	rm -f $(TARGET_DIR)/bin/sh
+endef
+else
+ifneq ($(SKELETON_INIT_COMMON_BIN_SH),)
+define SKELETON_INIT_COMMON_SET_BIN_SH
+	ln -sf $(SKELETON_INIT_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
+endef
+endif
+endif
+SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_BIN_SH
+
+$(eval $(generic-package))
diff --git a/package/skeleton-init-none/Config.in b/package/skeleton-init-none/Config.in
index 426954c..449bf66 100644
--- a/package/skeleton-init-none/Config.in
+++ b/package/skeleton-init-none/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SKELETON_INIT_NONE
 	bool
 	select BR2_PACKAGE_HAS_SKELETON
-	select BR2_PACKAGE_SKELETON_COMMON
+	select BR2_PACKAGE_SKELETON_INIT_COMMON
 
 config BR2_PACKAGE_PROVIDES_SKELETON
 	default "skeleton-init-none" if BR2_PACKAGE_SKELETON_INIT_NONE
diff --git a/package/skeleton-init-none/skeleton-init-none.mk b/package/skeleton-init-none/skeleton-init-none.mk
index 04e38c9..8181aa0 100644
--- a/package/skeleton-init-none/skeleton-init-none.mk
+++ b/package/skeleton-init-none/skeleton-init-none.mk
@@ -11,7 +11,7 @@
 SKELETON_INIT_NONE_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_INIT_NONE_ADD_SKELETON_DEPENDENCY = NO
 
-SKELETON_INIT_NONE_DEPENDENCIES = skeleton-common
+SKELETON_INIT_NONE_DEPENDENCIES = skeleton-init-common
 
 SKELETON_INIT_NONE_PROVIDES = skeleton
 
diff --git a/package/skeleton-init-systemd/Config.in b/package/skeleton-init-systemd/Config.in
index 2d8845c..59b21d1 100644
--- a/package/skeleton-init-systemd/Config.in
+++ b/package/skeleton-init-systemd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SKELETON_INIT_SYSTEMD
 	bool
 	select BR2_PACKAGE_HAS_SKELETON
-	select BR2_PACKAGE_SKELETON_COMMON
+	select BR2_PACKAGE_SKELETON_INIT_COMMON
 
 config BR2_PACKAGE_PROVIDES_SKELETON
 	default "skeleton-init-systemd" if BR2_PACKAGE_SKELETON_INIT_SYSTEMD
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index b2a6e26..a2d4e8c 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -11,7 +11,7 @@
 SKELETON_INIT_SYSTEMD_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_INIT_SYSTEMD_ADD_SKELETON_DEPENDENCY = NO
 
-SKELETON_INIT_SYSTEMD_DEPENDENCIES = skeleton-common
+SKELETON_INIT_SYSTEMD_DEPENDENCIES = skeleton-init-common
 
 SKELETON_INIT_SYSTEMD_PROVIDES = skeleton
 
diff --git a/package/skeleton-init-sysv/Config.in b/package/skeleton-init-sysv/Config.in
index 60000e0..6f645f9 100644
--- a/package/skeleton-init-sysv/Config.in
+++ b/package/skeleton-init-sysv/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SKELETON_INIT_SYSV
 	bool
 	select BR2_PACKAGE_HAS_SKELETON
-	select BR2_PACKAGE_SKELETON_COMMON
+	select BR2_PACKAGE_SKELETON_INIT_COMMON
 
 config BR2_PACKAGE_PROVIDES_SKELETON
 	default "skeleton-init-sysv" if BR2_PACKAGE_SKELETON_INIT_SYSV
diff --git a/package/skeleton-init-sysv/skeleton-init-sysv.mk b/package/skeleton-init-sysv/skeleton-init-sysv.mk
index dcff2b8..c89c2dc 100644
--- a/package/skeleton-init-sysv/skeleton-init-sysv.mk
+++ b/package/skeleton-init-sysv/skeleton-init-sysv.mk
@@ -11,7 +11,7 @@
 SKELETON_INIT_SYSV_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_INIT_SYSV_ADD_SKELETON_DEPENDENCY = NO
 
-SKELETON_INIT_SYSV_DEPENDENCIES = skeleton-common
+SKELETON_INIT_SYSV_DEPENDENCIES = skeleton-init-common
 
 SKELETON_INIT_SYSV_PROVIDES = skeleton
 
