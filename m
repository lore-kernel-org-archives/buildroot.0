From: correa at uclibc.org <correa@uclibc.org>
Date: Thu,  3 Jul 2008 19:23:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/atk
Message-ID: <20080704022320.2F0D63C608@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-07-03 19:23:19 -0700 (Thu, 03 Jul 2008)
New Revision: 22621

Log:
Fix bug #3594: ATK does not always require X support to be compiled

Modified:
   trunk/buildroot/package/atk/atk.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2008-07-04 02:12:21 UTC (rev 22620)
+++ trunk/buildroot/package/atk/atk.mk	2008-07-04 02:23:19 UTC (rev 22621)
@@ -42,6 +42,14 @@
 		gl_cv_c_restrict=no ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no 
 
+ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ATK_CONF_OPT_X = --with-x \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib
+else
+ATK_CONF_OPT_X = --without-x
+endif
+
 ATK_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
 		--exec-prefix=/usr --bindir=/usr/bin \
@@ -50,9 +58,7 @@
 		--datadir=/usr/share --localstatedir=/var \
 		--includedir=/usr/include --mandir=/usr/man \
 		--infodir=/usr/info --enable-shared \
-		--enable-static --with-x \
-		--x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib \
+		--enable-static $(ATK_CONF_OPT_X) \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug 
 
