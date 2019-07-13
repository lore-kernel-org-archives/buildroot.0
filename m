From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Jul 2019 22:57:42 +0200
Subject: [Buildroot] [git commit] arch/arm: some cores have a different name
 with gcc-9
Message-ID: <20190713210917.60298816B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0d17301531eaa1dfdf102d1ec5bfce839c55ce4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Arnout: don't rely on ordering, but make condition explicit]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in.arm | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 5557261604..42f8b4d72f 100644
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
+	default "octeontx"	if BR2_thunderx && BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	default "thunderxt81"	if BR2_thunderxt81 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	default "octeontx81"	if BR2_thunderxt81 && BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	default "thunderxt83"	if BR2_thunderxt83 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	default "octeontx83"	if BR2_thunderxt83 && BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	default "thunderxt88"	if BR2_thunderxt88
 	default "thunderxt88p1"	if BR2_thunderxt88p1
 	default "xgene1"	if BR2_xgene1
