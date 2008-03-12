From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Wed, 12 Mar 2008 07:51:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20080312145134.2589F120132@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-12 07:51:32 -0700 (Wed, 12 Mar 2008)
New Revision: 21317

Log:
fix dbus makefile to install with or without stripping

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-03-12 13:57:59 UTC (rev 21316)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-03-12 14:51:32 UTC (rev 21317)
@@ -66,8 +66,13 @@
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
 	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/var/lib/dbus $(TARGET_DIR)/etc/init.d
+ifeq ($(BR2_STRIP_none),y)
+	$(MAKE) DESTDIR=$(TARGET_DIR) \
+		initdir=/etc/init.d -C $(DBUS_DIR) install
+else
 	$(MAKE) DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' \
 		initdir=/etc/init.d -C $(DBUS_DIR) install-strip
+endif
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0 \
 		$(TARGET_DIR)/usr/lib/libdbus-1.la \
 		$(TARGET_DIR)/usr/include/dbus-1.0 \
