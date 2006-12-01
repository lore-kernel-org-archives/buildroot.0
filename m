From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  1 Dec 2006 09:49:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20061201174943.1279148581@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-01 09:49:42 -0800 (Fri, 01 Dec 2006)
New Revision: 16746

Log:
- bump version. Thanks to Petr Stetiar.


Added:
   trunk/buildroot/package/udev/udev-100.fix_makefile.patch

Modified:
   trunk/buildroot/package/udev/init-udev
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/init-udev
===================================================================
--- trunk/buildroot/package/udev/init-udev	2006-12-01 16:56:12 UTC (rev 16745)
+++ trunk/buildroot/package/udev/init-udev	2006-12-01 17:49:42 UTC (rev 16746)
@@ -27,6 +27,8 @@
 test -x $UDEV_BIN || exit 5
 UDEVSTART_BIN=/sbin/udevstart
 test -x $UDEVSTART_BIN || exit 5
+UDEVD_BIN=/sbin/udevd
+test -x $UDEVD_BIN || exit 5
 
 # Check for config file and read it
 UDEV_CONFIG=/etc/udev/udev.conf
@@ -64,7 +66,10 @@
 	echo -n "Populating $udev_root using udev... "
 	$UDEVSTART_BIN || (echo "FAIL" && exit 1)
 	mkdir $udev_root/pts $udev_root/shm
+	# start daemon
+	$UDEVD_BIN --daemon || (echo "udevd FAIL" && exit 1)
 	echo "done"
+	mount -a
 	;;
     stop)
 	# do nothing

Added: trunk/buildroot/package/udev/udev-100.fix_makefile.patch
===================================================================
--- trunk/buildroot/package/udev/udev-100.fix_makefile.patch	2006-12-01 16:56:12 UTC (rev 16745)
+++ trunk/buildroot/package/udev/udev-100.fix_makefile.patch	2006-12-01 17:49:42 UTC (rev 16746)
@@ -0,0 +1,12 @@
+diff -u udev-100/Makefile udev-100.ynezz/Makefile
+--- udev-100/Makefile	2006-09-07 11:32:45.000000000 +0200
++++ udev-100.ynezz/Makefile	2006-09-18 17:35:33.000000000 +0200
+@@ -276,6 +276,8 @@
+ install-bin:
+ 	$(INSTALL) -d $(DESTDIR)$(udevdir)
+ 	$(INSTALL_PROGRAM) -D udevd $(DESTDIR)$(sbindir)/udevd
++	$(INSTALL_PROGRAM) -D udev $(DESTDIR)$(sbindir)/udev
++	$(INSTALL_PROGRAM) -D udevstart $(DESTDIR)$(sbindir)/udevstart
+ 	$(INSTALL_PROGRAM) -D udevtrigger $(DESTDIR)$(sbindir)/udevtrigger
+ 	$(INSTALL_PROGRAM) -D udevsettle $(DESTDIR)$(sbindir)/udevsettle
+ 	$(INSTALL_PROGRAM) -D udevcontrol $(DESTDIR)$(sbindir)/udevcontrol

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2006-12-01 16:56:12 UTC (rev 16745)
+++ trunk/buildroot/package/udev/udev.mk	2006-12-01 17:49:42 UTC (rev 16746)
@@ -3,7 +3,7 @@
 # udev
 #
 #############################################################
-UDEV_VERSION:=094
+UDEV_VERSION:=100
 UDEV_SOURCE:=udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE:=ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 UDEV_CAT:=$(BZCAT)
@@ -35,7 +35,7 @@
 	touch $(UDEV_DIR)/.configured
 
 $(UDEV_DIR)/$(UDEV_BINARY): $(UDEV_DIR)/.configured
-	$(MAKE) CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LD=$(TARGET_CC) \
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC=$(TARGET_CC) LD=$(TARGET_CC)\
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR)
@@ -45,19 +45,21 @@
 # default access controls prevent non-root tasks from running.  Many of the
 # rule files rely on PROGRAM invocations (e.g. extra /etc/udev/scripts);
 # for now we'll avoid having buildroot systems rely on them.
-UDEV_CONF:=etc/udev/frugalware/udev.rules
+UDEV_CONF:=etc/udev/frugalware/*
 
 $(TARGET_DIR)/$(UDEV_TARGET_BINARY): $(UDEV_DIR)/$(UDEV_BINARY)
 	-mkdir $(TARGET_DIR)/sys
-	install -D -m 0644 $(UDEV_DIR)/$(UDEV_CONF) \
-		$(TARGET_DIR)/etc/udev/rules.d/50-udev.rules
-	$(MAKE) CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LD=$(TARGET_CC) \
+	-mkdir $(TARGET_DIR)/etc/udev/rules.d
+	$(INSTALL) -D -m 0644 $(UDEV_DIR)/$(UDEV_CONF) \
+		$(TARGET_DIR)/etc/udev/rules.d
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC=$(TARGET_CC)  LD=$(TARGET_CC) \
 		DESTDIR=$(TARGET_DIR) \
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		LDFLAGS="-warn-common" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
 	$(INSTALL) -m 0755 -D package/udev/init-udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -m 0644 -D package/udev/udev.conf $(TARGET_DIR)/etc/udev
 
 udev: uclibc $(TARGET_DIR)/$(UDEV_TARGET_BINARY)
 
