From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue,  5 Feb 2008 16:55:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20080206005506.8499E120108@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-02-05 16:55:05 -0800 (Tue, 05 Feb 2008)
New Revision: 20947

Log:
Added configuration item to control whether development headers and libraries are installed on the target
Removed some additional files if optional modules are disabled


Modified:
   trunk/buildroot/package/python/Config.in
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/Config.in
===================================================================
--- trunk/buildroot/package/python/Config.in	2008-02-05 23:04:09 UTC (rev 20946)
+++ trunk/buildroot/package/python/Config.in	2008-02-06 00:55:05 UTC (rev 20947)
@@ -6,6 +6,14 @@
 
 	  http://www.python.org/
 
+config BR2_PACKAGE_PYTHON_DEV
+	depends on BR2_PACKAGE_PYTHON
+	bool "development files on target"
+	default n
+	help
+	  If enabled, development files (headers and static libpython) will be
+	  installed on the target.
+
 choice
 	prompt "Module format to install"
 	depends on BR2_PACKAGE_PYTHON

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-02-05 23:04:09 UTC (rev 20946)
+++ trunk/buildroot/package/python/python.mk	2008-02-06 00:55:05 UTC (rev 20947)
@@ -4,6 +4,7 @@
 #
 #############################################################
 PYTHON_VERSION=2.4.2
+PYTHON_VERSION_SHORT=2.4
 PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
@@ -136,13 +137,31 @@
 	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
-		$(TARGET_DIR)/usr/lib/python*/test
+		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/test
+	cp -dpr $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT) $(STAGING_DIR)/usr/include/
+	mkdir -p $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)
+	cp -dpr $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/
+
 ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \;
 endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
 endif
+ifneq ($(BR2_PACKAGE_PYTHON_DEV),y)
+	rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT)
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config
+	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
+endif
+ifneq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/bsddb
+endif
+ifneq ($(BR2_PACKAGE_PYTHON_CURSES),y)
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/curses
+endif
+ifneq ($(BR2_PACKAGE_PYTHON_TKINTER),y)
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/lib-tk
+endif
 
 python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
 
