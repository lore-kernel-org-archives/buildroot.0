From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 18 Apr 2008 06:54:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  devmem2
Message-ID: <20080418135451.0EFAF3C30B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-18 06:54:50 -0700 (Fri, 18 Apr 2008)
New Revision: 21761

Log:
buildroot: devmem2 package


Added:
   trunk/buildroot/package/devmem2/
   trunk/buildroot/package/devmem2/Config.in
   trunk/buildroot/package/devmem2/devmem2.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-17 18:04:38 UTC (rev 21760)
+++ trunk/buildroot/package/Config.in	2008-04-18 13:54:50 UTC (rev 21761)
@@ -235,6 +235,7 @@
 
 if BR2_BLOCKDEV_SUPPORT
 source "package/acpid/Config.in"
+source "package/devmem2/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dm/Config.in"

Added: trunk/buildroot/package/devmem2/Config.in
===================================================================
--- trunk/buildroot/package/devmem2/Config.in	                        (rev 0)
+++ trunk/buildroot/package/devmem2/Config.in	2008-04-18 13:54:50 UTC (rev 21761)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DEVMEM2
+	bool "devmem2"
+	default n
+	help
+	  Simple program to read/write from/to any location in memory.
+
+	  http://free-electrons.com/pub/mirror/devmem2.c

Added: trunk/buildroot/package/devmem2/devmem2.mk
===================================================================
--- trunk/buildroot/package/devmem2/devmem2.mk	                        (rev 0)
+++ trunk/buildroot/package/devmem2/devmem2.mk	2008-04-18 13:54:50 UTC (rev 21761)
@@ -0,0 +1,42 @@
+#############################################################
+#
+# devmem2
+#
+#############################################################
+
+DEVMEM2_SOURCE:=devmem2.c
+DEVMEM2_SITE:=http://free-electrons.com/pub/mirror
+DEVMEM2_BINARY:=devmem2
+DEVMEM2_DIR:=$(BUILD_DIR)/devmem2
+
+$(DL_DIR)/$(DEVMEM2_SOURCE):
+	$(WGET) -P $(DL_DIR) $(DEVMEM2_SITE)/$(DEVMEM2_SOURCE)
+
+$(DEVMEM2_DIR)/$(DEVMEM2_SOURCE): $(DL_DIR)/$(DEVMEM2_SOURCE)
+	mkdir -p $(@D)
+	cp $^ $@
+
+$(DEVMEM2_DIR)/$(DEVMEM2_BINARY): $(DEVMEM2_DIR)/$(DEVMEM2_SOURCE)
+	$(TARGET_CC) $(TARGET_CFLAGS) -o $@ $^
+
+$(TARGET_DIR)/sbin/$(DEVMEM2_BINARY): $(DEVMEM2_DIR)/$(DEVMEM2_BINARY)
+	cp $^ $@
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+
+devmem2: uclibc $(TARGET_DIR)/sbin/$(DEVMEM2_BINARY)
+
+devmem2-source: $(DL_DIR)/$(DEVMEM2_SOURCE)
+
+devmem2-clean:
+	rm -f $(TARGET_DIR/sbin/$(DEVMEM2_BINARY)
+
+devmem2-dirclean:
+	rm -rf $(DEVMEM2_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_DEVMEM2)),y)
+TARGETS+=devmem2
+endif
