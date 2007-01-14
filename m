From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 16:59:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20070114005910.028A448593@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 16:59:10 -0800 (Sat, 13 Jan 2007)
New Revision: 17271

Log:
Upgrade to udev-101. We also create and init script that actually works and has been tested in multiple PowerPC embedded platforms. We also add a new config option to build the volume_id library which will be used by D-Bus and HAL.


Added:
   trunk/buildroot/package/udev/udev-install.patch

Removed:
   trunk/buildroot/package/udev/udev-100.fix_makefile.patch
   trunk/buildroot/package/udev/udev.conf

Modified:
   trunk/buildroot/package/udev/Config.in
   trunk/buildroot/package/udev/init-udev
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/Config.in
===================================================================
--- trunk/buildroot/package/udev/Config.in	2007-01-14 00:57:50 UTC (rev 17270)
+++ trunk/buildroot/package/udev/Config.in	2007-01-14 00:59:10 UTC (rev 17271)
@@ -5,3 +5,23 @@
 	  Userspace device daemon.
 
 	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
+
+config BR2_PACKAGE_UDEV_UTILS
+        bool "udev-utils"
+        default n
+        depends on BR2_PACKAGE_UDEV
+        help
+          Adds the udevmonitor, udevinfo, and udevtest binaries
+	  to your filesystem.
+
+menu "Extra udev tools"
+        depends BR2_PACKAGE_UDEV
+
+config BR2_PACKAGE_UDEV_VOLUME_ID
+        bool "udev-libvolume_id"
+        default n
+        depends on BR2_PACKAGE_UDEV
+        help
+          Build and install volume identification library.
+
+endmenu

Modified: trunk/buildroot/package/udev/init-udev
===================================================================
--- trunk/buildroot/package/udev/init-udev	2007-01-14 00:57:50 UTC (rev 17270)
+++ trunk/buildroot/package/udev/init-udev	2007-01-14 00:59:10 UTC (rev 17271)
@@ -18,17 +18,15 @@
 
 # old kernels don't use udev
 case $(uname -r) in
-2.6*|2.7*)	;;
-*)		exit 0;;
+    2.6*|2.7*)	;;
+    *)		exit 0;;
 esac
 
 # Check for missing binaries
-UDEV_BIN=/sbin/udev
+UDEV_BIN=/sbin/udevd
 test -x $UDEV_BIN || exit 5
 UDEVSTART_BIN=/sbin/udevstart
 test -x $UDEVSTART_BIN || exit 5
-UDEVD_BIN=/sbin/udevd
-test -x $UDEVD_BIN || exit 5
 
 # Check for config file and read it
 UDEV_CONFIG=/etc/udev/udev.conf
@@ -40,42 +38,44 @@
 
 case "$1" in
     start)
-	# mount sysfs if it's not yet mounted
-	if [ ! -d $SYSFS_DIR ]; then
-		echo "${0}: SYSFS_DIR \"$SYSFS_DIR\" not found"
-		exit 1
-	fi
-	grep -q "^sysfs $SYSFS_DIR" /proc/mounts ||
-		mount -t sysfs /sys /sys ||
-		exit 1
+        # mount sysfs if it's not yet mounted
+        if [ ! -d $SYSFS_DIR ]; then
+	    echo "${0}: SYSFS_DIR \"$SYSFS_DIR\" not found"
+	    exit 1
+        fi
+        grep -q "^sysfs $SYSFS_DIR" /proc/mounts ||
+	mount -t sysfs /sys /sys ||
+	exit 1
 
-	# mount $udev_root as ramfs if it's not yet mounted
-	# we know 2.6 kernels always support ramfs
-	if [ ! -d $udev_root ]; then
-		echo "${0}: udev_root \"$udev_root\" not found"
-		exit 1
-	fi
-	grep -q "^udev $udev_root" /proc/mounts ||
-		mount -t ramfs udev $udev_root ||
-		exit 1
+        # mount $udev_root as ramfs if it's not yet mounted
+        # we know 2.6 kernels always support ramfs
+        if [ ! -d $udev_root ]; then
+	    echo "${0}: udev_root \"$udev_root\" not found"
+	    exit 1
+        fi
+        grep -q "^udev $udev_root" /proc/mounts ||
+	mount -t ramfs udev $udev_root ||
+	exit 1
 
-	# heck, go whole-hog:  use only new style hotplug
-	# echo $UDEV_BIN > /proc/sys/kernel/hotplug
+        mkdir $udev_root/pts $udev_root/shm
 
-	# populate /dev (normally)
-	echo -n "Populating $udev_root using udev... "
+        # populate /dev (normally)
+        echo -n "Populating $udev_root using udev: "
+        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+        $UDEV_BIN -d || (echo "FAIL" && exit 1)
 	$UDEVSTART_BIN || (echo "FAIL" && exit 1)
-	mkdir $udev_root/pts $udev_root/shm
-	# start daemon
-	$UDEVD_BIN --daemon || (echo "udevd FAIL" && exit 1)
-	echo "done"
-	mount -a
-	;;
+        echo "done"
+        ;;
     stop)
-	# do nothing
-	;;
+        # Stop execution of events
+        udevcontrol stop_exec_queue
+        killall udevd
+        ;;
     *)
-	echo "Usage: $0 {start|stop}"
-	exit 1
-	;;
+        echo "Usage: $0 {start|stop}"
+        exit 1
+        ;;
 esac
+
+
+exit 0

Deleted: trunk/buildroot/package/udev/udev-100.fix_makefile.patch
===================================================================
--- trunk/buildroot/package/udev/udev-100.fix_makefile.patch	2007-01-14 00:57:50 UTC (rev 17270)
+++ trunk/buildroot/package/udev/udev-100.fix_makefile.patch	2007-01-14 00:59:10 UTC (rev 17271)
@@ -1,12 +0,0 @@
-diff -u udev-100/Makefile udev-100.ynezz/Makefile
---- udev-100/Makefile	2006-09-07 11:32:45.000000000 +0200
-+++ udev-100.ynezz/Makefile	2006-09-18 17:35:33.000000000 +0200
-@@ -276,6 +276,8 @@
- install-bin:
- 	$(INSTALL) -d $(DESTDIR)$(udevdir)
- 	$(INSTALL_PROGRAM) -D udevd $(DESTDIR)$(sbindir)/udevd
-+	$(INSTALL_PROGRAM) -D udev $(DESTDIR)$(sbindir)/udev
-+	$(INSTALL_PROGRAM) -D udevstart $(DESTDIR)$(sbindir)/udevstart
- 	$(INSTALL_PROGRAM) -D udevtrigger $(DESTDIR)$(sbindir)/udevtrigger
- 	$(INSTALL_PROGRAM) -D udevsettle $(DESTDIR)$(sbindir)/udevsettle
- 	$(INSTALL_PROGRAM) -D udevcontrol $(DESTDIR)$(sbindir)/udevcontrol

Added: trunk/buildroot/package/udev/udev-install.patch
===================================================================
--- trunk/buildroot/package/udev/udev-install.patch	                        (rev 0)
+++ trunk/buildroot/package/udev/udev-install.patch	2007-01-14 00:59:10 UTC (rev 17271)
@@ -0,0 +1,11 @@
+diff -ur udev-101/Makefile udev-101-patched/Makefile
+--- udev-101/Makefile	2006-09-30 07:30:00.000000000 -0500
++++ udev-101-patched/Makefile	2006-10-20 12:28:18.000000000 -0500
+@@ -275,6 +275,7 @@
+ 
+ install-bin:
+ 	$(INSTALL) -d $(DESTDIR)$(udevdir)
++	$(INSTALL_PROGRAM) -D udevstart $(DESTDIR)$(sbindir)/udevstart
+ 	$(INSTALL_PROGRAM) -D udevd $(DESTDIR)$(sbindir)/udevd
+ 	$(INSTALL_PROGRAM) -D udevtrigger $(DESTDIR)$(sbindir)/udevtrigger
+ 	$(INSTALL_PROGRAM) -D udevsettle $(DESTDIR)$(sbindir)/udevsettle

Deleted: trunk/buildroot/package/udev/udev.conf
===================================================================
--- trunk/buildroot/package/udev/udev.conf	2007-01-14 00:57:50 UTC (rev 17270)
+++ trunk/buildroot/package/udev/udev.conf	2007-01-14 00:59:10 UTC (rev 17271)
@@ -1,7 +0,0 @@
-# udev.conf
-
-# The initial syslog(3) priority: "err", "info", "debug" or its
-# numerical equivalent. For runtime debugging, the daemons internal
-# state can be changed with: "udevcontrol log_priority=<value>".
-udev_log="err"
-udev_root=/dev

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-01-14 00:57:50 UTC (rev 17270)
+++ trunk/buildroot/package/udev/udev.mk	2007-01-14 00:59:10 UTC (rev 17271)
@@ -3,12 +3,12 @@
 # udev
 #
 #############################################################
-UDEV_VERSION:=100
+UDEV_VERSION:=101
 UDEV_SOURCE:=udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE:=ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 UDEV_CAT:=$(BZCAT)
 UDEV_DIR:=$(BUILD_DIR)/udev-$(UDEV_VERSION)
-UDEV_TARGET_BINARY:=sbin/udev
+UDEV_TARGET_BINARY:=sbin/udevd
 UDEV_BINARY:=udev
 
 # 094 had _GNU_SOURCE set
@@ -41,30 +41,56 @@
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR)
 	touch -c $(UDEV_DIR)/$(UDEV_BINARY)
 
-# UDEV_CONF overrides default policies for device access control and naming;
-# default access controls prevent non-root tasks from running.  Many of the
-# rule files rely on PROGRAM invocations (e.g. extra /etc/udev/scripts);
-# for now we'll avoid having buildroot systems rely on them.
-UDEV_CONF:=etc/udev/frugalware/*
-
 $(TARGET_DIR)/$(UDEV_TARGET_BINARY): $(UDEV_DIR)/$(UDEV_BINARY)
 	-mkdir $(TARGET_DIR)/sys
-	-mkdir -p $(TARGET_DIR)/etc/udev/rules.d
-	$(INSTALL) -D -m 0644 $(UDEV_DIR)/$(UDEV_CONF) \
-		$(TARGET_DIR)/etc/udev/rules.d
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC=$(TARGET_CC)  LD=$(TARGET_CC) \
-		DESTDIR=$(TARGET_DIR) \
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(TARGET_DIR) \
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		LDFLAGS="-warn-common" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
 	$(INSTALL) -m 0755 -D package/udev/init-udev $(TARGET_DIR)/etc/init.d/S10udev
-	$(INSTALL) -m 0644 -D package/udev/udev.conf $(TARGET_DIR)/etc/udev
+	rm -rf $(TARGET_DIR)/usr/share/man
+ifneq ($(strip $(BR2_PACKAGE_UDEV_UTILS)),y)
+	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor
+	rm -f $(TARGET_DIR)/usr/bin/udevinfo
+	rm -f $(TARGET_DIR)/usr/bin/udevtest
+endif
 
 udev: uclibc $(TARGET_DIR)/$(UDEV_TARGET_BINARY)
 
+ifeq ($(strip $(BR2_PACKAGE_UDEV_VOLUME_ID)),y)
+$(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0:
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		USE_LOG=false USE_SELINUX=false \
+		udevdir=$(UDEV_ROOT) EXTRAS="extras/volume_id" -C $(UDEV_DIR)
+	$(INSTALL) -m 0644 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.h $(STAGING_DIR)/include/libvolume_id.h
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.0.72.0 $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0
+	-ln -sf libvolume_id.so.0.72.0 $(STAGING_DIR)/usr/lib/libvolume_id.so.0
+	-ln -sf libvolume_id.so.0 $(STAGING_DIR)/usr/lib/libvolume_id.so
+
+$(TARGET_DIR)/lib/udev/vol_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/vol_id $(TARGET_DIR)/lib/udev/vol_id
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.0.72.0 $(TARGET_DIR)/usr/lib/libvolume_id.so.0.72.0
+	-ln -sf libvolume_id.so.0.72.0 $(TARGET_DIR)/usr/lib/libvolume_id.so.0
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libvolume_id.so.0.72.0
+
+udev-volume_id: udev $(TARGET_DIR)/lib/udev/vol_id
+
+udev-volume_id-clean:
+	rm -f $(STAGING_DIR)/include/libvolume_id.h
+	rm -f $(STAGING_DIR)/usr/lib/libvolume_id.so*
+	rm -f $(TARGET_DIR)/usr/lib/libvolume_id.so.0*
+	rm -f $(TARGET_DIR)/lib/udev/vol_id
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
+
+udev-volume_id-dirclean:
+	-$(MAKE) EXTRAS="extras/volume_id" -C $(UDEV_DIR) clean
+endif
+
 udev-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(UDEV_DIR) uninstall
+	rm -f $(TARGET_DIR)/etc/init.d/S10udev $(TARGET_DIR)/sbin/udev*
+	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor $(TARGET_DIR)/usr/bin/udev*
+	rmdir $(TARGET_DIR)/sys
 	-$(MAKE) -C $(UDEV_DIR) clean
 
 udev-dirclean:
@@ -78,3 +104,7 @@
 ifeq ($(strip $(BR2_PACKAGE_UDEV)),y)
 TARGETS+=udev
 endif
+
+ifeq ($(strip $(BR2_PACKAGE_UDEV_VOLUME_ID)),y)
+TARGETS+=udev-volume_id
+endif
