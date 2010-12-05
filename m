From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:20 +0100
Subject: [Buildroot] [PATCH 49/55] Improve handling of mdev/udev
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f92465f9de8bcd24cf2c974b158a600a84e96422.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor Yefremov introduced udev/mdev integration, but it relies on
devtmpfs and does not use tmpfs on /dev, which is the purpose of
mdev/udev. This commit improves how mdev and udev are handled in
Buildroot.

At compile time, only a minimal /dev is created in the filesystem,
with only "console" and "null". This is done thanks to a small device
table in target/generic/device_table_mdev_udev.txt. This is done
directly at the configuration level (fs/Config.in).

Moreover, at compile time, the mounting of a tmpfs filesystem in /dev
is enabled/disabled in /etc/inittab depending on whether udev/mdev are
used or not. This is done in target/generic/Makefile.in, together with
other hooks to tune the target filesystem (hostname, serial port,
etc.).

At run time, what happens is :

 * inittab sysinit actions are executed. They do: remount the root
   filesystem read/write, mount the proc filesystem, mount a tmpfs
   filesystem in /dev, create the /dev/pts directory and then mount
   all filesystems listed in fstab.

 * initialization scripts are started, with S10mdev or S10udev being
   at the very beginning of the list of scripts to be executed.

Between the moment at which a tmpfs filesystem is mounted in /dev and
the moment S10mdev or S10udev are executed, the /dev directory is
empty of devices. This is why the "null" device is no longer used to
redirect messages from sysinit actions.

The kernel compilation code is improved to only enable devtmpfs in the
configuration when the devtmpfs method is used. udev/mdev do not
require devtmpfs, only tmpfs.

Finally, the S10udev startup script is simplified, as it handled
unnecessary things: mount sysfs, mount a tmpfs filesystem in /dev/,
etc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/Config.in                              |   10 +++++++-
 fs/skeleton/etc/inittab                   |    7 +++--
 linux/linux.mk                            |    2 +-
 package/udev/S10udev                      |   34 -----------------------------
 target/generic/Makefile.in                |    9 +++++++
 target/generic/device_table_mdev_udev.txt |   17 ++++++++++++++
 6 files changed, 40 insertions(+), 39 deletions(-)
 create mode 100644 target/generic/device_table_mdev_udev.txt

diff --git a/fs/Config.in b/fs/Config.in
index 9ac3acc..2963d36 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -35,7 +35,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 
 endchoice
 
-config BR2_ROOTFS_DEVICE_TABLE
+config BR2_ROOTFS_CUSTOM_DEVICE_TABLE
 	string "Path to the device table"
 	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
 	default "target/generic/device_table.txt"
@@ -44,6 +44,14 @@ config BR2_ROOTFS_DEVICE_TABLE
 	  to the makedevs utility to create all the special device
 	  files in the target filesystem.
 
+config BR2_ROOTFS_DEVICE_TABLE
+	string
+	default $(BR2_ROOTFS_CUSTOM_DEVICE_TABLE) \
+		if BR2_ROOTFS_DEVICE_CREATION_STATIC
+	default "target/generic/device_table_mdev_udev.txt" \
+		if (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV || \
+		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
+
 choice
 	prompt "Root FS skeleton"
 
diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index 4be14b8..6ed38d3 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -16,9 +16,10 @@
 # Startup the system
 null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mkdir -p /dev/pts
-null::sysinit:/bin/mount -a
-null::sysinit:/bin/hostname -F /etc/hostname
+#::sysinit:/bin/mount -t tmpfs dev /dev # DEVTMPFS
+::sysinit:/bin/mkdir -p /dev/pts
+::sysinit:/bin/mount -a
+::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
diff --git a/linux/linux.mk b/linux/linux.mk
index ede9983..ca4b21c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -112,7 +112,7 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
 endif
-ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS),y)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
 endif
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
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 1ef2a9d..c952c54 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -15,6 +15,13 @@ target-generic-getty:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
 		$(TARGET_DIR)/etc/inittab
 
+target-generic-dev-tmpfs:
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV)$(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+	$(SED) 's/#\(.*\)\(# DEVTMPFS\)$$/\1\2/' $(TARGET_DIR)/etc/inittab
+else
+	$(SED) 's/#\(.*\)\(# DEVTMPFS\)$$/#\1\2/' $(TARGET_DIR)/etc/inittab
+endif
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
@@ -26,3 +33,5 @@ endif
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
 TARGETS += target-generic-getty
 endif
+
+TARGETS += target-generic-dev-tmpfs
diff --git a/target/generic/device_table_mdev_udev.txt b/target/generic/device_table_mdev_udev.txt
new file mode 100644
index 0000000..47493b3
--- /dev/null
+++ b/target/generic/device_table_mdev_udev.txt
@@ -0,0 +1,17 @@
+# Minimal device table for mdev/udev based systems
+
+# Device table entries take the form of:
+# <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
+# where name is the file name,  type can be one of:
+#       f       A regular file
+#       d       Directory
+#       c       Character special device file
+#       b       Block special device file
+#       p       Fifo (named pipe)
+# uid is the user id for the target file, gid is the group id for the
+# target file.  The rest of the entries (major, minor, etc) apply only
+# to device special files.
+
+/dev		d	755	0	0	-	-	-	-	-
+/dev/console	c	666	0	0	5	1	-	-	-
+/dev/null	c	666	0	0	1	3	0	0	-
-- 
1.7.0.4
