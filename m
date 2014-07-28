From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 22:02:02 +0400
Subject: [Buildroot] [PATCH 3/9] jack2: arc: Disable if ARC atomics are
	disabled
In-Reply-To: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406570528-31516-3-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jack2 requires GCC built-in atomic functions which are optional in ARC
toolchain.

This fixes:
http://autobuild.buildroot.net/results/c218be876d3abf7a8e212b6d526595bfd835e1c5/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/jack2/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index a443f58..2a04a85 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc # missing compiler intrinsics
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
@@ -23,6 +23,8 @@ config BR2_PACKAGE_JACK2
 
 comment "jack2 needs a toolchain w/ largefile, threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_arc
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
+
+comment "jack2 needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
-- 
1.8.4.1
