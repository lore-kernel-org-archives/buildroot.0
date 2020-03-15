From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:47:10 +0100
Subject: [Buildroot] [git commit] package/libcpprestsdk: needs locale
Message-ID: <20200315213510.87FCE817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3037e99ae67f159626c0b148da46008e1dd23e91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

locale_t is unconditionally used since version 2.3.0 and
https://github.com/microsoft/cpprestsdk/commit/814caa4c0a80ef223535446a274146bf46a5ef2b

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcpprestsdk/Config.in        | 5 +++--
 package/libcpprestsdk/libcpprestsdk.mk | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index a07159b124..01ebc6aa7f 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk"
+	depends on BR2_ENABLE_LOCALE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
@@ -22,10 +23,10 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 
 	  https://github.com/Microsoft/cpprestsdk
 
-comment "libcpprestsdk needs a toolchain w/ NPTL, C++, wchar"
+comment "libcpprestsdk needs a toolchain w/ NPTL, C++, wchar, locale"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR
+		!BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
 
 comment "libcpprestsdk needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 8404b5096c..e746f22b1b 100644
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
