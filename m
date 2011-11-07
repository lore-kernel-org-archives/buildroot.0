From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 07 Nov 2011 12:47:09 +0100
Subject: [Buildroot] [PATCH v2] add support for virtual terminal
Message-ID: <4EB7C53D.4030902@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

introduces new option "Enable virtual console on tty1"
to enable virtual terminal on tty1

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
v2: corrected the patch according to Baruch's comments

 fs/skeleton/etc/inittab    |    3 +++
 target/generic/Config.in   |    3 +++
 target/generic/Makefile.in |   16 ++++++++++++++++
 3 files changed, 22 insertions(+)

Index: b/fs/skeleton/etc/inittab
===================================================================
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -23,6 +23,9 @@
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
+# Put a getty on a virtual terminal
+#tty1::respawn:/sbin/getty tty1 38400 # GENERIC_VT
+
 # Put a getty on the serial port
 #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
Index: b/target/generic/Config.in
===================================================================
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -116,6 +116,9 @@
 	default "57600"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
 	default "115200"	if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
 
+config BR2_TARGET_GENERIC_TTY_PORT
+	bool "Enable virtual console on tty1"
+
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	bool "remount root filesystem read-write during boot"
 	default y
Index: b/target/generic/Makefile.in
===================================================================
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -23,6 +23,16 @@
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
 		$(TARGET_DIR)/etc/inittab
 
+# Put a getty on virtual terminal
+target-generic-do-getty-tty1:
+	#$(SED) 's/#tty1/tty1/' $(TARGET_DIR)/etc/inittab
+	$(SED) '/^#.*# GENERIC_VT$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+
+# Don't put a getty on virtual terminal
+target-generic-dont-getty-tty1:
+	#$(SED) 's/tty1/#tty1/' $(TARGET_DIR)/etc/inittab
+	$(SED) '/^[^#].*# GENERIC_VT$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+
 # Find commented line, if any, and remove leading '#'s
 target-generic-do-remount-rw:
 	$(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
@@ -39,6 +49,12 @@
 TARGETS += target-generic-issue
 endif
 
+ifeq ($(BR2_TARGET_GENERIC_TTY_PORT),y)
+TARGETS += target-generic-do-getty-tty1
+else
+TARGETS += target-generic-dont-getty-tty1
+endif
+
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 TARGETS += target-generic-getty-sysvinit
