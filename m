From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 17:50:30 +0100
Subject: [Buildroot] [git commit] package/openjdk: restrict to support
 architectures
Message-ID: <20190325164832.02AC181628@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=011c2b915fa2414469da1aa1bc02716cecaeb5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This list is taken from make/autoconf/platform.m4 and fixes
http://autobuild.buildroot.net/results/df7/df7f393ec62f0e38034837ffa591ac5af424c373
http://autobuild.buildroot.net/results/c57/c5782d6b52516d07469adf6600d4fc69c4016157
http://autobuild.buildroot.net/results/f36/f36b96c91604dda021ee05dd0a79c4f7e89e5a5b

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas:
 - rename option to BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 - actually use it in the Config.in comments]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/Config.in | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index dd1f3c59cf..3f2f1f47c2 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -2,8 +2,22 @@ config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	bool
 	default y if BR2_HOSTARCH = "x86_64"
 
+# Taken from make/autoconf/platform.m4
+config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_m68k
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_sh
+	default y if BR2_sparc || BR2_sparc64
+
 config BR2_PACKAGE_OPENJDK
 	bool "openjdk"
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	depends on !BR2_SOFT_FLOAT
 	depends on !BR2_STATIC_LIBS # glibc
 	depends on BR2_INSTALL_LIBSTDCPP # cups
@@ -59,14 +73,20 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
 endif
 
 comment "openjdk needs X.Org"
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_XORG7
 
 comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
 
 comment "openjdk does not support soft float configurations"
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_SOFT_FLOAT
