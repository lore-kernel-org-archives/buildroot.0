From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 31 Jan 2009 21:01:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20090131210126.336A27621A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-31 21:01:24 +0000 (Sat, 31 Jan 2009)
New Revision: 25194

Log:
Unbreak Peters 'fixes' to dbus for a second time

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-01-31 20:49:59 UTC (rev 25193)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-01-31 21:01:24 UTC (rev 25194)
@@ -13,18 +13,10 @@
 
 ifeq ($(BR2_DBUS_EXPAT),y)
 DBUS_XML:=expat
-# depend on the exact library file instead of expat so dbus isn't always
-# considered out-of-date
-DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
+DBUS_XML_DEP:=expat
 else
 DBUS_XML:=libxml
-# Makefile.autotools.in unfortunately has broken dependency handling,
-# so we cannot do the same for libxml2 as the targets (like
-# libxml2-install-staging) are phony and hence, dbus will always be
-# considered out-of-date. Using the corresponding .stamp_* files (E.G.
-# LIBXML2_TARGET_INSTALL_STAGING doesn't work as there's no dependency
-# information between them.
-DBUS_XML_DEP:=libxml2-install-staging
+DBUS_XML_DEP:=libxml2
 endif
 
 $(DL_DIR)/$(DBUS_SOURCE):
@@ -94,7 +86,7 @@
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
 
-dbus: uclibc pkgconfig $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
+dbus: uclibc pkgconfig $(DBUS_XML_DEP) $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
 
 dbus-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
@@ -121,3 +113,5 @@
 ifeq ($(BR2_PACKAGE_DBUS),y)
 TARGETS+=dbus
 endif
+
+
