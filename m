From: Anton Kolesov <anton.kolesov@synopsys.com>
Date: Mon, 10 Feb 2014 15:27:54 +0400
Subject: [Buildroot] [PATCH] libtorrent: disable on ARC arch
Message-ID: <1392031674-30031-1-git-send-email-anton.kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtorrent has dependencies on atomic operations. However ARC GCC doesn't
implement those at the moment so package should be disabled.

This fixes:
http://autobuild.buildroot.net/results/51414e22c8ea47c38df20d864526a370c5a895d7/

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
---
 package/libtorrent/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index a7e358d..6c8d09d 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+        # ARC GCC doesn't support atomic instructions required by this lib
+        depends on !BR2_arc
 	select BR2_PACKAGE_LIBSIGC
 	help
 	  BitTorrent library written in C++ for *nix
-- 
1.8.4.1
