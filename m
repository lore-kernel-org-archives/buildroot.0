From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 12 Oct 2015 11:08:06 +0100
Subject: [Buildroot] [PATCH v2] Add support for mips32r6 and mips64r6 target
	architecture variants
Message-ID: <1444644486-11117-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add support for mips32r6 and mips64r6 target architecture variants
- Disable unsupported gcc versions
- Disable unsupported binutils versions
- Disable unsupported external toolchains
- Disable unsuported C libraries
- Add a hook in order to make glibc compile for MIPS R6.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
  - Rebase on top of master
  - Change the "Broken" comments to "Unsupported" (Suggested by Thomas)
  - Specify why we choose the 4.0.0 version for the glibc hook
  - Add 32r6 and 64r6 in the help message of arch/Config.in.mips

 arch/Config.in.mips                     |   12 ++++++++++--
 package/binutils/Config.in.host         |    4 ++++
 package/gcc/Config.in.host              |    8 ++++++++
 package/glibc/glibc.mk                  |   24 ++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in |    4 ++++
 toolchain/toolchain-external/Config.in  |    8 ++++++++
 6 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 297977a..1e5d24d 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -6,8 +6,8 @@ choice
 	help
 	  Specific CPU variant to use
 
-	  64bit cabable: 64, 64r2
-	  non-64bit capable: 32, 32r2
+	  64bit cabable: 64, 64r2, 64r6
+	  non-64bit capable: 32, 32r2, 32r6
 
 config BR2_mips_32
 	bool "mips 32"
@@ -15,12 +15,18 @@ config BR2_mips_32
 config BR2_mips_32r2
 	bool "mips 32r2"
 	depends on !BR2_ARCH_IS_64
+config BR2_mips_32r6
+	bool "mips 32r6"
+	depends on !BR2_ARCH_IS_64
 config BR2_mips_64
 	bool "mips 64"
 	depends on BR2_ARCH_IS_64
 config BR2_mips_64r2
 	bool "mips 64r2"
 	depends on BR2_ARCH_IS_64
+config BR2_mips_64r6
+	bool "mips 64r6"
+	depends on BR2_ARCH_IS_64
 endchoice
 
 
@@ -67,8 +73,10 @@ config BR2_ARCH_HAS_ATOMICS
 config BR2_GCC_TARGET_ARCH
 	default "mips32"	if BR2_mips_32
 	default "mips32r2"	if BR2_mips_32r2
+	default "mips32r6"	if BR2_mips_32r6
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
+	default "mips64r6"	if BR2_mips_64r6
 
 config BR2_MIPS_OABI32
 	bool
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 40619ab..f6aac5c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -10,11 +10,15 @@ choice
 	config BR2_BINUTILS_VERSION_2_23_X
 		depends on !BR2_aarch64 && !BR2_microblaze && \
 			   !BR2_powerpc64le && !BR2_nios2
+		# Unsupported for MIPS R6
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24_X
 		# supported, but broken on Nios-II and powerpc64le
 		depends on !BR2_nios2 && !BR2_powerpc64le
+		# Unsupported for MIPS R6
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		bool "binutils 2.24"
 
 	config BR2_BINUTILS_VERSION_2_25_X
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index baa7956..78eb50b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -31,6 +31,8 @@ choice
 		depends on !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_x86_steamroller
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
+		# Unsupported for MIPS R6
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 		select BR2_GCC_NEEDS_MPC
@@ -50,6 +52,8 @@ choice
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
+		# Unsupported for MIPS R6
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		select BR2_GCC_NEEDS_MPC
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
@@ -64,6 +68,8 @@ choice
 		depends on !BR2_powerpc_power8
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
 		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
+		# Unsupported for MIPS R6
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -80,6 +86,8 @@ choice
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
 		depends on !BR2_arc
+		# Unsupported for MIPS R6
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cbfbf32..86f025e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -121,4 +121,28 @@ define GLIBC_INSTALL_TARGET_CMDS
 	done
 endef
 
+# MIPS R6 requires to have NaN2008 support which is currently
+# unavailable in the Linux kernel, so in order to not allow the
+# compilation glibc checks for a version 10.0.0 of the Linux headers.
+# In general the compatibility issues introduced by mis-matched NaN
+# encodings will not cause a problem as signalling NaNs are rarely used
+# in average code. For MIPS R6 there isn't actually any compatibility
+# issue as the hardware is always NaN2008 and software is always
+# NaN2008. The problem only comes from when older MIPS code is linked in
+# via a DSO and multiple NaN encodings are introduced. Since Buildroot
+# is intended to have all code built from source then this scenario is
+# highly unlikely. The failure mode, if it ever occurs, would be either
+# that a signalling NaN fails to raise an invalid operation exception or
+# (more likely) an ordinary NaN raises an invalid operation exception.
+# In order to be able to compile glibc for MIPS R6 we change the Linux
+# kernel headers check from 10.0.0 to 4.0.0, because the MIPS R6 ISA
+# support has been part of mainline since v4.0.
+ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+define GLIBC_FIX_MIPS_R6
+	$(SED) 's#10.0.0#4.0.0#' $(@D)/sysdeps/unix/sysv/linux/mips/configure
+	$(SED) 's#10.0.0#4.0.0#' $(@D)/sysdeps/unix/sysv/linux/mips/configure.ac
+endef
+GLIBC_POST_EXTRACT_HOOKS += GLIBC_FIX_MIPS_R6
+endif
+
 $(eval $(autotools-package))
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 56c01c8..d3f685f 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -34,6 +34,8 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
 		   BR2_sparc   || BR2_xtensa || BR2_x86_64
+	# Unsupported for MIPS R6
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	help
 	  This option selects uClibc as the C library for the
 	  cross-compilation toolchain.
@@ -90,6 +92,8 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
 		BR2_sh || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
+	# Unsupported for MIPS R6
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 1bf97b8..18eb784 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -196,6 +196,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
+	# Unsupported for MIPS R6
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -282,6 +284,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
+	# Unsupported for MIPS R6
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -368,6 +372,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
+	# Unsupported for MIPS R6
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -824,6 +830,8 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Unsupported for MIPS R6
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-- 
1.7.1
