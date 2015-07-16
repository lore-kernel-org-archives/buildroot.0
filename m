From: Ed Swierk <eswierk@skyportsystems.com>
Date: Thu, 16 Jul 2015 13:58:49 -0700
Subject: [Buildroot] [PATCH] Update from polarssl to mbed 1.3.11
Message-ID: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates the polarssl package to build the current mbed 1.3.x
release.

It also prefixes the generated binaries with mbed_, to avoid names that
overlap with other packages (like sha1sum) or that are generic and
confusing (like selftest or hello).

Signed-off-by: Ed Swierk <eswierk@skyportsystems.com>
---
 package/polarssl/0001-no-test-suite.patch          | 27 ----------------------
 ...he-standard-CMake-flag-to-drive-the-share.patch | 18 +++++++--------
 package/polarssl/polarssl.hash                     |  4 ++--
 package/polarssl/polarssl.mk                       | 17 +++++++++++---
 4 files changed, 25 insertions(+), 41 deletions(-)
 delete mode 100644 package/polarssl/0001-no-test-suite.patch

diff --git a/package/polarssl/0001-no-test-suite.patch b/package/polarssl/0001-no-test-suite.patch
deleted file mode 100644
index 4c8552a..0000000
--- a/package/polarssl/0001-no-test-suite.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Add BUILD_TESTS option to disable test suite
-
-By default, PolarSSL builds a fairly extensive test suite to validate
-the library. In the context of Buildroot, building this test suite is
-not really useful, so we add a BUILD_TESTS to disable its build.
-
-[Gustavo: update for 1.2.11]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura polarssl-1.2.11.orig/CMakeLists.txt polarssl-1.2.11/CMakeLists.txt
---- polarssl-1.2.11.orig/CMakeLists.txt	2014-07-11 17:14:43.414651327 -0300
-+++ polarssl-1.2.11/CMakeLists.txt	2014-07-11 17:23:00.573498626 -0300
-@@ -49,9 +49,11 @@
- add_subdirectory(library)
- add_subdirectory(include)
- 
--if(CMAKE_COMPILER_IS_GNUCC)
-+option(BUILD_TESTS "Build tests." ON)
-+
-+if(CMAKE_COMPILER_IS_GNUCC AND BUILD_TESTS)
-   add_subdirectory(tests)
--endif(CMAKE_COMPILER_IS_GNUCC)
-+endif(CMAKE_COMPILER_IS_GNUCC AND BUILD_TESTS)
- if(CMAKE_COMPILER_IS_CLANG)
-   add_subdirectory(tests)
- endif(CMAKE_COMPILER_IS_CLANG)
diff --git a/package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
index d241ae2..2ab80a5 100644
--- a/package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
+++ b/package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
@@ -17,23 +17,23 @@ index 27bd2e0..2ae0aba 100644
 --- a/library/CMakeLists.txt
 +++ b/library/CMakeLists.txt
 @@ -1,5 +1,15 @@
--option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL static library." ON)
--option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL shared library." OFF)
+-option(USE_STATIC_MBEDTLS_LIBRARY "Build mbed TLS static library." ON)
+-option(USE_SHARED_MBEDTLS_LIBRARY "Build mbed TLS shared library." OFF)
 +# Use the standard CMake flag to drive the shared object build.
-+if(DEFINED BUILD_SHARED_LIBS AND NOT DEFINED USE_STATIC_POLARSSL_LIBRARY AND NOT DEFINED USE_SHARED_POLARSSL_LIBRARY)
-+  set(USE_STATIC_POLARSSL_LIBRARY ON)
++if(DEFINED BUILD_SHARED_LIBS AND NOT DEFINED USE_STATIC_MBEDTLS_LIBRARY AND NOT DEFINED USE_SHARED_MBEDTLS_LIBRARY)
++  set(USE_STATIC_MBEDTLS_LIBRARY ON)
 +  if(BUILD_SHARED_LIBS)
-+    set(USE_SHARED_POLARSSL_LIBRARY ON)
++    set(USE_SHARED_MBEDTLS_LIBRARY ON)
 +  else()
-+    set(USE_SHARED_POLARSSL_LIBRARY OFF)
++    set(USE_SHARED_MBEDTLS_LIBRARY OFF)
 +  endif()
 +else()
-+  option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL static library." ON)
-+  option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL shared library." OFF)
++  option(USE_STATIC_MBEDTLS_LIBRARY "Build mbed TLS static library." ON)
++  option(USE_SHARED_MBEDTLS_LIBRARY "Build mbed TLS shared library." OFF)
 +endif()
+ option(LINK_WITH_PTHREAD "Explicitly link mbed TLS library to pthread." OFF)
  
  set(src
-      aes.c
 -- 
 2.1.0
 
diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
index e7883fd..23ed577 100644
--- a/package/polarssl/polarssl.hash
+++ b/package/polarssl/polarssl.hash
@@ -1,2 +1,2 @@
-# From https://polarssl.org/tech-updates/releases/polarssl-1.2.14-released
-sha256	d7cbd8314aa3a5441f6282d13d07df610f49b4bc678088b04188adf093d17d37	polarssl-1.2.14-gpl.tgz
+# From https://tls.mbed.org/code/releases/mbedtls-1.3.11-gpl.tgz
+sha256	67a593027b6a442a4fa5b6c224c4ac8cdae5be721f5a28a11d34f10dcda441cb	mbedtls-1.3.11-gpl.tgz
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 289a28d..9462253 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -5,10 +5,12 @@
 ################################################################################
 
 POLARSSL_SITE = https://tls.mbed.org/code/releases
-POLARSSL_VERSION = 1.2.14
-POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
+POLARSSL_VERSION = 1.3.11
+POLARSSL_SOURCE = mbedtls-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
-	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
+	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF) \
+	-DENABLE_TESTING=OFF \
+	-DCMAKE_EXECUTABLE_SUFFIX_C=_mbed \
 
 POLARSSL_INSTALL_STAGING = YES
 POLARSSL_LICENSE = GPLv2
@@ -26,4 +28,13 @@ else ifeq ($(BR2_microblaze),y)
 POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
 endif
 
+# Prefix installed executables with mbed_ to avoid conflicting with
+# other tools like sha1sum
+define POLARSSL_PREFIX_EXECUTABLES
+	cd $(TARGET_DIR)/usr/bin; for f in *_mbed; do [ ! -f $$f ] || mv $$f mbed_$${f%_mbed}; done
+	rm -f $(TARGET_DIR)/usr/lib/libmbedtls.a
+endef
+
+POLARSSL_POST_INSTALL_TARGET_HOOKS += POLARSSL_PREFIX_EXECUTABLES
+
 $(eval $(cmake-package))
-- 
1.9.1
