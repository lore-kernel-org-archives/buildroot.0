From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 15:41:57 +0100
Subject: [Buildroot] [git commit] libtorrent: disable on ARC arch
Message-ID: <20140210150742.DA52A9C951@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a36923ce78426c95bdb857e87968e6fd664c3f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libtorrent has dependencies on atomic operations. However ARC GCC doesn't
implement those at the moment so package should be disabled. Rtorrent
depends on libtorrent.

This fixes:
http://autobuild.buildroot.net/results/51414e22c8ea47c38df20d864526a370c5a895d7/

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtorrent/Config.in |    3 +++
 package/rtorrent/Config.in   |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index a7e358d..a21bf95 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# ARC GCC doesn't support atomic instructions required by this lib
+	depends on !BR2_arc
 	select BR2_PACKAGE_LIBSIGC
 	help
 	  BitTorrent library written in C++ for *nix
@@ -10,3 +12,4 @@ config BR2_PACKAGE_LIBTORRENT
 
 comment "libtorrent needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 0f39a92..fa81cde 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	# ARC GCC doesn't support atomic instructions required by libtorrent
+	depends on !BR2_arc
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
@@ -17,3 +19,4 @@ config BR2_PACKAGE_RTORRENT
 comment "rtorrent needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_arc
