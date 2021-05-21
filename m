From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 21 May 2021 16:09:42 +0200
Subject: [Buildroot] [PATCH v2] toolchain: remove binutils bug 21464
Message-ID: <20210521140942.3032331-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bug has been fixed upstream and backported to buildroot binutils
package. So let's remove it from toolchain/Config.in and from packages
that are affected by it:
- libgeos
- postgis
- protobuf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* squashed 4 different patches into one
---
 package/libgeos/Config.in  | 4 +---
 package/postgis/Config.in  | 4 +---
 package/protobuf/Config.in | 1 -
 toolchain/Config.in        | 6 ------
 4 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 86a1cddcf3..124e2da661 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
@@ -13,7 +12,6 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 04705f7e16..78c52ea7b2 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
@@ -20,9 +19,8 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 27597"
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 30050950aa..46c820b9cf 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 78444f6130..06c338ee7d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
-# Affect toolchains built with binutils 2.31.1, still not fixed.
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
-	bool
-	default y if BR2_or1k
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=27100
 # Affect toolchains built with binutils 2.33.1 (fixed in binutils 2.36)
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
-- 
2.25.1
