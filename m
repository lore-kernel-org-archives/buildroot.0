From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 10 Jun 2014 10:52:47 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
	"target-finalize" rule
Message-ID: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move system.mk recipes inside the "target-finalize" rule in order to:
- Ensure an ordering even if top-level parallel make is being used.
- Execute system.mk commands after the "target-finalize" initial message
  is printed so they can be clearly distinguished from packages
  building.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile         |  6 +++++
 system/system.mk | 74 ++++++++++++++++++++++++++++----------------------------
 2 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/Makefile b/Makefile
index dc86060..dba2083 100644
--- a/Makefile
+++ b/Makefile
@@ -531,6 +531,12 @@ $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(TARGETS)
 	@$(call MESSAGE,"Finalizing target directory")
+	$(TARGET_FINALIZE_GENERIC_SECURETTY)
+	$(TARGET_FINALIZE_GENERIC_HOSTNAME)
+	$(TARGET_FINALIZE_GENERIC_ISSUE)
+	$(TARGET_FINALIZE_ROOT_PASSWD)
+	$(TARGET_FINALIZE_GENERIC_GETTY)
+	$(TARGET_FINALIZE_GENERIC_REMOUNT_RW)
 	$(TARGET_PURGE_LOCALES)
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/system/system.mk b/system/system.mk
index 01a6c3a..756d3de 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -7,68 +7,68 @@ TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRAT
 TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
 
-target-generic-securetty:
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+define TARGET_FINALIZE_GENERIC_SECURETTY
 	grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
 		echo '$(TARGET_GENERIC_GETTY_PORT)' >> $(TARGET_DIR)/etc/securetty
+endef
+endif
 
-target-generic-hostname:
+ifneq ($(TARGET_GENERIC_HOSTNAME),)
+define TARGET_FINALIZE_GENERIC_HOSTNAME
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
 	$(SED) '$$a \127.0.1.1\t$(TARGET_GENERIC_HOSTNAME)' \
 		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
+endef
+endif
 
-target-generic-issue:
+ifneq ($(TARGET_GENERIC_ISSUE),)
+define TARGET_FINALIZE_GENERIC_ISSUE
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
+endef
+endif
 
 ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
-target-root-passwd: host-mkpasswd
+TARGETS += host-mkpasswd
 endif
-target-root-passwd:
+
+ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
+
+define TARGET_FINALIZE_ROOT_PASSWD
 	[ -n "$(TARGET_GENERIC_ROOT_PASSWD)" ] && \
 		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
 	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
+endef
 
-target-generic-getty-busybox:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
 # skip the "tty" part and keep only the remaining.
-target-generic-getty-sysvinit:
+define TARGET_FINALIZE_GENERIC_GETTY
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
+endef
+else
+# Add getty to busybox inittab
+define TARGET_FINALIZE_GENERIC_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+endif
+endif
 
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Find commented line, if any, and remove leading '#'s
-target-generic-do-remount-rw:
+define TARGET_FINALIZE_GENERIC_REMOUNT_RW
 	$(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
-
+endef
+else
 # Find uncommented line, if any, and add a leading '#'
-target-generic-dont-remount-rw:
+define TARGET_FINALIZE_GENERIC_REMOUNT_RW
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
1.9.1
