From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: add mips32r5 generic architecture
	variant
Message-ID: <20161015112247.6F66F81F55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1feb1b77564d2c043e70f37e2c05edda72afc8a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-march=mips32r5 support started from GCC-5, so disable previous versions
when the CPU is R5.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips        | 9 ++++++++-
 package/gcc/Config.in.host | 6 ++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 56b8a6b..94f6fa3 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -3,6 +3,8 @@ config BR2_MIPS_CPU_MIPS32
 	bool
 config BR2_MIPS_CPU_MIPS32R2
 	bool
+config BR2_MIPS_CPU_MIPS32R5
+	bool
 config BR2_MIPS_CPU_MIPS32R6
 	bool
 config BR2_MIPS_CPU_MIPS64
@@ -21,7 +23,7 @@ choice
 	  Specific CPU variant to use
 
 	  64bit cabable: 64, 64r2, 64r6
-	  non-64bit capable: 32, 32r2, 32r6
+	  non-64bit capable: 32, 32r2, 32r5, 32r6
 
 config BR2_mips_32
 	bool "Generic MIPS32"
@@ -31,6 +33,10 @@ config BR2_mips_32r2
 	bool "Generic MIPS32R2"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
+config BR2_mips_32r5
+	bool "Generic MIPS32R5"
+	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R5
 config BR2_mips_32r6
 	bool "Generic MIPS32R6"
 	depends on !BR2_ARCH_IS_64
@@ -90,6 +96,7 @@ config BR2_ENDIAN
 config BR2_GCC_TARGET_ARCH
 	default "mips32"	if BR2_mips_32
 	default "mips32r2"	if BR2_mips_32r2
+	default "mips32r5"	if BR2_mips_32r5
 	default "mips32r6"	if BR2_mips_32r6
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3c4d1cd..3af9a24 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -28,6 +28,8 @@ choice
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
+		# Unsupported for MIPS R5
+		depends on !BR2_MIPS_CPU_MIPS32R5
 		# Unsupported for MIPS R6
 		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
@@ -46,6 +48,8 @@ choice
 		depends on !BR2_powerpc_power8
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
 		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
+		# Unsupported for MIPS R5
+		depends on !BR2_MIPS_CPU_MIPS32R5
 		# Unsupported for MIPS R6
 		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
@@ -70,6 +74,8 @@ choice
 		depends on !BR2_arc && !BR2_bfin
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a17
+		# Unsupported for MIPS R5
+		depends on !BR2_MIPS_CPU_MIPS32R5
 		# Unsupported for MIPS R6
 		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
