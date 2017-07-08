From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Jul 2017 16:08:36 +0200
Subject: [Buildroot] [PATCH 1/4 v2] arch/arm: fix -mcpu default values for
	AArch64
In-Reply-To: <cover.1499522760.git.yann.morin.1998@free.fr>
References: <cover.1499522760.git.yann.morin.1998@free.fr>
Message-ID: <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499522760.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have to specify the -mcpu value, even in 64-bit mode.

For AArch64, +fp and +simd are the default, so they are totally useless.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - squash the two changes into one patch  (Thomas)
  - remove useless parentheses  (Baruch)
  - remove superfluous indentation

Notes: If anything, it is the +nofp or +nosimd that should be specified.
This can be done in a future patch, though.
---
 arch/Config.in.arm | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b1817ed568..3cafe21700 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -534,15 +534,9 @@ config BR2_GCC_TARGET_CPU
 	default "strongarm"	if BR2_strongarm
 	default "xscale"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
-	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
-	default "cortex-a53+fp"		if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a53+fp+simd"	if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
-	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
-	default "cortex-a57+fp"		if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a57+fp+simd"	if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
-	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
-	default "cortex-a72+fp"		if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a72+fp+simd"	if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
+	default "cortex-a53"	if BR2_cortex_a53
+	default "cortex-a57"	if BR2_cortex_a57
+	default "cortex-a72"	if BR2_cortex_a72
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.11.0
