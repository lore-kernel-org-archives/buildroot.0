From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 19:31:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  usbmount
Message-ID: <20070114033144.31E76485B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 19:31:43 -0800 (Sat, 13 Jan 2007)
New Revision: 17282

Log:
Add new package.


Added:
   trunk/buildroot/package/usbmount/
   trunk/buildroot/package/usbmount/Config.in
   trunk/buildroot/package/usbmount/usbmount.mk
   trunk/buildroot/package/usbmount/usbmount.patch


Changeset:
Added: trunk/buildroot/package/usbmount/Config.in
===================================================================
--- trunk/buildroot/package/usbmount/Config.in	                        (rev 0)
+++ trunk/buildroot/package/usbmount/Config.in	2007-01-14 03:31:43 UTC (rev 17282)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_USBMOUNT
+	bool "usbmount"
+	default n
+	help
+	  The usbmount package automatically mounts USB mass storage devices
+	  when they are plugged in, and unmounts them when they are removed.

Added: trunk/buildroot/package/usbmount/usbmount.mk
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.mk	                        (rev 0)
+++ trunk/buildroot/package/usbmount/usbmount.mk	2007-01-14 03:31:43 UTC (rev 17282)
@@ -0,0 +1,43 @@
+#############################################################
+#
+# usbmount
+#
+#############################################################
+USBMOUNT_SOURCE:=usbmount_0.0.14.tar.gz
+USBMOUNT_SITE:=http://usbmount.alioth.debian.org/package/
+USBMOUNT_CAT:=$(ZCAT)
+USBMOUNT_DIR:=$(BUILD_DIR)/usbmount-0.0.14
+USBMOUNT_BINARY:=usbmount
+USBMOUNT_TARGET_BINARY:=sbin/usbmount
+
+$(DL_DIR)/$(USBMOUNT_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(USBMOUNT_SITE)/$(USBMOUNT_SOURCE)
+
+$(USBMOUNT_DIR)/.unpacked: $(DL_DIR)/$(USBMOUNT_SOURCE)
+	$(USBMOUNT_CAT) $(DL_DIR)/$(USBMOUNT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount \*.patch
+	touch $(USBMOUNT_DIR)/.unpacked
+
+$(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY): $(USBMOUNT_DIR)/.unpacked
+	$(INSTALL) -m 0755 -D $(USBMOUNT_DIR)/usbmount $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
+	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ] ; then \
+                $(INSTALL) -m 0644 -D $(USBMOUNT_DIR)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
+        fi;
+
+usbmount: uclibc $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
+
+usbmount-clean:
+	rm -f $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
+	rm -rf $(TARGET_DIR)/etc/usbmount
+
+usbmount-dirclean:
+	rm -rf $(USBMOUNT_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_USBMOUNT)),y)
+TARGETS+=usbmount
+endif

Added: trunk/buildroot/package/usbmount/usbmount.patch
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.patch	                        (rev 0)
+++ trunk/buildroot/package/usbmount/usbmount.patch	2007-01-14 03:31:43 UTC (rev 17282)
@@ -0,0 +1,87 @@
+diff -ur usbmount-0.0.14/usbmount usbmount-0.0.14-patched/usbmount
+--- usbmount-0.0.14/usbmount	2005-07-08 11:51:02.000000000 -0500
++++ usbmount-0.0.14-patched/usbmount	2006-11-28 09:13:42.000000000 -0600
+@@ -11,16 +11,20 @@
+ # but WITHOUT ANY WARRANTY, to the extent permitted by law; without
+ # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+ # PARTICULAR PURPOSE.
++
++#
++# Changed to support config of logfile and vol_id and creating locks
++# without the use of lockfile-create all for embedded use.
++# Joshua D Henderson <jdhende1@rockwellcollins.com>
+ #
+ set -e
+ exec > /dev/null 2>&1
+ 
+-
+ # Log a string via the syslog facility.
+ log()
+ {
+     if test $1 != debug || expr "$VERBOSE" : "[yY]" > /dev/null; then
+-	logger -p user.$1 -t "usbmount[$$]" -- "$2"
++	echo "usbmount[$$] -- $2" >> $LOGFILE
+     fi
+ }
+ 
+@@ -37,7 +41,7 @@
+ 
+ 
+ # Test if /sbin/vol_id is executable.
+-test -x /sbin/vol_id || { log err "cannnot execute /sbin/vol_id"; exit 1; }
++test -x $VOLID || { log err "cannnot execute $VOLID"; exit 1; }
+ 
+ # Default values for configuration variables.
+ MOUNTPOINTS=""
+@@ -57,11 +61,11 @@
+ if test "$1" = add; then
+ 
+     # Acquire lock.
+-    log debug "trying to acquire lock /var/run/usbmount/.mount.lock"
+-    lockfile-create --retry 3 /var/run/usbmount/.mount || \
+-	{ log err "cannot acquire lock /var/run/usbmount/.mount.lock"; exit 1; }
+-    trap '( lockfile-remove /var/run/usbmount/.mount )' 0
+-    log debug "acquired lock /var/run/usbmount/.mount.lock"
++#    log debug "trying to acquire lock /var/lock/usbmount/.mount.lock"
++#    lockfile-create --retry 3 /var/lock/usbmount/.mount || \
++#	{ log err "cannot acquire lock /var/lock/usbmount/.mount.lock"; exit 1; }
++#    trap '( lockfile-remove /var/lock/usbmount/.mount )' 0
++#    log debug "acquired lock /var/lock/usbmount/.mount.lock"
+ 
+     # Try to read from the device.  Some devices need a few seconds
+     # initialization time before they can be accessed.  Give up after
+@@ -85,10 +89,10 @@
+     # Test if the device contains a filesystem.  If it doesn't, no
+     # further action is required, but calling vol_id has the side effect
+     # that the partition table is read and partition devices are created.
+-    if /sbin/vol_id "$DEVNAME" | egrep -q '^ID_FS_USAGE=(filesystem|disklabel)$'; then
++    if $VOLID "$DEVNAME" | egrep -q '^ID_FS_USAGE=(filesystem|disklabel)$'; then
+ 	log debug "$DEVNAME contains a filesystem or disklabel"
+ 
+-	fstype="`/sbin/vol_id -t \"$DEVNAME\"`"
++	fstype="`$VOLID -t \"$DEVNAME\"`"
+ 	log debug "$DEVNAME contains filesystem type $fstype"
+ 
+ 	# Test if the filesystem type is in the list of filesystem
+diff -ur usbmount-0.0.14/usbmount.conf usbmount-0.0.14-patched/usbmount.conf
+--- usbmount-0.0.14/usbmount.conf	2005-04-08 09:05:10.000000000 -0500
++++ usbmount-0.0.14-patched/usbmount.conf	2006-11-28 09:14:52.000000000 -0600
+@@ -17,7 +17,7 @@
+ # sure all data is written to the medium before you remove it (e.g. run the #
+ # "sync" command in a terminal window).  Otherwise, you *WILL* lose data!   #
+ #############################################################################
+-FILESYSTEMS="ext2 ext3"
++FILESYSTEMS="ext2 ext3 vfat msdos"
+ 
+ # Mount options: Options passed to the mount command with the -o flag.
+ # WARNING!  Removing "sync" from the options is a very bad idea and
+@@ -35,3 +35,9 @@
+ # If set to "yes", more information will be logged via the syslog
+ # facility.
+ VERBOSE="no"
++
++# Location of vol_id
++VOLID="/lib/udev/vol_id"
++
++# Location of the log file when verbose is Yes
++LOGFILE="/var/log/usbmount.log"
