From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu, 31 Jul 2014 17:24:49 +0400
Subject: [Buildroot] [PATCH v2 8/9] libtorrent: Add dependency on atomic
	intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406813090-32472-8-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtorrent requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

This fixes:
http://autobuild.buildroot.net/results/51414e22c8ea47c38df20d864526a370c5a895d7/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/libtorrent/Config.in | 9 ++++-----
 package/rtorrent/Config.in   | 9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index a21bf95..a706d98 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -2,14 +2,13 @@ config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# ARC GCC doesn't support atomic instructions required by this lib
-	depends on !BR2_arc
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	select BR2_PACKAGE_LIBSIGC
 	help
 	  BitTorrent library written in C++ for *nix
 
 	  http://libtorrent.rakshasa.no/
 
-comment "libtorrent needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_arc
+comment "libtorrent needs a toolchain w/ C++, threads, atomic intrinsics"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index fa81cde..1efc5f1 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	# ARC GCC doesn't support atomic instructions required by libtorrent
-	depends on !BR2_arc
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # libtorrent
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
@@ -16,7 +15,7 @@ config BR2_PACKAGE_RTORRENT
 
 	  http://libtorrent.rakshasa.no/
 
-comment "rtorrent needs a toolchain w/ C++, threads, wchar"
+comment "rtorrent needs a toolchain w/ C++, threads, wchar, atomic intrinsics"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-	depends on !BR2_arc
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS \
+		&& BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS)
-- 
1.8.4.1
