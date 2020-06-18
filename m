From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:14:19 +0200
Subject: [Buildroot] [git commit] package/libcpprestsdk: bump to version
 2.10.16
Message-ID: <20200618201238.2749886062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fada99faadb9241404c0ec87cfff697f5718c9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Remove upstream patch

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...prestsdk-fix-building-as-a-static-library.patch | 38 ----------------------
 package/libcpprestsdk/libcpprestsdk.hash           |  2 +-
 package/libcpprestsdk/libcpprestsdk.mk             |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/libcpprestsdk/0001-libcpprestsdk-fix-building-as-a-static-library.patch b/package/libcpprestsdk/0001-libcpprestsdk-fix-building-as-a-static-library.patch
deleted file mode 100644
index de900178d5..0000000000
--- a/package/libcpprestsdk/0001-libcpprestsdk-fix-building-as-a-static-library.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8a9c3db14a390c0a8788405e52e9b8737a430191 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 12 Feb 2018 07:49:34 -0500
-Subject: [PATCH] libcpprestsdk: fix building as a static library
-
-Use pkg-config to find OpenSSL. This will automatically find any
-dependent libraries and put them in the correct order for linking.
-
-Upstream status: submitted
-https://github.com/Microsoft/cpprestsdk/pull/688
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Release/cmake/cpprest_find_openssl.cmake | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/Release/cmake/cpprest_find_openssl.cmake b/Release/cmake/cpprest_find_openssl.cmake
-index 0b49a7e..2be8afb 100644
---- a/Release/cmake/cpprest_find_openssl.cmake
-+++ b/Release/cmake/cpprest_find_openssl.cmake
-@@ -41,8 +41,12 @@ function(cpprest_find_openssl)
-       # This should prevent linking against the system provided 0.9.8y
-       set(_OPENSSL_VERSION "")
-     endif()
--    find_package(OpenSSL 1.0.0 REQUIRED)
--
-+    if(UNIX)
-+		find_package(PkgConfig REQUIRED)
-+		pkg_search_module(OPENSSL openssl REQUIRED)
-+    else()
-+    	find_package(OpenSSL 1.0.0 REQUIRED)
-+	endif()
-     INCLUDE(CheckCXXSourceCompiles)
-     set(CMAKE_REQUIRED_INCLUDES "${OPENSSL_INCLUDE_DIR}")
-     set(CMAKE_REQUIRED_LIBRARIES "${OPENSSL_LIBRARIES}")
--- 
-2.14.3
-
diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
index 1f79a4ad95..e76522f6ee 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1c027a53457e87b0b3a475e5c8045b94400c475898c8bd51b0fbd218b99a7f7b  libcpprestsdk-2.10.15.tar.gz
+sha256  3d75e17c7d79131320438f2a15331f7ca6281c38c0e2daa27f051e290eeb8681  libcpprestsdk-2.10.16.tar.gz
 sha256  5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97  license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 69ff9f17cc..d8525cfe1b 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = 2.10.15
+LIBCPPRESTSDK_VERSION = 2.10.16
 LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,v$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
