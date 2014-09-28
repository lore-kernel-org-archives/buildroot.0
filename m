From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 18:26:29 +0200
Subject: [Buildroot] [PATCH 3/4] package/trace-cmd: does not build on static
	onl; y, needs dlopen()
In-Reply-To: <cover.1411921550.git.yann.morin.1998@free.fr>
References: <cover.1411921550.git.yann.morin.1998@free.fr>
Message-ID: <6e627ac1abcc876371ba820aef879ecd95aa41d5.1411921550.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.net/results/4d773e0738c1d5adada8c0a4bca312068132fd9b/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/trace-cmd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index baa4868..8b3bc5f 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TRACE_CMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_avr32 # AVR32 does not have TLS support
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB # dlopen()
 	help
 	  Command line reader for ftrace.
 
@@ -14,6 +15,7 @@ config BR2_PACKAGE_TRACE_CMD
 
 	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
 
-comment "trace-cmd needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "trace-cmd needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_PREFER_STATIC_LIB
-- 
1.9.1
