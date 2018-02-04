From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun,  4 Feb 2018 22:45:08 +0100
Subject: [Buildroot] [PATCH] package/mono: fix crosscompilation error on
 ppc64
Message-ID: <1517780708-1738-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mono for powerpc64 could not, at least at the moment, cross compile
for a powerpc architecture.

Fixes:
http://autobuild.buildroot.net/results/9713b9976c4aa3b9345609ef6fcdf663a994fb4d/

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mono/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index d45ad37..b0a7c77 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -3,9 +3,14 @@ config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
 		      BR2_mipsel || BR2_powerpc || BR2_x86_64)
 
+config BR2_PACKAGE_MONO_CROSS_COMPILE_NOT_SUPPORTS
+	bool
+	default y if (BR2_HOSTARCH = "powerpc64le" && !BR2_powerpc64le)
+
 config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_MONO_CROSS_COMPILE_NOT_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
@@ -17,3 +22,7 @@ config BR2_PACKAGE_MONO
 comment "mono needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "on powerpc64le mono can be crosscompiled only to the same arch"
+	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_MONO_CROSS_COMPILE_NOT_SUPPORTS
-- 
2.7.4
