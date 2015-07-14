From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 02:51:47 +0200
Subject: [Buildroot] [PATCH v2] skeleton: New package
Message-ID: <1436835107-24984-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create a proper package for the skeleton.

The main Makefile is modified to remove the skeleton support.

The infrastructure are modified to filter host-skeleton.
Also, in the pkg-generic we add skeleton as a dependency to every package.

All the TARGET_FINALIZE_HOOKS that were done in system/system.mk are now
done in skeleton.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
   - Huge overall rework
   - Filter-out host-skeleton in missing infra
   - Finally, keep skeleton's file in /system/
   - Keep the TARGET_DIR creation in the main Makefile
---
 Makefile                     |  24 +----------
 package/pkg-autotools.mk     |   2 +-
 package/pkg-cmake.mk         |   3 +-
 package/pkg-generic.mk       |   5 ++-
 package/pkg-rebar.mk         |   4 +-
 package/skeleton/Config.in   |   5 +++
 package/skeleton/skeleton.mk | 100 +++++++++++++++++++++++++++++++++++++++++++
 system/Config.in             |   2 +
 system/system.mk             |  66 ----------------------------
 9 files changed, 118 insertions(+), 93 deletions(-)
 create mode 100644 package/skeleton/Config.in
 create mode 100644 package/skeleton/skeleton.mk

diff --git a/Makefile b/Makefile
index 546bcd3..c0bbaf4 100644
--- a/Makefile
+++ b/Makefile
@@ -361,8 +361,6 @@ HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"

-TARGET_SKELETON = $(TOPDIR)/system/skeleton
-
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
 TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
@@ -421,8 +419,7 @@ include fs/common.mk

 include $(BR2_EXTERNAL)/external.mk

-dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR)
+dirs: $(BUILD_DIR) $(STAGING_DIR) $(HOST_DIR) $(BINARIES_DIR)

 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -441,7 +438,7 @@ world: target-post-image
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@

 # We make a symlink lib32->lib or lib64->lib as appropriate
@@ -462,27 +459,10 @@ $(STAGING_DIR):
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
-		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
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
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 55154ff..b630ec9 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -164,7 +164,7 @@ $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
 # and _GETTEXTIZE away from the non-host rule
 ifeq ($(4),host)
 $(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
-				host-gettext host-toolchain $(1),\
+				host-gettext host-skeleton host-toolchain $(1),\
     $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f17a883..574eccc 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -146,7 +146,8 @@ endif
 # This must be repeated from inner-generic-package, otherwise we only get
 # host-cmake in _DEPENDENCIES because of the following line
 ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
+	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif

 $(2)_DEPENDENCIES += host-cmake
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index beff2d7..d1d6711 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -405,10 +405,13 @@ $(2)_REDISTRIBUTE		?= YES
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES

 ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out  host-toolchain $(1),\
+$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
 ifeq ($(4),target)
+ifneq ($(1),skeleton)
+$(2)_DEPENDENCIES += skeleton
+endif
 ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
 $(2)_DEPENDENCIES += toolchain
 endif
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 75facd5..c727489 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -192,11 +192,11 @@ ifeq ($$($(2)_USE_AUTOCONF),YES)
 # is NO.  Also filter the result of _AUTORECONF and _GETTEXTIZE away
 # from the non-host rule
 $(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
-				host-gettext host-toolchain host-erlang-rebar $(1),\
+				host-gettext host-skeleton host-toolchain host-erlang-rebar $(1),\
     $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 else
 # Same deal, if _USE_BUNDLED_REBAR is NO.
-$(2)_DEPENDENCIES ?= $$(filter-out  host-toolchain host-erlang-rebar $(1),\
+$(2)_DEPENDENCIES ?= $$(filter-out  host-skeleton host-toolchain host-erlang-rebar $(1),\
 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif

diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
new file mode 100644
index 0000000..d25147b
--- /dev/null
+++ b/package/skeleton/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_SKELETON
+	bool
+	default y
+	help
+	  The basic skeleton for your rootfs.
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
new file mode 100644
index 0000000..0c592b3
--- /dev/null
+++ b/package/skeleton/skeleton.mk
@@ -0,0 +1,100 @@
+################################################################################
+#
+# skeleton
+#
+################################################################################
+
+# source included in buildroot
+SKELETON_SOURCE =
+
+SKELETON_RSYNC_VCS_EXCLUSIONS = \
+	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
+	--exclude CVS
+
+SKELETON_PATH = system/skeleton
+ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
+SKELETON_PATH = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
+endif
+
+define SKELETON_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)
+	rsync -a --ignore-times $(SKELETON_RSYNC_VCS_EXCLUSIONS) \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
+		$(SKELETON_PATH)/ $(TARGET_DIR)/
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(TARGET_DIR_WARNING_FILE)
+	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
+	mkdir -p $(TARGET_DIR)/usr
+	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
+	touch $(BUILD_DIR)/.root
+endef
+
+# The TARGET_FINALIZE_HOOKS must be sourced only if the users choose to use the
+# default skeleton.
+ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
+
+ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
+ifeq ($(TARGET_GENERIC_ROOT_PASSWD),)
+SYSTEM_ROOT_PASSWORD =
+else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(TARGET_GENERIC_ROOT_PASSWD)),)
+SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWD)
+else
+SKELETON_DEPENDENCIES += host-mkpasswd
+# This variable will only be evaluated in the finalize stage, so we can
+# be sure that host-mkpasswd will have already been built by that time.
+SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
+endif
+else # !BR2_TARGET_ENABLE_ROOT_LOGIN
+SYSTEM_ROOT_PASSWORD = *
+endif
+
+define SKELETON_SYSTEM_SET_ROOT_PASSWD
+	$(SED) 's,^root:[^:]*:,root:$(SYSTEM_ROOT_PASSWORD):,' $(TARGET_DIR)/etc/shadow
+endef
+TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_SET_ROOT_PASSWD
+
+ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
+define SKELETON_SYSTEM_BIN_SH
+	rm -f $(TARGET_DIR)/bin/sh
+endef
+else
+define SKELETON_SYSTEM_BIN_SH
+	ln -sf $(TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
+endef
+endif
+TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_BIN_SH
+
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+# In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
+# skip the "tty" part and keep only the remaining.
+define SKELETON_SYSTEM_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+else
+# Add getty to busybox inittab
+define SKELETON_SYSTEM_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+endif
+TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_GETTY
+endif
+
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+# Find commented line, if any, and remove leading '#'s
+define SKELETON_SYSTEM_REMOUNT_RW
+	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+endef
+else
+# Find uncommented line, if any, and add a leading '#'
+define SKELETON_SYSTEM_REMOUNT_RW
+	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+endef
+endif
+TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_REMOUNT_RW
+
+endif # BR2_ROOTFS_SKELETON_DEFAULT
+
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index fad829d..ab1d510 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -158,11 +158,13 @@ choice

 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
+	select BR2_PACKAGE_SKELETON
 	help
 	  Use default target skeleton

 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
+	select BR2_PACKAGE_SKELETON
 	help
 	  Use custom target skeleton.

diff --git a/system/system.mk b/system/system.mk
index fd94e03..57fdd9c 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -54,69 +54,3 @@ define SET_NETWORK
 endef

 TARGET_FINALIZE_HOOKS += SET_NETWORK
-
-ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-
-ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
-ifeq ($(TARGET_GENERIC_ROOT_PASSWD),)
-SYSTEM_ROOT_PASSWORD =
-else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(TARGET_GENERIC_ROOT_PASSWD)),)
-SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWD)
-else
-PACKAGES += host-mkpasswd
-# This variable will only be evaluated in the finalize stage, so we can
-# be sure that host-mkpasswd will have already been built by that time.
-SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
-endif
-else # !BR2_TARGET_ENABLE_ROOT_LOGIN
-SYSTEM_ROOT_PASSWORD = *
-endif
-
-define SYSTEM_SET_ROOT_PASSWD
-	$(SED) 's,^root:[^:]*:,root:$(SYSTEM_ROOT_PASSWORD):,' $(TARGET_DIR)/etc/shadow
-endef
-TARGET_FINALIZE_HOOKS += SYSTEM_SET_ROOT_PASSWD
-
-ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
-define SYSTEM_BIN_SH
-	rm -f $(TARGET_DIR)/bin/sh
-endef
-else
-define SYSTEM_BIN_SH
-	ln -sf $(TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
-endef
-endif
-TARGET_FINALIZE_HOOKS += SYSTEM_BIN_SH
-
-ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-ifeq ($(BR2_PACKAGE_SYSVINIT),y)
-# In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
-# skip the "tty" part and keep only the remaining.
-define SYSTEM_GETTY
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-endef
-else
-# Add getty to busybox inittab
-define SYSTEM_GETTY
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-endef
-endif
-TARGET_FINALIZE_HOOKS += SYSTEM_GETTY
-endif
-
-ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
-# Find commented line, if any, and remove leading '#'s
-define SYSTEM_REMOUNT_RW
-	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
-endef
-else
-# Find uncommented line, if any, and add a leading '#'
-define SYSTEM_REMOUNT_RW
-	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
-endef
-endif
-TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW
-
-endif # BR2_ROOTFS_SKELETON_DEFAULT
--
2.1.4
