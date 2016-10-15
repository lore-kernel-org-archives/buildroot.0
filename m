From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: add support for interAptiv cores
Message-ID: <20161015112247.8E50A81F66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef3e7323ef036cff006aeac9290ce19654b8254f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-march=interaptiv support starts from GCC-6, so disable previous
versions when selecting this core.

Also disable external toolchains that don't support this core.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index b6c46d8..a816464 100644
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
index 7bf63d3..e3d4964 100644
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
