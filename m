From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 08:19:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20070717151918.BB042A6873@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 08:19:18 -0700 (Tue, 17 Jul 2007)
New Revision: 19136

Log:
Make dbus depend on libxml2 and link with lib

Modified:
   trunk/buildroot/package/dbus/Config.in
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/Config.in
===================================================================
--- trunk/buildroot/package/dbus/Config.in	2007-07-17 15:17:42 UTC (rev 19135)
+++ trunk/buildroot/package/dbus/Config.in	2007-07-17 15:19:18 UTC (rev 19136)
@@ -2,6 +2,7 @@
 	bool "dbus"
 	default n
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBXML2
 	help
 	  The D-Bus message bus system.
 

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-07-17 15:17:42 UTC (rev 19135)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-07-17 15:19:18 UTC (rev 19136)
@@ -51,7 +51,7 @@
 	touch $@
 
 $(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
-	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so" -C $(DBUS_DIR) all
+	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so $(STAGING_DIR)/usr/lib/libxml2.so" -C $(DBUS_DIR) all
 
 $(STAGING_DIR)/usr/lib/libdbus-1.so: $(DBUS_DIR)/$(DBUS_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
@@ -70,7 +70,7 @@
 	-rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	rm -rf $(TARGET_DIR)/etc/rc.d
 
-dbus: uclibc expat $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
+dbus: uclibc expat libxml2-headers $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
 
 dbus-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
