From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:33:38 +0200
Subject: [Buildroot] [git commit] system: move setting getty to the
	corresponding init systems
Message-ID: <20170722202932.0933B81DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b07ccc47cb511b877e6e7bb45c511e0646cb5528
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, setting the getty is done:
  - by the skeleton package when the init system is either busybox or
    sysvinit;
  - by the systemd package when the init system is systemd;
both by registering a target-finalize hook.

This is not very consistent.

Move setting the getty out of the skeleton and into the package that
provides the init system, by registering a per-package target-fialize
hook.

This offloads yet a bit more out of the skeleton, so that it is easier
to properly separate the skeletons for the various init systems.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk   | 12 +++++++++++-
 package/skeleton/skeleton.mk | 22 ----------------------
 package/sysvinit/sysvinit.mk |  8 ++++++++
 system/system.mk             | 11 +++++++++++
 4 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 2231730..2001c2d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -181,10 +181,20 @@ define BUSYBOX_INSTALL_UDHCPC_SCRIPT
 endef
 
 ifeq ($(BR2_INIT_BUSYBOX),y)
+
 define BUSYBOX_SET_INIT
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
 endef
-endif
+
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+define BUSYBOX_SET_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(SYSTEM_GETTY_PORT)::respawn:/sbin/getty -L $(SYSTEM_GETTY_OPTIONS) $(SYSTEM_GETTY_PORT) $(SYSTEM_GETTY_BAUDRATE) $(SYSTEM_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_SET_GETTY
+endif # BR2_TARGET_GENERIC_GETTY
+
+endif # BR2_INIT_BUSYBOX
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_SELINUX),y)
 BUSYBOX_DEPENDENCIES += host-pkgconf libselinux libsepol
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 3ae37c7..7ad2cb1 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -96,10 +96,6 @@ SKELETON_TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 SKELETON_TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
 SKELETON_TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
 SKELETON_TARGET_GENERIC_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
-SKELETON_TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
-SKELETON_TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
-SKELETON_TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
-SKELETON_TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
 
 ifneq ($(SKELETON_TARGET_GENERIC_HOSTNAME),)
 define SKELETON_SET_HOSTNAME
@@ -152,24 +148,6 @@ endif
 endif
 TARGET_FINALIZE_HOOKS += SKELETON_BIN_SH
 
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
 ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Find commented line, if any, and remove leading '#'s
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index ca7d06b..e9aa69b 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -47,4 +47,12 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	ln -sf killall5 $(TARGET_DIR)/sbin/pidof
 endef
 
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+define SYSVINIT_SET_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(SYSTEM_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(SYSTEM_GETTY_OPTIONS) $(SYSTEM_GETTY_PORT) $(SYSTEM_GETTY_BAUDRATE) $(SYSTEM_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+SYSVINIT_TARGET_FINALIZE_HOOKS += SYSVINIT_SET_GETTY
+endif # BR2_TARGET_GENERIC_GETTY
+
 $(eval $(generic-package))
diff --git a/system/system.mk b/system/system.mk
index cab5c1d..7b843da 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -22,6 +22,12 @@
 # - SYSTEM_LIB_SYMLINK
 #   create the appropriate /lib{32,64} symlinks
 #
+# - SYSTEM_GETTY_PORT
+# - SYSTEM_GETTY_BAUDRATE
+# - SYSTEM_GETTY_TERM
+# - SYSTEM_GETTY_OPTIONS
+#   the un-quoted getty setting
+#
 
 # This function handles the merged or non-merged /usr cases
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
@@ -60,3 +66,8 @@ define SYSTEM_LIB_SYMLINK
 	ln -snf lib $(1)/usr/lib32
 endef
 endif
+
+SYSTEM_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
+SYSTEM_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
+SYSTEM_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
+SYSTEM_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
