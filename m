From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 May 2019 20:30:10 +0200
Subject: [Buildroot] [PATCH 14/15] arch/arm: add two new non-cortex-based
 armv8.2a cores
In-Reply-To: <20190506183011.4856-1-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
Message-ID: <20190506183011.4856-15-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The Neoverse N1 CPU was supported in GCC earlier through the codename Ares [1].

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=37cf0ddecfd1eb5c6852a44135af5a92e5103931

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Romain: rename BR2_ares to BR2_neoverse_n1]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 100a28e997..3cc9358ea2 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -473,6 +473,15 @@ config BR2_vulcan
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 
 comment "armv8.2a cores"
+config BR2_neoverse_n1
+	bool "neoverse-N1 (alias ares)"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_cortex_a55
 	bool "cortex-A55"
 	depends on BR2_ARCH_IS_64
@@ -512,6 +521,13 @@ config BR2_cortex_a76_a55
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_tsv110
+	bool "tsv110"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 
 comment "armv8.4a cores"
 config BR2_saphira
@@ -872,11 +888,13 @@ config BR2_GCC_TARGET_CPU
 	default "thunderx2t99p1"	if BR2_thunderx2t99p1
 	default "vulcan"	if BR2_vulcan
 	# armv8.2a
+	default "neoverse-n1"	if BR2_neoverse_n1
 	default "cortex-a55"	if BR2_cortex_a55
 	default "cortex-a75"	if BR2_cortex_a75
 	default "cortex-a75.cortex-a55"	if BR2_cortex_a75_a55
 	default "cortex-a76"	if BR2_cortex_a76
 	default "cortex-a76.cortex-a55"	if BR2_cortex_a76_a55
+	default "tsv110"	if BR2_tsv110
 	# armv8.4a
 	default "saphira"	if BR2_saphira
 
-- 
2.14.5
