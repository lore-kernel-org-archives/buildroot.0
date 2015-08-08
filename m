From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:52 -0000
Subject: [Buildroot] [git commit branch/next] skeleton: New package
Message-ID: <20150808105633.1295B7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a6b83a211612ff95a1f5d35b2861ad5655ac8b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Create a proper package for the skeleton.

The main Makefile is modified to remove the skeleton support.
The 'dirs' target, will create the $(TARGET_DIR).
The file 'output/target/.root' doesn't exists anymore, as there's no
Make rule to statisfy.

The infrastructure are modified to filter host-skeleton.
It's needed becauses the host-dependencies are derived from the
dependencies of the target package where 'host-' is preprended to the
depedency name.

In the pkg-generic we add skeleton as a dependency to every package.

The whole system/system.mk is now removed at the profit of
package/skeleton/skeleton.mk

[Thomas:
  - rebase on top of master and fix some minor conflicts
  - remove the 'select BR2_PACKAGE_SKELETON' in
    BR2_ROOTFS_SKELETON_DEFAULT and BR2_ROOTFS_SKELETON_CUSTOM, since
    anyway the skeleton package is always enabled.
  - fixup a few mistakes in the getty handling due to misnamed
    variables.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                     |   22 +------
 package/pkg-autotools.mk     |    2 +-
 package/pkg-cmake.mk         |    3 +-
 package/pkg-generic.mk       |    5 +-
 package/pkg-python.mk        |    2 +-
 package/pkg-rebar.mk         |    4 +-
 package/pkg-virtual.mk       |    2 +-
 package/skeleton/Config.in   |    5 ++
 package/skeleton/skeleton.mk |  160 ++++++++++++++++++++++++++++++++++++++++++
 system/system.mk             |  124 --------------------------------
 10 files changed, 177 insertions(+), 152 deletions(-)

diff --git a/Makefile b/Makefile
index 8eb8c6d..9a18853 100644
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
@@ -416,7 +414,6 @@ include $(sort $(wildcard package/*/*.mk))
 
 include boot/common.mk
 include linux/linux.mk
-include system/system.mk
 include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
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
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 426301a..b7a702d 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -150,7 +150,7 @@ endif
 # automatically from the dependencies of the corresponding target
 # package.
 ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-python host-python3 host-python-setuptools host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+$(2)_DEPENDENCIES ?= $$(filter-out host-python host-python3 host-python-setuptools host-skeleton host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
 
 # Target packages need both the python interpreter on the target (for
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
 
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 2889ef9..9c68b51 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -50,7 +50,7 @@ $(2)_VERSION = virtual
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES
 ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-toolchain $(1),\
+$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
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
index 0000000..70d1258
--- /dev/null
+++ b/package/skeleton/skeleton.mk
@@ -0,0 +1,160 @@
+################################################################################
+#
+# skeleton
+#
+################################################################################
+
+# source included in buildroot
+SKELETON_SOURCE =
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
+SKELETON_PATH = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
+else
+SKELETON_PATH = system/skeleton
+endif
+
+define SKELETON_INSTALL_TARGET_CMDS
+	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
+		$(SKELETON_PATH)/ $(TARGET_DIR)/
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(TARGET_DIR_WARNING_FILE)
+	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
+	mkdir -p $(TARGET_DIR)/usr
+	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
+endef
+
+SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
+SKELETON_TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+SKELETON_TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+SKELETON_TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
+SKELETON_TARGET_GENERIC_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
+SKELETON_TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
+SKELETON_TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
+SKELETON_TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
+SKELETON_TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
+
+ifneq ($(SKELETON_TARGET_GENERIC_HOSTNAME),)
+define SYSTEM_HOSTNAME
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(SKELETON_TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+	$(SED) '$$a \127.0.1.1\t$(SKELETON_TARGET_GENERIC_HOSTNAME)' \
+		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_HOSTNAME
+endif
+
+ifneq ($(SKELETON_TARGET_GENERIC_ISSUE),)
+define SYSTEM_ISSUE
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(SKELETON_TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_ISSUE
+endif
+
+define SET_NETWORK_LOCALHOST
+	( \
+		echo "# interface file auto-generated by buildroot"; \
+		echo ;                                               \
+		echo "auto lo";                                      \
+		echo "iface lo inet loopback";                       \
+	) > $(TARGET_DIR)/etc/network/interfaces
+endef
+
+NETWORK_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
+
+ifneq ($(NETWORK_DHCP_IFACE),)
+define SET_NETWORK_DHCP
+	( \
+		echo ;                                               \
+		echo "auto $(NETWORK_DHCP_IFACE)";                   \
+		echo "iface $(NETWORK_DHCP_IFACE) inet dhcp";        \
+	) >> $(TARGET_DIR)/etc/network/interfaces
+endef
+endif
+
+define SET_NETWORK
+	mkdir -p $(TARGET_DIR)/etc/network/
+	$(SET_NETWORK_LOCALHOST)
+	$(SET_NETWORK_DHCP)
+endef
+
+TARGET_FINALIZE_HOOKS += SET_NETWORK
+
+# The TARGET_FINALIZE_HOOKS must be sourced only if the users choose to use the
+# default skeleton.
+ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
+
+ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
+ifeq ($(SKELETON_TARGET_GENERIC_ROOT_PASSWD),)
+SYSTEM_ROOT_PASSWORD =
+else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)),)
+SYSTEM_ROOT_PASSWORD = $(SKELETON_TARGET_GENERIC_ROOT_PASSWD)
+else
+SKELETON_DEPENDENCIES += host-mkpasswd
+# This variable will only be evaluated in the finalize stage, so we can
+# be sure that host-mkpasswd will have already been built by that time.
+SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(SKELETON_TARGET_GENERIC_PASSWD_METHOD)" "$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)")
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
+	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
+endef
+endif
+TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_BIN_SH
+
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+ifeq ($(BR2_INIT_SYSV),y)
+# In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
+# skip the "tty" part and keep only the remaining.
+define SKELETON_SYSTEM_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(SKELETON_TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(SKELETON_TARGET_GENERIC_GETTY_OPTIONS) $(SKELETON_TARGET_GENERIC_GETTY_PORT) $(SKELETON_TARGET_GENERIC_GETTY_BAUDRATE) $(SKELETON_TARGET_GENERIC_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+else ifeq ($(BR2_INIT_BUSYBOX),y)
+# Add getty to busybox inittab
+define SKELETON_SYSTEM_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(SKELETON_TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(SKELETON_TARGET_GENERIC_GETTY_OPTIONS) $(SKELETON_TARGET_GENERIC_GETTY_PORT) $(SKELETON_TARGET_GENERIC_GETTY_BAUDRATE) $(SKELETON_TARGET_GENERIC_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+endif
+TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_GETTY
+endif
+
+ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
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
+endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
+
+endif # BR2_ROOTFS_SKELETON_DEFAULT
+
+$(eval $(generic-package))
diff --git a/system/system.mk b/system/system.mk
deleted file mode 100644
index e44f64c..0000000
--- a/system/system.mk
+++ /dev/null
@@ -1,124 +0,0 @@
-TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
-TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
-TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
-TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
-TARGET_GENERIC_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
-TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
-TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
-TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
-TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
-
-ifneq ($(TARGET_GENERIC_HOSTNAME),)
-define SYSTEM_HOSTNAME
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
-	$(SED) '$$a \127.0.1.1\t$(TARGET_GENERIC_HOSTNAME)' \
-		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
-endef
-TARGET_FINALIZE_HOOKS += SYSTEM_HOSTNAME
-endif
-
-ifneq ($(TARGET_GENERIC_ISSUE),)
-define SYSTEM_ISSUE
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
-endef
-TARGET_FINALIZE_HOOKS += SYSTEM_ISSUE
-endif
-
-define SET_NETWORK_LOCALHOST
-	( \
-		echo "# interface file auto-generated by buildroot"; \
-		echo ;                                               \
-		echo "auto lo";                                      \
-		echo "iface lo inet loopback";                       \
-	) > $(TARGET_DIR)/etc/network/interfaces
-endef
-
-NETWORK_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
-
-ifneq ($(NETWORK_DHCP_IFACE),)
-define SET_NETWORK_DHCP
-	( \
-		echo ;                                               \
-		echo "auto $(NETWORK_DHCP_IFACE)";                   \
-		echo "iface $(NETWORK_DHCP_IFACE) inet dhcp";        \
-	) >> $(TARGET_DIR)/etc/network/interfaces
-endef
-endif
-
-define SET_NETWORK
-	mkdir -p $(TARGET_DIR)/etc/network/
-	$(SET_NETWORK_LOCALHOST)
-	$(SET_NETWORK_DHCP)
-endef
-
-TARGET_FINALIZE_HOOKS += SET_NETWORK
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
-ifeq ($(BR2_INIT_SYSV),y)
-# In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
-# skip the "tty" part and keep only the remaining.
-define SYSTEM_GETTY
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-endef
-else ifeq ($(BR2_INIT_BUSYBOX),y)
-# Add getty to busybox inittab
-define SYSTEM_GETTY
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-endef
-endif
-TARGET_FINALIZE_HOOKS += SYSTEM_GETTY
-endif
-
-ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
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
-endif
-
-endif # BR2_ROOTFS_SKELETON_DEFAULT
