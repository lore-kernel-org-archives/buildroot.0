From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:41:11 +0200
Subject: [Buildroot] [git commit] package/libcpprestsdk: zlib is optional,
 not mandatory
Message-ID: <20200425133014.24B4390009@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe2b8e8a394c3a0a21edc869e31da6e038a24623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CMakeLists.txt contains:

  if(CPPREST_EXCLUDE_COMPRESSION)
  if(NOT CPPREST_EXCLUDE_BROTLI)
  message(FATAL_ERROR "Use of Brotli requires compression to be enabled")
  endif()

libcpprestsdk requires openssl, so if the libopenssl provider is
chosen, it anyway pulls in zlib. But if libressl is used as a
provider, it doesn't pull in zlib, and building libcpprestsdk becomes
possible without zlib thanks to this patch.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcpprestsdk/Config.in        | 1 -
 package/libcpprestsdk/libcpprestsdk.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index 01ebc6aa7f..af97509d1b 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_LIBCPPRESTSDK
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
