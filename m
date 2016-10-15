From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: add support for M5100 cores
Message-ID: <20161015112247.97DFC81F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=067a46474ad2ebe3b335f6fecaa3816b833d0afb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-march=m5100 support starts from GCC-6, so disable previous versions
when selecting this core.

Note that M5100 implies a MIPS R5 CPU, and some GCC versions are already
disabled for R5, so we don't need to disable those ones for M5100 as
well.

Also disable external toolchains that don't support this core.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips                    | 5 +++++
 package/gcc/Config.in.host             | 2 +-
 toolchain/toolchain-external/Config.in | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index ac87e2c..9ed42a2 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -47,6 +47,10 @@ config BR2_mips_interaptiv
 	bool "interAptiv"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
+config BR2_mips_m5100
+	bool "M5100"
+	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R5
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
@@ -109,6 +113,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips32r5"	if BR2_mips_32r5
 	default "mips32r6"	if BR2_mips_32r6
 	default "interaptiv"	if BR2_mips_interaptiv
+	default "m5100"		if BR2_mips_m5100
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
 	default "mips64r5"	if BR2_mips_64r5
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a816464..2d85387 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -100,7 +100,7 @@ choice
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# Unsupported MIPS cores
-		depends on !BR2_mips_interaptiv
+		depends on !BR2_mips_interaptiv && !BR2_mips_m5100
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_GCC_NEEDS_MPC
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e3d4964..254a1e5 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -598,7 +598,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 		BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv
+	depends on !BR2_mips_interaptiv && !BR2_mips_m5100
 	# Unsupported for MIPS R6
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
