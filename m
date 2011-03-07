From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 22:21:24 +0100
Subject: [Buildroot] [PATCH 2/3] Simplify udev startup script
In-Reply-To: <cover.1299532878.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299532878.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b2de5cb2b8fcb30ff32211a54fa3d447316520b6.1299532878.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The S10udev startup script did useless things such as mounting sysfs,
mounting a tmpfs filesystem in /dev/, etc. Those things are already
done during in the default inittab.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udev/S10udev |   34 ----------------------------------
 1 files changed, 0 insertions(+), 34 deletions(-)

diff --git a/package/udev/S10udev b/package/udev/S10udev
index 6418f63..0d2a23a 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -16,12 +16,6 @@
 #	/dev/zero, /dev/null -- that's needed to boot and run this script.
 #
 
-# old kernels don't use udev
-case $(uname -r) in
-    2.6*|2.7*)	;;
-    *)		exit 0;;
-esac
-
 # Check for missing binaries
 UDEV_BIN=/sbin/udevd
 test -x $UDEV_BIN || exit 5
@@ -33,41 +27,13 @@ UDEV_CONFIG=/etc/udev/udev.conf
 test -r $UDEV_CONFIG || exit 6
 . $UDEV_CONFIG
 
-# Directory where sysfs is mounted
-SYSFS_DIR=/sys
-
 case "$1" in
     start)
-        # mount sysfs if it's not yet mounted
-        if [ ! -d $SYSFS_DIR ]; then
-	    echo "${0}: SYSFS_DIR \"$SYSFS_DIR\" not found"
-	    exit 1
-        fi
-        grep -q "^sysfs $SYSFS_DIR" /proc/mounts ||
-	mount -t sysfs /sys /sys ||
-	exit 1
-
-        # mount $udev_root as ramfs if it's not yet mounted
-        # we know 2.6 kernels always support ramfs
-        if [ ! -d $udev_root ]; then
-	    echo "${0}: udev_root \"$udev_root\" not found"
-	    exit 1
-        fi
-        grep -q "^udev $udev_root" /proc/mounts ||
-	mount -t ramfs udev $udev_root ||
-	exit 1
-
-        mkdir $udev_root/pts $udev_root/shm
         mknod -m 0666 /dev/null c 1 3
-        mknod -m 0666 /dev/zero c 1 5
-        mknod -m 0600 /dev/console c 5 1
-
-        # populate /dev (normally)
         echo -n "Populating $udev_root using udev: "
         echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
 	$UDEVSTART_BIN || (echo "FAIL" && exit 1)
-	mount -t devpts /dev/pts /dev/pts || (echo "FAIL" && exit 1)
         echo "done"
         ;;
     stop)
-- 
1.7.0.4
