From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 01:01:14 +0100
Subject: [Buildroot] [git commit] system: add option to configure TERM
	variable
Message-ID: <20121216001446.78AAE9A02E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0df7e1f0bc9247069c0598405e519dd7e190ce3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option is useful for cases where the terminal isn't a bare serial
vt100, but e.g. a linux tty with more features.

Signed-off-by: Richard Braun <rbraun@sceen.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/Config.in |    6 ++++++
 system/system.mk |    5 +++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 622b242..a557ea0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -154,6 +154,12 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 	default "57600"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
 	default "115200"	if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
 
+config BR2_TARGET_GENERIC_GETTY_TERM
+	string "Value to assign the TERM environment variable"
+	default "vt100"
+	help
+	  Specify a TERM type.
+
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	bool "remount root filesystem read-write during boot"
 	default y
diff --git a/system/system.mk b/system/system.mk
index 4185202..353d0ba 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -2,6 +2,7 @@ TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
+TARGET_GENERIC_GETTY_TERM:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 
 target-generic-hostname:
 	mkdir -p $(TARGET_DIR)/etc
@@ -14,13 +15,13 @@ target-generic-issue:
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
 
 target-generic-getty-busybox:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 
 # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
 # skip the "tty" part and keep only the remaining.
 target-generic-getty-sysvinit:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 
 # Find commented line, if any, and remove leading '#'s
