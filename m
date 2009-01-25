From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 08:16:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/liboil
Message-ID: <20090125081654.4A59076D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 08:16:53 +0000 (Sun, 25 Jan 2009)
New Revision: 25012

Log:
liboil make fails on ARM with release toolset for a few unneeded examples due to use of hidden __clz_tab, do not build them for now, but problem may need further examination

Modified:
   trunk/buildroot/package/liboil/liboil.mk


Changeset:
Modified: trunk/buildroot/package/liboil/liboil.mk
===================================================================
--- trunk/buildroot/package/liboil/liboil.mk	2009-01-25 08:14:37 UTC (rev 25011)
+++ trunk/buildroot/package/liboil/liboil.mk	2009-01-25 08:16:53 UTC (rev 25012)
@@ -26,6 +26,8 @@
 LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
 endif
 
+LIBOIL_CONF_OPT+=--with-gnu-ld
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 LIBOIL_GLIB_DEP = libglib2
 endif
@@ -42,3 +44,8 @@
 	# Remove useless bugreport program from the target
 	rm -f $(TARGET_DIR)/usr/bin/oil-bugreport
 	touch $@
+
+$(LIBOIL_HOOK_POST_CONFIGURE):
+	$(SED) 's/uberopt//g' $(LIBOIL_DIR)/examples/Makefile
+	$(SED) 's/work//g' $(LIBOIL_DIR)/examples/Makefile
+
