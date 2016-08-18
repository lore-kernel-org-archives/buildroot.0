From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 18 Aug 2016 08:37:29 +0200
Subject: [Buildroot] [PATCH] musl: allow to build ppc64 toolchains
Message-ID: <20160818063728.GA28662@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Latest musl release supports ppc64 architecture.
Tested with Qemu for big endian and little endian configurations.
Musl implements ELFv2 ABI. Only gcc 6.x contains required
changes for musl ppc64 support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/Config.in.host              | 8 ++++++++
 package/gcc/gcc.mk                      | 6 ++++++
 toolchain/toolchain-buildroot/Config.in | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6ab7f00..c2b22c8 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -30,6 +30,8 @@ choice
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		# musl ppc64 unsupported
+		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
 		select BR2_GCC_NEEDS_MPC
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
@@ -46,6 +48,8 @@ choice
 		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		# musl ppc64 unsupported
+		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -66,6 +70,8 @@ choice
 		depends on !BR2_cortex_a17
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		# musl ppc64 unsupported
+		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
@@ -75,6 +81,8 @@ choice
 		bool "gcc 5.x"
 		# Broken or unsupported architectures
 		depends on !BR2_arc && !BR2_bfin
+		# musl ppc64 unsupported
+		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 032015c..adf776d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -231,6 +231,12 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_powerpc64),yy)
+HOST_GCC_COMMON_CONF_OPTS += \
+	--with-abi=elfv2 \
+	--without-long-double-128
+endif
+
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 ifeq ($(BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS),)
 ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 48ca254..02cfb83 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -68,7 +68,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_sh || BR2_x86_64
+		BR2_powerpc64  || BR2_powerpc64le || BR2_sh || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
-- 
2.1.4
