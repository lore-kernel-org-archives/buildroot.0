From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Jun 2013 16:28:02 +0200
Subject: [Buildroot] [PATCH] usbmount: stop using blkid,
	use udev environment variables instead
Message-ID: <1371652082-3515-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The blkid binary is not any longer installed when libblkid from
util-linux is selected. udev has a builtin blkid command though
and already detects all values that we are interested in. Change
the usbmount script to use the environment variables set by udev
instead of calling blkid directly.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/usbmount/Config.in                         |  2 -
 ...unt-use-udev-environment-instead-of-blkid.patch | 65 ++++++++++++++++++++++
 package/usbmount/usbmount.mk                       |  2 +-
 3 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch

diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 30c7b5a..0fb491c 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_USBMOUNT
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
 	  The usbmount package automatically mounts USB mass storage devices
 	  when they are plugged in, and unmounts them when they are removed.
diff --git a/package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch b/package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch
new file mode 100644
index 0000000..0f0968b
--- /dev/null
+++ b/package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch
@@ -0,0 +1,65 @@
+--- usbmount-0.0.22/usbmount.orig	2013-06-18 14:44:40.143096147 +0200
++++ usbmount-0.0.22/usbmount	2013-06-19 16:13:09.882434896 +0200
+@@ -59,11 +59,6 @@
+     exit 0
+ fi
+ 
+-if [ ! -x /sbin/blkid ]; then
+-    log err "cannot execute /sbin/blkid"
+-    exit 1
+-fi
+-
+ # Per Policy 9.3.2, directories under /var/run have to be created
+ # after every reboot.
+ if [ ! -e /var/run/usbmount ]; then
+@@ -83,15 +78,7 @@
+     trap '( lockfile-remove /var/run/usbmount/.mount )' 0
+     log debug "acquired lock /var/run/usbmount/.mount.lock"
+ 
+-    # Grab device information from device and "divide it"
+-    #   FIXME: improvement: implement mounting by label (notice that labels
+-    #   can contain spaces, which makes things a little bit less comfortable).
+-    DEVINFO=$(/sbin/blkid -p $DEVNAME)
+-    FSTYPE=$(echo "$DEVINFO" | sed 's/.*[[:blank:]]TYPE="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
+-    UUID=$(echo "$DEVINFO"   | sed 's/.*[[:blank:]]UUID="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
+-    USAGE=$(echo "$DEVINFO"  | sed 's/.*[[:blank:]]USAGE="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
+-
+-    if ! echo $USAGE | egrep -q "(filesystem|disklabel)"; then
++    if ! echo $ID_FS_USAGE | egrep -q "(filesystem|disklabel)"; then
+ 	log info "$DEVNAME does not contain a filesystem or disklabel"
+ 	exit 1
+     fi
+@@ -101,14 +88,14 @@
+ 	log info "executing command: mount $DEVNAME"
+ 	mount $DEVNAME || log err "mount by DEVNAME with $DEVNAME wasn't successful; return code $?"
+ 
+-    elif grep -q "^[[:blank:]]*UUID=$UUID" /etc/fstab; then
+-        log info "executing command: mount -U $UUID"
+-	mount -U $UUID || log err "mount by UUID with $UUID wasn't successful; return code $?"
++    elif grep -q "^[[:blank:]]*UUID=$ID_FS_UUID" /etc/fstab; then
++        log info "executing command: mount -U $ID_FS_UUID"
++	mount -U $ID_FS_UUID || log err "mount by UUID with $ID_FS_UUID wasn't successful; return code $?"
+ 
+     else
+-	log debug "$DEVNAME contains filesystem type $FSTYPE"
++	log debug "$DEVNAME contains filesystem type $ID_FS_TYPE"
+ 
+-	fstype=$FSTYPE
++	fstype=$ID_FS_TYPE
+ 	# Test if the filesystem type is in the list of filesystem
+ 	# types to mount.
+ 	if in_list "$fstype" "$FILESYSTEMS"; then
+@@ -176,11 +163,13 @@
+ 
+ 		# Run hook scripts; ignore errors.
+ 		export UM_DEVICE="$DEVNAME"
++		export UM_UUID="$ID_FS_UUID"
+ 		export UM_MOUNTPOINT="$mountpoint"
+ 		export UM_FILESYSTEM="$fstype"
+ 		export UM_MOUNTOPTIONS="$options"
+ 		export UM_VENDOR="$vendor"
+ 		export UM_MODEL="$model"
++		export UM_LABEL="$ID_FS_LABEL"
+ 		log info "executing command: run-parts /etc/usbmount/mount.d"
+ 		run-parts /etc/usbmount/mount.d || :
+ 	    else
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 69262a6..de87009 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -7,7 +7,7 @@
 USBMOUNT_VERSION = 0.0.22
 USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
 USBMOUNT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbmount
-USBMOUNT_DEPENDENCIES = udev lockfile-progs util-linux
+USBMOUNT_DEPENDENCIES = udev lockfile-progs
 
 define USBMOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
-- 
1.8.1.2
