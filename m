From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:06:46 +0200
Subject: [Buildroot] [git commit] package/rtorrent: requires gcc >= 4.9
Message-ID: <20180916130717.58C2F88256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cb36bfcd510d848b467c7c7a02b966dd1f13d2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtorrent/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 190e50fe26..6bbcaaf56c 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	# gcc < 4.9 cause an "internal compiler error"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBTORRENT
@@ -14,7 +16,8 @@ config BR2_PACKAGE_RTORRENT
 
 	  https://github.com/rakshasa/rtorrent
 
-comment "rtorrent needs a toolchain w/ C++, threads, wchar"
+comment "rtorrent needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9)
