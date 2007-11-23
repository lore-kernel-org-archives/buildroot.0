From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 03:43:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071123114301.6B7493004A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 03:42:59 -0800 (Fri, 23 Nov 2007)
New Revision: 20494

Log:
Fix target install, install helper programs as well as strip executables

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-11-23 11:25:13 UTC (rev 20493)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-11-23 11:42:59 UTC (rev 20494)
@@ -66,19 +66,17 @@
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
 	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/etc/init.d
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(DBUS_DIR)/dbus install
-	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
-	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.la \
-		$(TARGET_DIR)/usr/lib/libdbus-1.so
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdbus-1.so.3.3.0
-	$(MAKE) DESTDIR=$(TARGET_DIR) initddir=/etc/init.d -C $(DBUS_DIR)/bus install
+	$(MAKE) DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIP)' \
+		initdir=/etc/init.d -C $(DBUS_DIR)/dbus install-strip
+	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0 \
+		$(TARGET_DIR)/usr/lib/libdbus-1.la \
+		$(TARGET_DIR)/usr/include/dbus-1.0 \
+		$(TARGET_DIR)/usr/lib/pkgconfig
 	$(INSTALL) -m 0755 package/dbus/S97messagebus $(TARGET_DIR)/etc/init.d
 	rm -f $(TARGET_DIR)/etc/init.d/messagebus
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-	rm -rf $(TARGET_DIR)/etc/rc.d
 
 dbus: uclibc $(DBUS_XML_DEP) $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
 
