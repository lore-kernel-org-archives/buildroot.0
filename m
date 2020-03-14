From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Mar 2020 23:20:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/libcpprestsdk: zlib is optional,
 not mandatory
Message-ID: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcpprestsdk/Config.in        | 1 -
 package/libcpprestsdk/libcpprestsdk.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index a07159b124..1551a0c6b1 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -13,7 +13,6 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
 	help
 	  The C++ REST SDK is a Microsoft project for cloud-based
 	  client-server communication in native code using a modern
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 8404b5096c..69ff9f17cc 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -10,7 +10,7 @@ LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
 LIBCPPRESTSDK_INSTALL_STAGING = YES
-LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl zlib
+LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl
 LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DBUILD_SAMPLES=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -25,12 +25,19 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBCPPRESTSDK_CXXFLAGS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBCPPRESTSDK_DEPENDENCIES += zlib
+LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_COMPRESSION=OFF
+# brotli needs compression
 ifeq ($(BR2_PACKAGE_BROTLI),y)
 LIBCPPRESTSDK_DEPENDENCIES += brotli
 LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=OFF
 else
 LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=ON
 endif
+else
+LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_COMPRESSION=ON
+endif
 
 ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
 LIBCPPRESTSDK_DEPENDENCIES += websocketpp
-- 
2.25.1
