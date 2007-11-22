From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 22 Nov 2007 09:12:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071122171219.D8A8F30067@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-22 09:12:19 -0800 (Thu, 22 Nov 2007)
New Revision: 20476

Log:
Make XML library used by D-Bus selectable instead of requiring both Expat
and libxml2.


Modified:
   trunk/buildroot/package/dbus/Config.in
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/Config.in
===================================================================
--- trunk/buildroot/package/dbus/Config.in	2007-11-22 17:05:28 UTC (rev 20475)
+++ trunk/buildroot/package/dbus/Config.in	2007-11-22 17:12:19 UTC (rev 20476)
@@ -1,9 +1,27 @@
 config BR2_PACKAGE_DBUS
 	bool "dbus"
 	default n
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBXML2
 	help
 	  The D-Bus message bus system.
 
 	  http://www.freedesktop.org/wiki/Software/dbus
+
+choice
+	prompt "XML library to use"
+	depends BR2_PACKAGE_DBUS
+	default BR2_DBUS_LIBXML2 if BR2_PACKAGE_LIBXML2
+	default BR2_DBUS_EXPAT
+	help
+	  Select the XML library to use with D-Bus. Select Expat
+	  unless you have specific reasons for using libxml2 as
+	  Expat is significant smaller.
+
+	config BR2_DBUS_EXPAT
+	       bool "Expat"
+	       select BR2_PACKAGE_EXPAT
+
+	config BR2_DBUS_LIBXML2
+	       bool "libxml2"
+	       select BR2_PACKAGE_LIBXML2
+
+endchoice

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-11-22 17:05:28 UTC (rev 20475)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-11-22 17:12:19 UTC (rev 20476)
@@ -11,6 +11,14 @@
 DBUS_BINARY:=bus/dbus-daemon
 DBUS_TARGET_BINARY:=usr/bin/dbus-daemon
 
+ifeq ($(strip $(BR2_DBUS_EXPAT)),y)
+DBUS_XML:=expat
+DBUS_XML_DEP:=expat
+else
+DBUS_XML:=libxml
+DBUS_XML_DEP:=libxml2-headers
+endif
+
 $(DL_DIR)/$(DBUS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DBUS_SITE)/$(DBUS_SOURCE)
 
@@ -44,14 +52,14 @@
 		--disable-static \
 		--enable-dnotify \
 		--without-x \
-		--without-xml \
+		--with-xml=$(DBUS_XML) \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid \
 	)
 	touch $@
 
 $(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
-	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so $(STAGING_DIR)/usr/lib/libxml2.so" -C $(DBUS_DIR) all
+	$(MAKE) -C $(DBUS_DIR) all
 
 $(STAGING_DIR)/usr/lib/libdbus-1.so: $(DBUS_DIR)/$(DBUS_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
@@ -70,7 +78,7 @@
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	rm -rf $(TARGET_DIR)/etc/rc.d
 
-dbus: uclibc expat libxml2-headers $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
+dbus: uclibc $(DBUS_XML_DEP) $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
 
 dbus-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
