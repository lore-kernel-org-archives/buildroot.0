From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Sep 2016 10:36:54 +0100
Subject: [Buildroot] [PATCH 08/13] MIPS: add support for interAptiv cores
In-Reply-To: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
References: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
Message-ID: <20160930093659.35032-9-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-march=interaptiv support starts from GCC-6, so disable previous
versions when selecting this core.

Also disable external toolchains that don't support this core.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips                    | 5 +++++
 package/gcc/Config.in.host             | 8 ++++++++
 toolchain/toolchain-external/Config.in | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 63f23b4..ac87e2c 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -43,6 +43,10 @@ config BR2_mips_32r6
 	bool "Generic MIPS32R6"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R6
+config BR2_mips_interaptiv
+	bool "interAptiv"
+	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R2
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
@@ -104,6 +108,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips32r2"	if BR2_mips_32r2
 	default "mips32r5"	if BR2_mips_32r5
 	default "mips32r6"	if BR2_mips_32r6
+	default "interaptiv"	if BR2_mips_interaptiv
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
 	default "mips64r5"	if BR2_mips_64r5
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index c5fcbc8..9ad4d0c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -28,6 +28,8 @@ choice
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
+		# Unsupported MIPS cores
+		depends on !BR2_mips_interaptiv
 		# Unsupported for MIPS R5
 		depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
 		# Unsupported for MIPS R6
@@ -46,6 +48,8 @@ choice
 		depends on !BR2_cortex_a12 && !BR2_cortex_a17
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_power8
+		# Unsupported MIPS cores
+		depends on !BR2_mips_interaptiv
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
 		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
 		# Unsupported for MIPS R5
@@ -74,6 +78,8 @@ choice
 		depends on !BR2_arc && !BR2_bfin
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a17
+		# Unsupported MIPS cores
+		depends on !BR2_mips_interaptiv
 		# Unsupported for MIPS R5
 		depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
 		# Unsupported for MIPS R6
@@ -93,6 +99,8 @@ choice
 		depends on !BR2_arc && !BR2_bfin
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
+		# Unsupported MIPS cores
+		depends on !BR2_mips_interaptiv
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_GCC_NEEDS_MPC
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6b71bc6..509505d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -191,6 +191,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	bool "Sourcery CodeBench MIPS 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2
+	# Unsupported MIPS cores
+	depends on !BR2_mips_interaptiv
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
@@ -595,6 +597,8 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 		BR2_sh4 || BR2_sh4eb || \
 		BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Unsupported MIPS cores
+	depends on !BR2_mips_interaptiv
 	# Unsupported for MIPS R6
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
-- 
2.10.0
