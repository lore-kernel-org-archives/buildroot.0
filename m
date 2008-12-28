From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 20:00:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  curl libcurl
Message-ID: <20081228200010.CE82476D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 20:00:07 +0000 (Sun, 28 Dec 2008)
New Revision: 24579

Log:
curl: rename to libcurl so Makefile.autotools.in can find patches

Added:
   trunk/buildroot/package/libcurl/
   trunk/buildroot/package/libcurl/Config.in
   trunk/buildroot/package/libcurl/libcurl.mk

Removed:
   trunk/buildroot/package/curl/Config.in
   trunk/buildroot/package/curl/curl.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-12-28 16:08:57 UTC (rev 24578)
+++ trunk/buildroot/package/Config.in	2008-12-28 20:00:07 UTC (rev 24579)
@@ -133,7 +133,6 @@
 endif
 source "package/bind/Config.in"
 source "package/bridge-utils/Config.in"
-source "package/curl/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dhcp/Config.in"
 endif
@@ -152,6 +151,7 @@
 source "package/l2tp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
+source "package/libcurl/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"

Deleted: trunk/buildroot/package/curl/Config.in
===================================================================
--- trunk/buildroot/package/curl/Config.in	2008-12-28 16:08:57 UTC (rev 24578)
+++ trunk/buildroot/package/curl/Config.in	2008-12-28 20:00:07 UTC (rev 24579)
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LIBCURL
-	bool "libcurl"
-	help
-	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
-	  and Dict servers, using any of the supported protocols.
-
-	  http://curl.haxx.nu/
-
-config BR2_PACKAGE_CURL
-	bool "curl binary"
-	depends on BR2_PACKAGE_LIBCURL
-	help
-	  Install curl binary as well

Deleted: trunk/buildroot/package/curl/curl.mk
===================================================================
--- trunk/buildroot/package/curl/curl.mk	2008-12-28 16:08:57 UTC (rev 24578)
+++ trunk/buildroot/package/curl/curl.mk	2008-12-28 20:00:07 UTC (rev 24579)
@@ -1,17 +0,0 @@
-#############################################################
-#
-# curl
-#
-#############################################################
-LIBCURL_VERSION = 7.19.2
-LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
-LIBCURL_SITE = http://curl.haxx.se/download/
-LIBCURL_INSTALL_STAGING = YES
-LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols \
-		   $(DISABLE_NLS) $(DISABLE_LARGEFILE) $(DISABLE_IPV6)
-
-$(eval $(call AUTOTARGETS,package,libcurl))
-
-$(LIBCURL_HOOK_POST_INSTALL):
-	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
-	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)

Copied: trunk/buildroot/package/libcurl/Config.in (from rev 24578, trunk/buildroot/package/curl/Config.in)
===================================================================
--- trunk/buildroot/package/libcurl/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libcurl/Config.in	2008-12-28 20:00:07 UTC (rev 24579)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBCURL
+	bool "libcurl"
+	help
+	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
+	  and Dict servers, using any of the supported protocols.
+
+	  http://curl.haxx.nu/
+
+config BR2_PACKAGE_CURL
+	bool "curl binary"
+	depends on BR2_PACKAGE_LIBCURL
+	help
+	  Install curl binary as well

Copied: trunk/buildroot/package/libcurl/libcurl.mk (from rev 24578, trunk/buildroot/package/curl/curl.mk)
===================================================================
--- trunk/buildroot/package/libcurl/libcurl.mk	                        (rev 0)
+++ trunk/buildroot/package/libcurl/libcurl.mk	2008-12-28 20:00:07 UTC (rev 24579)
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libcurl
+#
+#############################################################
+LIBCURL_VERSION = 7.19.2
+LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
+LIBCURL_SITE = http://curl.haxx.se/download/
+LIBCURL_INSTALL_STAGING = YES
+LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols \
+		   $(DISABLE_NLS) $(DISABLE_LARGEFILE) $(DISABLE_IPV6)
+
+$(eval $(call AUTOTARGETS,package,libcurl))
+
+$(LIBCURL_HOOK_POST_INSTALL):
+	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
+	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
