From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Sep 2016 10:36:52 +0100
Subject: [Buildroot] [PATCH 06/13] MIPS: add mips64r5 generic architecture
	variant
In-Reply-To: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
References: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
Message-ID: <20160930093659.35032-7-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-march=mips64r5 support started from GCC-5, so disable previous versions
when the CPU is R5.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips        | 9 ++++++++-
 package/gcc/Config.in.host | 6 +++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 94f6fa3..63f23b4 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -11,6 +11,8 @@ config BR2_MIPS_CPU_MIPS64
 	bool
 config BR2_MIPS_CPU_MIPS64R2
 	bool
+config BR2_MIPS_CPU_MIPS64R5
+	bool
 config BR2_MIPS_CPU_MIPS64R6
 	bool
 
@@ -22,7 +24,7 @@ choice
 	help
 	  Specific CPU variant to use
 
-	  64bit cabable: 64, 64r2, 64r6
+	  64bit cabable: 64, 64r2, 64r5, 64r6
 	  non-64bit capable: 32, 32r2, 32r5, 32r6
 
 config BR2_mips_32
@@ -49,6 +51,10 @@ config BR2_mips_64r2
 	bool "Generic MIPS64R2"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R2
+config BR2_mips_64r5
+	bool "Generic MIPS64R5"
+	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64R5
 config BR2_mips_64r6
 	bool "Generic MIPS64R6"
 	depends on BR2_ARCH_IS_64
@@ -100,6 +106,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips32r6"	if BR2_mips_32r6
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
+	default "mips64r5"	if BR2_mips_64r5
 	default "mips64r6"	if BR2_mips_64r6
 
 config BR2_MIPS_OABI32
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0988a9c..c5fcbc8 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -29,7 +29,7 @@ choice
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
 		# Unsupported for MIPS R5
-		depends on !BR2_MIPS_CPU_MIPS32R5
+		depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
 		# Unsupported for MIPS R6
 		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
@@ -49,7 +49,7 @@ choice
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
 		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
 		# Unsupported for MIPS R5
-		depends on !BR2_MIPS_CPU_MIPS32R5
+		depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
 		# Unsupported for MIPS R6
 		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
@@ -75,7 +75,7 @@ choice
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a17
 		# Unsupported for MIPS R5
-		depends on !BR2_MIPS_CPU_MIPS32R5
+		depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
 		# Unsupported for MIPS R6
 		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
-- 
2.10.0
