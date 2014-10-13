From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Oct 2014 11:03:10 +0200
Subject: [Buildroot] [PATCH] initscripts: new package
Message-ID: <1413190990-24136-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The folder init.d is currently installed by default since it's part of
our skeleton.
This patch creates a package out of it and make busybox/sysvinit depends
on it.

This way, if you chose another init, you don't end up with a useless
init.d folder.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/busybox/busybox.mk            |  6 ++++
 package/initscripts/busybox_inittab   | 36 +++++++++++++++++++++++
 package/initscripts/init.d/S20urandom | 54 +++++++++++++++++++++++++++++++++++
 package/initscripts/init.d/S40network | 25 ++++++++++++++++
 package/initscripts/init.d/rcK        | 27 ++++++++++++++++++
 package/initscripts/init.d/rcS        | 27 ++++++++++++++++++
 package/initscripts/initscripts.mk    | 28 ++++++++++++++++++
 package/initscripts/sysvinit_inittab  | 25 ++++++++++++++++
 package/sysvinit/inittab              | 25 ----------------
 package/sysvinit/sysvinit.mk          | 11 +++++--
 system/skeleton/etc/init.d/S20urandom | 54 -----------------------------------
 system/skeleton/etc/init.d/S40network | 25 ----------------
 system/skeleton/etc/init.d/rcK        | 27 ------------------
 system/skeleton/etc/init.d/rcS        | 27 ------------------
 system/skeleton/etc/inittab           | 36 -----------------------
 15 files changed, 237 insertions(+), 196 deletions(-)
 create mode 100644 package/initscripts/busybox_inittab
 create mode 100755 package/initscripts/init.d/S20urandom
 create mode 100755 package/initscripts/init.d/S40network
 create mode 100755 package/initscripts/init.d/rcK
 create mode 100755 package/initscripts/init.d/rcS
 create mode 100644 package/initscripts/initscripts.mk
 create mode 100644 package/initscripts/sysvinit_inittab
 delete mode 100644 package/sysvinit/inittab
 delete mode 100755 system/skeleton/etc/init.d/S20urandom
 delete mode 100755 system/skeleton/etc/init.d/S40network
 delete mode 100755 system/skeleton/etc/init.d/rcK
 delete mode 100755 system/skeleton/etc/init.d/rcS
 delete mode 100644 system/skeleton/etc/inittab

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 73a99fb..2bfd55c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -16,6 +16,10 @@ BUSYBOX_CFLAGS = \
 BUSYBOX_LDFLAGS = \
 	$(TARGET_LDFLAGS)
 
+# initscripts contains/install only inittab and the init.d folder with base
+# scripts.
+BUSYBOX_DEPENDENCIES = initscripts
+
 # Link against libtirpc if available so that we can leverage its RPC
 # support for NFS mounting with BusyBox
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
@@ -220,8 +224,10 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	fi
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
+ifeq ($(BR2_INIT_BUSYBOX),y)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+endif
 endef
 
 $(eval $(kconfig-package))
diff --git a/package/initscripts/busybox_inittab b/package/initscripts/busybox_inittab
new file mode 100644
index 0000000..85881f4
--- /dev/null
+++ b/package/initscripts/busybox_inittab
@@ -0,0 +1,36 @@
+# /etc/inittab
+#
+# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
+#
+# Note: BusyBox init doesn't support runlevels.  The runlevels field is
+# completely ignored by BusyBox init. If you want runlevels, use
+# sysvinit.
+#
+# Format for each entry: <id>:<runlevels>:<action>:<process>
+#
+# id        == tty to run on, or empty for /dev/console
+# runlevels == ignored
+# action    == one of sysinit, respawn, askfirst, wait, and once
+# process   == program to run
+
+# Startup the system
+null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
+null::sysinit:/bin/mkdir -p /dev/pts
+null::sysinit:/bin/mkdir -p /dev/shm
+null::sysinit:/bin/mount -a
+null::sysinit:/bin/hostname -F /etc/hostname
+# now run any rc scripts
+::sysinit:/etc/init.d/rcS
+
+# Put a getty on the serial port
+#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
+
+# Stuff to do for the 3-finger salute
+::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+null::shutdown:/etc/init.d/rcK
+null::shutdown:/bin/umount -a -r
+null::shutdown:/sbin/swapoff -a
+
diff --git a/package/initscripts/init.d/S20urandom b/package/initscripts/init.d/S20urandom
new file mode 100755
index 0000000..f73cea5
--- /dev/null
+++ b/package/initscripts/init.d/S20urandom
@@ -0,0 +1,54 @@
+#! /bin/sh
+#
+# urandom	This script saves the random seed between reboots.
+#		It is called from the boot, halt and reboot scripts.
+#
+# Version:	@(#)urandom  1.33  22-Jun-1998  miquels at cistron.nl
+#
+
+[ -c /dev/urandom ] || exit 0
+#. /etc/default/rcS
+
+case "$1" in
+	start|"")
+		if [ "$VERBOSE" != no ]
+		then
+			echo -n "Initializing random number generator... "
+		fi
+		# Load and then save 512 bytes,
+		# which is the size of the entropy pool
+		if [ -f /etc/random-seed ]
+		then
+			cat /etc/random-seed >/dev/urandom
+		fi
+		# check for read only file system
+		if ! touch /etc/random-seed 2>/dev/null
+		then
+			echo "read-only file system detected...done"
+			exit
+		fi
+		rm -f /etc/random-seed
+		umask 077
+		dd if=/dev/urandom of=/etc/random-seed count=1 \
+			>/dev/null 2>&1 || echo "urandom start: failed."
+		umask 022
+		[ "$VERBOSE" != no ] && echo "done."
+		;;
+	stop)
+		if ! touch /etc/random-seed 2>/dev/null
+                then
+                        exit
+                fi
+		# Carry a random seed from shut-down to start-up;
+		# see documentation in linux/drivers/char/random.c
+		[ "$VERBOSE" != no ] && echo -n "Saving random seed... "
+		umask 077
+		dd if=/dev/urandom of=/etc/random-seed count=1 \
+			>/dev/null 2>&1 || echo "urandom stop: failed."
+		[ "$VERBOSE" != no ] && echo "done."
+		;;
+	*)
+		echo "Usage: urandom {start|stop}" >&2
+		exit 1
+		;;
+esac
diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
new file mode 100755
index 0000000..e69e613
--- /dev/null
+++ b/package/initscripts/init.d/S40network
@@ -0,0 +1,25 @@
+#!/bin/sh
+#
+# Start the network....
+#
+
+case "$1" in
+  start)
+ 	echo "Starting network..."
+	/sbin/ifup -a
+	;;
+  stop)
+	echo -n "Stopping network..."
+	/sbin/ifdown -a
+	;;
+  restart|reload)
+	"$0" stop
+	"$0" start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/package/initscripts/init.d/rcK b/package/initscripts/init.d/rcK
new file mode 100755
index 0000000..59e9c54
--- /dev/null
+++ b/package/initscripts/init.d/rcK
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+
+# Stop all init scripts in /etc/init.d
+# executing them in reversed numerical order.
+#
+for i in $(ls -r /etc/init.d/S??*) ;do
+
+     # Ignore dangling symlinks (if any).
+     [ ! -f "$i" ] && continue
+
+     case "$i" in
+	*.sh)
+	    # Source shell script for speed.
+	    (
+		trap - INT QUIT TSTP
+		set stop
+		. $i
+	    )
+	    ;;
+	*)
+	    # No sh extension, so fork subprocess.
+	    $i stop
+	    ;;
+    esac
+done
+
diff --git a/package/initscripts/init.d/rcS b/package/initscripts/init.d/rcS
new file mode 100755
index 0000000..de41153
--- /dev/null
+++ b/package/initscripts/init.d/rcS
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+
+# Start all init scripts in /etc/init.d
+# executing them in numerical order.
+#
+for i in /etc/init.d/S??* ;do
+
+     # Ignore dangling symlinks (if any).
+     [ ! -f "$i" ] && continue
+
+     case "$i" in
+	*.sh)
+	    # Source shell script for speed.
+	    (
+		trap - INT QUIT TSTP
+		set start
+		. $i
+	    )
+	    ;;
+	*)
+	    # No sh extension, so fork subprocess.
+	    $i start
+	    ;;
+    esac
+done
+
diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
new file mode 100644
index 0000000..13affe8
--- /dev/null
+++ b/package/initscripts/initscripts.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# initscripts
+#
+################################################################################
+
+# source included in buildroot
+INITSCRIPTS_SOURCE =
+
+# Note: We need to override Busybox's inittab with an inittab compatible with
+# sysvinit if we want SYSVINIT as our init.
+ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+define INITSCRIPTS_INSTALL_INITTAB
+	$(INSTALL) -D -m 0644 package/initscripts/sysvinit_inittab $(TARGET_DIR)/etc/inittab
+endef
+else
+define INITSCRIPTS_INSTALL_INITTAB
+	$(INSTALL) -D -m 0644 package/initscripts/busybox_inittab $(TARGET_DIR)/etc/inittab
+endef
+endif
+
+define INITSCRIPTS_INSTALL_TARGET_CMDS
+	mkdir -p  $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
+	$(INITSCRIPTS_INSTALL_INITTAB)
+endef
+
+$(eval $(generic-package))
diff --git a/package/initscripts/sysvinit_inittab b/package/initscripts/sysvinit_inittab
new file mode 100644
index 0000000..d3de4a7
--- /dev/null
+++ b/package/initscripts/sysvinit_inittab
@@ -0,0 +1,25 @@
+# /etc/inittab
+#
+# This inittab is a basic inittab sample for sysvinit, which mimics
+# Buildroot's default inittab for BusyBox.
+id:1:initdefault:
+
+proc::sysinit:/bin/mount -t proc proc /proc
+rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
+dpts::sysinit:/bin/mkdir -p /dev/pts
+dshm::sysinit:/bin/mkdir -p /dev/shm
+moun::sysinit:/bin/mount -a
+host::sysinit:/bin/hostname -F /etc/hostname
+init::sysinit:/etc/init.d/rcS
+
+1:1:respawn:/sbin/getty 38400 tty1
+2:1:respawn:/sbin/getty 38400 tty2
+
+# S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
+
+# Stuff to do for the 3-finger salute
+rebo::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+umou:6:wait:/bin/umount -a -r
+swap:6:wait:/sbin/swapoff -a
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
deleted file mode 100644
index d3de4a7..0000000
--- a/package/sysvinit/inittab
+++ /dev/null
@@ -1,25 +0,0 @@
-# /etc/inittab
-#
-# This inittab is a basic inittab sample for sysvinit, which mimics
-# Buildroot's default inittab for BusyBox.
-id:1:initdefault:
-
-proc::sysinit:/bin/mount -t proc proc /proc
-rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
-dpts::sysinit:/bin/mkdir -p /dev/pts
-dshm::sysinit:/bin/mkdir -p /dev/shm
-moun::sysinit:/bin/mount -a
-host::sysinit:/bin/hostname -F /etc/hostname
-init::sysinit:/etc/init.d/rcS
-
-1:1:respawn:/sbin/getty 38400 tty1
-2:1:respawn:/sbin/getty 38400 tty2
-
-# S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
-
-# Stuff to do for the 3-finger salute
-rebo::ctrlaltdel:/sbin/reboot
-
-# Stuff to do before rebooting
-umou:6:wait:/bin/umount -a -r
-swap:6:wait:/sbin/swapoff -a
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index d588122..d515882 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -11,9 +11,13 @@ SYSVINIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
-# Override BusyBox implementations if BusyBox is enabled.
+# initscripts contains/install only inittab and the init.d folder with base
+# scripts.
+SYSVINIT_DEPENDENCIES = initscripts
+
+# Override Busybox implementations if Busybox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSVINIT_DEPENDENCIES = busybox
+SYSVINIT_DEPENDENCIES += busybox
 endif
 
 define SYSVINIT_DEBIAN_PATCHES
@@ -34,9 +38,12 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	for x in halt init shutdown killall5; do \
 		$(INSTALL) -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
+<<<<<<< HEAD
 	# Override BusyBox's inittab with an inittab compatible with
 	# sysvinit
 	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
+=======
+>>>>>>> initscripts: new package
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
 	ln -sf killall5 $(TARGET_DIR)/sbin/pidof
diff --git a/system/skeleton/etc/init.d/S20urandom b/system/skeleton/etc/init.d/S20urandom
deleted file mode 100755
index f73cea5..0000000
--- a/system/skeleton/etc/init.d/S20urandom
+++ /dev/null
@@ -1,54 +0,0 @@
-#! /bin/sh
-#
-# urandom	This script saves the random seed between reboots.
-#		It is called from the boot, halt and reboot scripts.
-#
-# Version:	@(#)urandom  1.33  22-Jun-1998  miquels at cistron.nl
-#
-
-[ -c /dev/urandom ] || exit 0
-#. /etc/default/rcS
-
-case "$1" in
-	start|"")
-		if [ "$VERBOSE" != no ]
-		then
-			echo -n "Initializing random number generator... "
-		fi
-		# Load and then save 512 bytes,
-		# which is the size of the entropy pool
-		if [ -f /etc/random-seed ]
-		then
-			cat /etc/random-seed >/dev/urandom
-		fi
-		# check for read only file system
-		if ! touch /etc/random-seed 2>/dev/null
-		then
-			echo "read-only file system detected...done"
-			exit
-		fi
-		rm -f /etc/random-seed
-		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom start: failed."
-		umask 022
-		[ "$VERBOSE" != no ] && echo "done."
-		;;
-	stop)
-		if ! touch /etc/random-seed 2>/dev/null
-                then
-                        exit
-                fi
-		# Carry a random seed from shut-down to start-up;
-		# see documentation in linux/drivers/char/random.c
-		[ "$VERBOSE" != no ] && echo -n "Saving random seed... "
-		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom stop: failed."
-		[ "$VERBOSE" != no ] && echo "done."
-		;;
-	*)
-		echo "Usage: urandom {start|stop}" >&2
-		exit 1
-		;;
-esac
diff --git a/system/skeleton/etc/init.d/S40network b/system/skeleton/etc/init.d/S40network
deleted file mode 100755
index e69e613..0000000
--- a/system/skeleton/etc/init.d/S40network
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-#
-# Start the network....
-#
-
-case "$1" in
-  start)
- 	echo "Starting network..."
-	/sbin/ifup -a
-	;;
-  stop)
-	echo -n "Stopping network..."
-	/sbin/ifdown -a
-	;;
-  restart|reload)
-	"$0" stop
-	"$0" start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
-
diff --git a/system/skeleton/etc/init.d/rcK b/system/skeleton/etc/init.d/rcK
deleted file mode 100755
index 59e9c54..0000000
--- a/system/skeleton/etc/init.d/rcK
+++ /dev/null
@@ -1,27 +0,0 @@
-#!/bin/sh
-
-
-# Stop all init scripts in /etc/init.d
-# executing them in reversed numerical order.
-#
-for i in $(ls -r /etc/init.d/S??*) ;do
-
-     # Ignore dangling symlinks (if any).
-     [ ! -f "$i" ] && continue
-
-     case "$i" in
-	*.sh)
-	    # Source shell script for speed.
-	    (
-		trap - INT QUIT TSTP
-		set stop
-		. $i
-	    )
-	    ;;
-	*)
-	    # No sh extension, so fork subprocess.
-	    $i stop
-	    ;;
-    esac
-done
-
diff --git a/system/skeleton/etc/init.d/rcS b/system/skeleton/etc/init.d/rcS
deleted file mode 100755
index de41153..0000000
--- a/system/skeleton/etc/init.d/rcS
+++ /dev/null
@@ -1,27 +0,0 @@
-#!/bin/sh
-
-
-# Start all init scripts in /etc/init.d
-# executing them in numerical order.
-#
-for i in /etc/init.d/S??* ;do
-
-     # Ignore dangling symlinks (if any).
-     [ ! -f "$i" ] && continue
-
-     case "$i" in
-	*.sh)
-	    # Source shell script for speed.
-	    (
-		trap - INT QUIT TSTP
-		set start
-		. $i
-	    )
-	    ;;
-	*)
-	    # No sh extension, so fork subprocess.
-	    $i start
-	    ;;
-    esac
-done
-
diff --git a/system/skeleton/etc/inittab b/system/skeleton/etc/inittab
deleted file mode 100644
index 85881f4..0000000
--- a/system/skeleton/etc/inittab
+++ /dev/null
@@ -1,36 +0,0 @@
-# /etc/inittab
-#
-# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
-#
-# Note: BusyBox init doesn't support runlevels.  The runlevels field is
-# completely ignored by BusyBox init. If you want runlevels, use
-# sysvinit.
-#
-# Format for each entry: <id>:<runlevels>:<action>:<process>
-#
-# id        == tty to run on, or empty for /dev/console
-# runlevels == ignored
-# action    == one of sysinit, respawn, askfirst, wait, and once
-# process   == program to run
-
-# Startup the system
-null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
-null::sysinit:/bin/mkdir -p /dev/pts
-null::sysinit:/bin/mkdir -p /dev/shm
-null::sysinit:/bin/mount -a
-null::sysinit:/bin/hostname -F /etc/hostname
-# now run any rc scripts
-::sysinit:/etc/init.d/rcS
-
-# Put a getty on the serial port
-#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
-
-# Stuff to do for the 3-finger salute
-::ctrlaltdel:/sbin/reboot
-
-# Stuff to do before rebooting
-null::shutdown:/etc/init.d/rcK
-null::shutdown:/bin/umount -a -r
-null::shutdown:/sbin/swapoff -a
-
-- 
2.1.1
