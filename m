From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 23:00:10 +0200
Subject: [Buildroot] [PATCH 3/4] skeleton: New package
In-Reply-To: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1436821211-4446-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package moves everything from /system/skeleton into a proper
package.

The entry Makefile is modified to remove the skeleton support.

The generic, autotools and cmake infra are modified to filter skeleton
and host-skeleton. Also, in the pkg-generic we add skeleton as a
dependency to every package.

All the TARGET_FINALIZE_HOOKS that were done in system/system.mk are now
done in skeleton.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Makefile                                           |  32 +------
 fs/common.mk                                       |   1 -
 package/pkg-autotools.mk                           |   2 +-
 package/pkg-cmake.mk                               |   3 +-
 package/skeleton/Config.in                         |   6 ++
 .../usr/sbin => package/skeleton/data/bin}/.empty  |   0
 {system/skeleton => package/skeleton/data}/dev/log |   0
 .../lib => package/skeleton/data/dev/pts}/.empty   |   0
 .../skeleton => package/skeleton/data}/etc/fstab   |   0
 .../skeleton => package/skeleton/data}/etc/group   |   0
 .../skeleton => package/skeleton/data}/etc/hosts   |   0
 .../skeleton => package/skeleton/data}/etc/inputrc |   0
 .../skeleton => package/skeleton/data}/etc/issue   |   0
 .../skeleton/data/etc/ld.so.conf.d}/.empty         |   0
 .../skeleton => package/skeleton/data}/etc/mtab    |   0
 .../skeleton/data/etc/network/if-down.d}/.empty    |   0
 .../data/etc/network/if-post-down.d}/.empty        |   0
 .../skeleton/data/etc/network/if-pre-up.d}/.empty  |   0
 .../skeleton/data/etc/network/if-up.d}/.empty      |   0
 .../skeleton => package/skeleton/data}/etc/passwd  |   0
 .../skeleton => package/skeleton/data}/etc/profile |   0
 .../skeleton/data}/etc/protocols                   |   0
 .../skeleton/data}/etc/resolv.conf                 |   0
 .../skeleton/data}/etc/services                    |   0
 .../skeleton => package/skeleton/data}/etc/shadow  |   0
 .../root => package/skeleton/data/home/ftp}/.empty |   0
 .../proc => package/skeleton/data/lib}/.empty      |   0
 .../opt => package/skeleton/data/media}/.empty     |   0
 .../skeleton => package/skeleton/data}/mnt/.empty  |   0
 .../media => package/skeleton/data/opt}/.empty     |   0
 .../lib => package/skeleton/data/proc}/.empty      |   0
 .../skeleton/data}/root/.bash_history              |   0
 .../skeleton/data}/root/.bash_logout               |   0
 .../skeleton/data}/root/.bash_profile              |   0
 .../home/ftp => package/skeleton/data/root}/.empty |   0
 .../if-up.d => package/skeleton/data/run}/.empty   |   0
 .../skeleton/data/sbin}/.empty                     |   0
 .../skeleton/data/sys}/.empty                      |   0
 .../if-down.d => package/skeleton/data/tmp}/.empty |   0
 .../skeleton/data/usr/bin}/.empty                  |   0
 .../pts => package/skeleton/data/usr/lib}/.empty   |   0
 .../bin => package/skeleton/data/usr/sbin}/.empty  |   0
 .../skeleton => package/skeleton/data}/var/cache   |   0
 .../skeleton/data}/var/lib/misc                    |   0
 .../skeleton => package/skeleton/data}/var/lock    |   0
 {system/skeleton => package/skeleton/data}/var/log |   0
 {system/skeleton => package/skeleton/data}/var/run |   0
 .../skeleton => package/skeleton/data}/var/spool   |   0
 {system/skeleton => package/skeleton/data}/var/tmp |   0
 package/skeleton/skeleton.mk                       | 100 +++++++++++++++++++++
 system/Config.in                                   |   1 +
 system/system.mk                                   |  66 --------------
 52 files changed, 114 insertions(+), 97 deletions(-)
 create mode 100644 package/skeleton/Config.in
 rename {system/skeleton/usr/sbin => package/skeleton/data/bin}/.empty (100%)
 rename {system/skeleton => package/skeleton/data}/dev/log (100%)
 rename {system/skeleton/usr/lib => package/skeleton/data/dev/pts}/.empty (100%)
 rename {system/skeleton => package/skeleton/data}/etc/fstab (100%)
 rename {system/skeleton => package/skeleton/data}/etc/group (100%)
 rename {system/skeleton => package/skeleton/data}/etc/hosts (100%)
 rename {system/skeleton => package/skeleton/data}/etc/inputrc (100%)
 rename {system/skeleton => package/skeleton/data}/etc/issue (100%)
 rename {system/skeleton/usr/bin => package/skeleton/data/etc/ld.so.conf.d}/.empty (100%)
 rename {system/skeleton => package/skeleton/data}/etc/mtab (100%)
 rename {system/skeleton/tmp => package/skeleton/data/etc/network/if-down.d}/.empty (100%)
 rename {system/skeleton/sys => package/skeleton/data/etc/network/if-post-down.d}/.empty (100%)
 rename {system/skeleton/sbin => package/skeleton/data/etc/network/if-pre-up.d}/.empty (100%)
 rename {system/skeleton/run => package/skeleton/data/etc/network/if-up.d}/.empty (100%)
 rename {system/skeleton => package/skeleton/data}/etc/passwd (100%)
 rename {system/skeleton => package/skeleton/data}/etc/profile (100%)
 rename {system/skeleton => package/skeleton/data}/etc/protocols (100%)
 rename {system/skeleton => package/skeleton/data}/etc/resolv.conf (100%)
 rename {system/skeleton => package/skeleton/data}/etc/services (100%)
 rename {system/skeleton => package/skeleton/data}/etc/shadow (100%)
 rename {system/skeleton/root => package/skeleton/data/home/ftp}/.empty (100%)
 rename {system/skeleton/proc => package/skeleton/data/lib}/.empty (100%)
 rename {system/skeleton/opt => package/skeleton/data/media}/.empty (100%)
 rename {system/skeleton => package/skeleton/data}/mnt/.empty (100%)
 rename {system/skeleton/media => package/skeleton/data/opt}/.empty (100%)
 rename {system/skeleton/lib => package/skeleton/data/proc}/.empty (100%)
 rename {system/skeleton => package/skeleton/data}/root/.bash_history (100%)
 rename {system/skeleton => package/skeleton/data}/root/.bash_logout (100%)
 rename {system/skeleton => package/skeleton/data}/root/.bash_profile (100%)
 rename {system/skeleton/home/ftp => package/skeleton/data/root}/.empty (100%)
 rename {system/skeleton/etc/network/if-up.d => package/skeleton/data/run}/.empty (100%)
 rename {system/skeleton/etc/network/if-pre-up.d => package/skeleton/data/sbin}/.empty (100%)
 rename {system/skeleton/etc/network/if-post-down.d => package/skeleton/data/sys}/.empty (100%)
 rename {system/skeleton/etc/network/if-down.d => package/skeleton/data/tmp}/.empty (100%)
 rename {system/skeleton/etc/ld.so.conf.d => package/skeleton/data/usr/bin}/.empty (100%)
 rename {system/skeleton/dev/pts => package/skeleton/data/usr/lib}/.empty (100%)
 rename {system/skeleton/bin => package/skeleton/data/usr/sbin}/.empty (100%)
 rename {system/skeleton => package/skeleton/data}/var/cache (100%)
 rename {system/skeleton => package/skeleton/data}/var/lib/misc (100%)
 rename {system/skeleton => package/skeleton/data}/var/lock (100%)
 rename {system/skeleton => package/skeleton/data}/var/log (100%)
 rename {system/skeleton => package/skeleton/data}/var/run (100%)
 rename {system/skeleton => package/skeleton/data}/var/spool (100%)
 rename {system/skeleton => package/skeleton/data}/var/tmp (100%)
 create mode 100644 package/skeleton/skeleton.mk

diff --git a/Makefile b/Makefile
index 546bcd3..8eb59ee 100644
--- a/Makefile
+++ b/Makefile
@@ -361,12 +361,6 @@ HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
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
@@ -421,8 +415,7 @@ include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
-dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR)
+dirs: $(BUILD_DIR) $(STAGING_DIR) $(HOST_DIR) $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -431,9 +424,9 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: target-post-image
 
-.PHONY: all world toolchain dirs clean distclean source outputmakefile \
-	legal-info legal-info-prepare legal-info-clean printvars help \
-	list-defconfigs target-finalize target-post-image source-check
+.PHONY: all world skeleton toolchain dirs clean distclean source \
+	outputmakefile legal-info legal-info-prepare legal-info-clean printvars \
+	help list-defconfigs target-finalize target-post-image source-check
 
 ################################################################################
 #
@@ -462,27 +455,10 @@ $(STAGING_DIR):
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
diff --git a/fs/common.mk b/fs/common.mk
index 4387d06..0f53405 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -91,7 +91,6 @@ endif
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
-	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
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
diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
new file mode 100644
index 0000000..1976158
--- /dev/null
+++ b/package/skeleton/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SKELETON
+	bool
+	default y
+	depends on BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  The basic skeleton for your rootfs.
diff --git a/system/skeleton/usr/sbin/.empty b/package/skeleton/data/bin/.empty
similarity index 100%
rename from system/skeleton/usr/sbin/.empty
rename to package/skeleton/data/bin/.empty
diff --git a/system/skeleton/dev/log b/package/skeleton/data/dev/log
similarity index 100%
rename from system/skeleton/dev/log
rename to package/skeleton/data/dev/log
diff --git a/system/skeleton/usr/lib/.empty b/package/skeleton/data/dev/pts/.empty
similarity index 100%
rename from system/skeleton/usr/lib/.empty
rename to package/skeleton/data/dev/pts/.empty
diff --git a/system/skeleton/etc/fstab b/package/skeleton/data/etc/fstab
similarity index 100%
rename from system/skeleton/etc/fstab
rename to package/skeleton/data/etc/fstab
diff --git a/system/skeleton/etc/group b/package/skeleton/data/etc/group
similarity index 100%
rename from system/skeleton/etc/group
rename to package/skeleton/data/etc/group
diff --git a/system/skeleton/etc/hosts b/package/skeleton/data/etc/hosts
similarity index 100%
rename from system/skeleton/etc/hosts
rename to package/skeleton/data/etc/hosts
diff --git a/system/skeleton/etc/inputrc b/package/skeleton/data/etc/inputrc
similarity index 100%
rename from system/skeleton/etc/inputrc
rename to package/skeleton/data/etc/inputrc
diff --git a/system/skeleton/etc/issue b/package/skeleton/data/etc/issue
similarity index 100%
rename from system/skeleton/etc/issue
rename to package/skeleton/data/etc/issue
diff --git a/system/skeleton/usr/bin/.empty b/package/skeleton/data/etc/ld.so.conf.d/.empty
similarity index 100%
rename from system/skeleton/usr/bin/.empty
rename to package/skeleton/data/etc/ld.so.conf.d/.empty
diff --git a/system/skeleton/etc/mtab b/package/skeleton/data/etc/mtab
similarity index 100%
rename from system/skeleton/etc/mtab
rename to package/skeleton/data/etc/mtab
diff --git a/system/skeleton/tmp/.empty b/package/skeleton/data/etc/network/if-down.d/.empty
similarity index 100%
rename from system/skeleton/tmp/.empty
rename to package/skeleton/data/etc/network/if-down.d/.empty
diff --git a/system/skeleton/sys/.empty b/package/skeleton/data/etc/network/if-post-down.d/.empty
similarity index 100%
rename from system/skeleton/sys/.empty
rename to package/skeleton/data/etc/network/if-post-down.d/.empty
diff --git a/system/skeleton/sbin/.empty b/package/skeleton/data/etc/network/if-pre-up.d/.empty
similarity index 100%
rename from system/skeleton/sbin/.empty
rename to package/skeleton/data/etc/network/if-pre-up.d/.empty
diff --git a/system/skeleton/run/.empty b/package/skeleton/data/etc/network/if-up.d/.empty
similarity index 100%
rename from system/skeleton/run/.empty
rename to package/skeleton/data/etc/network/if-up.d/.empty
diff --git a/system/skeleton/etc/passwd b/package/skeleton/data/etc/passwd
similarity index 100%
rename from system/skeleton/etc/passwd
rename to package/skeleton/data/etc/passwd
diff --git a/system/skeleton/etc/profile b/package/skeleton/data/etc/profile
similarity index 100%
rename from system/skeleton/etc/profile
rename to package/skeleton/data/etc/profile
diff --git a/system/skeleton/etc/protocols b/package/skeleton/data/etc/protocols
similarity index 100%
rename from system/skeleton/etc/protocols
rename to package/skeleton/data/etc/protocols
diff --git a/system/skeleton/etc/resolv.conf b/package/skeleton/data/etc/resolv.conf
similarity index 100%
rename from system/skeleton/etc/resolv.conf
rename to package/skeleton/data/etc/resolv.conf
diff --git a/system/skeleton/etc/services b/package/skeleton/data/etc/services
similarity index 100%
rename from system/skeleton/etc/services
rename to package/skeleton/data/etc/services
diff --git a/system/skeleton/etc/shadow b/package/skeleton/data/etc/shadow
similarity index 100%
rename from system/skeleton/etc/shadow
rename to package/skeleton/data/etc/shadow
diff --git a/system/skeleton/root/.empty b/package/skeleton/data/home/ftp/.empty
similarity index 100%
rename from system/skeleton/root/.empty
rename to package/skeleton/data/home/ftp/.empty
diff --git a/system/skeleton/proc/.empty b/package/skeleton/data/lib/.empty
similarity index 100%
rename from system/skeleton/proc/.empty
rename to package/skeleton/data/lib/.empty
diff --git a/system/skeleton/opt/.empty b/package/skeleton/data/media/.empty
similarity index 100%
rename from system/skeleton/opt/.empty
rename to package/skeleton/data/media/.empty
diff --git a/system/skeleton/mnt/.empty b/package/skeleton/data/mnt/.empty
similarity index 100%
rename from system/skeleton/mnt/.empty
rename to package/skeleton/data/mnt/.empty
diff --git a/system/skeleton/media/.empty b/package/skeleton/data/opt/.empty
similarity index 100%
rename from system/skeleton/media/.empty
rename to package/skeleton/data/opt/.empty
diff --git a/system/skeleton/lib/.empty b/package/skeleton/data/proc/.empty
similarity index 100%
rename from system/skeleton/lib/.empty
rename to package/skeleton/data/proc/.empty
diff --git a/system/skeleton/root/.bash_history b/package/skeleton/data/root/.bash_history
similarity index 100%
rename from system/skeleton/root/.bash_history
rename to package/skeleton/data/root/.bash_history
diff --git a/system/skeleton/root/.bash_logout b/package/skeleton/data/root/.bash_logout
similarity index 100%
rename from system/skeleton/root/.bash_logout
rename to package/skeleton/data/root/.bash_logout
diff --git a/system/skeleton/root/.bash_profile b/package/skeleton/data/root/.bash_profile
similarity index 100%
rename from system/skeleton/root/.bash_profile
rename to package/skeleton/data/root/.bash_profile
diff --git a/system/skeleton/home/ftp/.empty b/package/skeleton/data/root/.empty
similarity index 100%
rename from system/skeleton/home/ftp/.empty
rename to package/skeleton/data/root/.empty
diff --git a/system/skeleton/etc/network/if-up.d/.empty b/package/skeleton/data/run/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-up.d/.empty
rename to package/skeleton/data/run/.empty
diff --git a/system/skeleton/etc/network/if-pre-up.d/.empty b/package/skeleton/data/sbin/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-pre-up.d/.empty
rename to package/skeleton/data/sbin/.empty
diff --git a/system/skeleton/etc/network/if-post-down.d/.empty b/package/skeleton/data/sys/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-post-down.d/.empty
rename to package/skeleton/data/sys/.empty
diff --git a/system/skeleton/etc/network/if-down.d/.empty b/package/skeleton/data/tmp/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-down.d/.empty
rename to package/skeleton/data/tmp/.empty
diff --git a/system/skeleton/etc/ld.so.conf.d/.empty b/package/skeleton/data/usr/bin/.empty
similarity index 100%
rename from system/skeleton/etc/ld.so.conf.d/.empty
rename to package/skeleton/data/usr/bin/.empty
diff --git a/system/skeleton/dev/pts/.empty b/package/skeleton/data/usr/lib/.empty
similarity index 100%
rename from system/skeleton/dev/pts/.empty
rename to package/skeleton/data/usr/lib/.empty
diff --git a/system/skeleton/bin/.empty b/package/skeleton/data/usr/sbin/.empty
similarity index 100%
rename from system/skeleton/bin/.empty
rename to package/skeleton/data/usr/sbin/.empty
diff --git a/system/skeleton/var/cache b/package/skeleton/data/var/cache
similarity index 100%
rename from system/skeleton/var/cache
rename to package/skeleton/data/var/cache
diff --git a/system/skeleton/var/lib/misc b/package/skeleton/data/var/lib/misc
similarity index 100%
rename from system/skeleton/var/lib/misc
rename to package/skeleton/data/var/lib/misc
diff --git a/system/skeleton/var/lock b/package/skeleton/data/var/lock
similarity index 100%
rename from system/skeleton/var/lock
rename to package/skeleton/data/var/lock
diff --git a/system/skeleton/var/log b/package/skeleton/data/var/log
similarity index 100%
rename from system/skeleton/var/log
rename to package/skeleton/data/var/log
diff --git a/system/skeleton/var/run b/package/skeleton/data/var/run
similarity index 100%
rename from system/skeleton/var/run
rename to package/skeleton/data/var/run
diff --git a/system/skeleton/var/spool b/package/skeleton/data/var/spool
similarity index 100%
rename from system/skeleton/var/spool
rename to package/skeleton/data/var/spool
diff --git a/system/skeleton/var/tmp b/package/skeleton/data/var/tmp
similarity index 100%
rename from system/skeleton/var/tmp
rename to package/skeleton/data/var/tmp
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
new file mode 100644
index 0000000..be3347e
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
+# Location of a file giving a big fat warning that output/target
+# should not be used as the root filesystem.
+SKELETON_TARGET_DIR_WARNING_FILE = \
+	$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+
+define SKELETON_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)
+	rsync -a --ignore-times $(SKELETON_RSYNC_VCS_EXCLUSIONS) \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
+		package/skeleton/data/ $(TARGET_DIR)/
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(SKELETON_TARGET_DIR_WARNING_FILE)
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
index fad829d..5cefbd1 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -158,6 +158,7 @@ choice
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
+	select BR2_PACKAGE_SKELETON
 	help
 	  Use default target skeleton
 
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
