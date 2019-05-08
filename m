From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 May 2019 17:07:15 +0200
Subject: [Buildroot] [PATCH v2 10/15] arch/arm: some cores have a different
 name with gcc-9
In-Reply-To: <20190508150720.27946-1-romain.naour@gmail.com>
References: <20190508150720.27946-1-romain.naour@gmail.com>
Message-ID: <20190508150720.27946-11-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

In gcc-9, some cores from the ThunderX familly have been renamed to
their marketting names, i.e. OcteonTX. Subsequently, new core names
have been added to gcc, with the old names still being around.

Update the prompts with the new names as alternative to the existing
names. We still keep the kconfig options as-is, so that we do not need
to add legacy handling.

However, since there is no guarantee for how long gcc will retain
compatibility for the older names, we readily switch over to using the
new names when using a gcc 9-or-later, but keep using the older names
with gcc older than 9.

The ordering of the 'default' clauses in kconfig is important, with the
first default which conditions is satisfied, to be used, so we just add
the new core names under a more liberal condition than the older names.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in.arm | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 71a148ad98..ee6ab875a3 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -391,21 +391,21 @@ config BR2_qdf24xx
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_thunderx
-	bool "thunderx"
+	bool "thunderx (aka octeontx)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_thunderxt81
-	bool "thunderxt81"
+	bool "thunderxt81 (aka octeontx81)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt83
-	bool "thunderxt83"
+	bool "thunderxt83 (aka octeontx83)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
@@ -824,9 +824,12 @@ config BR2_GCC_TARGET_CPU
 	default "exynos-m1"	if BR2_exynos_m1
 	default "falkor"	if BR2_falkor
 	default "qdf24xx"	if BR2_qdf24xx
-	default "thunderx"	if BR2_thunderx
-	default "thunderxt81"	if BR2_thunderxt81
-	default "thunderxt83"	if BR2_thunderxt83
+	default "thunderx"	if BR2_thunderx && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	default "octeontx"	if BR2_thunderx
+	default "thunderxt81"	if BR2_thunderxt81 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	default "octeontx81"	if BR2_thunderxt81
+	default "thunderxt83"	if BR2_thunderxt83 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	default "octeontx83"	if BR2_thunderxt83
 	default "thunderxt88"	if BR2_thunderxt88
 	default "thunderxt88p1"	if BR2_thunderxt88p1
 	default "xgene1"	if BR2_xgene1
-- 
2.14.5
