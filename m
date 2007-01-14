From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 17:02:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20070114010236.A5BED485A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 17:02:36 -0800 (Sat, 13 Jan 2007)
New Revision: 17273

Log:
Make sure to install the 'libgthread' shared libraries as well. Also, allow for configuration of locale support or not.


Modified:
   trunk/buildroot/package/libglib2/Config.in
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/Config.in
===================================================================
--- trunk/buildroot/package/libglib2/Config.in	2007-01-14 01:01:07 UTC (rev 17272)
+++ trunk/buildroot/package/libglib2/Config.in	2007-01-14 01:02:36 UTC (rev 17273)
@@ -1,9 +1,16 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
 	default n
-	select BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBINTL
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
+
+config BR2_PACKAGE_LIBGLIB2_LOCALE
+	bool "libglib2-locale"
+	default n
+	select BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_PKGCONFIG
+	help
+	  Enable locale support for Glib library.

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2007-01-14 01:01:07 UTC (rev 17272)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2007-01-14 01:02:36 UTC (rev 17273)
@@ -138,15 +138,25 @@
 	cp -a $(STAGING_DIR)/lib/libgmodule-2.0.so.0* $(TARGET_DIR)/lib/
 	cp -a $(STAGING_DIR)/lib/libgobject-2.0.so $(TARGET_DIR)/lib/
 	cp -a $(STAGING_DIR)/lib/libgobject-2.0.so.0* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libgthread-2.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libgthread-2.0.so.0* $(TARGET_DIR)/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libglib-2.0.so.0.*
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmodule-2.0.so.0.*
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgobject-2.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgthread-2.0.so.0.*
 	touch -c $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
 
+ifeq ($(strip $(BR2_PACKAGE_LIBGLIB2_LOCAL)),y)
 libglib2: uclibc gettext libintl pkgconfig $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
+else
+libglib2: uclibc $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
+endif
 
 libglib2-clean:
-	rm -f $(TARGET_DIR)/lib/$(LIBGLIB2_BINARY)
+	rm -f $(TARGET_DIR)/usr/lib/libglib-2.0*
+	rm -f $(TARGET_DIR)/usr/lib/libgmodule-2.0*
+	rm -f $(TARGET_DIR)/usr/lib/libgobject-2.0*
+	rm -f $(TARGET_DIR)/usr/lib/libgthread-2.0*
 	-$(MAKE) -C $(LIBGLIB2_DIR) clean
 
 libglib2-dirclean:
