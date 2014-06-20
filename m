From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 20 Jun 2014 10:26:17 +0200
Subject: [Buildroot] [PATCH v2 2/3] system: convert "system.mk" recipes to
	"target-finalize" hooks
In-Reply-To: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1403252778-19761-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert "system.mk" recipes to "target-finalize" hooks in order to:
- Ensure an ordering even if top-level parallel make is being used.
- Execute "system.mk" commands after the "target-finalize" initial message
  is printed so they can be clearly distinguished from packages
  building.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v2:
     - use hooks

 system/system.mk | 82 +++++++++++++++++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/system/system.mk b/system/system.mk
index 01a6c3a..c01ab0f 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -7,68 +7,76 @@ TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRAT
 TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
 
-target-generic-securetty:
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+define SYSTEM_GENERIC_SECURETTY
 	grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
 		echo '$(TARGET_GENERIC_GETTY_PORT)' >> $(TARGET_DIR)/etc/securetty
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_SECURETTY
+endif
 
-target-generic-hostname:
+ifneq ($(TARGET_GENERIC_HOSTNAME),)
+define SYSTEM_GENERIC_HOSTNAME
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
 	$(SED) '$$a \127.0.1.1\t$(TARGET_GENERIC_HOSTNAME)' \
 		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_HOSTNAME
+endif
 
-target-generic-issue:
+ifneq ($(TARGET_GENERIC_ISSUE),)
+define SYSTEM_GENERIC_ISSUE
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_ISSUE
+endif
 
 ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
-target-root-passwd: host-mkpasswd
+TARGETS += host-mkpasswd
 endif
-target-root-passwd:
+
+ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
+
+define SYSTEM_ROOT_PASSWD
 	[ -n "$(TARGET_GENERIC_ROOT_PASSWD)" ] && \
 		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
 	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_ROOT_PASSWD
 
-target-generic-getty-busybox:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
 # skip the "tty" part and keep only the remaining.
-target-generic-getty-sysvinit:
+define SYSTEM_GENERIC_GETTY_SYSVINIT
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_GETTY_SYSVINIT
+else
+# Add getty to busybox inittab
+define SYSTEM_GENERIC_GETTY_BUSYBOX
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_GETTY_BUSYBOX
+endif
+endif
 
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Find commented line, if any, and remove leading '#'s
-target-generic-do-remount-rw:
+define SYSTEM_GENERIC_DO_REMOUNT_RW
 	$(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
-
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_DO_REMOUNT_RW
+else
 # Find uncommented line, if any, and add a leading '#'
-target-generic-dont-remount-rw:
+define SYSTEM_GENERIC_DONT_REMOUNT_RW
 	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
-
-ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-TARGETS += target-generic-securetty
-endif
-
-ifneq ($(TARGET_GENERIC_HOSTNAME),)
-TARGETS += target-generic-hostname
-endif
-
-ifneq ($(TARGET_GENERIC_ISSUE),)
-TARGETS += target-generic-issue
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_DONT_REMOUNT_RW
 endif
 
-ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-TARGETS += target-root-passwd
-
-ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-TARGETS += target-generic-getty-$(if $(BR2_PACKAGE_SYSVINIT),sysvinit,busybox)
-endif
-
-ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
-TARGETS += target-generic-do-remount-rw
-else
-TARGETS += target-generic-dont-remount-rw
-endif
-endif
+endif # BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.0.0
