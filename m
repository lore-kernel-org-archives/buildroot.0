From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 29 Apr 2016 09:57:00 +0200
Subject: [Buildroot] [PATCH 3/3] swupdate: bump to version 2016.04
In-Reply-To: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
References: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1461916620-5170-4-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
 * Update the .config file and the help text:
    - clarify project name is SWupdate
    - U-Boot supports needs now BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 * Remove comment about bundled lsqlite3, it has been removed.
 * Remove upstream patches:
    - "Kbuild: Fix link error for CONFIG_UBOUT and missing libz" [1]
    - "Kbuild: Link with GCC instead of LD" [2]
 * Add patch from upstream:
    - "Fix build without MTD support" [3]
 * Add optional dependency for libarchive
 * Add optional dependency for uboot-tools
 * Lua support is not restricted to Lua 5.2

[1] https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1
[2] https://github.com/sbabic/swupdate/commit/f26577423eb65728fcd10f78f9978dd07d51dcb9
[3] https://github.com/sbabic/swupdate/commit/69c0e66994f01ce1bf2299fbce86aee7a1baa37b

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/Config.in       | 18 ++++++++++--------
 package/swupdate/swupdate.config | 36 +++++++++++++++++++++++++++++++++++-
 package/swupdate/swupdate.hash   |  5 ++---
 package/swupdate/swupdate.mk     | 27 ++++++++++++++++++++-------
 4 files changed, 67 insertions(+), 19 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index f475b85..40bd0a2 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -5,12 +5,12 @@ config BR2_PACKAGE_SWUPDATE
 	# swupdate requires a parser and uses libconfig as default
 	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && !BR2_PACKAGE_LUA_5_2
 	help
-	  swupdate provides a reliable way to update the software on an
+	  SWupdate provides a reliable way to update the software on an
 	  embedded system.
 
-	  swupdate is highly configurable to fit the targets requirements and
+	  SWupdate is highly configurable to fit the targets requirements and
 	  to minimize the footprint. The provided default configuration file
-	  BR2_PACKAGE_SWUPDATE_CONFIG will enable swupdate with an embedded
+	  BR2_PACKAGE_SWUPDATE_CONFIG will enable SWupdate with an embedded
 	  webserver, a parser and a handler for raw NAND or NOR flash.
 
 	  The default configuration file builds a reasonable firmware update
@@ -18,14 +18,16 @@ config BR2_PACKAGE_SWUPDATE
 	  use your own modified configuration, you have to select the
 	  necessary packages manually:
 
-	  * Select BR2_PACKAGE_LUA_5_2 if you want to have Lua support.
+	  * Select BR2_PACKAGE_LUA if you want to have Lua support.
 	  * Select BR2_LIBCURL if you want to use the download feature.
 	  * Select BR2_PACKAGE_OPENSSL is you want to add encryptions support
 	    to the webserver.
-	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
+	  * Select BR2_PACKAGE_MTD if you want to use SWupdate with UBI
 	    partitions.
 	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip compressed
 	    archives.
+	  * Select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV and BR2_PACKAGE_ZLIB to
+	    add support for setting the U-Boot environment.
 
 	  https://sbabic.github.io/swupdate
 
@@ -35,9 +37,9 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	string "swupdate configuration file"
 	default "package/swupdate/swupdate.config"
 	help
-	  Path to the swupdate configuration file.
+	  Path to the SWupdate configuration file.
 
-	  I you wish to use your own modified swupdate configuration file
+	  I you wish to use your own modified SWupdate configuration file
 	  specify the config file location with this option.
 
 config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
@@ -46,7 +48,7 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	help
 	  Install the provided website to /var/www/swupdate.
 
-	  This is necessary if you want to run swupdate with the embedded
+	  This is necessary if you want to run SWupdate with the embedded
 	  webserver and do not provide an own website to be installed to
 	  /var/www/swupdate.
 endif
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index bac7a58..b5180ee 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -13,6 +13,15 @@ CONFIG_HAVE_DOT_CONFIG=y
 #
 CONFIG_SCRIPTS=y
 # CONFIG_HW_COMPATIBILITY is not set
+CONFIG_SW_VERSIONS_FILE="/etc/sw-versions"
+
+#
+# MTD support needs libmtd
+#
+
+#
+# Lua support needs a Lua interpreter
+#
 # CONFIG_FEATURE_SYSLOG is not set
 
 #
@@ -31,6 +40,10 @@ CONFIG_EXTRA_LDLIBS=""
 # CONFIG_DEBUG is not set
 # CONFIG_WERROR is not set
 # CONFIG_NOCLEANUP is not set
+
+#
+# Image downloading support needs libcurl
+#
 CONFIG_WEBSERVER=y
 
 #
@@ -44,18 +57,39 @@ CONFIG_MONGOOSE=y
 CONFIG_MONGOOSEIPV6=y
 
 #
+# SSL support needs libcrypto, libssl
+#
+
+#
 # Archival Features
 #
 CONFIG_CPIO=y
 
 #
+# gunzip support needs libz
+#
+
+#
 # Parser Features
 #
+CONFIG_LIBCONFIG=y
+CONFIG_LIBCONFIGROOT=""
+
+#
+# JSON config parser support needs json-c
+#
 # CONFIG_SETSWDESCRIPTION is not set
 
 #
 # Image Handlers
 #
+
+#
+# ubivol support needs libubi
+#
 CONFIG_RAW=y
 # CONFIG_SHELLSCRIPTHANDLER is not set
-# CONFIG_UBOOT is not set
+
+#
+# uboot support needs libz
+#
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index c57ab89..b7ed79d 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
-sha256	6cffe115cad73c0d1095f7880b6d2b97fc12b7f7871f532e5b33717e863f03d7  5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
-sha256	b97a107a0e4625337485b9bb118bc9a33fa0f2bfcb80475cff017940b5261238  f26577423eb65728fcd10f78f9978dd07d51dcb9.patch
+sha256	534342ecb89e004edf641945afb49ae185e2599fd93dbcba8dbf1ba77e507f46  swupdate-2016.04.tar.gz
+sha256  089393b0c8aec626078bc66f759474fa3d1bb7c48c7ae3c493d981514248fed5  69c0e66994f01ce1bf2299fbce86aee7a1baa37b.patch
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index e22bc08..10bc98c 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2015.07
+SWUPDATE_VERSION = 2016.04
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
-SWUPDATE_PATCH = \
-	https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch \
-	https://github.com/sbabic/swupdate/commit/f26577423eb65728fcd10f78f9978dd07d51dcb9.patch
 
-# swupdate bundles its own version of mongoose (version 3.8) and
-# lsqlite3 (version 0.8)
+# Upstream patch to fix build without MTD support
+SWUPDATE_PATCH = https://github.com/sbabic/swupdate/commit/69c0e66994f01ce1bf2299fbce86aee7a1baa37b.patch
+
+# swupdate bundles its own version of mongoose (version 3.8)
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 SWUPDATE_DEPENDENCIES += json-c
@@ -22,6 +21,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_JSON_C=n
 endif
 
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+SWUPDATE_DEPENDENCIES += libarchive
+SWUPDATE_MAKE_ENV += HAVE_LIBARCHIVE=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBARCHIVE=n
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SWUPDATE_DEPENDENCIES += libconfig
 SWUPDATE_MAKE_ENV += HAVE_LIBCONFIG=y
@@ -36,7 +42,7 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-ifeq ($(BR2_PACKAGE_LUA_5_2),y)
+ifeq ($(BR2_PACKAGE_LUA),y)
 SWUPDATE_DEPENDENCIES += lua
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
 else
@@ -61,6 +67,13 @@ SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
+SWUPDATE_DEPENDENCIES += uboot-tools
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SWUPDATE_DEPENDENCIES += zlib
 SWUPDATE_MAKE_ENV += HAVE_ZLIB=y
-- 
2.8.0
