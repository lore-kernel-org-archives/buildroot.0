From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat, 12 Apr 2008 02:56:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  neon
Message-ID: <20080412095615.AA3FA3C58F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-12 02:56:15 -0700 (Sat, 12 Apr 2008)
New Revision: 21717

Log:
* Added neon


Added:
   trunk/buildroot/package/neon/
   trunk/buildroot/package/neon/Config.in
   trunk/buildroot/package/neon/neon.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-12 09:51:21 UTC (rev 21716)
+++ trunk/buildroot/package/Config.in	2008-04-12 09:56:15 UTC (rev 21717)
@@ -172,6 +172,7 @@
 source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
+source "package/neon/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/netcat/Config.in"
 endif

Added: trunk/buildroot/package/neon/Config.in
===================================================================
--- trunk/buildroot/package/neon/Config.in	                        (rev 0)
+++ trunk/buildroot/package/neon/Config.in	2008-04-12 09:56:15 UTC (rev 21717)
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_NEON
+	bool "libneon"
+	default n
+	help
+	  HTTP and WebDAV client library, with a C interface.
+
+	  http://www.webdav.org/neon/
+
+choice
+	prompt "XML Support"
+	default BR2_PACKAGE_NEON_NOXML
+	depends BR2_PACKAGE_NEON
+	help
+	  Select which XML library to use...
+	  expat      use exapt
+	  libxml2    use libxml2
+	  none       do not build with XML support
+
+config BR2_PACKAGE_NEON_EXPAT
+	bool "expat"
+	depends BR2_PACKAGE_EXPAT
+	help
+	  expat      use exapt, a library for parsing XML.
+
+config BR2_PACKAGE_NEON_LIBXML2
+	bool "libxml2"
+	depends BR2_PACKAGE_LIBXML2
+	help
+	  libxml2    use libxml2, a library to read, modify and 
+	             write XML and HTML files.
+
+config BR2_PACKAGE_NEON_NOXML
+	bool "none"
+	help
+	  none       don't use XML, if this is the only option
+	             and you want XML support, you must choose
+		     XML handling below.
+endchoice

Added: trunk/buildroot/package/neon/neon.mk
===================================================================
--- trunk/buildroot/package/neon/neon.mk	                        (rev 0)
+++ trunk/buildroot/package/neon/neon.mk	2008-04-12 09:56:15 UTC (rev 21717)
@@ -0,0 +1,25 @@
+#############################################################
+#
+# neon
+#
+#############################################################
+NEON_VERSION = 0.28.2
+NEON_SITE = http://www.webdav.org/neon/
+NEON_INSTALL_STAGING = YES
+
+NEON_CONF_OPT+=--enable-shared --without-gssapi --disable-rpath
+
+NEON_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+
+ifeq ($(strip $(BR2_PACKAGE_NEON_LIBXML2)),y)
+NEON_CONF_OPT+=--with-libxml2=yes
+NEON_CONF_OPT+=--with-expat=no
+NEON_DEPENDENCIES+=libxml2
+endif
+ifeq ($(strip $(BR2_PACKAGE_NEON_EXPAT)),y)
+NEON_CONF_OPT+=--with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
+NEON_CONF_OPT+=--with-libxml2=no
+NEON_DEPENDENCIES+=expat
+endif
+
+$(eval $(call AUTOTARGETS,package,neon))
