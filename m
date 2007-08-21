From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 05:09:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20070821120956.BD82EA657F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 05:09:53 -0700 (Tue, 21 Aug 2007)
New Revision: 19613

Log:
- fix installation of dbus.


Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-08-21 11:25:30 UTC (rev 19612)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-08-21 12:09:53 UTC (rev 19613)
@@ -57,14 +57,14 @@
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
-	-mkdir $(TARGET_DIR)/var/run/dbus
+	-mkdir $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/etc/init.d
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(DBUS_DIR)/dbus install
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
 	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.la \
 		$(TARGET_DIR)/usr/lib/libdbus-1.so
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdbus-1.so.3.2.0
 	$(MAKE) DESTDIR=$(TARGET_DIR) initddir=/etc/init.d -C $(DBUS_DIR)/bus install
-	$(INSTALL) -m 0755 -D package/dbus/S97messagebus $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/dbus/S97messagebus $(TARGET_DIR)/etc/init.d
 	rm -f $(TARGET_DIR)/etc/init.d/messagebus
 	rm -rf $(TARGET_DIR)/usr/man
 	-rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
