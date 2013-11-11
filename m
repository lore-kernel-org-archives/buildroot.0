From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 22:29:50 +0100
Subject: [Buildroot] [git commit] toolchain-external: make sure (e)glibc
	isn't chosen when BR2_PREFER_STATIC_LIB=y
Message-ID: <20131111213335.0843E9BBE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed3f3e433f146a093750905a3c578ae2ec83c1c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(e)glibc doesn't support a fully statically linked userspace. Even a
basic program such as Busybox fails to do authentication due to glibc
loading some libraries dynamically. Therefore, we disable the
possibility of using a (e)glibc toolchain when
BR2_PREFER_STATIC_LIB=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in |   37 ++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a7fcca7..22e3fb2 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,12 +3,16 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
+comment "(e)glibc toolchains only available with shared lib support"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
 	bool "Linaro 2013.09"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -30,6 +34,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -51,6 +56,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -69,12 +75,14 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
+	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	bool "Sourcery CodeBench ARM 2013.05"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -100,6 +108,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -125,6 +134,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -148,6 +158,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 comment "Sourcery CodeBench toolchains available for the EABI ABI"
 	depends on BR2_arm
 	depends on !BR2_ARM_EABI
+	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	bool "Arago ARMv7 2011.09"
@@ -156,6 +167,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_ARM_EABI
 	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -178,6 +190,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 		BR2_GCC_TARGET_ARCH != "armv4" && \
 		BR2_GCC_TARGET_ARCH != "armv5t"
 	depends on BR2_ARM_EABI
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -193,6 +206,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -260,6 +274,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	depends on BR2_mips || BR2_mipsel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -327,6 +342,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	depends on BR2_mips || BR2_mipsel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -391,11 +407,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 
 comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
 	depends on BR2_MIPS_NABI32
+	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	bool "Sourcery CodeBench Nios-II 2013.05"
 	depends on BR2_nios2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -409,6 +427,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	bool "Sourcery CodeBench PowerPC 2011.03"
 	depends on BR2_powerpc
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -439,6 +458,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	bool "Sourcery CodeBench PowerPC 2010.09"
 	depends on BR2_powerpc
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -469,6 +489,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
 	bool "Sourcery CodeBench SH 2012.09"
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -491,6 +512,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	bool "Sourcery CodeBench SH 2012.03"
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -512,6 +534,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	bool "Sourcery CodeBench SH 2011.03"
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -572,6 +595,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	bool "Sourcery CodeBench x86/x86_64 2012.09"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -596,6 +620,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	bool "Sourcery CodeBench x86/x86_64 2012.03"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -619,6 +644,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	bool "Sourcery CodeBench x86/x86_64 2011.09"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -677,6 +703,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	bool "Xilinx Little Endian Microblaze GNU Tools 14.3"
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -689,6 +716,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	bool "Xilinx Little Endian Microblaze GNU Tools v2"
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -699,6 +727,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	bool "Xilinx Big Endian Microblaze GNU Tools"
 	depends on BR2_microblazebe
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -711,6 +740,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	bool "Xilinx Big Endian Microblaze GNU Tools"
 	depends on BR2_microblazebe
 	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -721,6 +751,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_09
 	bool "Linaro AArch64 13.09"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -733,6 +764,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_08
 	bool "Linaro AArch64 13.08"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -745,6 +777,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_07
 	bool "Linaro AArch64 13.07"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -869,6 +902,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	bool "glibc/eglibc"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Select this option if your external toolchain uses the GNU C
@@ -880,6 +914,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	  toolchain with eglibc configured to exclude key features may
 	  cause build failures to some packages.
 
+comment "(e)glibc only available with shared lib support"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
 	bool "musl"
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
