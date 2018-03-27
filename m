From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 27 Mar 2018 23:05:55 +0300
Subject: [Buildroot] [PATCH 2/2] woff2: fix static builds
In-Reply-To: <20180327200555.21748-1-aperez@igalia.com>
References: <20180327200555.21748-1-aperez@igalia.com>
Message-ID: <20180327200555.21748-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include a patch to make CMake correctly find the Brotli libraries when
they have been built as static libraries.

Fixes:
- http://autobuild.buildroot.net/results/f1c4b5aeb12af7b7a3e8ae01c219004ecd9befd6/
- http://autobuild.buildroot.net/results/74d20ff38766466623cc4a9eb18afcda831bc20b/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...e-multiple-libraries-being-returned-for-B.patch | 80 ++++++++++++++++++++++
 package/woff2/woff2.mk                             |  7 ++
 2 files changed, 87 insertions(+)
 create mode 100644 package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch

diff --git a/package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch b/package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch
new file mode 100644
index 0000000000..142eab2718
--- /dev/null
+++ b/package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch
@@ -0,0 +1,80 @@
+From 9a6d50b3f355c1e4d72a235aa0bac4856dff1785 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Tue, 27 Mar 2018 19:59:23 +0100
+Subject: [PATCH] CMake: Handle multiple libraries being returned for Brotli
+
+Brotli is built as three libraries: libbrotlienc, libbrotlidec, and
+libbrotlicommon. When requesting the linker flags using pkg-config for
+e.g. libbrotlidec, it will return both libbrotlidec and libbrotlicommon.
+The FindBrotli*.cmake files ignore the names of the libraries returned
+by pkg-config, and hardcode only the libbrotli{enc,dec} names. While
+this is fine when using shared libraries (they contain an entry for
+libbrotlicommon as required library in their headers), it will cause
+linker errors when Brotli has been built as static libraries, due to
+the missing symbols from libbrotlicommon being unknown to the linker.
+
+This fixes FindBrotli*.cmake files by using the library names reported
+by pkg-config (instead of hardcoding them), and applying find_library()
+to each of the libraries to find their absolute paths. If any of the
+libraries is missing, the corresponding BROTLI{ENC,DEC}_LIBRARIES is
+unset to let find_package_handle_standard_args() report an error.
+---
+ cmake/FindBrotliDec.cmake | 13 +++++++++----
+ cmake/FindBrotliEnc.cmake | 14 ++++++++++----
+ 2 files changed, 19 insertions(+), 8 deletions(-)
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream-Status: Submitted [https://github.com/google/woff2/pull/112]
+
+diff --git a/cmake/FindBrotliDec.cmake b/cmake/FindBrotliDec.cmake
+index abb06f4..9cbb415 100644
+--- a/cmake/FindBrotliDec.cmake
++++ b/cmake/FindBrotliDec.cmake
+@@ -18,10 +18,15 @@ find_path(BROTLIDEC_INCLUDE_DIRS
+     HINTS ${PC_BROTLIDEC_INCLUDEDIR}
+ )
+ 
+-find_library(BROTLIDEC_LIBRARIES
+-    NAMES brotlidec
+-    HINTS ${PC_BROTLIDEC_LIBDIR}
+-)
++set(BROTLIDEC_LIBRARIES "")
++foreach(_lib ${PC_BROTLIDEC_LIBRARIES})
++	find_library(PC_BROTLIDEC_PATH_${_lib} ${_lib} HINTS ${PC_BROTLIDEC_LIBRARY_DIRS})
++	if(NOT PC_BROTLIDEC_PATH_${_lib})
++		unset(BROTLIDEC_LIBRARIES)
++		break()
++	endif()
++	list(APPEND BROTLIDEC_LIBRARIES "${PC_BROTLIDEC_PATH_${_lib}}")
++endforeach()
+ 
+ include(FindPackageHandleStandardArgs)
+ find_package_handle_standard_args(BrotliDec
+diff --git a/cmake/FindBrotliEnc.cmake b/cmake/FindBrotliEnc.cmake
+index 4be347d..55f3932 100644
+--- a/cmake/FindBrotliEnc.cmake
++++ b/cmake/FindBrotliEnc.cmake
+@@ -18,10 +18,16 @@ find_path(BROTLIENC_INCLUDE_DIRS
+     HINTS ${PC_BROTLIENC_INCLUDEDIR}
+ )
+ 
+-find_library(BROTLIENC_LIBRARIES
+-    NAMES brotlienc
+-    HINTS ${PC_BROTLIENC_LIBDIR}
+-)
++set(BROTLIENC_LIBRARIES "")
++foreach(_lib ${PC_BROTLIENC_LIBRARIES})
++	find_library(PC_BROTLIENC_PATH_${_lib} ${_lib}
++		HINTS ${PC_BROTLIENC_LIBRARY_DIRS})
++	if(NOT PC_BROTLIENC_PATH_${_lib})
++		unset(BROTLIENC_LIBRARIES)
++		break()
++	endif()
++	list(APPEND BROTLIENC_LIBRARIES "${PC_BROTLIENC_PATH_${_lib}}")
++endforeach()
+ 
+ include(FindPackageHandleStandardArgs)
+ find_package_handle_standard_args(BrotliEnc
+-- 
+2.16.3
+
diff --git a/package/woff2/woff2.mk b/package/woff2/woff2.mk
index 23b88a5e9a..b2ff33fe98 100644
--- a/package/woff2/woff2.mk
+++ b/package/woff2/woff2.mk
@@ -14,4 +14,11 @@ WOFF2_DEPENDENCIES = brotli
 WOFF2_CONF_OPTS = \
 	-DNOISY_LOGGING=OFF
 
+# The CMake build files for woff2 manually set some RPATH handling options
+# which make the installation steps fail with static builds, so pass this
+# to prevent any attempt of mangling RPATH that CMake would do.
+ifneq ($(BR2_SHARED_LIBS),y)
+WOFF2_CONF_OPTS += -DCMAKE_SKIP_RPATH=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.16.3
