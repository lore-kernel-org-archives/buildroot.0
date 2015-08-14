From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 14 Aug 2015 11:45:40 +0100
Subject: [Buildroot] [PATCH] Add support for mips32r6 and mips64r6 target
	architecture variants
Message-ID: <1439549140-58207-1-git-send-email-Vincent.Riera@imgtec.com>
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
 arch/Config.in.mips                     |    8 ++++++++
 package/binutils/Config.in.host         |    4 ++++
 package/gcc/Config.in.host              |    8 ++++++++
 package/glibc/Config.in                 |    2 ++
 package/glibc/glibc.mk                  |   22 ++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in |    4 ++++
 toolchain/toolchain-external/Config.in  |    8 ++++++++
 7 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 7630503..cb3baa3 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
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
 
 
@@ -71,8 +77,10 @@ config BR2_GCC_TARGET_ARCH
 	default "mips4"		if BR2_mips_4
 	default "mips32"	if BR2_mips_32
 	default "mips32r2"	if BR2_mips_32r2
+	default "mips32r6"	if BR2_mips_32r6
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
+	default "mips64r6"	if BR2_mips_64r6
 
 config BR2_MIPS_OABI32
 	bool
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 40619ab..b8b5f8c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -10,11 +10,15 @@ choice
 	config BR2_BINUTILS_VERSION_2_23_X
 		depends on !BR2_aarch64 && !BR2_microblaze && \
 			   !BR2_powerpc64le && !BR2_nios2
+		# Broken on unsupported MIPS cores
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24_X
 		# supported, but broken on Nios-II and powerpc64le
 		depends on !BR2_nios2 && !BR2_powerpc64le
+		# Broken on unsupported MIPS cores
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		bool "binutils 2.24"
 
 	config BR2_BINUTILS_VERSION_2_25_X
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index baa7956..6a9ac64 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -31,6 +31,8 @@ choice
 		depends on !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_x86_steamroller
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
+		# Broken on unsupported MIPS cores
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 		select BR2_GCC_NEEDS_MPC
@@ -50,6 +52,8 @@ choice
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
+		# Broken on unsupported MIPS cores
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		select BR2_GCC_NEEDS_MPC
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
@@ -64,6 +68,8 @@ choice
 		depends on !BR2_powerpc_power8
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
 		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
+		# Broken on unsupported MIPS cores
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -80,6 +86,8 @@ choice
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
 		depends on !BR2_arc
+		# Broken on unsupported MIPS cores
+		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 8cc8cce..53c867e 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -38,6 +38,8 @@ config BR2_GLIBC_VERSION_2_20
 	depends on !BR2_nios2
 	# Broken see https://bugs.busybox.net/show_bug.cgi?id=7941
 	depends on !BR2_sparc
+	# Broken on unsupported MIPS cores
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	bool "2.20"
 
 config BR2_GLIBC_VERSION_2_21
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cbfbf32..1fdd50a 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -121,4 +121,26 @@ define GLIBC_INSTALL_TARGET_CMDS
 	done
 endef
 
+# We need this in order to make glibc compile successfully for MIPS R6.
+# MIPS R6 requires to have NaN2008 support which is currently
+# unavailable in the Linux kernel, so in order to not allow the
+# compilation glibc checks for a version 10.0.0 of the Linux headers.
+# In general the compatibility issues introduced by mis-matched NaN
+# encodings will not cause a problem as signalling NaNs are rarely used
+# in average code. For MIPS R6 there isn't actually any compatibility
+# issue as the hardware is always NaN2008 and software is always
+# NaN2008. The problem only comes from when older MIPS code is linked in
+# via a DSO and multiple NaN encodings are introduced. Since buildroot
+# is intended to have all code built from source then this scenario is
+# highly unlikely. The failure mode, if it ever occurs, would be either
+# that a signalling NaN fails to raise an invalid operation exception or
+# (more likely) an ordinary NaN raises an invalid operation exception.
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
index 13e2b15..5cd7529 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -34,6 +34,8 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
 		   BR2_sparc   || BR2_xtensa || BR2_x86_64
+	# Broken on unsupported MIPS cores
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	help
 	  This option selects uClibc as the C library for the
 	  cross-compilation toolchain.
@@ -89,6 +91,8 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
 		BR2_sh || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
+	# Broken on unsupported MIPS cores
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0b45e12..8f73381 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -201,6 +201,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
+	# Broken on unsupported MIPS cores
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -287,6 +289,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
+	# Broken on unsupported MIPS cores
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -373,6 +377,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
+	# Broken on unsupported MIPS cores
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -846,6 +852,8 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Broken on unsupported MIPS cores
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-- 
1.7.1
