From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: replace every BR2_mips_* with the
	new MIPS CPU options
Message-ID: <20161015112247.5F38A81EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45c92c60b163abefb0e78fe4f992d7cbbdaa72e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host         | 2 +-
 package/gcc/Config.in.host              | 6 +++---
 package/glibc/glibc.mk                  | 2 +-
 package/gmp/gmp.mk                      | 2 +-
 package/go/Config.in.host               | 2 +-
 package/gstreamer/gst-ffmpeg/Config.in  | 2 +-
 package/luajit/Config.in                | 2 +-
 package/mbedtls/mbedtls.mk              | 2 +-
 package/mongrel2/mongrel2.mk            | 2 +-
 package/nodejs/nodejs.mk                | 6 +++---
 package/openblas/Config.in              | 6 +++---
 package/polarssl/polarssl.mk            | 2 +-
 package/uclibc/Config.in                | 6 +++---
 toolchain/toolchain-buildroot/Config.in | 4 ++--
 toolchain/toolchain-external/Config.in  | 8 ++++----
 15 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 5ea5f31..889d8ce 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,7 +12,7 @@ choice
 		# supported, but broken on Nios-II, Blackfin and powerpc64le
 		depends on !BR2_nios2 && !BR2_powerpc64le && !BR2_bfin
 		# Unsupported for MIPS R6
-		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# Unsupported ARM cores
 		depends on !BR2_cortex_a17
 		bool "binutils 2.24"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5b847fa..3c4d1cd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -29,7 +29,7 @@ choice
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
 		# Unsupported for MIPS R6
-		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		select BR2_GCC_NEEDS_MPC
@@ -47,7 +47,7 @@ choice
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
 		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
 		# Unsupported for MIPS R6
-		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# musl mips64 unsupported
@@ -71,7 +71,7 @@ choice
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a17
 		# Unsupported for MIPS R6
-		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# musl mips64 unsupported
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2c32e65..50154e8 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -136,7 +136,7 @@ endef
 # highly unlikely. The failure mode, if it ever occurs, would be either
 # that a signalling NaN fails to raise an invalid operation exception or
 # (more likely) an ordinary NaN raises an invalid operation exception.
-ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 define GLIBC_FIX_MIPS_R6
 	$(SED) 's#10.0.0#4.0.0#' \
 		$(@D)/sysdeps/unix/sysv/linux/mips/configure \
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 420fd2f..843a7a1 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -15,7 +15,7 @@ HOST_GMP_DEPENDENCIES = host-m4
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
-ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6)$(BR2_ARM_CPU_ARMV7M)$(BR2_arc),y)
+ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M)$(BR2_arc),y)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index d79c669..8d4d346 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 		|| BR2_mips64 || BR2_mips64el
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
-	depends on !BR2_mips_64r6
+	depends on !BR2_MIPS_CPU_MIPS64R6
 
 config BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	bool
diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index f3d4b3e..2164ea2 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	# Unsupported for MIPS R6. It bundles a version of libav which
 	# doesn't have support for MIPS R6.
-	depends on !BR2_mips_32r6 && !BR2_mips_64r6
+	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# triggers https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65151 on sh
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
 	select BR2_PACKAGE_GST_PLUGINS_BASE
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f9285e8..380f247 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
 		BR2_powerpc || BR2_arm || BR2_armeb || \
 		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
-		!BR2_mips_32r6 && !BR2_mips_64r6)
+		!BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6)
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 7067beb..d55e16b 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -60,7 +60,7 @@ endef
 # MIPS R6 asm is not yet supported
 ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
 MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
-else ifeq ($(BR2_microblaze)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
+else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
 endif
 
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index d0640c9..c69c143 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -24,7 +24,7 @@ ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THU
 MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
 else ifeq ($(BR2_microblaze),y)
 MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
-else ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+else ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
 endif
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index d6f115a..81006f5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -96,12 +96,12 @@ endif
 
 # MIPS architecture specific options
 ifeq ($(BR2_mips)$(BR2_mipsel),y)
-ifeq ($(BR2_mips_32r6),y)
+ifeq ($(BR2_MIPS_CPU_MIPS32R6),y)
 NODEJS_MIPS_ARCH_VARIANT = r6
 NODEJS_MIPS_FPU_MODE = fp64
-else ifeq ($(BR2_mips_32r2),y)
+else ifeq ($(BR2_MIPS_CPU_MIPS32R2),y)
 NODEJS_MIPS_ARCH_VARIANT = r2
-else ifeq ($(BR2_mips_32),y)
+else ifeq ($(BR2_MIPS_CPU_MIPS32),y)
 NODEJS_MIPS_ARCH_VARIANT = r1
 endif
 endif
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 0609a91..1fbed1c 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -27,10 +27,10 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PPC440"       if BR2_powerpc_440
 	default "PPC440FP2"    if BR2_powerpc_440fp
 	# P5600 is built with MSA support which is only available in Codescape toolchains
-	default "P5600"        if BR2_mips_32r2 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	default "SICORTEX"     if BR2_mips_64
+	default "P5600"        if BR2_MIPS_CPU_MIPS32R2 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
+	default "SICORTEX"     if BR2_MIPS_CPU_MIPS64
 	# I6400 is built with MSA support which is only available in Codescape toolchains
-	default "I6400"        if BR2_mips_64r6 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
+	default "I6400"        if BR2_MIPS_CPU_MIPS64R6 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	default "SPARC"        if BR2_sparc
 	# Cortex-A15 always have a VFPv4
 	default "CORTEXA15"    if (BR2_cortex_a15 && BR2_ARM_EABIHF)
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 9199f28..7f4c582 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -25,7 +25,7 @@ ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THU
 POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
 else ifeq ($(BR2_microblaze),y)
 POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
-else ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+else ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
 endif
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 33969cc..cbae096 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -145,9 +145,9 @@ config BR2_UCLIBC_MIPS_ABI
 config BR2_UCLIBC_MIPS_ISA
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
-	default "MIPS32" if BR2_mips_32
-	default "MIPS32R2" if BR2_mips_32r2
-	default "MIPS64" if BR2_mips_64
+	default "MIPS32" if BR2_MIPS_CPU_MIPS32
+	default "MIPS32R2" if BR2_MIPS_CPU_MIPS32R2
+	default "MIPS64" if BR2_MIPS_CPU_MIPS64
 
 config BR2_UCLIBC_SH_TYPE
 	string
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8e275c2..310572e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -35,7 +35,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
 		   BR2_sparc   || BR2_xtensa || BR2_x86_64
 	# Unsupported for MIPS R6
-	depends on !BR2_mips_32r6 && !BR2_mips_64r6
+	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	help
 	  This option selects uClibc-ng as the C library for the
 	  cross-compilation toolchain.
@@ -74,7 +74,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 		   BR2_sh         || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# Unsupported for MIPS R6
-	depends on !BR2_mips_32r6 && !BR2_mips_64r6
+	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
 	depends on BR2_USE_MMU
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index bcb42db..15095b6 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -190,7 +190,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	bool "Sourcery CodeBench MIPS 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_mips_32r2 || BR2_mips_64r2
+	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
@@ -283,7 +283,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	bool "Codescape IMG GNU Linux Toolchain 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_mips_32r6 || (BR2_mips_64r6 && !BR2_MIPS_SOFT_FLOAT)
+	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -346,7 +346,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	bool "Codescape MTI GNU Linux Toolchain 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_mips_32r2 || (BR2_mips_64r2 && !BR2_MIPS_SOFT_FLOAT)
+	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -595,7 +595,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 		BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	# Unsupported for MIPS R6
-	depends on !BR2_mips_32r6 && !BR2_mips_64r6
+	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
