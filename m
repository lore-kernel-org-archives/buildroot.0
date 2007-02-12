From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 12 Feb 2007 03:36:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/usbmount
Message-ID: <20070212113628.7F4D9485AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-12 03:36:27 -0800 (Mon, 12 Feb 2007)
New Revision: 17862

Log:
- update patch for 0.0.14.1. Thanks to Alexander Rigbo.


Added:
   trunk/buildroot/package/usbmount/usbmount-0.0.14.1.patch

Removed:
   trunk/buildroot/package/usbmount/usbmount.patch

Modified:
   trunk/buildroot/package/usbmount/usbmount.mk


Changeset:
Added: trunk/buildroot/package/usbmount/usbmount-0.0.14.1.patch
===================================================================
--- trunk/buildroot/package/usbmount/usbmount-0.0.14.1.patch	                        (rev 0)
+++ trunk/buildroot/package/usbmount/usbmount-0.0.14.1.patch	2007-02-12 11:36:27 UTC (rev 17862)
@@ -0,0 +1,64 @@
+diff -ru usbmount-0.0.14.1/usbmount usbmount-patched/usbmount
+--- usbmount-0.0.14.1/usbmount	2007-01-27 12:22:14.000000000 +0100
++++ usbmount-patched/usbmount	2007-02-07 12:47:16.000000000 +0100
+@@ -11,7 +11,14 @@
+ # but WITHOUT ANY WARRANTY, to the extent permitted by law; without
+ # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+ # PARTICULAR PURPOSE.
++
++#
++# Changed to support config of logfile and vol_id and creating locks
++# without the use of lockfile-create all for embedded use.
++# Joshua D Henderson <jdhende1@rockwellcollins.com>
++# Patch touched by Alexander Rigbo <alexander.rigbo@acgnystrom.se>
+ #
++
+ set -e
+ exec > /dev/null 2>&1
+ 
+@@ -20,7 +27,7 @@
+ log()
+ {
+     if test $1 != debug || expr "$VERBOSE" : "[yY]" > /dev/null; then
+-	logger -p user.$1 -t "usbmount[$$]" -- "$2"
++	echo "usbmount[$$] -- $2" >> $LOGFILE
+     fi
+ }
+ 
+@@ -57,11 +64,11 @@
+ if test "$1" = add; then
+ 
+     # Acquire lock.
+-    log debug "trying to acquire lock /var/run/usbmount/.mount.lock"
+-    lockfile-create --retry 3 /var/run/usbmount/.mount || \
+-	{ log err "cannot acquire lock /var/run/usbmount/.mount.lock"; exit 1; }
+-    trap '( lockfile-remove /var/run/usbmount/.mount )' 0
+-    log debug "acquired lock /var/run/usbmount/.mount.lock"
++#    log debug "trying to acquire lock /var/run/usbmount/.mount.lock"
++#    lockfile-create --retry 3 /var/run/usbmount/.mount || \
++#	{ log err "cannot acquire lock /var/run/usbmount/.mount.lock"; exit 1; }
++#    trap '( lockfile-remove /var/run/usbmount/.mount )' 0
++#    log debug "acquired lock /var/run/usbmount/.mount.lock"
+ 
+     # Try to read from the device.  Some devices need a few seconds
+     # initialization time before they can be accessed.  Give up after
+diff -ru usbmount-0.0.14.1/usbmount.conf usbmount-patched/usbmount.conf
+--- usbmount-0.0.14.1/usbmount.conf	2005-04-08 16:05:10.000000000 +0200
++++ usbmount-patched/usbmount.conf	2007-02-07 12:44:39.000000000 +0100
+@@ -17,7 +17,7 @@
+ # sure all data is written to the medium before you remove it (e.g. run the #
+ # "sync" command in a terminal window).  Otherwise, you *WILL* lose data!   #
+ #############################################################################
+-FILESYSTEMS="ext2 ext3"
++FILESYSTEMS="ext2 ext3 msdos vfat"
+ 
+ # Mount options: Options passed to the mount command with the -o flag.
+ # WARNING!  Removing "sync" from the options is a very bad idea and
+@@ -35,3 +35,7 @@
+ # If set to "yes", more information will be logged via the syslog
+ # facility.
+ VERBOSE="no"
++
++# Location of the log file when verbose is Yes
++LOGFILE="/var/log/usbmount.log"
++

Modified: trunk/buildroot/package/usbmount/usbmount.mk
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.mk	2007-02-12 10:41:59 UTC (rev 17861)
+++ trunk/buildroot/package/usbmount/usbmount.mk	2007-02-12 11:36:27 UTC (rev 17862)
@@ -18,7 +18,7 @@
 
 $(USBMOUNT_DIR)/.unpacked: $(DL_DIR)/$(USBMOUNT_SOURCE)
 	$(USBMOUNT_CAT) $(DL_DIR)/$(USBMOUNT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount \*.patch
+	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount usbmount-$(USBMOUNT_VERSION).patch
 	touch $@
 
 $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY): $(USBMOUNT_DIR)/.unpacked

Deleted: trunk/buildroot/package/usbmount/usbmount.patch
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.patch	2007-02-12 10:41:59 UTC (rev 17861)
+++ trunk/buildroot/package/usbmount/usbmount.patch	2007-02-12 11:36:27 UTC (rev 17862)
@@ -1,87 +0,0 @@
-diff -ur usbmount-0.0.14/usbmount usbmount-0.0.14-patched/usbmount
---- usbmount-0.0.14/usbmount	2005-07-08 11:51:02.000000000 -0500
-+++ usbmount-0.0.14-patched/usbmount	2006-11-28 09:13:42.000000000 -0600
-@@ -11,16 +11,20 @@
- # but WITHOUT ANY WARRANTY, to the extent permitted by law; without
- # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
- # PARTICULAR PURPOSE.
-+
-+#
-+# Changed to support config of logfile and vol_id and creating locks
-+# without the use of lockfile-create all for embedded use.
-+# Joshua D Henderson <jdhende1@rockwellcollins.com>
- #
- set -e
- exec > /dev/null 2>&1
- 
--
- # Log a string via the syslog facility.
- log()
- {
-     if test $1 != debug || expr "$VERBOSE" : "[yY]" > /dev/null; then
--	logger -p user.$1 -t "usbmount[$$]" -- "$2"
-+	echo "usbmount[$$] -- $2" >> $LOGFILE
-     fi
- }
- 
-@@ -37,7 +41,7 @@
- 
- 
- # Test if /sbin/vol_id is executable.
--test -x /sbin/vol_id || { log err "cannnot execute /sbin/vol_id"; exit 1; }
-+test -x $VOLID || { log err "cannnot execute $VOLID"; exit 1; }
- 
- # Default values for configuration variables.
- MOUNTPOINTS=""
-@@ -57,11 +61,11 @@
- if test "$1" = add; then
- 
-     # Acquire lock.
--    log debug "trying to acquire lock /var/run/usbmount/.mount.lock"
--    lockfile-create --retry 3 /var/run/usbmount/.mount || \
--	{ log err "cannot acquire lock /var/run/usbmount/.mount.lock"; exit 1; }
--    trap '( lockfile-remove /var/run/usbmount/.mount )' 0
--    log debug "acquired lock /var/run/usbmount/.mount.lock"
-+#    log debug "trying to acquire lock /var/lock/usbmount/.mount.lock"
-+#    lockfile-create --retry 3 /var/lock/usbmount/.mount || \
-+#	{ log err "cannot acquire lock /var/lock/usbmount/.mount.lock"; exit 1; }
-+#    trap '( lockfile-remove /var/lock/usbmount/.mount )' 0
-+#    log debug "acquired lock /var/lock/usbmount/.mount.lock"
- 
-     # Try to read from the device.  Some devices need a few seconds
-     # initialization time before they can be accessed.  Give up after
-@@ -85,10 +89,10 @@
-     # Test if the device contains a filesystem.  If it doesn't, no
-     # further action is required, but calling vol_id has the side effect
-     # that the partition table is read and partition devices are created.
--    if /sbin/vol_id "$DEVNAME" | egrep -q '^ID_FS_USAGE=(filesystem|disklabel)$'; then
-+    if $VOLID "$DEVNAME" | egrep -q '^ID_FS_USAGE=(filesystem|disklabel)$'; then
- 	log debug "$DEVNAME contains a filesystem or disklabel"
- 
--	fstype="`/sbin/vol_id -t \"$DEVNAME\"`"
-+	fstype="`$VOLID -t \"$DEVNAME\"`"
- 	log debug "$DEVNAME contains filesystem type $fstype"
- 
- 	# Test if the filesystem type is in the list of filesystem
-diff -ur usbmount-0.0.14/usbmount.conf usbmount-0.0.14-patched/usbmount.conf
---- usbmount-0.0.14/usbmount.conf	2005-04-08 09:05:10.000000000 -0500
-+++ usbmount-0.0.14-patched/usbmount.conf	2006-11-28 09:14:52.000000000 -0600
-@@ -17,7 +17,7 @@
- # sure all data is written to the medium before you remove it (e.g. run the #
- # "sync" command in a terminal window).  Otherwise, you *WILL* lose data!   #
- #############################################################################
--FILESYSTEMS="ext2 ext3"
-+FILESYSTEMS="ext2 ext3 vfat msdos"
- 
- # Mount options: Options passed to the mount command with the -o flag.
- # WARNING!  Removing "sync" from the options is a very bad idea and
-@@ -35,3 +35,9 @@
- # If set to "yes", more information will be logged via the syslog
- # facility.
- VERBOSE="no"
-+
-+# Location of vol_id
-+VOLID="/lib/udev/vol_id"
-+
-+# Location of the log file when verbose is Yes
-+LOGFILE="/var/log/usbmount.log"
