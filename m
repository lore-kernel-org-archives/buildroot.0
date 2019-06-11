From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Jun 2019 12:29:56 +0200
Subject: [Buildroot] [PATCH v3 14/15] arch/arm: add two new non-cortex-based
 armv8.2a cores
In-Reply-To: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
References: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190611102957.7145-15-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The Neoverse N1 CPU was supported in GCC earlier through the codename Ares [1].

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=37cf0ddecfd1eb5c6852a44135af5a92e5103931

Build tested:
https://gitlab.com/kubu93/buildroot/pipelines/60318953

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Romain: rename BR2_ares to BR2_neoverse_n1]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
v2: add neoverse-e1 (Yann)
    reorder alphabetically after renaming ares to neoverse-n1.

Note: The Neoverse E1 CPU needs at least binutils 2.32 to support Speculative Store
Bypass Safe instruction (SSBS) which is part of ARMv8.5-A architecture extensions.
Postpone the support for this new ARM core.
See: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=104fefeebb544b7745bb353b63110afa46119647
---
 arch/Config.in.arm | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a664cfe0e2..eea77cdabe 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -512,6 +512,22 @@ config BR2_cortex_a76_a55
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_neoverse_n1
+	bool "neoverse-N1 (alias ares)"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_tsv110
+	bool "tsv110"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 
 comment "armv8.4a cores"
 config BR2_saphira
@@ -877,6 +893,8 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a75.cortex-a55"	if BR2_cortex_a75_a55
 	default "cortex-a76"	if BR2_cortex_a76
 	default "cortex-a76.cortex-a55"	if BR2_cortex_a76_a55
+	default "neoverse-n1"	if BR2_neoverse_n1
+	default "tsv110"	if BR2_tsv110
 	# armv8.4a
 	default "saphira"	if BR2_saphira
 
-- 
2.17.1
