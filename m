From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Nov 2018 23:14:33 +0100
Subject: [Buildroot] [git commit] webkitgtk: disable JIT usage on MIPS32 R6
Message-ID: <20181105222005.86396814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a982d037bbf8d1b80007cf061e7bb766a9168d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently JavaScriptCore does not support JIT on MIPS32 R6, so remove
it from the list of supported architectures. Reported upstream:

  https://bugs.webkit.org/show_bug.cgi?id=191258

This fixes the following autobuilder failure:

  http://autobuild.buildroot.net/results/eeaf3edbf6f5bf468b10adc3d053f703c6ceba96/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index f1228892af..8714677b6a 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -22,11 +22,11 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
 	default y if BR2_i386
 	default y if BR2_x86_64
 	# JIT is known not to work on MIPS64.
-	# Plain MIPS32 (pre R2) is not well tested and likely broken.
+	# Plain MIPS32 (pre R2) is not well tested and likely broken, and R6
+	# is unsupported, see https://bugs.webkit.org/show_bug.cgi?id=191258
 	# The MIPS support is completely untested in big-endian mode.
 	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R2
 	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R5
-	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R6
 
 comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
