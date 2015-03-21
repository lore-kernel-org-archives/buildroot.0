From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:28:25 +0200
Subject: [Buildroot] [RFC 03/11] init/finalize script
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <f57a76991eaff395a88e093061f66b28bc7aa915.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch moves the code that handles non-package parts of init
configuration out of packages and out of skeleton, gathering it
in a dedicated script.

For sysv init, the script writes /etc/inittab, making filesystems
are mounted, udev is handled somehow, syslog is started and network
is brought up. For systemd, the script handles target symlinks
and aliases.

The idea is that options the configure the system as a whole should
be handled outside of individual packages.

So instead of letting eudev to install itself as the udev handler,
or maybe letting busybox install mdev, it is decided later and
outside of either eudev or busybox.

As a side effect, this patch makes sure sysv-specific files are not
installed at all if systemd is chosen for the init.
---
 package/busybox/busybox.mk            |   8 --
 package/busybox/mdev.conf             |  35 ------
 package/eudev/S10udev                 |  50 --------
 package/eudev/eudev.mk                |   4 -
 support/init/finalize                 | 207 ++++++++++++++++++++++++++++++++++
 support/init/init.d/S10mdev           |  21 ++++
 support/init/init.d/S10udev           |  50 ++++++++
 support/init/init.d/rcK               |  26 +++++
 support/init/init.d/rcS               |  26 +++++
 support/init/mdev.conf                |  35 ++++++
 support/init/sysv.fini                |   7 ++
 support/init/sysv.init                |  14 +++
 system/skeleton/etc/init.d/S20urandom |  54 ---------
 system/skeleton/etc/init.d/S40network |  28 -----
 system/skeleton/etc/init.d/rcK        |  27 -----
 system/skeleton/etc/init.d/rcS        |  27 -----
 system/skeleton/etc/inittab           |  35 ------
 system/system.mk                      |  32 +-----
 18 files changed, 390 insertions(+), 296 deletions(-)
 delete mode 100644 package/busybox/mdev.conf
 delete mode 100755 package/eudev/S10udev
 create mode 100755 support/init/finalize
 create mode 100755 support/init/init.d/S10mdev
 create mode 100755 support/init/init.d/S10udev
 create mode 100755 support/init/init.d/rcK
 create mode 100755 support/init/init.d/rcS
 create mode 100644 support/init/mdev.conf
 create mode 100644 support/init/sysv.fini
 create mode 100644 support/init/sysv.init
 delete mode 100755 system/skeleton/etc/init.d/S20urandom
 delete mode 100755 system/skeleton/etc/init.d/S40network
 delete mode 100755 system/skeleton/etc/init.d/rcK
 delete mode 100755 system/skeleton/etc/init.d/rcS
 delete mode 100644 system/skeleton/etc/inittab

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a3ac7e7..90f7293 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -56,14 +56,6 @@ endef
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
-define BUSYBOX_INSTALL_MDEV_SCRIPT
-	$(INSTALL) -D -m 0755 package/busybox/S10mdev \
-		$(TARGET_DIR)/etc/init.d/S10mdev
-endef
-define BUSYBOX_INSTALL_MDEV_CONF
-	$(INSTALL) -D -m 0644 package/busybox/mdev.conf \
-		$(TARGET_DIR)/etc/mdev.conf
-endef
 define BUSYBOX_SET_MDEV
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_CONF,$(BUSYBOX_BUILD_CONFIG))
diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
deleted file mode 100644
index 247c0ed..0000000
--- a/package/busybox/mdev.conf
+++ /dev/null
@@ -1,35 +0,0 @@
-# null may already exist; therefore ownership has to be changed with command
-null		root:root 666 @chmod 666 $MDEV
-zero		root:root 666
-full		root:root 666
-random		root:root 444
-urandom		root:root 444
-hwrandom	root:root 444
-grsec		root:root 660
-
-kmem		root:root 640
-mem		root:root 640
-port		root:root 640
-# console may already exist; therefore ownership has to be changed with command
-console		root:tty 600 @chmod 600 $MDEV
-ptmx		root:tty 666
-pty.*		root:tty 660
-
-# Typical devices
-tty		root:tty 666
-tty[0-9]*	root:tty 660
-vcsa*[0-9]*	root:tty 660
-ttyS[0-9]*	root:root 660
-
-# alsa sound devices
-pcm.*		root:audio 660 =snd/
-control.*	root:audio 660 =snd/
-midi.*		root:audio 660 =snd/
-seq		root:audio 660 =snd/
-timer		root:audio 660 =snd/
-
-# input stuff
-event[0-9]+	root:root 640 =input/
-mice		root:root 640 =input/
-mouse[0-9]	root:root 640 =input/
-ts[0-9]		root:root 600 =input/
diff --git a/package/eudev/S10udev b/package/eudev/S10udev
deleted file mode 100755
index 8382bec..0000000
--- a/package/eudev/S10udev
+++ /dev/null
@@ -1,50 +0,0 @@
-#!/bin/sh
-#
-# udev	This is a minimal non-LSB version of a UDEV startup script.  It
-#	was derived by stripping down the udev-058 LSB version for use
-#	with buildroot on embedded hardware using Linux 2.6.34+ kernels.
-#
-#	You may need to customize this for your system's resource limits
-#	(including startup time!) and administration.  For example, if
-#	your early userspace has a custom initramfs or initrd you might
-#	need /dev much earlier; or without hotpluggable busses (like USB,
-#	PCMCIA, MMC/SD, and so on) your /dev might be static after boot.
-#
-#	This script assumes your system boots right into the eventual root
-#	filesystem, and that init runs this udev script before any programs
-#	needing more device nodes than the bare-bones set -- /dev/console,
-#	/dev/zero, /dev/null -- that's needed to boot and run this script.
-#
-
-# Check for missing binaries
-UDEV_BIN=/sbin/udevd
-test -x $UDEV_BIN || exit 5
-
-# Check for config file and read it
-UDEV_CONFIG=/etc/udev/udev.conf
-test -r $UDEV_CONFIG || exit 6
-. $UDEV_CONFIG
-
-case "$1" in
-    start)
-        printf "Populating ${udev_root:-/dev} using udev: "
-        printf '\000\000\000\000' > /proc/sys/kernel/hotplug
-        $UDEV_BIN -d || (echo "FAIL" && exit 1)
-        udevadm trigger --type=subsystems --action=add
-        udevadm trigger --type=devices --action=add
-        udevadm settle --timeout=30 || echo "udevadm settle failed"
-        echo "done"
-        ;;
-    stop)
-        # Stop execution of events
-        udevadm control --stop-exec-queue
-        killall udevd
-        ;;
-    *)
-        echo "Usage: $0 {start|stop}"
-        exit 1
-        ;;
-esac
-
-
-exit 0
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index f5159a2..dab519e 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -40,10 +40,6 @@ else
 EUDEV_CONF_OPTS += --disable-gudev
 endif
 
-define EUDEV_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
-endef
-
 # Required by default rules for input devices
 define EUDEV_USERS
 	- - input -1 * - - - Input device group
diff --git a/support/init/finalize b/support/init/finalize
new file mode 100755
index 0000000..fada2be
--- /dev/null
+++ b/support/init/finalize
@@ -0,0 +1,207 @@
+#!/usr/bin/env python
+
+from re import match, sub
+from sys import stderr, argv
+from os import listdir, lstat, symlink, unlink
+from os.path import islink, isdir, dirname
+from os import mkdir, makedirs, fstat, fchmod
+from os import O_RDONLY, O_WRONLY, O_CREAT, O_TRUNC
+from os import open as osopen
+from os import read as osread
+from os import write as oswrite
+
+def die(message, *args):
+    stderr.write((message+"\n") % tuple(args))
+    exit(-1)
+
+class Br2:
+    def __init__(self, dotconfig):
+        with open(dotconfig) as f:
+            for l in f:
+                m = match(r'^BR2_(.*)=(.*)', l)
+                if not m: continue
+                setattr(self, m.group(1), self.cfgval(m.group(2)))
+    def cfgval(self, x):
+        if x == 'y':
+            return True
+        elif x == 'n':
+            return False
+        else:
+            return sub(r'^"(.*)"', r'\1', x)
+
+    def __getattr__(self, k):
+        return self.__dict__[k] if k in self.__dict__ else None
+
+def grepval(filename, key):
+    patt = key + '='
+    plen = len(patt)
+    with open(filename) as f:
+        for l in f:
+            if l.startswith(patt):
+                return l[plen:]
+    return None
+
+def lnsf(target, link):
+    try:
+        if islink(link):
+            unlink(link)
+    except OSError:
+        pass
+
+    symlink(target, link)
+
+def writeto(path):
+    global output
+    output = open(path, 'w')
+
+def pipefile(path):
+    global output
+    with open(path) as f:
+        for l in f:
+            output.write(l)
+
+def copyfile(src, dst):
+    f = osopen(src, O_RDONLY)
+    s = fstat(f)
+    if not isdir(dirname(dst)): makedirs(dirname(dst))
+    o = osopen(dst, O_WRONLY | O_CREAT | O_TRUNC)
+    fchmod(o, s.st_mode)
+    buf = osread(f, s.st_size)
+    oswrite(o, buf)
+
+# write
+def w(fmt, *subst):
+    global output
+    output.write((fmt+"\n") % subst)
+
+# write newline
+def wnl(): w("")
+
+# ------------------------------------------------------------------------------
+
+# Common code for sysv-style systems
+
+def sysv_mount():
+    global BR2
+    w('# Startup the system')
+    w('null::sysinit:/bin/mount -t proc proc /proc')
+    if BR2.TARGET_GENERIC_REMOUNT_ROOTFS_RW:
+        w('null::sysinit:/bin/mount -o remount,rw /')
+    w('null::sysinit:/bin/mkdir -p /dev/pts')
+    w('null::sysinit:/bin/mkdir -p /dev/shm')
+    w('null::sysinit:/bin/mount -a')
+
+def sysv_net():
+    w('null::sysinit:/bin/hostname -F /etc/hostname')
+    w('null::sysinit:/sbin/ifup -a')
+
+def sysv_syslog():
+    global BR2
+    if BR2.PACKAGE_BUSYBOX or BR2.PACKAGE_RSYSLOG:
+        wnl()
+        w("# Start syslog before any daemons")
+        w("null::respawn:/usr/sbin/syslogd -n")
+    if BR2.PACKAGE_BUSYBOX:
+        w("null::respawn:/usr/sbin/klogd -n")
+
+def sysv_getty():
+    global BR2
+    if not BR2.TARGET_GENERIC_GETTY:
+        return
+    port = BR2.TARGET_GENERIC_GETTY_PORT
+    term = BR2.TARGET_GENERIC_GETTY_TERM
+    opts = BR2.TARGET_GENERIC_GETTY_OPTIONS
+    if port:
+        wnl()
+        w("# Start serial console")
+        w("%s::respawn:/sbin/getty -L %s %s %s", port, opts, port, term)
+
+# pri:name:rlvls:act:cmd -> pri
+def sysv_prio(line):
+    return line.split(':')[0]
+
+# pri:name:rlvls:act:cmd -> name:rlvls:act:cmd
+def sysv_line(line):
+    return ":".join(line.split(':')[1:])
+
+# read everything from path/*.line files into a single array
+def readlines(path):
+    lines = [ ]
+    if not isdir(path):
+        return lines
+    for de in listdir(path):
+        if not de.endswith('.line'): continue
+        with open(path + '/' + de) as f:
+            for l in f:
+                if l: lines.append(l)
+    return lines
+
+# ------------------------------------------------------------------------------
+
+# Initscripts need their static inittab written, and rc* files installed.
+# The only decisions to be made here are about system-wide services
+# with no .run files (syslog and such)
+def initscripts():
+    copyfile('support/init/init.d/rcS', 'output/target/etc/init.d/rcS')
+    copyfile('support/init/init.d/rcK', 'output/target/etc/init.d/rcK')
+
+    if BR2.ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV:
+        copyfile('support/init/init.d/S10udev', 'output/target/etc/init.d/S10udev')
+    elif BR2.ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV:
+        copyfile('support/init/init.d/S10mdev', 'output/target/etc/init.d/S10udev')
+
+    # The stuff in sysv.init and sysv.fini should not be static actually.
+    # For now it just the current BR setup, but that's probably not right.
+    # At least swap and network depend heavily on target configuration.
+    writeto('output/target/etc/inittab')
+    pipefile('support/init/sysv.init')
+    wnl()
+
+    sysv_mount()
+    sysv_net()
+    sysv_syslog()
+    sysv_getty()
+    wnl()
+
+    w("# Run rc scripts on startup and shutdown")
+    w("null::sysinit:/etc/init.d/rcS")
+    w("null::shutdown:/etc/init.d/rcK")
+    wnl()
+
+    pipefile('support/init/sysv.fini')
+
+# ------------------------------------------------------------------------------
+
+# Installed service files must be linked to relevant *.wants directories.
+# Other than that, there is nothing to do with systemd configuration.
+def systemd():
+    sd = "output/target/usr/lib/systemd/system"
+    for de in listdir(sd):
+        if not de.endswith(".service"): continue
+        path = sd+'/'+de
+        wantedby = grepval(path, 'WantedBy')
+        aliases = grepval(path, 'Alias')
+        if wantedby:
+            for t in wantedby.split():
+                lnsf("../%s" % de, "%s/%s.wants/%s" % (sd, t, de))
+        if aliases:
+            for a in aliases.split():
+                lnsf(de, "%s.service" % a)
+
+# ------------------------------------------------------------------------------
+
+output = None
+inits = [ 'initscripts', 'systemd' ]
+BR2 = Br2('.config')
+
+if len(argv) > 1 and argv[1] == '-':
+    nopath = True
+    del argv[1]
+
+if len(argv) < 2:
+    die("Usage: finalize-init [-] init-system")
+
+if argv[1] in inits:
+    globals()[argv[1]]()
+else:
+    die("Unknown init system %s", argv[1])
diff --git a/support/init/init.d/S10mdev b/support/init/init.d/S10mdev
new file mode 100755
index 0000000..d386d42
--- /dev/null
+++ b/support/init/init.d/S10mdev
@@ -0,0 +1,21 @@
+#!/bin/sh
+#
+# Start mdev....
+#
+
+case "$1" in
+  start)
+	echo "Starting mdev..."
+	echo /sbin/mdev >/proc/sys/kernel/hotplug
+	/sbin/mdev -s
+	;;
+  stop)
+	;;
+  restart|reload)
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/support/init/init.d/S10udev b/support/init/init.d/S10udev
new file mode 100755
index 0000000..8382bec
--- /dev/null
+++ b/support/init/init.d/S10udev
@@ -0,0 +1,50 @@
+#!/bin/sh
+#
+# udev	This is a minimal non-LSB version of a UDEV startup script.  It
+#	was derived by stripping down the udev-058 LSB version for use
+#	with buildroot on embedded hardware using Linux 2.6.34+ kernels.
+#
+#	You may need to customize this for your system's resource limits
+#	(including startup time!) and administration.  For example, if
+#	your early userspace has a custom initramfs or initrd you might
+#	need /dev much earlier; or without hotpluggable busses (like USB,
+#	PCMCIA, MMC/SD, and so on) your /dev might be static after boot.
+#
+#	This script assumes your system boots right into the eventual root
+#	filesystem, and that init runs this udev script before any programs
+#	needing more device nodes than the bare-bones set -- /dev/console,
+#	/dev/zero, /dev/null -- that's needed to boot and run this script.
+#
+
+# Check for missing binaries
+UDEV_BIN=/sbin/udevd
+test -x $UDEV_BIN || exit 5
+
+# Check for config file and read it
+UDEV_CONFIG=/etc/udev/udev.conf
+test -r $UDEV_CONFIG || exit 6
+. $UDEV_CONFIG
+
+case "$1" in
+    start)
+        printf "Populating ${udev_root:-/dev} using udev: "
+        printf '\000\000\000\000' > /proc/sys/kernel/hotplug
+        $UDEV_BIN -d || (echo "FAIL" && exit 1)
+        udevadm trigger --type=subsystems --action=add
+        udevadm trigger --type=devices --action=add
+        udevadm settle --timeout=30 || echo "udevadm settle failed"
+        echo "done"
+        ;;
+    stop)
+        # Stop execution of events
+        udevadm control --stop-exec-queue
+        killall udevd
+        ;;
+    *)
+        echo "Usage: $0 {start|stop}"
+        exit 1
+        ;;
+esac
+
+
+exit 0
diff --git a/support/init/init.d/rcK b/support/init/init.d/rcK
new file mode 100755
index 0000000..b1fb8f3
--- /dev/null
+++ b/support/init/init.d/rcK
@@ -0,0 +1,26 @@
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
diff --git a/support/init/init.d/rcS b/support/init/init.d/rcS
new file mode 100755
index 0000000..bd11d5a
--- /dev/null
+++ b/support/init/init.d/rcS
@@ -0,0 +1,26 @@
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
diff --git a/support/init/mdev.conf b/support/init/mdev.conf
new file mode 100644
index 0000000..247c0ed
--- /dev/null
+++ b/support/init/mdev.conf
@@ -0,0 +1,35 @@
+# null may already exist; therefore ownership has to be changed with command
+null		root:root 666 @chmod 666 $MDEV
+zero		root:root 666
+full		root:root 666
+random		root:root 444
+urandom		root:root 444
+hwrandom	root:root 444
+grsec		root:root 660
+
+kmem		root:root 640
+mem		root:root 640
+port		root:root 640
+# console may already exist; therefore ownership has to be changed with command
+console		root:tty 600 @chmod 600 $MDEV
+ptmx		root:tty 666
+pty.*		root:tty 660
+
+# Typical devices
+tty		root:tty 666
+tty[0-9]*	root:tty 660
+vcsa*[0-9]*	root:tty 660
+ttyS[0-9]*	root:root 660
+
+# alsa sound devices
+pcm.*		root:audio 660 =snd/
+control.*	root:audio 660 =snd/
+midi.*		root:audio 660 =snd/
+seq		root:audio 660 =snd/
+timer		root:audio 660 =snd/
+
+# input stuff
+event[0-9]+	root:root 640 =input/
+mice		root:root 640 =input/
+mouse[0-9]	root:root 640 =input/
+ts[0-9]		root:root 600 =input/
diff --git a/support/init/sysv.fini b/support/init/sysv.fini
new file mode 100644
index 0000000..e68f97e
--- /dev/null
+++ b/support/init/sysv.fini
@@ -0,0 +1,7 @@
+# Stuff to do for the 3-finger salute
+null::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+null::shutdown:/sbin/ifdown -a
+null::shutdown:/sbin/swapoff -a
+null::shutdown:/bin/umount -a -r
diff --git a/support/init/sysv.init b/support/init/sysv.init
new file mode 100644
index 0000000..b56e3c3
--- /dev/null
+++ b/support/init/sysv.init
@@ -0,0 +1,14 @@
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
diff --git a/system/system.mk b/system/system.mk
index 4a1eb4a..c5ce1d3 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -87,35 +87,11 @@ endef
 endif
 TARGET_FINALIZE_HOOKS += SYSTEM_BIN_SH
 
-ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-ifeq ($(BR2_PACKAGE_SYSVINIT),y)
-# In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
-# skip the "tty" part and keep only the remaining.
-define SYSTEM_GETTY
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-endef
-else
-# Add getty to busybox inittab
-define SYSTEM_GETTY
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
-		$(TARGET_DIR)/etc/inittab
-endef
-endif
-TARGET_FINALIZE_HOOKS += SYSTEM_GETTY
-endif
-
-ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
-# Find commented line, if any, and remove leading '#'s
-define SYSTEM_REMOUNT_RW
-	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
-endef
-else
-# Find uncommented line, if any, and add a leading '#'
-define SYSTEM_REMOUNT_RW
-	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+ifneq ($(BR2_INIT),)
+define FINALIZE_INIT
+	support/init/finalize $(BR2_INIT)
 endef
+TARGET_FINALIZE_HOOKS += FINALIZE_INIT
 endif
-TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.0.3
