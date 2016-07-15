From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 15 Jul 2016 08:16:54 +0200
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2016.07
Message-ID: <20160715061654.20289-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Remove fetching upstream patch to fix build without MTD support
* Update .config
* Update help text as SSL support is now needed for other features
  than the webserver too

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/Config.in       |  3 +--
 package/swupdate/swupdate.config | 43 ++++++++++------------------------------
 package/swupdate/swupdate.hash   |  3 +--
 package/swupdate/swupdate.mk     |  5 +----
 4 files changed, 13 insertions(+), 41 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 1d14a7c..5f5e1e7 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -20,8 +20,7 @@ config BR2_PACKAGE_SWUPDATE
 
 	  * Select BR2_PACKAGE_LUA if you want to have Lua support.
 	  * Select BR2_LIBCURL if you want to use the download feature.
-	  * Select BR2_PACKAGE_OPENSSL is you want to add encryptions support
-	    to the webserver.
+	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption support.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
 	    partitions.
 	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip compressed
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index b5180ee..51869bb 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -14,14 +14,8 @@ CONFIG_HAVE_DOT_CONFIG=y
 CONFIG_SCRIPTS=y
 # CONFIG_HW_COMPATIBILITY is not set
 CONFIG_SW_VERSIONS_FILE="/etc/sw-versions"
-
-#
-# MTD support needs libmtd
-#
-
-#
-# Lua support needs a Lua interpreter
-#
+# CONFIG_MTD is not set
+# CONFIG_LUA is not set
 # CONFIG_FEATURE_SYSLOG is not set
 
 #
@@ -40,10 +34,9 @@ CONFIG_EXTRA_LDLIBS=""
 # CONFIG_DEBUG is not set
 # CONFIG_WERROR is not set
 # CONFIG_NOCLEANUP is not set
-
-#
-# Image downloading support needs libcurl
-#
+# CONFIG_DOWNLOAD is not set
+# CONFIG_SIGNED_IMAGES is not set
+# CONFIG_SURICATTA is not set
 CONFIG_WEBSERVER=y
 
 #
@@ -55,41 +48,25 @@ CONFIG_MONGOOSE=y
 # Mongoose Feature
 #
 CONFIG_MONGOOSEIPV6=y
-
-#
-# SSL support needs libcrypto, libssl
-#
+# CONFIG_MONGOOSESSL is not set
 
 #
 # Archival Features
 #
-CONFIG_CPIO=y
-
-#
-# gunzip support needs libz
-#
+# CONFIG_GUNZIP is not set
 
 #
 # Parser Features
 #
 CONFIG_LIBCONFIG=y
 CONFIG_LIBCONFIGROOT=""
-
-#
-# JSON config parser support needs json-c
-#
+# CONFIG_JSON is not set
 # CONFIG_SETSWDESCRIPTION is not set
 
 #
 # Image Handlers
 #
-
-#
-# ubivol support needs libubi
-#
 CONFIG_RAW=y
 # CONFIG_SHELLSCRIPTHANDLER is not set
-
-#
-# uboot support needs libz
-#
+# CONFIG_ARCHIVE is not set
+# CONFIG_UBOOT is not set
\ No newline at end of file
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 70299a9..918ca2f 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  534342ecb89e004edf641945afb49ae185e2599fd93dbcba8dbf1ba77e507f46  swupdate-2016.04.tar.gz
-sha256  089393b0c8aec626078bc66f759474fa3d1bb7c48c7ae3c493d981514248fed5  69c0e66994f01ce1bf2299fbce86aee7a1baa37b.patch
+sha256  c21d2fd52eb7ed9c304a7a996d230a8f1b47b9879a8c9fa50c80b41e117d1e60  swupdate-2016.07.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index f49cbaa..313a54f 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2016.04
+SWUPDATE_VERSION = 2016.07
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
 
-# Upstream patch to fix build without MTD support
-SWUPDATE_PATCH = https://github.com/sbabic/swupdate/commit/69c0e66994f01ce1bf2299fbce86aee7a1baa37b.patch
-
 # swupdate bundles its own version of mongoose (version 3.8)
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
-- 
2.9.0
