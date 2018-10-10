From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:22:05 +0200
Subject: [Buildroot] [git commit] webkitgtk: enable JIT support on 32-bit
 MIPS
Message-ID: <20181010192125.145C28271F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cf84fe954b4ef1ff8ac78739ffae2f7203d3b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WebKitGTK+ is known to work on all 32-bit MIPS R2 processors
or newer, in little-endian mode.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 85a3af81bf..bf0a150251 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -21,6 +21,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
 	# i386 & x86_64 don't have any special requirements.
 	default y if BR2_i386
 	default y if BR2_x86_64
+	# JIT is known not to work on MIPS64.
+	# Plain MIPS32 (pre R2) is not well tested and likely broken.
+	# The MIPS support is completely untested in big-endian mode.
+	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R2
+	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R5
+	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R6
 
 comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
