From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:38 +0200
Subject: [Buildroot] [PATCH 16/24 v2] package/skeleton: split into sysv and
	custom skeleton
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <f1043a01854ac5436fe818f3342f5674107748fc.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, both the sysv-like and custom skeletons are managed in a
single package.

However, for the custom skeleton, we basically do nothing, except for
a few symlinks for the /lib directory aliases, and a few checks about
merged /usr.

OTOH, for the default (sysv-like) skeleton, we do a lot more things,
like tweaking the issue, the hostname, setting the root password and so
on...

Furthermore, we're soon gonna have a skeleton for each kind of init
system, be it sysv-based or systemd.

So, it makes sense to offload the custom skeleton management to its own
package.

We change the way we check for the merged /usr readiness, from checking
at make parse time, to a configure command. This has virtually zero
impact, since the skeleton is the very first package to be "built", so
its configure commands are the very first to be run. It however slightly
cimplifies the .mk as we need not enclose the parse-time checks inside
an ifeq-block to check if the package is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                          |   2 +
 package/skeleton-custom/Config.in          |   2 +
 package/skeleton-custom/skeleton-custom.mk | 112 +++++++++++++++++++
 package/skeleton-sysv/Config.in            |   2 +
 package/skeleton-sysv/skeleton-sysv.mk     | 126 +++++++++++++++++++++
 package/skeleton/Config.in                 |   2 +
 package/skeleton/skeleton.mk               | 172 ++++-------------------------
 7 files changed, 265 insertions(+), 153 deletions(-)
 create mode 100644 package/skeleton-custom/Config.in
 create mode 100644 package/skeleton-custom/skeleton-custom.mk
 create mode 100644 package/skeleton-sysv/Config.in
 create mode 100644 package/skeleton-sysv/skeleton-sysv.mk

diff --git a/package/Config.in b/package/Config.in
index a2a02a8..fd445f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2,6 +2,8 @@ menu "Target packages"
 
 	source "package/busybox/Config.in"
 	source "package/skeleton/Config.in"
+	source "package/skeleton-custom/Config.in"
+	source "package/skeleton-sysv/Config.in"
 
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
diff --git a/package/skeleton-custom/Config.in b/package/skeleton-custom/Config.in
new file mode 100644
index 0000000..1f3c87c
--- /dev/null
+++ b/package/skeleton-custom/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_SKELETON_CUSTOM
+	bool
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
new file mode 100644
index 0000000..8690af4
--- /dev/null
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -0,0 +1,112 @@
+################################################################################
+#
+# skeleton-custom
+#
+################################################################################
+
+SKELETON_CUSTOM_SOURCE =
+
+SKELETON_CUSTOM_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_CUSTOM_ADD_SKELETON_DEPENDENCY = NO
+
+SKELETON_CUSTOM_INSTALL_STAGING = YES
+
+SKELETON_CUSTOM_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
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
+define SKELETON_CUSTOM_MISSING_DIRS
+	if [ -z "$(SKELETON_CUSTOM_LIB_INODE)" ]; then \
+		missing+=" /lib"; \
+	fi; \
+	if [ -z "$(SKELETON_CUSTOM_USR_LIB_INODE)" ]; then \
+		missing+=" /usr/lib"; \
+	fi; \
+	if [ -z "$(SKELETON_CUSTOM_BIN_INODE)" ]; then \
+		missing+=" /bin"; \
+	fi; \
+	if [ -z "$(SKELETON_CUSTOM_USR_BIN_INODE)" ]; then \
+		missing+=" /usr/bin"; \
+	fi; \
+	if [ -z "$(SKELETON_CUSTOM_SBIN_INODE)" ]; then \
+		missing+=" /sbin"; \
+	fi; \
+	if [ -z "$(SKELETON_CUSTOM_USR_SBIN_INODE)" ]; then \
+		missing+=" /usr/sbin"; \
+	fi; \
+	if [ "$${missing" ]; then \
+		printf "The custom skeleton in %s is missing\n" "$(SKELETON_CUSTOM_PATH)"; \
+		printf "the following directories:\n"; \
+		printf "   %s\n" "$${missing}"; \
+		exit 1; \
+	fi
+endef
+
+# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
+# counterparts are appropriately setup symlinks ones to the others.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+
+define SKELETON_CUSTOM_MERGED_USR
+	if [ $(SKELETON_LIB_INODE) != $(SKELETON_USR_LIB_INODE) ]; then \
+		missing+=" /lib"; \
+	fi; \
+	if [ $(SKELETON_BIN_INODE) != $(SKELETON_USR_BIN_INODE) ]; then \
+		missing+=" /bin"; \
+	fi; \
+	if [ $(SKELETON_SBIN_INODE) != $(SKELETON_USR_SBIN_INODE) ]; then \
+		missing+=" /sbin"; \
+	fi;
+	if [ "$${missing}" ]; then
+		printf "The custom skeleton in %s is not\n" "$(SKELETON_CUSTOM_PATH)"; \
+		printf "using a merged /usr for the following directories:\n"; \
+		printf "   %s\n" "$${missing}"; \
+		exit 1; \
+	fi
+endef
+
+endif # merged /usr
+
+# We used to do the followinf checks in Makefile code, to catch the
+# errors as early as possible. But the skeleton is the very first
+# package to be installed, so we do the checks in its configure
+# commands; they are almost as early as if they were done in Makefile
+# code.
+define SKELETON_CUSTOM_CONFIGURE_CMDS
+	$(SKELETON_CUSTOM_MISSING_DIRS)
+	$(SKELETON_CUSTOM_MERGED_USR)
+endef
+
+# Provided by the 'skeleton' package:
+# - SKELETON_LIB_SYMLINK
+
+define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
+	$(call SKELETON_RSYNC,$(SKELETON_CUSTOM_PATH),$(TARGET_DIR))
+	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
+	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
+endef
+
+# For the staging dir, we don't really care what we install, but we
+# need the /lib and /usr/lib apropriately setup.
+# Since we ensure, above, that they are correct in the skeleton, we
+# can simply copy it to staging.
+define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
+	$(call SKELETON_RSYNC,$(SKELETON_CUSTOM_PATH),$(STAGING_DIR))
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
+	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
+	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
+endef
+
+$(eval $(generic-package))
diff --git a/package/skeleton-sysv/Config.in b/package/skeleton-sysv/Config.in
new file mode 100644
index 0000000..8c2e7dd
--- /dev/null
+++ b/package/skeleton-sysv/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_SKELETON_SYSV
+	bool
diff --git a/package/skeleton-sysv/skeleton-sysv.mk b/package/skeleton-sysv/skeleton-sysv.mk
new file mode 100644
index 0000000..0a2f51b
--- /dev/null
+++ b/package/skeleton-sysv/skeleton-sysv.mk
@@ -0,0 +1,126 @@
+################################################################################
+#
+# skeleton-sysv
+#
+################################################################################
+
+SKELETON_SYSV_SOURCE =
+
+SKELETON_SYSV_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_SYSV_ADD_SKELETON_DEPENDENCY = NO
+
+SKELETON_SYSV_INSTALL_STAGING = YES
+
+# Provided by the 'skeleton' package:
+# - SKELETON_USR_SYMLINKS_OR_DIRS
+# - SKELETON_LIB_SYMLINK
+# - SKELETON_TARGET_GENERIC_HOSTNAME
+# - SKELETON_TARGET_GENERIC_ISSUE
+# - SKELETON_TARGET_ROOT_PASSWD
+# - SKELETON_TARGET_GENERIC_BIN_SH
+# - SKELETON_TARGET_GENERIC_GETTY_PORT
+# - SKELETON_TARGET_GENERIC_GETTY_BAUDRATE
+# - SKELETON_TARGET_GENERIC_GETTY_TERM
+# - SKELETON_TARGET_GENERIC_GETTY_OPTIONS
+# - SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK
+# - SKELETON_SET_NETWORK_IFUPDOWN_DHCP
+
+define SKELETON_INSTALL_TARGET_CMDS
+	$(call SKELETON_RSYNC,system/skeleton,$(TARGET_DIR))
+	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
+	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
+	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(TARGET_DIR_WARNING_FILE)
+endef
+
+# For the staging dir, we don't really care about /bin and /sbin.
+# But for consistency with the target dir, and to simplify the code,
+# we still handle them for the merged or non-merged /usr cases.
+# Since the toolchain is not yet available, the staging is not yet
+# populated, so we need to create the directories in /usr
+define SKELETON_SYSV_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
+	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
+	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
+	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
+endef
+
+ifneq ($(SKELETON_TARGET_GENERIC_HOSTNAME),)
+define SKELETON_SYSV_SET_HOSTNAME
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(SKELETON_TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+	$(SED) '$$a \127.0.1.1\t$(SKELETON_TARGET_GENERIC_HOSTNAME)' \
+		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
+endef
+SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_HOSTNAME
+endif
+
+ifneq ($(SKELETON_TARGET_GENERIC_ISSUE),)
+define SKELETON_SYSV_SET_ISSUE
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(SKELETON_TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
+endef
+SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_ISSUE
+endif
+
+define SKELETON_SYSV_SET_NETWORK
+	mkdir -p $(TARGET_DIR)/etc/network/
+	$(SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK)
+	$(SKELETON_SET_NETWORK_IFUPDOWN_DHCP)
+endef
+SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_NETWORK
+
+define SKELETON_SYSV_SET_ROOT_PASSWD
+	$(SED) s,^root:[^:]*:,root:$(SKELETON_SYSV_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
+endef
+SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_ROOT_PASSWD
+
+ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
+define SKELETON_SYSV_BIN_SH
+	rm -f $(TARGET_DIR)/bin/sh
+endef
+else
+define SKELETON_SYSV_BIN_SH
+	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
+endef
+endif
+SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_BIN_SH
+
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+ifeq ($(BR2_INIT_SYSV),y)
+# In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
+# skip the "tty" part and keep only the remaining.
+define SKELETON_SYSV_SET_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(SKELETON_TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(SKELETON_TARGET_GENERIC_GETTY_OPTIONS) $(SKELETON_TARGET_GENERIC_GETTY_PORT) $(SKELETON_TARGET_GENERIC_GETTY_BAUDRATE) $(SKELETON_TARGET_GENERIC_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+else ifeq ($(BR2_INIT_BUSYBOX),y)
+# Add getty to busybox inittab
+define SKELETON_SYSV_SET_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(SKELETON_TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(SKELETON_TARGET_GENERIC_GETTY_OPTIONS) $(SKELETON_TARGET_GENERIC_GETTY_PORT) $(SKELETON_TARGET_GENERIC_GETTY_BAUDRATE) $(SKELETON_TARGET_GENERIC_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+endif
+SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_GETTY
+endif
+
+ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+# Find commented line, if any, and remove leading '#'s
+define SKELETON_SYSV_REMOUNT_RW
+	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+endef
+else
+# Find uncommented line, if any, and add a leading '#'
+define SKELETON_SYSV_REMOUNT_RW
+	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+endef
+endif
+SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_REMOUNT_RW
+endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
+
+$(eval $(generic-package))
diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
index d25147b..6db0634 100644
--- a/package/skeleton/Config.in
+++ b/package/skeleton/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_SKELETON
 	bool
 	default y
+	select BR2_PACKAGE_SKELETON_SYSV   if BR2_ROOTFS_SKELETON_DEFAULT
+	select BR2_PACKAGE_SKELETON_CUSTOM if BR2_ROOTFS_SKELETON_CUSTOM
 	help
 	  The basic skeleton for your rootfs.
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index e3ae694..bd787db 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -7,6 +7,10 @@
 # source included in buildroot
 SKELETON_SOURCE =
 
+SKELETON_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_SKELETON_SYSV),skeleton-sysv) \
+	$(if $(BR2_PACKAGE_SKELETON_CUSTOM),skeleton-custom)
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
@@ -14,53 +18,19 @@ SKELETON_SOURCE =
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
-# The skeleton also handles the merged /usr case in the sysroot
-SKELETON_INSTALL_STAGING = YES
-
-ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
-
-SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
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
-
-else # ! custom skeleton
-
-SKELETON_PATH = system/skeleton
-
-endif # ! custom skeleton
+# The following definitions are to be used by the specific skeletons:
+# - SKELETON_USR_SYMLINKS_OR_DIRS
+# - SKELETON_LIB_SYMLINK
+# - SKELETON_TARGET_GENERIC_HOSTNAME
+# - SKELETON_TARGET_GENERIC_ISSUE
+# - SKELETON_TARGET_ROOT_PASSWD
+# - SKELETON_TARGET_GENERIC_BIN_SH
+# - SKELETON_TARGET_GENERIC_GETTY_PORT
+# - SKELETON_TARGET_GENERIC_GETTY_BAUDRATE
+# - SKELETON_TARGET_GENERIC_GETTY_TERM
+# - SKELETON_TARGET_GENERIC_GETTY_OPTIONS
+# - SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK
+# - SKELETON_SET_NETWORK_IFUPDOWN_DHCP
 
 # This function rsyncs the skeleton directory in $(1) to the destination
 # in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
@@ -93,34 +63,6 @@ else
 SKELETON_LIB_SYMLINK = lib32
 endif
 
-define SKELETON_INSTALL_TARGET_CMDS
-	$(call SKELETON_RSYNC,$(SKELETON_PATH),$(TARGET_DIR))
-	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
-	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
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
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
-	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
-	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
-	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
-endef
-
-# The TARGET_FINALIZE_HOOKS must be sourced only if the users choose to use the
-# default skeleton.
-ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-
 SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 SKELETON_TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 SKELETON_TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
@@ -131,25 +73,8 @@ SKELETON_TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETT
 SKELETON_TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 SKELETON_TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
 
-ifneq ($(SKELETON_TARGET_GENERIC_HOSTNAME),)
-define SKELETON_SET_HOSTNAME
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(SKELETON_TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
-	$(SED) '$$a \127.0.1.1\t$(SKELETON_TARGET_GENERIC_HOSTNAME)' \
-		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
-endef
-TARGET_FINALIZE_HOOKS += SKELETON_SET_HOSTNAME
-endif
 
-ifneq ($(SKELETON_TARGET_GENERIC_ISSUE),)
-define SKELETON_SET_ISSUE
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(SKELETON_TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
-endef
-TARGET_FINALIZE_HOOKS += SKELETON_SET_ISSUE
-endif
-
-define SKELETON_SET_NETWORK_LOCALHOST
+define SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK
 	( \
 		echo "# interface file auto-generated by buildroot"; \
 		echo ;                                               \
@@ -161,7 +86,7 @@ endef
 SKELETON_NETWORK_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
 
 ifneq ($(SKELETON_NETWORK_DHCP_IFACE),)
-define SKELETON_SET_NETWORK_DHCP
+define SKELETON_SET_NETWORK_IFUPDOWN_DHCP
 	( \
 		echo ;                                               \
 		echo "auto $(SKELETON_NETWORK_DHCP_IFACE)";                   \
@@ -174,14 +99,6 @@ define SKELETON_SET_NETWORK_DHCP
 endef
 endif
 
-define SKELETON_SET_NETWORK
-	mkdir -p $(TARGET_DIR)/etc/network/
-	$(SKELETON_SET_NETWORK_LOCALHOST)
-	$(SKELETON_SET_NETWORK_DHCP)
-endef
-
-TARGET_FINALIZE_HOOKS += SKELETON_SET_NETWORK
-
 ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
 ifeq ($(SKELETON_TARGET_GENERIC_ROOT_PASSWD),)
 SKELETON_ROOT_PASSWORD =
@@ -197,55 +114,4 @@ else # !BR2_TARGET_ENABLE_ROOT_LOGIN
 SKELETON_ROOT_PASSWORD = "*"
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
-define SKELETON_BIN_SH
-	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
-endef
-endif
-TARGET_FINALIZE_HOOKS += SKELETON_BIN_SH
-
-ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-ifeq ($(BR2_INIT_SYSV),y)
-# In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
-# skip the "tty" part and keep only the remaining.
-define SKELETON_SET_GETTY
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(SKELETON_TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(SKELETON_TARGET_GENERIC_GETTY_OPTIONS) $(SKELETON_TARGET_GENERIC_GETTY_PORT) $(SKELETON_TARGET_GENERIC_GETTY_BAUDRATE) $(SKELETON_TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-endef
-else ifeq ($(BR2_INIT_BUSYBOX),y)
-# Add getty to busybox inittab
-define SKELETON_SET_GETTY
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(SKELETON_TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(SKELETON_TARGET_GENERIC_GETTY_OPTIONS) $(SKELETON_TARGET_GENERIC_GETTY_PORT) $(SKELETON_TARGET_GENERIC_GETTY_BAUDRATE) $(SKELETON_TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-endef
-endif
-TARGET_FINALIZE_HOOKS += SKELETON_SET_GETTY
-endif
-
-ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
-ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
-# Find commented line, if any, and remove leading '#'s
-define SKELETON_REMOUNT_RW
-	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
-endef
-else
-# Find uncommented line, if any, and add a leading '#'
-define SKELETON_REMOUNT_RW
-	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
-endef
-endif
-TARGET_FINALIZE_HOOKS += SKELETON_REMOUNT_RW
-endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
-
-endif # BR2_ROOTFS_SKELETON_DEFAULT
-
 $(eval $(generic-package))
-- 
2.7.4
