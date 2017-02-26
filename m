From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:39:03 +0100
Subject: [Buildroot] [git commit] Revert "cmake: bump version to 3.7.0"
Message-ID: <20170226214212.C607A7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85b852a969c87ccae423ffe2bf250d836aa7832c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmake 3.7 causes serious regressions in some cmake-based packages,
related to how RPATH is handled.

This reverts commit 1ffcf364b6e9894a876dc581a090f87685945412.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/Config.in  | 9 ++-------
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 6 +++---
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 716d80e..6f04a4a 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -20,14 +20,11 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_XZ
-	select BR2_PACKAGE_LIBUV
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
-	depends on BR2_USE_MMU # libuv
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
@@ -37,9 +34,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 
 	  http://www.cmake.org/
 
-comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, threads"
+comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
-	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 687e5a4..f846dc9 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.7/cmake-3.7.0-SHA-256.txt
-sha256 ed63e05c41aeb6c036e503114ab15847f29c312f9f21f5f1a7060a4b4ec2fb31  cmake-3.7.0.tar.gz
+# From http://www.cmake.org/files/v3.6/cmake-3.6.3-SHA-256.txt
+sha256 7d73ee4fae572eb2d7cd3feb48971aea903bb30a20ea5ae8b4da826d8ccad5fe  cmake-3.6.3.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e4904fc..bc55509 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.7
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION_MAJOR = 3.6
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
@@ -22,7 +22,7 @@ CMAKE_LICENSE_FILES = Copyright.txt
 #   the system-wide libraries instead of rebuilding and statically
 #   linking with the ones bundled into the CMake sources.
 
-CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv
+CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz
 
 CMAKE_CONF_OPTS = \
 	-DKWSYS_LFS_WORKS=TRUE \
