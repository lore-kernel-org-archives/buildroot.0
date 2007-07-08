From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 06:20:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20070708132046.C0489A687C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 06:20:46 -0700 (Sun, 08 Jul 2007)
New Revision: 19036

Log:
- fix looking for libexpat.so in wrong place (Cristian Ionescu-Idbohrn)
- bump version


Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-07-08 13:13:29 UTC (rev 19035)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-07-08 13:20:46 UTC (rev 19036)
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VER:=1.0.0
+DBUS_VER:=1.1.1
 DBUS_SOURCE:=dbus-$(DBUS_VER).tar.gz
 DBUS_SITE:=http://dbus.freedesktop.org/releases/dbus/
 DBUS_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VER)
@@ -18,7 +18,7 @@
 
 $(DBUS_DIR)/.unpacked: $(DL_DIR)/$(DBUS_SOURCE)
 	$(DBUS_CAT) $(DL_DIR)/$(DBUS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(DBUS_DIR)/.unpacked
+	touch $@
 
 $(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked
 	(cd $(DBUS_DIR); rm -rf config.cache; \
@@ -48,10 +48,10 @@
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid \
 	);
-	touch  $(DBUS_DIR)/.configured
+	touch $@
 
 $(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
-	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/lib/libexpat.so" -C $(DBUS_DIR) all
+	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so" -C $(DBUS_DIR) all
 
 $(STAGING_DIR)/usr/lib/libdbus-1.so: $(DBUS_DIR)/$(DBUS_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
@@ -59,15 +59,15 @@
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
 	-mkdir $(TARGET_DIR)/var/run/dbus
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(DBUS_DIR)/dbus install
-	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/dbus-1.0
-	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.la
-	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.so
+	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
+	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.la \
+		$(TARGET_DIR)/usr/lib/libdbus-1.so
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libdbus-1.so.3.2.0
 	$(MAKE) DESTDIR=$(TARGET_DIR) initddir=/etc/init.d -C $(DBUS_DIR)/bus install
 	$(INSTALL) -m 0755 -D package/dbus/S97messagebus $(TARGET_DIR)/etc/init.d
 	rm -f $(TARGET_DIR)/etc/init.d/messagebus
 	rm -rf $(TARGET_DIR)/usr/man
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	-rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	rm -rf $(TARGET_DIR)/etc/rc.d
 
 dbus: uclibc expat $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
