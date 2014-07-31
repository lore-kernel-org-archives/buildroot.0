From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu, 31 Jul 2014 17:24:44 +0400
Subject: [Buildroot] [PATCH v2 3/9] jack2: Add dependency on atomic
	intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406813090-32472-3-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jack requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

This fixes:
http://autobuild.buildroot.net/results/c218be876d3abf7a8e212b6d526595bfd835e1c5/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/jack2/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index a443f58..82143c7 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc # missing compiler intrinsics
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
@@ -21,8 +21,7 @@ config BR2_PACKAGE_JACK2
 
 	  http://jackaudio.org/
 
-comment "jack2 needs a toolchain w/ largefile, threads, C++"
+comment "jack2 needs a toolchain w/ largefile, threads, C++, atomic intrinsics"
 	depends on BR2_USE_MMU
-	depends on !BR2_arc
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
-- 
1.8.4.1
