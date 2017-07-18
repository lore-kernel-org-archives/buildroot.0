From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 19:25:33 +0200
Subject: [Buildroot] [PATCH 07/20] system: move remounting / to the
	corresponding init systems
In-Reply-To: <cover.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <db57282a925ddcf70a8fca8631ae62347b04c175.1500398733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, remounting / read-write (or not) is done by the skeleton
package when the init system is eitehr busybox or sysvinit, by
registering a target-finalize hook; it is not done at all for systemd.

Move registering this target-finalize hook to both of busybox and
sysvinit. Leave systemd alone, we'll take care of it later.

Rename the macro to a more meaningful name, and move it to system.mk
with the other such macros.

Yet a little bit less init-system knowledge in the skeleton.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk   |  3 +++
 package/skeleton/skeleton.mk | 15 ---------------
 package/sysvinit/sysvinit.mk |  3 +++
 system/system.mk             | 15 +++++++++++++++
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 2001c2dbdb..0550275a38 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -194,6 +194,9 @@ endef
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_SET_GETTY
 endif # BR2_TARGET_GENERIC_GETTY
 
+# Provided by the skeleton package
+BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
+
 endif # BR2_INIT_BUSYBOX
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_SELINUX),y)
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 7ad2cb1a66..4a66f6ceca 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -148,21 +148,6 @@ endif
 endif
 TARGET_FINALIZE_HOOKS += SKELETON_BIN_SH
 
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
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 $(eval $(generic-package))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index e9aa69b27b..d3312820b1 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -55,4 +55,7 @@ endef
 SYSVINIT_TARGET_FINALIZE_HOOKS += SYSVINIT_SET_GETTY
 endif # BR2_TARGET_GENERIC_GETTY
 
+# Provided by the skeleton package
+SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
+
 $(eval $(generic-package))
diff --git a/system/system.mk b/system/system.mk
index 7b843dad8e..ca6bf1388f 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -28,6 +28,9 @@
 # - SYSTEM_GETTY_OPTIONS
 #   the un-quoted getty setting
 #
+# - SYSTEM_REMOUNT_ROOT_INITTAB
+#   set inittab to remount root read-write or read-only
+#
 
 # This function handles the merged or non-merged /usr cases
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
@@ -71,3 +74,15 @@ SYSTEM_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 SYSTEM_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 SYSTEM_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 SYSTEM_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
+
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+# Find commented line, if any, and remove leading '#'s
+define SYSTEM_REMOUNT_ROOT_INITTAB
+	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+endef
+else
+# Find uncommented line, if any, and add a leading '#'
+define SYSTEM_REMOUNT_ROOT_INITTAB
+	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+endef
+endif
-- 
2.11.0
