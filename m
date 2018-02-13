From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:13:52 +0100
Subject: [Buildroot] [git commit] libcpprestsdk: fix building as a static
 library
Message-ID: <20180213221425.4380988743@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2f0a9bba400c9c623da0d34d1e58341b16241a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to find OpenSSL. This will automatically find any
dependent libraries and put them in the correct order for linking.

Upstream status: submitted
https://github.com/Microsoft/cpprestsdk/pull/688

Fixes:

  http://autobuild.buildroot.net/results/be9e8d1717968a0ff8f01f7fadfa79825ac88b94/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...prestsdk-fix-building-as-a-static-library.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch b/package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch
new file mode 100644
index 0000000000..de900178d5
--- /dev/null
+++ b/package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch
@@ -0,0 +1,38 @@
+From 8a9c3db14a390c0a8788405e52e9b8737a430191 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 12 Feb 2018 07:49:34 -0500
+Subject: [PATCH] libcpprestsdk: fix building as a static library
+
+Use pkg-config to find OpenSSL. This will automatically find any
+dependent libraries and put them in the correct order for linking.
+
+Upstream status: submitted
+https://github.com/Microsoft/cpprestsdk/pull/688
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ Release/cmake/cpprest_find_openssl.cmake | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/Release/cmake/cpprest_find_openssl.cmake b/Release/cmake/cpprest_find_openssl.cmake
+index 0b49a7e..2be8afb 100644
+--- a/Release/cmake/cpprest_find_openssl.cmake
++++ b/Release/cmake/cpprest_find_openssl.cmake
+@@ -41,8 +41,12 @@ function(cpprest_find_openssl)
+       # This should prevent linking against the system provided 0.9.8y
+       set(_OPENSSL_VERSION "")
+     endif()
+-    find_package(OpenSSL 1.0.0 REQUIRED)
+-
++    if(UNIX)
++		find_package(PkgConfig REQUIRED)
++		pkg_search_module(OPENSSL openssl REQUIRED)
++    else()
++    	find_package(OpenSSL 1.0.0 REQUIRED)
++	endif()
+     INCLUDE(CheckCXXSourceCompiles)
+     set(CMAKE_REQUIRED_INCLUDES "${OPENSSL_INCLUDE_DIR}")
+     set(CMAKE_REQUIRED_LIBRARIES "${OPENSSL_LIBRARIES}")
+-- 
+2.14.3
+
