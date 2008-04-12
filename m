From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat, 12 Apr 2008 02:51:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  popt
Message-ID: <20080412095121.C5A183C5A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-12 02:51:21 -0700 (Sat, 12 Apr 2008)
New Revision: 21716

Log:
* Added popt


Added:
   trunk/buildroot/package/popt/
   trunk/buildroot/package/popt/Config.in
   trunk/buildroot/package/popt/popt-1.14_no-wchar.patch
   trunk/buildroot/package/popt/popt.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-12 09:45:49 UTC (rev 21715)
+++ trunk/buildroot/package/Config.in	2008-04-12 09:51:21 UTC (rev 21716)
@@ -93,6 +93,7 @@
 source "package/modutils/Config.in"
 endif
 source "package/ng-spice-rework/Config.in"
+source "package/popt/Config.in"
 source "package/portage/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/procps/Config.in"

Added: trunk/buildroot/package/popt/Config.in
===================================================================
--- trunk/buildroot/package/popt/Config.in	                        (rev 0)
+++ trunk/buildroot/package/popt/Config.in	2008-04-12 09:51:21 UTC (rev 21716)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_POPT
+	bool "popt"
+	default n
+	help
+	  Popt is a C library for parsing command line parameters.
+
+	  http://rpm5.org

Added: trunk/buildroot/package/popt/popt-1.14_no-wchar.patch
===================================================================
--- trunk/buildroot/package/popt/popt-1.14_no-wchar.patch	                        (rev 0)
+++ trunk/buildroot/package/popt/popt-1.14_no-wchar.patch	2008-04-12 09:51:21 UTC (rev 21716)
@@ -0,0 +1,12 @@
+diff -ru popt-1.14_vanilla/popthelp.c popt-1.14_no-wchar/popthelp.c
+--- popt-1.14_vanilla/popthelp.c	2008-03-27 17:33:08.000000000 +0000
++++ popt-1.14_no-wchar/popthelp.c	2008-04-10 05:44:43.000000000 +0000
+@@ -15,7 +15,7 @@
+ #include <sys/ioctl.h>
+ #endif
+ 
+-#define	POPT_WCHAR_HACK
++/* #define	POPT_WCHAR_HACK */
+ #ifdef 	POPT_WCHAR_HACK
+ #include <wchar.h>			/* for mbsrtowcs */
+ /*@access mbstate_t @*/

Added: trunk/buildroot/package/popt/popt.mk
===================================================================
--- trunk/buildroot/package/popt/popt.mk	                        (rev 0)
+++ trunk/buildroot/package/popt/popt.mk	2008-04-12 09:51:21 UTC (rev 21716)
@@ -0,0 +1,20 @@
+#############################################################
+#
+# popt
+#
+#############################################################
+POPT_VERSION = 1.14
+POPT_SITE = http://rpm5.org/files/popt
+POPT_INSTALL_STAGING = YES
+
+
+POPT_CONF_ENV = ac_cv_va_copy=yes 
+
+
+POPT_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(REAL_GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr
+
+POPT_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+
+
+$(eval $(call AUTOTARGETS,package,popt))
