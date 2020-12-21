From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Dec 2020 14:57:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 2.10.5
Message-ID: <20201221135706.752966-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patches (already in version)
- Set MZ_FETCH_LIBS to OFF (available since version 2.10.5 and
  https://github.com/nmoinvaz/minizip/commit/a1602ed9c82c6b2dd5ea8753dd3fecc3dcc74ba5)
- Use MZ_ICONV which is available since version 2.10.4 and
  https://github.com/nmoinvaz/minizip/commit/628830ff93c2fb1fd1bbb87ccea5857c5caf2af4
- Add xz optional dependency which is available since version 2.10.2 and
  https://github.com/nmoinvaz/minizip/commit/f1cc0e3898b23828765378b2ab6ba7622d1f8dbe

https://github.com/nmoinvaz/minizip/releases/tag/2.10.5
https://github.com/nmoinvaz/minizip/releases/tag/2.10.4
https://github.com/nmoinvaz/minizip/releases/tag/2.10.3
https://github.com/nmoinvaz/minizip/releases/tag/2.10.2
https://github.com/nmoinvaz/minizip/releases/tag/2.10.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Use-pkg-config-to-find-ZSTD.patch    | 30 ----------
 .../0002-mz.h-fix-build-with-gcc-4.8.patch    | 60 -------------------
 package/minizip/minizip.hash                  |  2 +-
 package/minizip/minizip.mk                    | 23 +++++--
 4 files changed, 19 insertions(+), 96 deletions(-)
 delete mode 100644 package/minizip/0001-Use-pkg-config-to-find-ZSTD.patch
 delete mode 100644 package/minizip/0002-mz.h-fix-build-with-gcc-4.8.patch

diff --git a/package/minizip/0001-Use-pkg-config-to-find-ZSTD.patch b/package/minizip/0001-Use-pkg-config-to-find-ZSTD.patch
deleted file mode 100644
index 5866099634..0000000000
--- a/package/minizip/0001-Use-pkg-config-to-find-ZSTD.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 69afd09aee3727f2804e1b063ef50800b22c6bb9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Patrik=20Novotn=C3=BD?= <panovotn@redhat.com>
-Date: Wed, 1 Jul 2020 11:18:08 +0200
-Subject: [PATCH] Use pkg-config to find ZSTD
-
-[Retrieved from: https://github.com/nmoinvaz/minizip/pull/509]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a6deb4ce..987e7947 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -115,7 +115,13 @@ endif()
- # Check if zstd installation is present
- if(MZ_ZSTD)
-     if(NOT ZSTD_FORCE_FETCH)
--        find_package(ZSTD QUIET)
-+        find_package(PkgConfig)
-+        if(PKGCONFIG_FOUND)
-+            pkg_check_modules(ZSTD libzstd)
-+        endif()
-+        if(NOT ZSTD_FOUND)
-+            find_package(ZSTD QUIET)
-+        endif()
-     endif()
-     if(ZSTD_FOUND AND NOT ZSTD_FORCE_FETCH)
-         message(STATUS "Using ZSTD")
diff --git a/package/minizip/0002-mz.h-fix-build-with-gcc-4.8.patch b/package/minizip/0002-mz.h-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index f9d28a3c75..0000000000
--- a/package/minizip/0002-mz.h-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From d38254c2cfdfa2baceef9e4fa553b74ed2e0247e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 25 Jul 2020 14:36:11 +0200
-Subject: [PATCH] mz.h: fix build with gcc 4.8
-
-gcc 4.8 does not support __has_include directive as a result the build
-will fail on:
-
-/home/naourr/work/instance-1/output-1/build/minizip-2.10.0/mz.h:162:44: error: missing binary operator before token "("
-    (defined(__has_include) && __has_include(<stdint.h>))
-                                            ^
-
-Fix it by appling:
-https://gcc.gnu.org/onlinedocs/gcc-10.1.0/cpp/_005f_005fhas_005finclude.html
-
-Fix #510
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/nmoinvaz/minizip/pull/515]
----
- mz.h | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/mz.h b/mz.h
-index 4d3732b..83662e0 100644
---- a/mz.h
-+++ b/mz.h
-@@ -158,9 +158,12 @@
- #include <string.h> /* memset, strncpy, strlen */
- #include <limits.h>
- 
--#if defined(HAVE_STDINT_H) || \
--   (defined(__has_include) && __has_include(<stdint.h>))
-+#if defined(HAVE_STDINT_H)
- #  include <stdint.h>
-+#elif defined(__has_include)
-+#  if __has_include(<stdint.h>)
-+#    include <stdint.h>
-+#  endif
- #endif
- 
- #ifndef __INT8_TYPE__
-@@ -188,9 +191,12 @@ typedef unsigned int       uint32_t;
- typedef unsigned long long uint64_t;
- #endif
- 
--#if defined(HAVE_INTTYPES_H) || \
--   (defined(__has_include) && __has_include(<inttypes.h>))
-+#if defined(HAVE_INTTYPES_H)
- #  include <inttypes.h>
-+#elif defined(__has_include)
-+#  if __has_include(<inttypes.h>)
-+#    include <inttypes.h>
-+#  endif
- #endif
- 
- #ifndef PRId8
--- 
-2.27.0
-
diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 74799b9d58..9262f3a3e7 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c7f236268fef57ce5dcbd9645235a22890d62480a592e1b0515ecff93f9989b  minizip-2.10.0.tar.gz
+sha256  1c6420d3f3509e722178d9130a57cb77537b34900e7b67acca7e3e2858846939  minizip-2.10.5.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 3fafab5f94..e2abfd4f20 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 2.10.0
+MINIZIP_VERSION = 2.10.5
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
-MINIZIP_DEPENDENCIES = \
-	host-pkgconf \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
 MINIZIP_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DMZ_BUILD_TEST=ON) \
-	-DMZ_COMPAT=OFF
+	-DMZ_COMPAT=OFF \
+	-DMZ_FETCH_LIBS=OFF
 MINIZIP_LICENSE = Zlib
 MINIZIP_LICENSE_FILES = LICENSE
 
@@ -23,6 +22,13 @@ else
 MINIZIP_CONF_OPTS += -DMZ_BZIP2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MINIZIP_DEPENDENCIES += libiconv
+MINIZIP_CONF_OPTS += -DMZ_ICONV=ON
+else
+MINIZIP_CONF_OPTS += -DMZ_ICONV=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBBSD),y)
 MINIZIP_DEPENDENCIES += libbsd
 MINIZIP_CONF_OPTS += -DMZ_LIBBSD=ON
@@ -37,6 +43,13 @@ else
 MINIZIP_CONF_OPTS += -DMZ_OPENSSL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+MINIZIP_DEPENDENCIES += xz
+MINIZIP_CONF_OPTS += -DMZ_LZMA=ON
+else
+MINIZIP_CONF_OPTS += -DMZ_LZMA=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 MINIZIP_DEPENDENCIES += zlib
 MINIZIP_CONF_OPTS += -DMZ_ZLIB=ON
-- 
2.29.2
