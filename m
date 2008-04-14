From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Mon, 14 Apr 2008 03:56:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  rpm
Message-ID: <20080414105642.97BB53C3D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-14 03:56:41 -0700 (Mon, 14 Apr 2008)
New Revision: 21732

Log:
* Added rpm


Added:
   trunk/buildroot/package/rpm/
   trunk/buildroot/package/rpm/Config.in
   trunk/buildroot/package/rpm/rpm-dirty-ssl-hack.patch
   trunk/buildroot/package/rpm/rpm-uclibc-ifdefs.patch
   trunk/buildroot/package/rpm/rpm-uclibc-vs-cookie-seek-pointer.patch
   trunk/buildroot/package/rpm/rpm.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-14 01:59:53 UTC (rev 21731)
+++ trunk/buildroot/package/Config.in	2008-04-14 10:56:41 UTC (rev 21732)
@@ -101,6 +101,9 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/psmisc/Config.in"
 endif
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/rpm/Config.in"
+endif
 source "package/sqlite/Config.in"
 source "package/startup-notification/Config.in"
 source "package/strace/Config.in"

Added: trunk/buildroot/package/rpm/Config.in
===================================================================
--- trunk/buildroot/package/rpm/Config.in	                        (rev 0)
+++ trunk/buildroot/package/rpm/Config.in	2008-04-14 10:56:41 UTC (rev 21732)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RPM
+	bool "rpm"
+	default n
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_BEECRYPT
+	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_NEON_EXPAT 	if BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_NEON_LIBXML2	if BR2_PACKAGE_LIBXML2
+	help
+	  The RPM package management system.
+
+	  http://rpm5.org

Added: trunk/buildroot/package/rpm/rpm-dirty-ssl-hack.patch
===================================================================
--- trunk/buildroot/package/rpm/rpm-dirty-ssl-hack.patch	                        (rev 0)
+++ trunk/buildroot/package/rpm/rpm-dirty-ssl-hack.patch	2008-04-14 10:56:41 UTC (rev 21732)
@@ -0,0 +1,12 @@
+diff -ru rpm-5.0.3_vanilla/rpmio/rpmdav.c rpm-5.0.3_dirty-ssl-hack/rpmio/rpmdav.c
+--- rpm-5.0.3_vanilla/rpmio/rpmdav.c	2008-01-29 13:57:50.000000000 +0000
++++ rpm-5.0.3_dirty-ssl-hack/rpmio/rpmdav.c	2008-04-09 17:06:39.000000000 +0000
+@@ -84,7 +84,7 @@
+ /* =============================================================== */
+ void davDestroy(void)
+ {
+-#ifdef NE_FEATURE_SSL
++#if 0
+     if (ne_has_support(NE_FEATURE_SSL)) {
+ /* XXX http://www.nabble.com/Memory-Leaks-in-SSL_Library_init()-t3431875.html */
+ 	ENGINE_cleanup();

Added: trunk/buildroot/package/rpm/rpm-uclibc-ifdefs.patch
===================================================================
--- trunk/buildroot/package/rpm/rpm-uclibc-ifdefs.patch	                        (rev 0)
+++ trunk/buildroot/package/rpm/rpm-uclibc-ifdefs.patch	2008-04-14 10:56:41 UTC (rev 21732)
@@ -0,0 +1,13 @@
+diff -ur rpm-4.4.9_vanilla/rpmio/fts.c rpm-4.4.9_uclibc-ifdefs/rpmio/fts.c
+--- rpm-4.4.9_vanilla/rpmio/fts.c	2007-01-21 15:18:00.000000000 +0000
++++ rpm-4.4.9_uclibc-ifdefs/rpmio/fts.c	2008-03-22 13:26:40.000000000 +0000
+@@ -45,6 +47,9 @@
+ #include <string.h>
+ #include <unistd.h>
+ #else
++#if defined(__UCLIBC__)
++#   define __fxstat64(_stat_ver, _fd, _sbp)	fstat((_fd), (_sbp))
++#endif
+ #if defined(hpux) || defined(__hpux)
+ # define        _INCLUDE_POSIX_SOURCE
+ #   define __errno_location() 	(&errno)

Added: trunk/buildroot/package/rpm/rpm-uclibc-vs-cookie-seek-pointer.patch
===================================================================
--- trunk/buildroot/package/rpm/rpm-uclibc-vs-cookie-seek-pointer.patch	                        (rev 0)
+++ trunk/buildroot/package/rpm/rpm-uclibc-vs-cookie-seek-pointer.patch	2008-04-14 10:56:41 UTC (rev 21732)
@@ -0,0 +1,12 @@
+diff -ru rpm-4.4.9_vanilla/rpmio/rpmio.h rpm-4.4.9_uclibc-vs-cookie-seek-pointer/rpmio/rpmio.h
+--- rpm-4.4.9_vanilla/rpmio/rpmio.h	2007-04-28 15:55:33.000000000 +0000
++++ rpm-4.4.9_uclibc-vs-cookie-seek-pointer/rpmio/rpmio.h	2008-03-22 07:28:07.000000000 +0000
+@@ -31,7 +31,7 @@
+  * typedefs to isolate the lossage.
+  */
+ /*@{*/
+-#if !defined(__LCLINT__) && defined(__GLIBC__) && \
++#if !defined(__LCLINT__) && defined(__GLIBC__) && !defined(__UCLIBC__) && \
+ 	(__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2))
+ #define USE_COOKIE_SEEK_POINTER 1
+ typedef _IO_off64_t 	_libio_off_t;

Added: trunk/buildroot/package/rpm/rpm.mk
===================================================================
--- trunk/buildroot/package/rpm/rpm.mk	                        (rev 0)
+++ trunk/buildroot/package/rpm/rpm.mk	2008-04-14 10:56:41 UTC (rev 21732)
@@ -0,0 +1,25 @@
+#############################################################
+#
+# rpm
+#
+#############################################################
+RPM_VERSION = 5.0.3
+RPM_SITE = http://rpm5.org/files/rpm/rpm-5.0/
+RPM_AUTORECONF = YES
+
+RPM_DEPENDENCIES = zlib beecrypt neon popt
+
+RPM_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon" \
+		ac_cv_va_copy=yes
+
+RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
+	--without-selinux \
+	--without-python --without-perl \
+	--with-zlib=$(STAGING_DIR) \
+	--with-libbeecrypt=$(STAGING_DIR) \
+	--with-popt=$(STAGING_DIR) \
+	$(DISABLE_NLS)
+
+RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
+
+$(eval $(call AUTOTARGETS,package,rpm))
