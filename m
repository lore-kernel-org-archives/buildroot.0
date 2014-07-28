From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 22:02:07 +0400
Subject: [Buildroot] [PATCH 8/9] libtorrent: arc: Disable if ARC atomics are
	disabled
In-Reply-To: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406570528-31516-8-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtorrent requires GCC built-in atomic functions which are optional in
ARC toolchain.

This fixes:
http://autobuild.buildroot.net/results/51414e22c8ea47c38df20d864526a370c5a895d7/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/libtorrent/Config.in | 7 ++++---
 package/rtorrent/Config.in   | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index a21bf95..a8f31d2 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# ARC GCC doesn't support atomic instructions required by this lib
-	depends on !BR2_arc
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	select BR2_PACKAGE_LIBSIGC
 	help
 	  BitTorrent library written in C++ for *nix
@@ -12,4 +11,6 @@ config BR2_PACKAGE_LIBTORRENT
 
 comment "libtorrent needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_arc
+
+comment "libtorrent needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index fa81cde..a7a3411 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	# ARC GCC doesn't support atomic instructions required by libtorrent
-	depends on !BR2_arc
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
@@ -19,4 +18,6 @@ config BR2_PACKAGE_RTORRENT
 comment "rtorrent needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-	depends on !BR2_arc
+
+comment "rtorrent needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
-- 
1.8.4.1
