From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 20:54:11 +0300
Subject: [Buildroot] [PATCH] libv4l: needs dynamic library support
Message-ID: <98716efabf8bc5fffbf065d5df8ef129b9a4bcd1.1436810051.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/752/752cda64e3a4a73adfd9b383d5f42b61e4a1e641/
http://autobuild.buildroot.net/results/042/0423132222f8a8030f703bb8d755f3e9a4ee73d8/
http://autobuild.buildroot.net/results/908/9087769da17e2092c3ad2eb901ff87c1d6437e6a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libv4l/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index a5455cb5eb06..0437ba1872b7 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBV4L
 	bool "libv4l"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
@@ -28,7 +29,7 @@ config BR2_PACKAGE_LIBV4L_UTILS
 
 endif
 
-comment "libv4l needs a toolchain w/ threads and C++, headers >= 3.0"
+comment "libv4l needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
2.1.4
