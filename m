From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 00:29:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080827072921.BE910F8014@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 00:29:20 -0700 (Wed, 27 Aug 2008)
New Revision: 23235

Log:
avahi: fix build with BR2_ENABLE_LOCALE

Modified:
   trunk/buildroot/package/avahi/Config.in
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2008-08-27 07:29:16 UTC (rev 23234)
+++ trunk/buildroot/package/avahi/Config.in	2008-08-27 07:29:20 UTC (rev 23235)
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
 	select BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
 	help
 	  Avahi is a system which facilitates service
 	  discovery on a local network.

Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-08-27 07:29:16 UTC (rev 23234)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-08-27 07:29:20 UTC (rev 23235)
@@ -142,7 +142,7 @@
 	touch $@
 
 $(AVAHI_DIR)/.compiled: $(AVAHI_DIR)/.configured
-	$(MAKE) -C $(AVAHI_DIR)
+	$(MAKE) -C $(AVAHI_DIR) $(if $(BR2_ENABLE_LOCALE),LIBS=-lintl)
 	touch $@
 
 $(AVAHI_DIR)/.installed: $(AVAHI_DIR)/.compiled
@@ -180,7 +180,7 @@
 		 $(TARGET_DIR)/usr/sbin/avahi-daemon
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-avahi: uclibc libdaemon $(AVAHI_TARGETS)
+avahi: uclibc libdaemon $(AVAHI_TARGETS) $(if $(BR2_ENABLE_LOCALE),gettext libintl)
 
 avahi-clean:
 	-$(MAKE) -C $(AVAHI_DIR) distclean
