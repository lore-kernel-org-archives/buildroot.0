From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Fri, 30 Jan 2009 09:27:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: 0 dbus libxml2
In-Reply-To: <20090130074016.0A323765E9@busybox.osuosl.org>
References: <20090130074016.0A323765E9@busybox.osuosl.org>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F1AF39BE4AC@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How is the dependency checking broken? are you saying that if you build dbus with out XML2 support and then enable XML2 support DBUS does not rebuild?
This does seems like a rather specific fix that fixes just packages that depend on LIBXML2.

It seems that the changes to LIBXML2 rather spoil the point of Makefile.autotools.in which is to make the package makefiles as simple and common as possible.

Cheers
Dan

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of ulf at uclibc.org
Sent: 2009 Jan 30 07:40
To: buildroot at uclibc.org
Subject: [Buildroot] svn commit: trunk/buildroot/package: 0 dbus libxml2

Author: ulf
Date: 2009-01-30 07:40:14 +0000 (Fri, 30 Jan 2009)
New Revision: 25156

Log:
Fix dbus dependency on libxml2, without rebuild, works but may need refinement

Added:
   trunk/buildroot/package/0/
   trunk/buildroot/package/0/0-run-first.mk

Modified:
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Added: trunk/buildroot/package/0/0-run-first.mk
===================================================================
--- trunk/buildroot/package/0/0-run-first.mk	                        (rev 0)
+++ trunk/buildroot/package/0/0-run-first.mk	2009-01-30 07:40:14 UTC (rev 25156)
@@ -0,0 +1,4 @@
+ifeq ($(BR2_TARGET_LIBXML2),y)
+TARGETS+=libxml2
+endif
+

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-01-29 23:32:06 UTC (rev 25155)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-01-30 07:40:14 UTC (rev 25156)
@@ -15,17 +15,17 @@
 DBUS_XML:=expat
 # depend on the exact library file instead of expat so dbus isn't always
 # considered out-of-date
-DBUS_XML_DEP_LIB:=$(STAGING_DIR)/usr/lib/libexpat.so.1
+DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
 DBUS_XML:=libxml
 # Makefile.autotools.in unfortunately has broken dependency handling,
 # so we cannot do the same for libxml2
-DBUS_XML_DEP_LIB:=$(LIBXML2_HOOK_POST_INSTALL)
+DBUS_XML_DEP:=$(LIBXML2_HOOK_POST_INSTALL)
 #libxml2-install-staging
 endif
 
-DBUS_XML_DEP:=$(DBUS_XML_DEP_LIB)
 
+
 $(DL_DIR)/$(DBUS_SOURCE):
 	$(call DOWNLOAD,$(DBUS_SITE),$(DBUS_SOURCE))
 
@@ -37,6 +37,7 @@
 
 $(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked $(DBUS_XML_DEP)
 	(cd $(DBUS_DIR); rm -rf config.cache; \
+		echo "dbus is depending on  $(DBUS_XML_DEP)"; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		ac_cv_have_abstract_sockets=yes \

Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2009-01-29 23:32:06 UTC (rev 25155)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2009-01-30 07:40:14 UTC (rev 25156)
@@ -8,7 +8,7 @@
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_INSTALL_TARGET = YES
-
+LIBXML2_LIBTOOL_PATCH = NO
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
@@ -27,10 +27,21 @@
 	rm -f $(LIBXML2_DIR)/macos/src/XMLTestPrefix.h.rej
 	touch $@
 
-$(LIBXML2_HOOK_POST_INSTALL):
+$(LIBXML2_HOOK_POST_INSTALL):\
+	$(LIBXML2_TARGET_SOURCE)		\
+	$(LIBXML2_TARGET_EXTRACT)		\
+	$(LIBXML2_HOOK_POST_EXTRACT)		\
+	$(LIBXML2_TARGET_PATCH)			\
+	$(LIBXML2_TARGET_AUTORECONF)		\
+	$(LIBXML2_TARGET_CONFIGURE)		\
+	$(LIBXML2_TARGET_LIBTOOL_PATCH)		\
+	$(LIBXML2_TARGET_BUILD)			\
+	$(LIBXML2_HOOK_POST_BUILD)		\
+	$(LIBXML2_TARGET_INSTALL_STAGING)
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	rm -rf $(TARGET_DIR)/usr/share/aclocal \
 	       $(TARGET_DIR)/usr/share/doc/libxml2-$(LIBXML2_VERSION) \
 	       $(TARGET_DIR)/usr/share/gtk-doc
 	touch $@
+

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
