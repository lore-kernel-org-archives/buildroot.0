From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:42 +0200
Subject: [Buildroot] [PATCH 03/24 v5] package/libtorrent: use the new
	ARCH_HAS_ATOMICS as dependency
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <a948ff8a1495582bae3c6f4b2efd507fc7f63313.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And propagate to the reverse dependencies of libtorrent

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtorrent/Config.in | 8 ++++----
 package/rtorrent/Config.in   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index a706d98..aac71fa 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -2,13 +2,13 @@ config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_LIBSIGC
 	help
 	  BitTorrent library written in C++ for *nix
 
 	  http://libtorrent.rakshasa.no/
 
-comment "libtorrent needs a toolchain w/ C++, threads, atomic intrinsics"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+comment "libtorrent needs a toolchain w/ C++, threads"
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 1efc5f1..1798331 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # libtorrent
+	depends on BR2_ARCH_HAS_ATOMICS # libtorrent
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
@@ -15,7 +15,7 @@ config BR2_PACKAGE_RTORRENT
 
 	  http://libtorrent.rakshasa.no/
 
-comment "rtorrent needs a toolchain w/ C++, threads, wchar, atomic intrinsics"
+comment "rtorrent needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS \
-		&& BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS)
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.9.1
