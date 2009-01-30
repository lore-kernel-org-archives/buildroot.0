From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 13:54:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: 0 dbus libxml2
Message-ID: <20090130135443.98285765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 13:54:42 +0000 (Fri, 30 Jan 2009)
New Revision: 25167

Log:
dbus: revert r25156 (Fix dbus dependency on libxml2, without rebuild, works but may need refinement)

As discussed on the list - Too complicated and wrong.

Removed:
   trunk/buildroot/package/0/0-run-first.mk

Modified:
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Deleted: trunk/buildroot/package/0/0-run-first.mk
===================================================================
--- trunk/buildroot/package/0/0-run-first.mk	2009-01-30 13:34:42 UTC (rev 25166)
+++ trunk/buildroot/package/0/0-run-first.mk	2009-01-30 13:54:42 UTC (rev 25167)
@@ -1,4 +0,0 @@
-ifeq ($(BR2_TARGET_LIBXML2),y)
-TARGETS+=libxml2
-endif
-

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-01-30 13:34:42 UTC (rev 25166)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-01-30 13:54:42 UTC (rev 25167)
@@ -15,17 +15,17 @@
 DBUS_XML:=expat
 # depend on the exact library file instead of expat so dbus isn't always
 # considered out-of-date
-DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
+DBUS_XML_DEP_LIB:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
 DBUS_XML:=libxml
 # Makefile.autotools.in unfortunately has broken dependency handling,
 # so we cannot do the same for libxml2
-DBUS_XML_DEP:=$(LIBXML2_HOOK_POST_INSTALL)
+DBUS_XML_DEP_LIB:=$(LIBXML2_HOOK_POST_INSTALL)
 #libxml2-install-staging
 endif
 
+DBUS_XML_DEP:=$(DBUS_XML_DEP_LIB)
 
-
 $(DL_DIR)/$(DBUS_SOURCE):
 	$(call DOWNLOAD,$(DBUS_SITE),$(DBUS_SOURCE))
 
@@ -37,7 +37,6 @@
 
 $(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked $(DBUS_XML_DEP)
 	(cd $(DBUS_DIR); rm -rf config.cache; \
-		echo "dbus is depending on  $(DBUS_XML_DEP)"; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		ac_cv_have_abstract_sockets=yes \

Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2009-01-30 13:34:42 UTC (rev 25166)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2009-01-30 13:54:42 UTC (rev 25167)
@@ -8,7 +8,7 @@
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_INSTALL_TARGET = YES
-LIBXML2_LIBTOOL_PATCH = NO
+
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
@@ -27,21 +27,10 @@
 	rm -f $(LIBXML2_DIR)/macos/src/XMLTestPrefix.h.rej
 	touch $@
 
-$(LIBXML2_HOOK_POST_INSTALL):\
-	$(LIBXML2_TARGET_SOURCE)		\
-	$(LIBXML2_TARGET_EXTRACT)		\
-	$(LIBXML2_HOOK_POST_EXTRACT)		\
-	$(LIBXML2_TARGET_PATCH)			\
-	$(LIBXML2_TARGET_AUTORECONF)		\
-	$(LIBXML2_TARGET_CONFIGURE)		\
-	$(LIBXML2_TARGET_LIBTOOL_PATCH)		\
-	$(LIBXML2_TARGET_BUILD)			\
-	$(LIBXML2_HOOK_POST_BUILD)		\
-	$(LIBXML2_TARGET_INSTALL_STAGING)
+$(LIBXML2_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	rm -rf $(TARGET_DIR)/usr/share/aclocal \
 	       $(TARGET_DIR)/usr/share/doc/libxml2-$(LIBXML2_VERSION) \
 	       $(TARGET_DIR)/usr/share/gtk-doc
 	touch $@
-
