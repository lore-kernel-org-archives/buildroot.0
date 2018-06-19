From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jun 2018 13:52:12 +0200
Subject: [Buildroot] [git commit] synopsys/axs10x: Update /etc/inittab by
 post-build
Message-ID: <20180619115711.8CE1A88EA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cdfa6c84951b25e805d329cb7bae833d333538f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To not maintain custom copy of inittab file lets adopt approach
used in raspberrypi adding post-build script for synopsys/axs10x
boards.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/synopsys/axs10x/fs-overlay/etc/inittab | 42 ----------------------------
 board/synopsys/axs10x/post-build.sh          | 11 ++++++++
 configs/snps_arc700_axs101_defconfig         |  2 +-
 configs/snps_archs38_axs103_defconfig        |  2 +-
 4 files changed, 13 insertions(+), 44 deletions(-)

diff --git a/board/synopsys/axs10x/fs-overlay/etc/inittab b/board/synopsys/axs10x/fs-overlay/etc/inittab
deleted file mode 100644
index 7412a27366..0000000000
--- a/board/synopsys/axs10x/fs-overlay/etc/inittab
+++ /dev/null
@@ -1,42 +0,0 @@
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
-::sysinit:/bin/mount -t proc proc /proc
-::sysinit:/bin/mount -o remount,rw /
-::sysinit:/bin/mkdir -p /dev/pts /dev/shm
-::sysinit:/bin/mount -a
-::sysinit:/sbin/swapon -a
-null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
-null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
-null::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
-null::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
-::sysinit:/bin/hostname -F /etc/hostname
-# now run any rc scripts
-::sysinit:/etc/init.d/rcS
-
-# /sbin/getty invocation for tty0
-tty0::respawn:/sbin/getty 115200 tty0
-
-# Put a getty on the serial port
-console::respawn:/sbin/getty -L console 0 vt100
-
-# Stuff to do for the 3-finger salute
-::ctrlaltdel:/sbin/reboot
-
-# Stuff to do before rebooting
-::shutdown:/etc/init.d/rcK
-::shutdown:/sbin/swapoff -a
-::shutdown:/bin/umount -a -r
diff --git a/board/synopsys/axs10x/post-build.sh b/board/synopsys/axs10x/post-build.sh
new file mode 100755
index 0000000000..f23c8a99b8
--- /dev/null
+++ b/board/synopsys/axs10x/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Add a console on tty0
+if [ -e ${TARGET_DIR}/etc/inittab ]; then
+    grep -qE '^tty0::' ${TARGET_DIR}/etc/inittab || \
+	sed -i '/GENERIC_SERIAL/a\
+tty0::respawn:/sbin/getty 115200  tty0' ${TARGET_DIR}/etc/inittab
+fi
diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index 2a71ff3896..4f796b438b 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_HOSTNAME="axs101"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 
 # Linux headers same as kernel, a 4.16 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index 1ad79eb406..456d4cba2e 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="axs103"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 
 # Linux headers same as kernel, a 4.16 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
