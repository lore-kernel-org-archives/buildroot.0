From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 01:20:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lighttpd
Message-ID: <20080705082035.1A57E3C682@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 01:20:34 -0700 (Sat, 05 Jul 2008)
New Revision: 22648

Log:
[0002974] add support for zlib and bzip2 in lighttpd, use alphabetical order for lighttpd config

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/lighttpd/Config.in
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-07-05 07:44:28 UTC (rev 22647)
+++ trunk/buildroot/package/Config.in	2008-07-05 08:20:34 UTC (rev 22648)
@@ -173,6 +173,9 @@
 source "package/libeXosip2/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/lighttpd/Config.in"
+endif
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
 source "package/mdnsresponder/Config.in"
@@ -213,7 +216,6 @@
 source "package/tcpdump/Config.in"
 source "package/tftpd/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-source "package/lighttpd/Config.in"
 source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
 endif

Modified: trunk/buildroot/package/lighttpd/Config.in
===================================================================
--- trunk/buildroot/package/lighttpd/Config.in	2008-07-05 07:44:28 UTC (rev 22647)
+++ trunk/buildroot/package/lighttpd/Config.in	2008-07-05 08:20:34 UTC (rev 22648)
@@ -16,13 +16,29 @@
 menu "lighttpd packages"
 
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
-	bool "openssl"
+	bool "lighttpd openssl support"
 	default y
 	depends on BR2_PACKAGE_LIGHTTPD
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable OpenSSL support for lighttpd.
 
+config BR2_PACKAGE_LIGHTTPD_ZLIB
+	bool "lighttpd zlib support"
+	default n
+	depends on BR2_PACKAGE_LIGHTTPD
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable zlib support for lighttpd mod_compress.
+
+config BR2_PACKAGE_LIGHTTPD_BZIP2
+	bool "lighttpd bzip2 support"
+	default n
+	depends on BR2_PACKAGE_LIGHTTPD
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bzip2 support for lighttpd mod_compress.
+
 config BR2_PACKAGE_LIGHTTPD_PCRE
 	bool "pcre"
 	default n

Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2008-07-05 07:44:28 UTC (rev 22647)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2008-07-05 08:20:34 UTC (rev 22648)
@@ -30,6 +30,20 @@
 LIGHTTPD_CONF_OPT += --without-openssl
 endif
 
+ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_ZLIB)),y)
+LIGHTTPD_DEPENDENCIES += zlib
+LIGHTTPD_CONF_OPT += --with-zlib
+else
+LIGHTTPD_CONF_OPT += --without-zlib
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_BZIP2)),y)
+LIGHTTPD_DEPENDENCIES += bzip2
+LIGHTTPD_CONF_OPT += --with-bzip2
+else
+LIGHTTPD_CONF_OPT += --without-bzip2
+endif
+
 ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_PCRE)),y)
 LIGHTTPD_CONF_ENV += PCRE_LIB="-lpcre"
 LIGHTTPD_DEPENDENCIES += pcre
