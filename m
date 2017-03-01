From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:57:14 +0100
Subject: [Buildroot] [git commit] cmake: adjust dependencies added for libuv
Message-ID: <20170301205731.8C73D82275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90f6ad4292fabbd777ca8ee2dde17dd280b236c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1ffcf364b6e9894a876dc581a090f87685945412 updated cmake to 3.7.0,
which requires selecting the libuv package. At the time, the libuv
package only depended on BR2_TOOLCHAIN_HAS_THREADS. However, later on,
it was changed in master to depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL, a
change which was not taken into account in the cmake 3.7.0 bump that was
merged in the next branch.

Due to this, builds of cmake is attempted on architectures that don't
provide NPTL thread support, causing a build failure. This commit fixes
that by adjusting the dependency.

Fixes:

  http://autobuild.buildroot.net/results/16a5e1cbb57c0124537c4f3dc0807ba1eaa975ec/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 716d80e..2706db5 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
@@ -37,9 +37,9 @@ config BR2_PACKAGE_CMAKE_CTEST
 
 	  http://www.cmake.org/
 
-comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, threads"
+comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, NPTL"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
