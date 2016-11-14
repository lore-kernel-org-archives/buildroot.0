From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Nov 2016 12:14:22 +0000
Subject: [Buildroot] [PATCH next] cmake: bump version to 3.7.0
Message-ID: <20161114121422.42062-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuv is now a required dependency.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/cmake/Config.in  | 11 ++++++++---
 package/cmake/cmake.hash |  4 ++--
 package/cmake/cmake.mk   |  6 +++---
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 6f04a4a..b554d7c 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -20,11 +20,14 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_LIBUV
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
+	depends on !BR2_STATIC_LIBS #libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
+	depends on BR2_USE_MMU # libuv
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
@@ -34,7 +37,9 @@ config BR2_PACKAGE_CMAKE_CTEST
 
 	  http://www.cmake.org/
 
-comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
+comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, threads"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f846dc9..687e5a4 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.6/cmake-3.6.3-SHA-256.txt
-sha256 7d73ee4fae572eb2d7cd3feb48971aea903bb30a20ea5ae8b4da826d8ccad5fe  cmake-3.6.3.tar.gz
+# From http://www.cmake.org/files/v3.7/cmake-3.7.0-SHA-256.txt
+sha256 ed63e05c41aeb6c036e503114ab15847f29c312f9f21f5f1a7060a4b4ec2fb31  cmake-3.7.0.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index fadb09e..522d7fe 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.6
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.7
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
@@ -22,7 +22,7 @@ CMAKE_LICENSE_FILES = Copyright.txt
 #   the system-wide libraries instead of rebuilding and statically
 #   linking with the ones bundled into the CMake sources.
 
-CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz
+CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv
 
 CMAKE_CONF_OPTS = \
 	-DKWSYS_LFS_WORKS=TRUE \
-- 
2.10.1
