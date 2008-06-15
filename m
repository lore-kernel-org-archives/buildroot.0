From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Jun 2008 13:20:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20080615202033.D35A13C92A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-15 13:20:33 -0700 (Sun, 15 Jun 2008)
New Revision: 22358

Log:
dbus: depend on exact XML dep so it isn't always considered out-of-date


Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-06-15 20:15:27 UTC (rev 22357)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-06-15 20:20:33 UTC (rev 22358)
@@ -13,10 +13,17 @@
 
 ifeq ($(strip $(BR2_DBUS_EXPAT)),y)
 DBUS_XML:=expat
-DBUS_XML_DEP:=expat
+# depend on the exact library file instead of expat so dbus isn't always
+# considered out-of-date
+DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
 DBUS_XML:=libxml
-DBUS_XML_DEP:=libxml2
+# depend on the exact target instead of libxml2 so dbus isn't always
+# considered out-of-date.
+# It would be neat to use $(LIBXML2_TARGET_INSTALL_STAGING) here,
+# but the libxml2 makefile is only parsed after dbus, so that doesn't work
+DBUS_XML_DEP:=$(BUILD_DIR)/libxml2-2.6.29/.stamp_staging_installed
+$(LIBXML2_TARGET_INSTALL_STAGING)
 endif
 
 $(DL_DIR)/$(DBUS_SOURCE):
@@ -83,7 +90,7 @@
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
 
-dbus: uclibc pkgconfig $(DBUS_XML_DEP) $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
+dbus: uclibc pkgconfig $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
 
 dbus-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
