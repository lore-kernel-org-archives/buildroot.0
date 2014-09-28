From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 23:20:36 +0200
Subject: [Buildroot] [git commit] package/trace-cmd: does not build on
	static only, needs dlopen()
Message-ID: <20140928212210.46F379D6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ac41fa467ca28638e594b0f47be19621e015eba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/4d773e0738c1d5adada8c0a4bca312068132fd9b/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trace-cmd/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
