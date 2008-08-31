From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 31 Aug 2008 13:23:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20080831202341.D772A3C6DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-31 13:23:41 -0700 (Sun, 31 Aug 2008)
New Revision: 23286

Log:
libglib2: fix build with/without locale support

Don't select BR2_ENABLE_LOCALE. Glib works without locale support in
toolchain, and packages shouldn't silently select toolchain options.

Only select libiconv if locale support isn't enabled.

Modified:
   trunk/buildroot/package/libglib2/Config.in
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/Config.in
===================================================================
--- trunk/buildroot/package/libglib2/Config.in	2008-08-31 20:23:37 UTC (rev 23285)
+++ trunk/buildroot/package/libglib2/Config.in	2008-08-31 20:23:41 UTC (rev 23286)
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
-	select BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_GETTEXT
 	select BR2_PACKAGE_LIBINTL
-	select BR2_PACKAGE_LIBICONV
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-08-31 20:23:37 UTC (rev 23285)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-08-31 20:23:41 UTC (rev 23286)
@@ -47,6 +47,10 @@
 LIBGLIB2_CONF_OPT = --enable-shared \
 		--enable-static $(DISABLE_NLS)
 
-LIBGLIB2_DEPENDENCIES = uclibc gettext libintl libiconv pkgconfig
+LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
 
+ifneq ($(BR2_ENABLE_LOCALE),y)
+LIBGLIB2_DEPENDENCIES+=libiconv
+endif
+
 $(eval $(call AUTOTARGETS,package,libglib2))
