From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Mar 2009 22:47:22 +0000 (UTC)
Subject: [Buildroot] svn commit: [25602] trunk/buildroot/package/avahi
Message-ID: <20090310224722.526F5764F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-10 22:47:21 +0000 (Tue, 10 Mar 2009)
New Revision: 25602

Log:
avahi: fix build with libintl but without locale support in toolchain

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-03-10 22:01:06 UTC (rev 25601)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-03-10 22:47:21 UTC (rev 25602)
@@ -92,7 +92,7 @@
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),gettext libintl)
+AVAHI_DEPENDENCIES = $(if $(BR2_PACKAGE_GETTEXT),gettext)
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
@@ -113,7 +113,8 @@
 AVAHI_CONF_OPT += --disable-dbus
 endif
 
-ifeq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_PACKAGE_LIBINTL),y)
+AVAHI_DEPENDENCIES += libintl
 AVAHI_MAKE_OPT = LIBS=-lintl
 endif
 
