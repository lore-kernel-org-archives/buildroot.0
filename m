From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 09:11:20 +0200
Subject: [Buildroot] [git commit] swupdate: bump to version 2016.04
Message-ID: <20160507071254.3D9CB7FEB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65b2ae49feb310d3272a47c44cf3b406646b25c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:
 * Update the .config file
 * Update the help text:
    - Lua support is not restricted to Lua 5.2
    - U-Boot supports needs now BR2_PACKAGE_UBOOT_TOOLS additionally
 * Remove comment about bundled lsqlite3, it has been removed.
 * Remove upstream patches:
    - "Kbuild: Fix link error for CONFIG_UBOUT and missing libz" [1]
    - "Kbuild: Link with GCC instead of LD" [2]
 * Add patch from upstream:
    - "Fix build without MTD support" [3]
 * Add optional dependency for libarchive
 * Add optional dependency for uboot-tools

[1] https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1
[2] https://github.com/sbabic/swupdate/commit/f26577423eb65728fcd10f78f9978dd07d51dcb9
[3] https://github.com/sbabic/swupdate/commit/69c0e66994f01ce1bf2299fbce86aee7a1baa37b

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: add host-pkgconf in the dependency when Lua is enabled, as it
is used to find Lua.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/Config.in       |  4 +++-
 package/swupdate/swupdate.config | 36 +++++++++++++++++++++++++++++++++++-
 package/swupdate/swupdate.hash   |  5 ++---
 package/swupdate/swupdate.mk     | 29 +++++++++++++++++++++--------
 4 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index f475b85..1d14a7c 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_SWUPDATE
 	  use your own modified configuration, you have to select the
 	  necessary packages manually:
 
-	  * Select BR2_PACKAGE_LUA_5_2 if you want to have Lua support.
+	  * Select BR2_PACKAGE_LUA if you want to have Lua support.
 	  * Select BR2_LIBCURL if you want to use the download feature.
 	  * Select BR2_PACKAGE_OPENSSL is you want to add encryptions support
 	    to the webserver.
@@ -26,6 +26,8 @@ config BR2_PACKAGE_SWUPDATE
 	    partitions.
 	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip compressed
 	    archives.
+	  * Select BR2_PACKAGE_UBOOT_TOOLS and BR2_PACKAGE_ZLIB to add support
+	    for setting the U-Boot environment.
 
 	  https://sbabic.github.io/swupdate
 
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
index c57ab89..70299a9 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
-sha256	6cffe115cad73c0d1095f7880b6d2b97fc12b7f7871f532e5b33717e863f03d7  5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
-sha256	b97a107a0e4625337485b9bb118bc9a33fa0f2bfcb80475cff017940b5261238  f26577423eb65728fcd10f78f9978dd07d51dcb9.patch
+sha256  534342ecb89e004edf641945afb49ae185e2599fd93dbcba8dbf1ba77e507f46  swupdate-2016.04.tar.gz
+sha256  089393b0c8aec626078bc66f759474fa3d1bb7c48c7ae3c493d981514248fed5  69c0e66994f01ce1bf2299fbce86aee7a1baa37b.patch
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index e22bc08..f49cbaa 100644
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
@@ -36,8 +42,8 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-ifeq ($(BR2_PACKAGE_LUA_5_2),y)
-SWUPDATE_DEPENDENCIES += lua
+ifeq ($(BR2_PACKAGE_LUA),y)
+SWUPDATE_DEPENDENCIES += lua host-pkgconf
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
 else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
@@ -61,6 +67,13 @@ SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS),y)
+SWUPDATE_DEPENDENCIES += uboot-tools
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SWUPDATE_DEPENDENCIES += zlib
 SWUPDATE_MAKE_ENV += HAVE_ZLIB=y
