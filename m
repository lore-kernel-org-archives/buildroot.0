From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Jul 2014 22:32:24 -0400
Subject: [Buildroot] [PATCH 1/1] udev: remove left-over S10udev script from
	udev virtual package
Message-ID: <1406773944-2022-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The S10udev script is not installed or referenced, and eudev has its own
S10udev.  So we can simply remove it.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/udev/S10udev |   48 ------------------------------------------------
 1 file changed, 48 deletions(-)
 delete mode 100755 package/udev/S10udev

diff --git a/package/udev/S10udev b/package/udev/S10udev
deleted file mode 100755
index cf825b4..0000000
--- a/package/udev/S10udev
+++ /dev/null
@@ -1,48 +0,0 @@
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
-UDEV_BIN=/lib/udev/udevd
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
-        udevadm trigger
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
-- 
1.7.9.5
