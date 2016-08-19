From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 14:28:01 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-buildroot: allow to
	build ppc64(le) musl toolchains
Message-ID: <20160819122818.EF7A581D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ab751ca44e9da6f406876ff582b3a813056b0d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Latest musl release supports ppc64 architecture (both big endian and
little endian), so this commit adds support for this.

Since musl implements the ELFv2 ABI for both big-endian and
little-endian PowerPC64, we have to force using this ABI on PowerPC64
big endian (normally elfv1 is the default).

Also, only gcc 6.x has the necessary changes to support musl on PowerPC
64, so we restrict the gcc version selection accordingly.

Tested with Qemu for big endian and little endian configurations.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: add comment about the ABI flag in gcc.mk, rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host              |  8 ++++++++
 package/gcc/gcc.mk                      | 10 ++++++++++
 toolchain/toolchain-buildroot/Config.in |  2 +-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b54959..4d02931 100644
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
index 032015c..39c3eeb 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -231,6 +231,16 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
+# PowerPC64 big endian by default uses the elfv1 ABI, and PowerPC 64
+# little endian by default uses the elfv2 ABI. However, musl has
+# decided to use the elfv2 ABI for both, so we force the elfv2 ABI for
+# Power64 big endian when the selected C library is musl.
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
index 0b97bbf..78cac14 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -70,7 +70,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_sh || BR2_x86_64
+		BR2_powerpc64  || BR2_powerpc64le || BR2_sh || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
