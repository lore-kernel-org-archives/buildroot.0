From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:16:00 +0100
Subject: [Buildroot] [git commit] thrift: remove BR2_ARCH_HAS_ATOMICS
	dependency
Message-ID: <20160206101652.31D8880771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a98a7d94caf3480b07d188973c367c97430f6ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

thrift builds perfectly fine on SPARC, which doesn't implement any of
the __sync built-ins, so we can get rid of the BR2_ARCH_HAS_ATOMICS
dependency.

The dependency on atomic operations originated in commit
1aaa14d84f1c920423ed0286b78f64a2b4b2b575 ("thrift: disable for ARC"),
but there was no reference to any autobuilder failure. Our testing
with an ARC toolchain that doesn't have atomics shows that thrift
builds just fine, and code inspection also shows no usage of
__sync_*() built-ins. At the time of the commit, the thrift version
was 0.9.1, which also did not contain any __sync_*() call.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested on an ARC toolchain without
 atomics, with CPU 770D]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/thrift/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index b9960f8..54ca9b8 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
@@ -20,7 +19,6 @@ config BR2_PACKAGE_THRIFT
 	  http://thrift.apache.org/
 
 comment "thrift needs a toolchain w/ C++, wchar, threads"
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
