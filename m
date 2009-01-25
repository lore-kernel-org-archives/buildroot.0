From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 20:55:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20090125205531.E8C1C76D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 20:55:31 +0000 (Sun, 25 Jan 2009)
New Revision: 25021

Log:
Stop dbus continuos rebuild, fix deps

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-01-25 20:53:43 UTC (rev 25020)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-01-25 20:55:31 UTC (rev 25021)
@@ -15,14 +15,17 @@
 DBUS_XML:=expat
 # depend on the exact library file instead of expat so dbus isn't always
 # considered out-of-date
-DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
+DBUS_XML_DEP_LIB:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
 DBUS_XML:=libxml
 # Makefile.autotools.in unfortunately has broken dependency handling,
 # so we cannot do the same for libxml2
-DBUS_XML_DEP:=libxml2-install-staging
+DBUS_XML_DEP_LIB:=$(LIBXML2_HOOK_POST_INSTALL)
+#libxml2-install-staging
 endif
 
+DBUS_XML_DEP:=$(DBUS_XML_DEP_LIB)
+
 $(DL_DIR)/$(DBUS_SOURCE):
 	$(call DOWNLOAD,$(DBUS_SITE),$(DBUS_SOURCE))
 
@@ -64,9 +67,12 @@
 
 $(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
 	$(MAKE) -C $(DBUS_DIR) all
+	touch $@
 
 $(STAGING_DIR)/$(DBUS_TARGET_BINARY): $(DBUS_DIR)/$(DBUS_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libdbus-1.la
+	touch $@
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/$(DBUS_TARGET_BINARY)
 	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/var/lib/dbus $(TARGET_DIR)/etc/init.d
