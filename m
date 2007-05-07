From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 21:03:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/usbmount
Message-ID: <20070507040343.2A60B4857F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 21:03:42 -0700 (Sun, 06 May 2007)
New Revision: 18579

Log:
Modify the main script to use the lockfile program utilities. Mounting and un-mounting do not work reliably without them.


Modified:
   trunk/buildroot/package/usbmount/Config.in
   trunk/buildroot/package/usbmount/usbmount-0.0.14.1.patch


Changeset:
Modified: trunk/buildroot/package/usbmount/Config.in
===================================================================
--- trunk/buildroot/package/usbmount/Config.in	2007-05-07 04:02:31 UTC (rev 18578)
+++ trunk/buildroot/package/usbmount/Config.in	2007-05-07 04:03:42 UTC (rev 18579)
@@ -2,6 +2,8 @@
 	bool "usbmount"
 	default n
 	select BR2_PACKAGE_UDEV_VOLUME_ID
+	select BR2_PACKAGE_UDEV_SCSI_ID
+	select BR2_PACKAGE_LOCKFILE_PROGS
 	help
 	  The usbmount package automatically mounts USB mass storage devices
 	  when they are plugged in, and unmounts them when they are removed.

Modified: trunk/buildroot/package/usbmount/usbmount-0.0.14.1.patch
===================================================================
--- trunk/buildroot/package/usbmount/usbmount-0.0.14.1.patch	2007-05-07 04:02:31 UTC (rev 18578)
+++ trunk/buildroot/package/usbmount/usbmount-0.0.14.1.patch	2007-05-07 04:03:42 UTC (rev 18579)
@@ -1,22 +1,7 @@
-diff -ru usbmount-0.0.14.1/usbmount usbmount-patched/usbmount
---- usbmount-0.0.14.1/usbmount	2007-01-27 12:22:14.000000000 +0100
-+++ usbmount-patched/usbmount	2007-02-07 12:47:16.000000000 +0100
-@@ -11,7 +11,14 @@
- # but WITHOUT ANY WARRANTY, to the extent permitted by law; without
- # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
- # PARTICULAR PURPOSE.
-+
-+#
-+# Changed to support config of logfile and vol_id and creating locks
-+# without the use of lockfile-create all for embedded use.
-+# Joshua D Henderson <jdhende1@rockwellcollins.com>
-+# Patch touched by Alexander Rigbo <alexander.rigbo@acgnystrom.se>
- #
-+
- set -e
- exec > /dev/null 2>&1
- 
-@@ -20,7 +27,7 @@
+diff -ur usbmount-0.0.14.1/usbmount usbmount-0.0.14.1-patched/usbmount
+--- usbmount-0.0.14.1/usbmount	2007-01-27 05:22:14.000000000 -0600
++++ usbmount-0.0.14.1-patched/usbmount	2007-03-15 07:25:18.000000000 -0500
+@@ -20,7 +20,7 @@
  log()
  {
      if test $1 != debug || expr "$VERBOSE" : "[yY]" > /dev/null; then
@@ -25,7 +10,7 @@
      fi
  }
  
-@@ -57,11 +64,11 @@
+@@ -57,11 +57,11 @@
  if test "$1" = add; then
  
      # Acquire lock.
@@ -34,17 +19,25 @@
 -	{ log err "cannot acquire lock /var/run/usbmount/.mount.lock"; exit 1; }
 -    trap '( lockfile-remove /var/run/usbmount/.mount )' 0
 -    log debug "acquired lock /var/run/usbmount/.mount.lock"
-+#    log debug "trying to acquire lock /var/run/usbmount/.mount.lock"
-+#    lockfile-create --retry 3 /var/run/usbmount/.mount || \
-+#	{ log err "cannot acquire lock /var/run/usbmount/.mount.lock"; exit 1; }
-+#    trap '( lockfile-remove /var/run/usbmount/.mount )' 0
-+#    log debug "acquired lock /var/run/usbmount/.mount.lock"
++    log debug "trying to acquire lock /var/run/.usbmount.lock"
++    lockfile-create --retry 5 /var/run/.usbmount || \
++	{ log err "cannot acquire lock /var/run/.usbmount.lock"; exit 1; }
++    trap '( lockfile-remove /var/run/.usbmount )' 0
++    log debug "acquired lock /var/run/.usbmount.lock"
  
      # Try to read from the device.  Some devices need a few seconds
      # initialization time before they can be accessed.  Give up after
-diff -ru usbmount-0.0.14.1/usbmount.conf usbmount-patched/usbmount.conf
---- usbmount-0.0.14.1/usbmount.conf	2005-04-08 16:05:10.000000000 +0200
-+++ usbmount-patched/usbmount.conf	2007-02-07 12:44:39.000000000 +0100
+@@ -184,6 +184,7 @@
+ 		log info "executing command: run-parts /etc/usbmount/umount.d"
+ 		run-parts /etc/usbmount/umount.d || :
+ 	    fi
++	    lockfile-remove /var/run/.usbmount
+ 	    break
+ 	fi
+     done < /proc/mounts
+diff -ur usbmount-0.0.14.1/usbmount.conf usbmount-0.0.14.1-patched/usbmount.conf
+--- usbmount-0.0.14.1/usbmount.conf	2005-04-08 09:05:10.000000000 -0500
++++ usbmount-0.0.14.1-patched/usbmount.conf	2007-03-15 07:21:33.000000000 -0500
 @@ -17,7 +17,7 @@
  # sure all data is written to the medium before you remove it (e.g. run the #
  # "sync" command in a terminal window).  Otherwise, you *WILL* lose data!   #
