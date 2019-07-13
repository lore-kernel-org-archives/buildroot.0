From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Jul 2019 23:06:23 +0200
Subject: [Buildroot] [git commit] arch/arm: add two new non-cortex-based
 armv8.2a cores
Message-ID: <20190713210917.7F4A2816B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b630b5bf3023e97740a2eca92eaa34804bd8aee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Neoverse N1 CPU was supported in GCC earlier through the codename Ares [1].

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=37cf0ddecfd1eb5c6852a44135af5a92e5103931

Build tested:
https://gitlab.com/kubu93/buildroot/pipelines/60318953

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Romain: rename BR2_ares to BR2_neoverse_n1]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Arnout: 'aka' instead of 'alias']
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in.arm | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index d0a2c3d7dd..4c0910e4f8 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -512,6 +512,22 @@ config BR2_cortex_a76_a55
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_neoverse_n1
+	bool "neoverse-N1 (aka ares)"
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
 
