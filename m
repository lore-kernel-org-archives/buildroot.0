From: Assaf Inbal <shmuelzon@gmail.com>
Date: Sun, 15 Sep 2013 09:20:48 +0300
Subject: [Buildroot] [PATCH v4 1/2] getty: Create specific getty config +
	cleanups
In-Reply-To: <1379226049-11011-1-git-send-email-shmuelzon@gmail.com>
References: <1379226049-11011-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1379226049-11011-2-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces a specific BR2_TARGET_GENERIC_GETTY configuration flag.
This eliminates the need for checking if BR2_TARGET_GENERIC_GETTY_PORT is an
empty string or not. It also allows hiding various getty options when getty
isn't enabled.

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 system/Config.in |   17 ++++++++++++-----
 system/system.mk |   27 ++++++++++++++-------------
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 401285b..92dc7dd 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -198,15 +198,20 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  in the build log! Avoid using a valuable password if either the
 	  .config file or the build log may be distributed!
 
+config BR2_TARGET_GENERIC_GETTY
+       bool "Run a getty (login prompt) after boot"
+       default y
+
+if BR2_TARGET_GENERIC_GETTY
+menu "getty options"
 config BR2_TARGET_GENERIC_GETTY_PORT
-	string "Port to run a getty (login prompt) on"
+	string "TTY port"
 	default "ttyS0"
 	help
-	  Specify a port to run a getty (login prompt) on.
-	  Set to the empty string to not run a getty.
+	  Specify a port to run a getty on.
 
 choice
-	prompt "Baudrate to use"
+	prompt "Baudrate"
 	default BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
 	help
 	  Select a baudrate to use.
@@ -235,10 +240,12 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 	default "115200"	if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
 
 config BR2_TARGET_GENERIC_GETTY_TERM
-	string "Value to assign the TERM environment variable"
+	string "TERM environment variable"
 	default "vt100"
 	help
 	  Specify a TERM type.
+endmenu
+endif
 
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	bool "remount root filesystem read-write during boot"
diff --git a/system/system.mk b/system/system.mk
index b4ddc3e..c9e7cf7 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -1,14 +1,14 @@
-TARGET_GENERIC_HOSTNAME := $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
-TARGET_GENERIC_ISSUE := $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
-TARGET_GENERIC_ROOT_PASSWD := $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
-TARGET_GENERIC_PASSWD_METHOD := $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
-TARGET_GENERIC_GETTY := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
-TARGET_GENERIC_GETTY_BAUDRATE := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
-TARGET_GENERIC_GETTY_TERM := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
+TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
+TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
+TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
+TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
+TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 
 target-generic-securetty:
-	grep -q '^$(TARGET_GENERIC_GETTY)$$' $(TARGET_DIR)/etc/securetty || \
-		echo '$(TARGET_GENERIC_GETTY)' >> $(TARGET_DIR)/etc/securetty
+	grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
+		echo '$(TARGET_GENERIC_GETTY_PORT)' >> $(TARGET_DIR)/etc/securetty
 
 target-generic-hostname:
 	mkdir -p $(TARGET_DIR)/etc
@@ -29,13 +30,13 @@ target-root-passwd:
 	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
 
 target-generic-getty-busybox:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 
 # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
 # skip the "tty" part and keep only the remaining.
 target-generic-getty-sysvinit:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 
 # Find commented line, if any, and remove leading '#'s
@@ -46,7 +47,7 @@ target-generic-do-remount-rw:
 target-generic-dont-remount-rw:
 	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
 
-ifneq ($(TARGET_GENERIC_GETTY),)
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
 TARGETS += target-generic-securetty
 endif
 
@@ -61,7 +62,7 @@ endif
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 TARGETS += target-root-passwd
 
-ifneq ($(TARGET_GENERIC_GETTY),)
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
 TARGETS += target-generic-getty-$(if $(BR2_PACKAGE_SYSVINIT),sysvinit,busybox)
 endif
 
-- 
1.7.9.5
