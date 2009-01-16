From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 16 Jan 2009 21:18:11 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20090116211811.BB15C7757D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-16 21:18:08 +0000 (Fri, 16 Jan 2009)
New Revision: 24888

Log:
Fix libglib2 build when LIBICONV is selected, clean up versioning

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-01-16 19:45:21 UTC (rev 24887)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-01-16 21:18:08 UTC (rev 24888)
@@ -3,9 +3,12 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION = 2.16.6
+LIBGLIB2_VERSION_MAJOR = 2.16
+LIBGLIB2_VERSION_MINOR = 6
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
-LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/2.16
+LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
+
 LIBGLIB2_AUTORECONF = NO
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
@@ -55,4 +58,9 @@
 LIBGLIB2_DEPENDENCIES+=libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+LIBGLIB2_CONF_OPT += --with-libiconv=gnu
+LIBGLIB2_DEPENDENCIES+=libiconv
+endif
+
 $(eval $(call AUTOTARGETS,package,libglib2))
