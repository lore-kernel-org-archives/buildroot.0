From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Wed, 14 Nov 2007 01:41:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kismet
Message-ID: <20071114094122.BF3B030048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2007-11-14 01:41:21 -0800 (Wed, 14 Nov 2007)
New Revision: 20421

Log:
This will hopefully address the comment on bug #1557


Modified:
   trunk/buildroot/package/kismet/Config.in
   trunk/buildroot/package/kismet/kismet.mk


Changeset:
Modified: trunk/buildroot/package/kismet/Config.in
===================================================================
--- trunk/buildroot/package/kismet/Config.in	2007-11-13 22:23:57 UTC (rev 20420)
+++ trunk/buildroot/package/kismet/Config.in	2007-11-14 09:41:21 UTC (rev 20421)
@@ -2,6 +2,9 @@
 	bool "kismet"
 	select BR2_PACKAGE_NCURSES 
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+
 	default n
 	help
 		Kismet - 802.11 layer2 wireless network detector, sniffer, and intrusion detection system

Modified: trunk/buildroot/package/kismet/kismet.mk
===================================================================
--- trunk/buildroot/package/kismet/kismet.mk	2007-11-13 22:23:57 UTC (rev 20420)
+++ trunk/buildroot/package/kismet/kismet.mk	2007-11-14 09:41:21 UTC (rev 20421)
@@ -25,6 +25,11 @@
 	(cd $(KISMET_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
+		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
+		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
+		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
+		PKG_CONFIG=/usr/bin/pkg-config \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -40,12 +45,18 @@
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
 	)
 	touch $@
 
 $(KISMET_DIR)/$(KISMET_BINARY): $(KISMET_DIR)/.configured
 	$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
 		-C $(KISMET_DIR)
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(KISMET_DIR)/kismet
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(KISMET_DIR)/kismet_client
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(KISMET_DIR)/kismet_drone
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(KISMET_DIR)/kismet_server
 
 $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/$(KISMET_BINARY): $(KISMET_DIR)/$(KISMET_BINARY)
 	install -m 755 $(KISMET_DIR)/kismet $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet
