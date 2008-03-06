From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:55:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  blackbox
Message-ID: <20080306175527.2AA701201B1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:55:26 -0800 (Thu, 06 Mar 2008)
New Revision: 21182

Log:
added blackbox window manager

Added:
   trunk/buildroot/package/blackbox/
   trunk/buildroot/package/blackbox/Config.in
   trunk/buildroot/package/blackbox/blackbox-0.70.1-configure.patch
   trunk/buildroot/package/blackbox/blackbox.mk


Changeset:
Added: trunk/buildroot/package/blackbox/Config.in
===================================================================
--- trunk/buildroot/package/blackbox/Config.in	                        (rev 0)
+++ trunk/buildroot/package/blackbox/Config.in	2008-03-06 17:55:26 UTC (rev 21182)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BLACKBOX
+	bool "blackbox"
+	default n
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	help
+	  Blackbox is a fast, lightweight window manager for the X Window System.
+
+	  http://blackboxwm.sourceforge.net/
+
+comment "blackbox		- disabled (requires Xorg(7))"
+	depends !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)

Added: trunk/buildroot/package/blackbox/blackbox-0.70.1-configure.patch
===================================================================
--- trunk/buildroot/package/blackbox/blackbox-0.70.1-configure.patch	                        (rev 0)
+++ trunk/buildroot/package/blackbox/blackbox-0.70.1-configure.patch	2008-03-06 17:55:26 UTC (rev 21182)
@@ -0,0 +1,15 @@
+--- a/configure	2005-11-03 03:27:16.000000000 -0500
++++ b/configure	2008-02-02 23:25:25.000000000 -0500
+@@ -1980,12 +1980,6 @@ am__tar='${AMTAR} chof - "$$tardir"'; am
+ 
+ test "x$prefix" = "xNONE" && prefix="$ac_default_prefix"
+ 
+-CPPFLAGS="$CPPFLAGS -I$prefix/include"
+-LDFLAGS="$LDFLAGS -L$prefix/lib"
+-if test "x$prefix" != "x/usr/local"; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-  LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-fi
+ 
+ ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'

Added: trunk/buildroot/package/blackbox/blackbox.mk
===================================================================
--- trunk/buildroot/package/blackbox/blackbox.mk	                        (rev 0)
+++ trunk/buildroot/package/blackbox/blackbox.mk	2008-03-06 17:55:26 UTC (rev 21182)
@@ -0,0 +1,23 @@
+#############################################################
+#
+# blackbox
+#
+#############################################################
+
+BLACKBOX_VERSION = 0.70.1
+BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
+BLACKBOX_SITE = http://superb-west.dl.sourceforge.net/sourceforge/blackboxwm/
+BLACKBOX_AUTORECONF = NO
+BLACKBOX_INSTALL_STAGING = NO
+BLACKBOX_INSTALL_TARGET = YES
+BLACKBOX_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+BLACKBOX_CONF_OPT =	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr \
+		--sysconfdir=/etc --x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib 
+
+
+BLACKBOX_DEPENDENCIES = uclibc $(XSERVER)
+
+$(eval $(call AUTOTARGETS,package,blackbox))
