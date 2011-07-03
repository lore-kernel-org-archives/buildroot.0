From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun,  3 Jul 2011 12:56:03 +0200
Subject: [Buildroot] [PATCH] fs/skeleton: allow rootfs not to be remounted
	read-write
Message-ID: <1309690563-9490-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 fs/skeleton/etc/inittab    |    2 +-
 package/sysvinit/inittab   |    2 +-
 target/generic/Config.in   |   11 +++++++++++
 target/generic/Makefile.in |   13 +++++++++++++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index b1e5c16..47ab8e8 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -15,7 +15,7 @@
 
 # Startup the system
 null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mount -o remount,rw /
+null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
 null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index a4bcf82..afa0dc3 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -5,7 +5,7 @@
 id:1:initdefault:
 
 proc::sysinit:/bin/mount -t proc proc /proc
-rwmo::sysinit:/bin/mount -o remount,rw /
+rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
 dpts::sysinit:/bin/mkdir -p /dev/pts
 moun::sysinit:/bin/mount -a
 host::sysinit:/bin/hostname -F /etc/hostname
diff --git a/target/generic/Config.in b/target/generic/Config.in
index 4969fcd..716f428 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -109,6 +109,17 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 	default "57600"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
 	default "115200"	if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
 
+config BR2_REMOUNT_ROOTFS_RW
+	bool "remount root filesystem read-write during boot"
+	default y
+	help
+	  The root filesystem is typically mounted read-only at boot.
+	  By default, buildroot remounts it in read-write mode early during the
+	  boot process.
+	  Say no here if you would rather like your root filesystem to remain
+	  read-only.
+	  If unsure, say Y.
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_ROOTFS_POST_BUILD_SCRIPT
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index ce07ecf..d945f4c 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -23,6 +23,14 @@ target-generic-getty-sysvinit:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
 		$(TARGET_DIR)/etc/inittab
 
+# Find commented line, if any, and remove leading '#'s
+target-generic-do-remount-rw:
+	$(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+
+# Find uncommented line, if any, and add a leading '#'
+target-generic-dont-remount-rw:
+	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
@@ -37,4 +45,9 @@ TARGETS += target-generic-getty-sysvinit
 else
 TARGETS += target-generic-getty-busybox
 endif
+ifeq ($(BR2_REMOUNT_ROOTFS_RW),y)
+TARGETS += target-generic-do-remount-rw
+else
+TARGETS += target-generic-dont-remount-rw
+endif
 endif
-- 
1.7.4.1
