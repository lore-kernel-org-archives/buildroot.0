From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jul 2015 20:44:57 +0200
Subject: [Buildroot] [PATCH v5 2/3] initscripts: new package
In-Reply-To: <1436726698-17776-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436726698-17776-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1436726698-17776-2-git-send-email-maxime.hadjinlian@gmail.com>
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
v4 -> v5:
    - Move inittab to their specifi packages (sysvinit and busybox)
    - Make BR2_INIT_SYSV and BR2_INIT_BUSYBOX select initscripts
    - Initscripts depends on BR2_INIT_SYSV or BR2_INIT_BUSYBOX so it
      can't be selected by anything else.
v3 -> v4:
    - Fix bug with busybox
v2 -> v3:
    - Fix rebase issues
v1 -> v2:
    - Redo the patch using git format-patch -M
---
 package/Config.in                     |  1 +
 package/busybox/busybox.mk            |  7 +++++
 package/busybox/inittab               | 35 ++++++++++++++++++++++++
 package/initscripts/Config.in         |  5 ++++
 package/initscripts/init.d/S20urandom | 51 +++++++++++++++++++++++++++++++++++
 package/initscripts/init.d/S40network | 28 +++++++++++++++++++
 package/initscripts/init.d/rcK        | 27 +++++++++++++++++++
 package/initscripts/init.d/rcS        | 27 +++++++++++++++++++
 package/initscripts/initscripts.mk    | 15 +++++++++++
 package/sysvinit/sysvinit.mk          |  6 ++---
 system/Config.in                      |  2 ++
 system/skeleton/etc/init.d/S20urandom | 51 -----------------------------------
 system/skeleton/etc/init.d/S40network | 28 -------------------
 system/skeleton/etc/init.d/rcK        | 27 -------------------
 system/skeleton/etc/init.d/rcS        | 27 -------------------
 system/skeleton/etc/inittab           | 35 ------------------------
 16 files changed, 200 insertions(+), 172 deletions(-)
 create mode 100644 package/busybox/inittab
 create mode 100644 package/initscripts/Config.in
 create mode 100755 package/initscripts/init.d/S20urandom
 create mode 100755 package/initscripts/init.d/S40network
 create mode 100755 package/initscripts/init.d/rcK
 create mode 100755 package/initscripts/init.d/rcS
 create mode 100644 package/initscripts/initscripts.mk
 delete mode 100755 system/skeleton/etc/init.d/S20urandom
 delete mode 100755 system/skeleton/etc/init.d/S40network
 delete mode 100755 system/skeleton/etc/init.d/rcK
 delete mode 100755 system/skeleton/etc/init.d/rcS
 delete mode 100644 system/skeleton/etc/inittab

diff --git a/package/Config.in b/package/Config.in
index e1b81a9..2b09f47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1408,6 +1408,7 @@ endif
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
+	source "package/initscripts/Config.in"
 	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/irqbalance/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5602fb1..d722e02 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -150,6 +150,12 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 endef
 endif
 
+ifeq ($(BR2_INIT_BUSYBOX),y)
+define BUSYBOX_INSTALL_INITTAB
+	$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
 define BUSYBOX_SET_WATCHDOG
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
@@ -204,6 +210,7 @@ endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
+	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
diff --git a/package/busybox/inittab b/package/busybox/inittab
new file mode 100644
index 0000000..b1892c1
--- /dev/null
+++ b/package/busybox/inittab
@@ -0,0 +1,35 @@
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
+null::sysinit:/bin/mount -o remount,rw /
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
+::shutdown:/etc/init.d/rcK
+::shutdown:/sbin/swapoff -a
+::shutdown:/bin/umount -a -r
diff --git a/package/initscripts/Config.in b/package/initscripts/Config.in
new file mode 100644
index 0000000..0c5176a
--- /dev/null
+++ b/package/initscripts/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_INITSCRIPTS
+	bool "initscripts"
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
+	help
+	  The basics startup scripts for both SysV and Busybox
diff --git a/package/initscripts/init.d/S20urandom b/package/initscripts/init.d/S20urandom
new file mode 100755
index 0000000..36277ba
--- /dev/null
+++ b/package/initscripts/init.d/S20urandom
@@ -0,0 +1,51 @@
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
+		# check for read only file system
+		if ! touch /etc/random-seed 2>/dev/null
+		then
+			echo "read-only file system detected...done"
+			exit
+		fi
+		if [ "$VERBOSE" != no ]
+		then
+			echo -n "Initializing random number generator... "
+		fi
+		# Load and then save 512 bytes,
+		# which is the size of the entropy pool
+		cat /etc/random-seed >/dev/urandom
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
index 0000000..bfdd491
--- /dev/null
+++ b/package/initscripts/init.d/S40network
@@ -0,0 +1,28 @@
+#!/bin/sh
+#
+# Start the network....
+#
+
+# Debian ifupdown needs the /run/network lock directory
+mkdir -p /run/network
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
index 0000000..a5d8db7
--- /dev/null
+++ b/package/initscripts/initscripts.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# initscripts
+#
+################################################################################
+
+# source included in buildroot
+INITSCRIPTS_SOURCE =
+
+define INITSCRIPTS_INSTALL_TARGET_CMDS
+	mkdir -p  $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
+endef
+
+$(eval $(generic-package))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 53640a4..56414e1 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -11,9 +11,9 @@ SYSVINIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
-# Override BusyBox implementations if BusyBox is enabled.
+# Override Busybox implementations if Busybox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSVINIT_DEPENDENCIES = busybox
+SYSVINIT_DEPENDENCIES += busybox
 endif
 
 define SYSVINIT_DEBIAN_PATCHES
@@ -34,8 +34,6 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	for x in halt init shutdown killall5; do \
 		$(INSTALL) -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
-	# Override BusyBox's inittab with an inittab compatible with
-	# sysvinit
 	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
diff --git a/system/Config.in b/system/Config.in
index b72aa17..fad829d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -70,10 +70,12 @@ choice
 config BR2_INIT_BUSYBOX
 	bool "BusyBox"
 	select BR2_PACKAGE_BUSYBOX
+	select BR2_PACKAGE_INITSCRIPTS
 
 config BR2_INIT_SYSV
 	bool "systemV"
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
+	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
 
 config BR2_INIT_SYSTEMD
diff --git a/system/skeleton/etc/init.d/S20urandom b/system/skeleton/etc/init.d/S20urandom
deleted file mode 100755
index 36277ba..0000000
--- a/system/skeleton/etc/init.d/S20urandom
+++ /dev/null
@@ -1,51 +0,0 @@
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
-		# check for read only file system
-		if ! touch /etc/random-seed 2>/dev/null
-		then
-			echo "read-only file system detected...done"
-			exit
-		fi
-		if [ "$VERBOSE" != no ]
-		then
-			echo -n "Initializing random number generator... "
-		fi
-		# Load and then save 512 bytes,
-		# which is the size of the entropy pool
-		cat /etc/random-seed >/dev/urandom
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
index bfdd491..0000000
--- a/system/skeleton/etc/init.d/S40network
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/sh
-#
-# Start the network....
-#
-
-# Debian ifupdown needs the /run/network lock directory
-mkdir -p /run/network
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
index b1892c1..0000000
--- a/system/skeleton/etc/inittab
+++ /dev/null
@@ -1,35 +0,0 @@
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
-null::sysinit:/bin/mount -o remount,rw /
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
-::shutdown:/etc/init.d/rcK
-::shutdown:/sbin/swapoff -a
-::shutdown:/bin/umount -a -r
-- 
2.1.4
