From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Jun 2008 14:45:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20080620214522.DF0353C7AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-20 14:45:21 -0700 (Fri, 20 Jun 2008)
New Revision: 22461

Log:
dbus: depend on libxml2-install-staging instead for libxml2

Makefile.autools.in doesn't have proper dependencies set up for
the .stamp files, so use the libxml2-install-staging target instead.
This does unfortunately mean that dbus is always considered out of
date, but atleast it works.


Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-06-20 20:20:54 UTC (rev 22460)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-06-20 21:45:21 UTC (rev 22461)
@@ -18,12 +18,9 @@
 DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
 DBUS_XML:=libxml
-# depend on the exact target instead of libxml2 so dbus isn't always
-# considered out-of-date.
-# It would be neat to use $(LIBXML2_TARGET_INSTALL_STAGING) here,
-# but the libxml2 makefile is only parsed after dbus, so that doesn't work
-DBUS_XML_DEP:=$(BUILD_DIR)/libxml2-2.6.29/.stamp_staging_installed
-$(LIBXML2_TARGET_INSTALL_STAGING)
+# Makefile.autotools.in unfortunately has broken dependency handling,
+# so we cannot do the same for libxml2
+DBUS_XML_DEP:=libxml2-install-staging
 endif
 
 $(DL_DIR)/$(DBUS_SOURCE):
