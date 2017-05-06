From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 May 2017 23:01:55 +0200
Subject: [Buildroot] [PATCH] package/cmake: propagate libuv dependencies
Message-ID: <20170506210155.13171-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In c2c06a6de02,  cmake version was bumped and a new dependency on libuv
was added, but it did not propagate all the dependencies of libuv,
missing sync_4 (probably because sync_4 was added after the patch was
sent on the list, but before it was applied to the tree).

Fix that, which fixes unmet dependencies.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 1c95d717b3..64ab15418d 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	select BR2_PACKAGE_CMAKE
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JSONCPP
@@ -40,6 +41,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, NPTL"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.11.0
