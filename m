From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:16:41 +0100
Subject: [Buildroot] [git commit] arch: add support for AMD steamroller
Message-ID: <20150304211938.CEA798180A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50451998f0e39d46675e9b1638ed4e38aae3ceba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for AMD steamroller optimizations, available in gcc 4.8+ as
bdver3.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.x86                     |   11 +++++++++++
 package/gcc/Config.in.host             |    4 ++--
 toolchain/toolchain-external/Config.in |    3 +++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 8a844db..d5788b1 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -139,6 +139,15 @@ config BR2_x86_jaguar
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+config BR2_x86_steamroller
+	bool "steamroller"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_geode
 	bool "geode"
 	# Don't include MMX support because there several variant of geode
@@ -189,6 +198,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
 	default "i686"		if BR2_x86_barcelona && BR2_i386
 	default "i686"		if BR2_x86_jaguar && BR2_i386
+	default "i686"		if BR2_x86_steamroller && BR2_i386
 	default "i686"		if BR2_x86_k6
 	default "i686"		if BR2_x86_k6_2
 	default "i686"		if BR2_x86_athlon
@@ -221,6 +231,7 @@ config BR2_GCC_TARGET_ARCH
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
 	default "btver2"	if BR2_x86_jaguar
+	default "bdver3"	if BR2_x86_steamroller
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index dd61f51..e07d881 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -29,7 +29,7 @@ choice
 		# SPARC -mcpu=leon3 appeared in gcc 4.8.x
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported X86 cores
-		depends on !BR2_x86_corei7 && !BR2_x86_jaguar
+		depends on !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_x86_steamroller
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		# musl patches only for gcc 4.7+
@@ -49,7 +49,7 @@ choice
 		# SPARC -mcpu=leon3 appeared in gcc 4.8.x
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
-		depends on !BR2_x86_jaguar
+		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
 		select BR2_GCC_NEEDS_MPC
 
 	config BR2_GCC_VERSION_4_8_X
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4321e43..e70c3ce 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -676,6 +676,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_x86_jaguar
+	depends on !BR2_x86_steamroller
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -703,6 +704,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_x86_jaguar
+	depends on !BR2_x86_steamroller
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -729,6 +731,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_x86_jaguar
+	depends on !BR2_x86_steamroller
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
