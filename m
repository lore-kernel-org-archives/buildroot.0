From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 10 Oct 2018 01:08:51 +0300
Subject: [Buildroot] [PATCH 3/4] webkitgtk: enable JIT support on 32-bit MIPS
In-Reply-To: <20181009220852.4309-1-aperez@igalia.com>
References: <20181009220852.4309-1-aperez@igalia.com>
Message-ID: <20181009220852.4309-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WebKitGTK+ is known to work on all 32-bit MIPS R2 processors
or newer, in little-endian mode.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
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
-- 
2.19.1
