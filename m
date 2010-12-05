From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:21 +0100
Subject: [Buildroot] [PATCH 50/55] xtensa: remove unused and useless
	skeleton patch
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <668fe87ee8e6c80825b87382fb17dc9cacc43c0e.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/device/xtensa/skeleton-patch/etc/inittab |   45 -----------------------
 1 files changed, 0 insertions(+), 45 deletions(-)
 delete mode 100644 target/device/xtensa/skeleton-patch/etc/inittab

diff --git a/target/device/xtensa/skeleton-patch/etc/inittab b/target/device/xtensa/skeleton-patch/etc/inittab
deleted file mode 100644
index de3ce70..0000000
--- a/target/device/xtensa/skeleton-patch/etc/inittab
+++ /dev/null
@@ -1,45 +0,0 @@
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
-null::sysinit:/bin/mount -a
-null::sysinit:/bin/hostname -F /etc/hostname
-# now run any rc scripts
-::sysinit:/etc/init.d/rcS
-
-# Set up a couple of getty's
-#tty1::respawn:/sbin/getty 38400 tty1
-#tty2::respawn:/sbin/getty 38400 tty2
-
-# Put a getty on the serial port
-ttyS0::respawn:/sbin/getty -L ttyS0 38400 vt100
-
-# Logging junk
-null::sysinit:/bin/touch /var/log/messages
-null::respawn:/sbin/syslogd -n -m 0
-null::respawn:/sbin/klogd -n
-#tty3::respawn:/usr/bin/tail -f /var/log/messages
-
-# Stuff to do for the 3-finger salute
-::ctrlaltdel:/sbin/reboot
-
-# Stuff to do before rebooting
-null::shutdown:/usr/bin/killall klogd
-null::shutdown:/usr/bin/killall syslogd
-null::shutdown:/bin/umount -a -r
-null::shutdown:/sbin/swapoff -a
-
-- 
1.7.0.4
