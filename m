From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 13:54:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20090130135447.AC162765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 13:54:47 +0000 (Fri, 30 Jan 2009)
New Revision: 25168

Log:
dbus: fix xml dependency and stop continous rebuilds

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-01-30 13:54:42 UTC (rev 25167)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-01-30 13:54:47 UTC (rev 25168)
@@ -13,19 +13,12 @@
 
 ifeq ($(BR2_DBUS_EXPAT),y)
 DBUS_XML:=expat
-# depend on the exact library file instead of expat so dbus isn't always
-# considered out-of-date
-DBUS_XML_DEP_LIB:=$(STAGING_DIR)/usr/lib/libexpat.so.1
+DBUS_XML_DEP:=expat
 else
 DBUS_XML:=libxml
-# Makefile.autotools.in unfortunately has broken dependency handling,
-# so we cannot do the same for libxml2
-DBUS_XML_DEP_LIB:=$(LIBXML2_HOOK_POST_INSTALL)
-#libxml2-install-staging
+DBUS_XML_DEP:=libxml2
 endif
 
-DBUS_XML_DEP:=$(DBUS_XML_DEP_LIB)
-
 $(DL_DIR)/$(DBUS_SOURCE):
 	$(call DOWNLOAD,$(DBUS_SITE),$(DBUS_SOURCE))
 
@@ -35,7 +28,7 @@
 	$(DBUS_CAT) $(DL_DIR)/$(DBUS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked $(DBUS_XML_DEP)
+$(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked
 	(cd $(DBUS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -93,7 +86,7 @@
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
 
-dbus: uclibc pkgconfig $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
+dbus: uclibc pkgconfig $(DBUS_XML_DEP) $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
 
 dbus-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
