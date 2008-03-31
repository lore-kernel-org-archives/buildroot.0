From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 12:36:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20080331193609.574FF3C2E6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 12:36:08 -0700 (Mon, 31 Mar 2008)
New Revision: 21598

Log:
dbus: use dbus-daemon as target for staging_dir installation

Use dbus-daemon as target for staging_dir installation instead of
library, as that changes name with soname changes.


Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-03-31 15:07:48 UTC (rev 21597)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-03-31 19:36:08 UTC (rev 21598)
@@ -61,10 +61,10 @@
 $(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
 	$(MAKE) -C $(DBUS_DIR) all
 
-$(STAGING_DIR)/usr/lib/libdbus-1.so: $(DBUS_DIR)/$(DBUS_BINARY)
+$(STAGING_DIR)/$(DBUS_TARGET_BINARY): $(DBUS_DIR)/$(DBUS_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR) install
 
-$(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
+$(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/$(DBUS_TARGET_BINARY)
 	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/var/lib/dbus $(TARGET_DIR)/etc/init.d
 ifeq ($(BR2_STRIP_none),y)
 	$(MAKE) DESTDIR=$(TARGET_DIR) \
