From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  6 Feb 2018 11:59:50 -0500
Subject: [Buildroot] [PATCH 1/1] libcpprestsdk: fix building as a static
 library
Message-ID: <20180206165950.10154-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib must be put after OpenSSL when building as a static library or else
OpenSSL will be unable to find zlib specific functions.

Put the search for zlib below the search for OpenSSL to
ensure that zlib links after OpenSSL.

Fixes:
http://autobuild.buildroot.net/results/1df528254468a5ece2f6fe37b3401e68737beed1
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0004-fix-static-library-linking.patch          | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/libcpprestsdk/0004-fix-static-library-linking.patch

diff --git a/package/libcpprestsdk/0004-fix-static-library-linking.patch b/package/libcpprestsdk/0004-fix-static-library-linking.patch
new file mode 100644
index 0000000000..e904bb96c1
--- /dev/null
+++ b/package/libcpprestsdk/0004-fix-static-library-linking.patch
@@ -0,0 +1,56 @@
+From cefe8da037e0c2bb97dc1cb4d7ff43e7123feabf Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Tue, 6 Feb 2018 11:34:49 -0500
+Subject: [PATCH] fix static library linking
+
+zlib must be put after OpenSSL when building as a static library or else
+OpenSSL will be unable to find zlib specific functions.
+
+Put the search for zlib below the search for OpenSSL to
+ensure that zlib links after OpenSSL.
+
+Upstream status: submitted
+https://github.com/Microsoft/cpprestsdk/pull/688
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ Release/src/CMakeLists.txt | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/Release/src/CMakeLists.txt b/Release/src/CMakeLists.txt
+index 3f8a0f8..2a6d440 100644
+--- a/Release/src/CMakeLists.txt
++++ b/Release/src/CMakeLists.txt
+@@ -75,14 +75,6 @@ else()
+   message(FATAL_ERROR "Invalid implementation")
+ endif()
+ 
+-# Compression component
+-if(CPPREST_EXCLUDE_COMPRESSION)
+-  target_compile_definitions(cpprest PRIVATE -DCPPREST_EXCLUDE_COMPRESSION=1)
+-else()
+-  cpprest_find_zlib()
+-  target_link_libraries(cpprest PRIVATE cpprestsdk_zlib_internal)
+-endif()
+-
+ # PPLX component
+ if(CPPREST_PPLX_IMPL STREQUAL "apple")
+   find_library(COREFOUNDATION CoreFoundation "/")
+@@ -133,6 +125,14 @@ else()
+   message(FATAL_ERROR "Invalid implementation")
+ endif()
+ 
++# Compression component
++if(CPPREST_EXCLUDE_COMPRESSION)
++  target_compile_definitions(cpprest PRIVATE -DCPPREST_EXCLUDE_COMPRESSION=1)
++else()
++  cpprest_find_zlib()
++  target_link_libraries(cpprest PRIVATE cpprestsdk_zlib_internal)
++endif()
++
+ # fileio streams component
+ if(CPPREST_FILEIO_IMPL STREQUAL "win32")
+   target_sources(cpprest PRIVATE streams/fileio_win32.cpp)
+-- 
+2.14.3
+
-- 
2.14.3
