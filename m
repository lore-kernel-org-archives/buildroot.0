From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:18:18 +0100
Subject: [Buildroot] [git commit branch/next] arch/mips: some variants need
 different gcc versions
Message-ID: <20171124211341.A1B8D801D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f82218fcbb536cc9c65782e687afdf2d93f02947
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We use the conditions currently expressed in the gcc version choice.

We leave the musl vs mips64 conditions in gcc, because the "fault"
really is on gcc, which does not recognise the mips64+musl tuples,
so the fix lies within gcc, and the current conditions are fitting.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips        | 7 +++++++
 package/gcc/Config.in.host | 8 --------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 1cce171..c08b2a2 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -7,9 +7,11 @@ config BR2_MIPS_CPU_MIPS32R2
 	select BR2_MIPS_NAN_LEGACY
 config BR2_MIPS_CPU_MIPS32R5
 	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_MIPS_CPU_MIPS32R6
 	bool
 	select BR2_MIPS_NAN_2008
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_MIPS_CPU_MIPS64
 	bool
 	select BR2_MIPS_NAN_LEGACY
@@ -18,9 +20,11 @@ config BR2_MIPS_CPU_MIPS64R2
 	select BR2_MIPS_NAN_LEGACY
 config BR2_MIPS_CPU_MIPS64R5
 	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_MIPS_CPU_MIPS64R6
 	bool
 	select BR2_MIPS_NAN_2008
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 
 choice
 	prompt "Target Architecture Variant"
@@ -53,11 +57,13 @@ config BR2_mips_interaptiv
 	bool "interAptiv"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_mips_m5150
 	bool "M5150"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
 	select BR2_MIPS_NAN_2008
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_mips_m6250
 	bool "M6250"
 	depends on !BR2_ARCH_IS_64
@@ -101,6 +107,7 @@ config BR2_mips_i6400
 	bool "I6400"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_mips_p6600
 	bool "P6600"
 	depends on BR2_ARCH_IS_64
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 582a409..c681dee 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -28,12 +28,6 @@ config BR2_GCC_VERSION_4_9_X
 	# Broken or unsupported ARM cores
 	depends on !BR2_cortex_a17 && !BR2_cortex_a17_a7
 	depends on !BR2_cortex_a72 && !BR2_cortex_a72_a53
-	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv
-	# Unsupported for MIPS R5
-	depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
-	# Unsupported for MIPS R6
-	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# musl microblaze unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
 	# musl ppc64 unsupported
@@ -53,8 +47,6 @@ config BR2_GCC_VERSION_5_X
 	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	# musl ppc64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
-	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && !BR2_mips_i6400
 	# musl mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 	# glibc >= 2.26 needs gcc >= 6.2
