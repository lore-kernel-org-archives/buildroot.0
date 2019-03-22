From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Mar 2019 23:54:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk: add
 BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
Message-ID: <20190322225451.24545-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openjdk does not support arc or riscv, see:
https://github.com/openjdk/jdk/blob/d85131a4d11d5767ae3afacd8627a4a8f8cbab95/make/autoconf/platform.m4

Fixes:
 - http://autobuild.buildroot.org/results/c5782d6b52516d07469adf6600d4fc69c4016157
 - http://autobuild.buildroot.org/results/8437ebe0fd228c2d8856255411026f30e39778e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openjdk/Config.in | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index dd1f3c59cf..f243afbec8 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -2,8 +2,20 @@ config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	bool
 	default y if BR2_HOSTARCH = "x86_64"
 
+config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_m68k
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_sh
+	default y if BR2_sparc || BR2_sparc64
+
 config BR2_PACKAGE_OPENJDK
 	bool "openjdk"
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	depends on !BR2_SOFT_FLOAT
 	depends on !BR2_STATIC_LIBS # glibc
 	depends on BR2_INSTALL_LIBSTDCPP # cups
@@ -59,14 +71,17 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
 endif
 
 comment "openjdk needs X.Org"
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_XORG7
 
 comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++"
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
 
 comment "openjdk does not support soft float configurations"
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_SOFT_FLOAT
-- 
2.14.1
