From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 Sep 2018 16:01:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtorrent: requires gcc >= 4.9
Message-ID: <20180915140150.7426-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream considers the build error as compiler bug:
https://github.com/rakshasa/rtorrent/issues/223

Building with gcc 4.9 works, tested with this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_RTORRENT=y

Fixes
http://autobuild.buildroot.net/results/990/990c9d62f3d275bd4e2ffad41bdb6d68c483cbb1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rtorrent/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 190e50fe26..5c5c64d892 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBTORRENT
@@ -14,7 +15,8 @@ config BR2_PACKAGE_RTORRENT
 
 	  https://github.com/rakshasa/rtorrent
 
-comment "rtorrent needs a toolchain w/ C++, threads, wchar"
+comment "rtorrent needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9)
-- 
2.18.0
