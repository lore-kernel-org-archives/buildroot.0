From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 22:53:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20090131225336.4E3377621A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-31 22:53:35 +0000 (Sat, 31 Jan 2009)
New Revision: 25201

Log:
dbus: revert r25194 (Unbreak Peters 'fixes' to dbus for a second time)

It was a bogus revert.

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-01-31 21:45:57 UTC (rev 25200)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-01-31 22:53:35 UTC (rev 25201)
@@ -13,10 +13,18 @@
 
 ifeq ($(BR2_DBUS_EXPAT),y)
 DBUS_XML:=expat
-DBUS_XML_DEP:=expat
+# depend on the exact library file instead of expat so dbus isn't always
+# considered out-of-date
+DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
 DBUS_XML:=libxml
-DBUS_XML_DEP:=libxml2
+# Makefile.autotools.in unfortunately has broken dependency handling,
+# so we cannot do the same for libxml2 as the targets (like
+# libxml2-install-staging) are phony and hence, dbus will always be
+# considered out-of-date. Using the corresponding .stamp_* files (E.G.
+# LIBXML2_TARGET_INSTALL_STAGING doesn't work as there's no dependency
+# information between them.
+DBUS_XML_DEP:=libxml2-install-staging
 endif
 
 $(DL_DIR)/$(DBUS_SOURCE):
@@ -86,7 +94,7 @@
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
 
-dbus: uclibc pkgconfig $(DBUS_XML_DEP) $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
+dbus: uclibc pkgconfig $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
 
 dbus-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
@@ -113,5 +121,3 @@
 ifeq ($(BR2_PACKAGE_DBUS),y)
 TARGETS+=dbus
 endif
-
-
