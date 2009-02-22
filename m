From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 22 Feb 2009 20:12:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20090222201251.023FF7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-22 20:12:50 +0000 (Sun, 22 Feb 2009)
New Revision: 25413

Log:
dbus: convert to Makefile.autotools.in and bump version

Added:
   trunk/buildroot/package/dbus/dbus-1.2.12-launch-helper-xml-fix.patch

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Added: trunk/buildroot/package/dbus/dbus-1.2.12-launch-helper-xml-fix.patch
===================================================================
--- trunk/buildroot/package/dbus/dbus-1.2.12-launch-helper-xml-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/dbus/dbus-1.2.12-launch-helper-xml-fix.patch	2009-02-22 20:12:50 UTC (rev 25413)
@@ -0,0 +1,33 @@
+dbus-daemon-launch-helper: fix build with libxml
+
+dbus-daemon-launch-helper links with the trival config parser, which
+doesn't provide bus_config_parser_check_doctype(), like the big parser does.
+The libxml loader unfortunately wants to call it, so this breaks the build.
+
+Fix it by including a dummy bus_config_parser_check_doctype() in the trivial
+config parser.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ bus/config-parser-trivial.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Index: dbus-1.2.12/bus/config-parser-trivial.c
+===================================================================
+--- dbus-1.2.12.orig/bus/config-parser-trivial.c
++++ dbus-1.2.12/bus/config-parser-trivial.c
+@@ -310,6 +310,14 @@
+   return &parser->service_dirs;
+ }
+ 
++dbus_bool_t
++bus_config_parser_check_doctype (BusConfigParser   *parser,
++                                 const char        *doctype,
++                                 DBusError         *error)
++{
++    return TRUE;
++}
++
+ #ifdef DBUS_BUILD_TESTS
+ #include <stdio.h>
+ #include "test.h"

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-02-22 10:57:23 UTC (rev 25412)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-02-22 20:12:50 UTC (rev 25413)
@@ -3,53 +3,31 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION:=1.1.1
-DBUS_SOURCE:=dbus-$(DBUS_VERSION).tar.gz
-DBUS_SITE:=http://dbus.freedesktop.org/releases/dbus/
-DBUS_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VERSION)
-DBUS_CAT:=$(ZCAT)
-DBUS_BINARY:=bus/dbus-daemon
-DBUS_TARGET_BINARY:=usr/bin/dbus-daemon
+DBUS_VERSION = 1.2.12
+DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
+DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
+DBUS_INSTALL_STAGING = YES
+DBUS_INSTALL_TARGET = YES
+ifeq ($(BR2_ENABLE_DEBUG),y)
+# install-exec doesn't install the config file
+DBUS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+else
+# install-strip uses host strip
+DBUS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip STRIPPROG="$(STRIPCMD)"
+endif
 
+DBUS_DEPENDENCIES = uclibc pkgconfig
+
 ifeq ($(BR2_DBUS_EXPAT),y)
 DBUS_XML:=expat
-# depend on the exact library file instead of expat so dbus isn't always
-# considered out-of-date
-DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
+DBUS_DEPENDENCIES += ezxml
 else
 DBUS_XML:=libxml
-# Makefile.autotools.in unfortunately has broken dependency handling,
-# so we cannot do the same for libxml2 as the targets (like
-# libxml2-install-staging) are phony and hence, dbus will always be
-# considered out-of-date. Using the corresponding .stamp_* files (E.G.
-# LIBXML2_TARGET_INSTALL_STAGING doesn't work as there's no dependency
-# information between them.
-DBUS_XML_DEP:=libxml2-install-staging
+DBUS_DEPENDENCIES += libxml2
 endif
 
-$(DL_DIR)/$(DBUS_SOURCE):
-	$(call DOWNLOAD,$(DBUS_SITE),$(DBUS_SOURCE))
-
-dbus-source: $(DL_DIR)/$(DBUS_SOURCE)
-
-$(DBUS_DIR)/.unpacked: $(DL_DIR)/$(DBUS_SOURCE)
-	$(DBUS_CAT) $(DL_DIR)/$(DBUS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked $(DBUS_XML_DEP)
-	(cd $(DBUS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_have_abstract_sockets=yes \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--localstatedir=/var \
-		--program-prefix="" \
-		--sysconfdir=/etc \
+DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
+DBUS_CONF_OPT = --program-prefix="" \
 		--with-dbus-user=dbus \
 		--disable-tests \
 		--disable-asserts \
@@ -62,62 +40,11 @@
 		--without-x \
 		--with-xml=$(DBUS_XML) \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
-		--with-system-pid-file=/var/run/messagebus.pid \
-	)
-	touch $@
+		--with-system-pid-file=/var/run/messagebus.pid
 
-$(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
-	$(MAKE) -C $(DBUS_DIR) all
-	touch $@
+$(eval $(call AUTOTARGETS,package,dbus))
 
-$(STAGING_DIR)/$(DBUS_TARGET_BINARY): $(DBUS_DIR)/$(DBUS_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libdbus-1.la
-	touch $@
-
-$(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/$(DBUS_TARGET_BINARY)
-	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/var/lib/dbus $(TARGET_DIR)/etc/init.d
-ifeq ($(BR2_STRIP_none),y)
-	$(MAKE) DESTDIR=$(TARGET_DIR) \
-		initdir=/etc/init.d -C $(DBUS_DIR) install
-else
-	$(MAKE) DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' \
-		initdir=/etc/init.d -C $(DBUS_DIR) install-strip
-endif
-	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0 \
-		$(TARGET_DIR)/usr/lib/libdbus-1.la \
-		$(TARGET_DIR)/usr/include/dbus-1.0 \
-		$(TARGET_DIR)/usr/lib/pkgconfig
+$(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
+	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
 	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
-	rm -f $(TARGET_DIR)/etc/init.d/messagebus
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-
-dbus: uclibc pkgconfig $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
-
-dbus-clean:
-	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
-	rm -f $(TARGET_DIR)/etc/dbus-1/system.conf
-	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/dbus-1/system.d
-	rm -f $(TARGET_DIR)/etc/init.d/S30dbus
-	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.so*
-	rm -f $(TARGET_DIR)/usr/bin/dbus-daemon
-	rm -rf $(TARGET_DIR)/tmp/dbus
-	rm -f $(STAGING_DIR)/usr/lib/libdbus-1.*
-	rm -rf $(STAGING_DIR)/usr/lib/dbus-1.0
-	rm -rf $(STAGING_DIR)/usr/include/dbus-1.0
-	rmdir --ignore-fail-on-non-empty $(STAGING_DIR)/usr/include
-	-$(MAKE) -C $(DBUS_DIR) clean
-
-dbus-dirclean:
-	rm -rf $(DBUS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DBUS),y)
-TARGETS+=dbus
-endif
+	touch $@
