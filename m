From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 00:07:56 +0100
Subject: [Buildroot] [PATCH 10/21] libtorrent: use the proper
	BR2_TOOLCHAIN_HAS_SYNC_x symbols
In-Reply-To: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453676887-31236-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libtorrent uses 1 bytes and 4 bytes __sync built-ins, so let's use the
appropriate BR2_TOOLCHAIN_HAS_SYNC_x symbols instead of
BR2_ARCH_HAS_ATOMICS. The rtorrent package, which is a reverse
dependency of libtorrent, gets fixed as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtorrent/Config.in | 4 ++--
 package/rtorrent/Config.in   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index 17a1f23..4787f9c 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_ZLIB
 	help
 	  BitTorrent library written in C++ for *nix
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBTORRENT
 	  https://github.com/rakshasa/libtorrent
 
 comment "libtorrent needs a toolchain w/ C++, threads"
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 0583152..190e50f 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_ARCH_HAS_ATOMICS # libtorrent
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBTORRENT
 	select BR2_PACKAGE_NCURSES
@@ -16,5 +16,5 @@ config BR2_PACKAGE_RTORRENT
 
 comment "rtorrent needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-- 
2.6.4
