From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 Jan 2009 21:32:44 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus-glib
Message-ID: <20090120213244.B1DB2770AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-20 21:32:43 +0000 (Tue, 20 Jan 2009)
New Revision: 24926

Log:
Libraries for dbus-glib are in /usr/lib, depend on expat

Modified:
   trunk/buildroot/package/dbus-glib/Config.in
   trunk/buildroot/package/dbus-glib/dbus-glib.mk


Changeset:
Modified: trunk/buildroot/package/dbus-glib/Config.in
===================================================================
--- trunk/buildroot/package/dbus-glib/Config.in	2009-01-20 20:06:36 UTC (rev 24925)
+++ trunk/buildroot/package/dbus-glib/Config.in	2009-01-20 21:32:43 UTC (rev 24926)
@@ -3,6 +3,7 @@
 	depends on BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PKGCONFIG
+	select BR2_PACKAGE_EXPAT
 	help
 	  GLib bindings for D-Bus.
 

Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-01-20 20:06:36 UTC (rev 24925)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-01-20 21:32:43 UTC (rev 24926)
@@ -31,7 +31,7 @@
 		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
-		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
+		DBUS_GLIB_LIBS="$(STAGING_DIR)/usr/lib/libglib-2.0.so $(STAGING_DIR)/usr/lib/libgobject-2.0.so $(STAGING_DIR)/usr/lib/libgmodule-2.0.so $(STAGING_DIR)/usr/lib/libgthread-2.0.so" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -47,7 +47,7 @@
 	touch $(DBUS_GLIB_DIR)/.configured
 
 $(DBUS_GLIB_DIR)/$(DBUS_GLIB_BINARY): $(DBUS_GLIB_DIR)/.configured
-	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/lib/libexpat.so" -C $(DBUS_GLIB_DIR) all
+	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so" -C $(DBUS_GLIB_DIR) all
 
 $(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0: $(DBUS_GLIB_DIR)/$(DBUS_GLIB_BINARY)
 	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/libdbus-glib-1.so* $(STAGING_DIR)/usr/lib
@@ -58,7 +58,7 @@
 	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/dbus-binding-tool $(TARGET_DIR)/usr/bin
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
 
-dbus-glib: uclibc pkgconfig dbus libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
+dbus-glib: uclibc pkgconfig dbus expat libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
 
 dbus-glib-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libdbus-glib-1.so.2*
