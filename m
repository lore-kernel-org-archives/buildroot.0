From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed, 31 Dec 2008 18:22:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/neon
Message-ID: <20081231182243.B20F476FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-12-31 18:22:43 +0000 (Wed, 31 Dec 2008)
New Revision: 24629

Log:
* Refined building of neon options
- Added support to build with or without zlib support


Modified:
   trunk/buildroot/package/neon/Config.in
   trunk/buildroot/package/neon/neon.mk


Changeset:
Modified: trunk/buildroot/package/neon/Config.in
===================================================================
--- trunk/buildroot/package/neon/Config.in	2008-12-31 18:12:22 UTC (rev 24628)
+++ trunk/buildroot/package/neon/Config.in	2008-12-31 18:22:43 UTC (rev 24629)
@@ -6,6 +6,13 @@
 
 	  http://www.webdav.org/neon/
 
+config BR2_PACKAGE_NEON_ZLIB
+	bool "ZLIB support"
+	depends on BR2_PACKAGE_NEON
+	select BR2_PACKAGE_ZLIB
+	help
+	  build with ZLIB support
+
 choice
 	prompt "XML Support"
 	default BR2_PACKAGE_NEON_NOXML

Modified: trunk/buildroot/package/neon/neon.mk
===================================================================
--- trunk/buildroot/package/neon/neon.mk	2008-12-31 18:12:22 UTC (rev 24628)
+++ trunk/buildroot/package/neon/neon.mk	2008-12-31 18:22:43 UTC (rev 24629)
@@ -16,6 +16,12 @@
 NEON_CONF_OPT+=--with-expat=no
 NEON_DEPENDENCIES+=libxml2
 endif
+ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
+NEON_CONF_OPT+=--with-zlib=$(STAGING_DIR)
+NEON_DEPENDENCIES+=zlib
+else
+NEON_CONF_OPT+=--without-zlib
+endif
 ifeq ($(BR2_PACKAGE_NEON_EXPAT),y)
 NEON_CONF_OPT+=--with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
 NEON_CONF_OPT+=--with-libxml2=no
