From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 23 Nov 2011 16:14:20 -0500
Subject: [Buildroot] [PATCH] mingetty: add package
Message-ID: <1322082860-12704-1-git-send-email-twoerner@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in            |    1 +
 package/mingetty/Config.in   |    7 +++++++
 package/mingetty/inittab     |   32 ++++++++++++++++++++++++++++++++
 package/mingetty/mingetty.mk |   28 ++++++++++++++++++++++++++++
 target/generic/Makefile.in   |    9 ++++++++-
 5 files changed, 76 insertions(+), 1 deletions(-)
 create mode 100644 package/mingetty/Config.in
 create mode 100644 package/mingetty/inittab
 create mode 100644 package/mingetty/mingetty.mk

diff --git a/package/Config.in b/package/Config.in
index 4b5e5d8..9d01d0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -528,6 +528,7 @@ source "package/bootutils/Config.in"
 endif
 source "package/htop/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/mingetty/Config.in"
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
diff --git a/package/mingetty/Config.in b/package/mingetty/Config.in
new file mode 100644
index 0000000..adc95a8
--- /dev/null
+++ b/package/mingetty/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MINGETTY
+	bool "mingetty"
+	help
+	  mingetty is a minimal getty for use on virtual consoles and is not
+	  suitable for use on serial lines.
+
+	  http://sourceforge.net/projects/mingetty/
diff --git a/package/mingetty/inittab b/package/mingetty/inittab
new file mode 100644
index 0000000..b59fc12
--- /dev/null
+++ b/package/mingetty/inittab
@@ -0,0 +1,32 @@
+# /etc/inittab
+#
+# This inittab is a basic inittab sample for mingetty,
+# which mimics sysvinit's inittab,
+# which mimics Buildroot's inittab for Busybox.
+id:1:initdefault:
+
+proc::sysinit:/bin/mount -t proc proc /proc
+rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
+dpts::sysinit:/bin/mkdir -p /dev/pts
+moun::sysinit:/bin/mount -a
+host::sysinit:/bin/hostname -F /etc/hostname
+init::sysinit:/etc/init.d/rcS
+
+1:1:respawn:/sbin/mingetty --noclear tty1
+2:1:respawn:/sbin/mingetty --noclear tty2
+
+# S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
+
+# Logging junk
+mess::sysinit:/bin/touch /var/log/messages
+sysl:1:respawn:/sbin/syslogd -n -m 0
+klog:1:respawn:/sbin/klogd -n
+
+# Stuff to do for the 3-finger salute
+rebo::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+sklo:6:wait:/usr/bin/killall klogd
+ssys:6:wait:/usr/bin/killall syslogd
+umou:6:wait:/bin/umount -a -r
+swap:6:wait:/sbin/swapoff -a
diff --git a/package/mingetty/mingetty.mk b/package/mingetty/mingetty.mk
new file mode 100644
index 0000000..d2ec924
--- /dev/null
+++ b/package/mingetty/mingetty.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# mingetty
+#
+#############################################################
+MINGETTY_VERSION = 1.08
+MINGETTY_SOURCE  = mingetty-$(MINGETTY_VERSION).tar.gz
+MINGETTY_SITE    = http://downloads.sourceforge.net/project/mingetty/mingetty/$(MINGETTY_VERSION)
+
+# Override sysvinit's implementations if it is enabled.
+ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+MINGETTY_DEPENDENCIES = sysvinit
+endif
+
+define MINGETTY_BUILD_CMDS
+	$(MAKE) CC=$(TARGET_CC) -C $(@D)
+endef
+
+define MINGETTY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/mingetty $(TARGET_DIR)/sbin
+	$(INSTALL) -D -m 0644 package/mingetty/inittab $(TARGET_DIR)/etc/inittab
+endef
+
+define MINGETTY_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS))
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 4185202..5ce1447 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -23,6 +23,11 @@ target-generic-getty-sysvinit:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
 		$(TARGET_DIR)/etc/inittab
 
+# Set the getty to mingetty
+target-generic-getty-mingetty:
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/mingetty --noclear $(TARGET_GENERIC_GETTY) #~' \
+		$(TARGET_DIR)/etc/inittab
+
 # Find commented line, if any, and remove leading '#'s
 target-generic-do-remount-rw:
 	$(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
@@ -40,7 +45,9 @@ TARGETS += target-generic-issue
 endif
 
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+ifeq ($(BR2_PACKAGE_MINGETTY),y)
+TARGETS += target-generic-getty-mingetty
+else ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 TARGETS += target-generic-getty-sysvinit
 else
 TARGETS += target-generic-getty-busybox
-- 
1.7.6.233.gd79bc
