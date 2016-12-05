From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:07:05 +0100
Subject: [Buildroot] [git commit] arch: merge Config.in.aarch64 into
	Config.in.arm
Message-ID: <20161205221749.679E97FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b7d8b4a4e41acadde27b12191ca6cb0ebd62b33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 64 bits ARM processors are capable of running 32 bits ARM code, and
some platforms are indeed using this capability. Due to this, if we were
to keep the separation between Config.in.aarch64 and Config.in.arm, we
would have to duplicate the definition of all 64-bits capable ARM cores
into both files.

Instead of going down this route, let's take the same route as the x86
one: a single Config.in.x86 file, used for both x86 32 bits and x86 64
bits, with the appropriate logic to only show the relevant cores
depending on which architecture is selected.

In order to do this, we:

 - Make the "ARM instruction set" choice only visible on ARM 32 bits,
   since we currently don't support ARM vs. Thumb on AArch64.

 - Add the relevant values for the BR2_ARCH option.

 - Add the relevant values for the BR2_ENDIAN option.

 - Make the "aapcs-linux" BR2_GCC_TARGET_ABI value only used on ARM 32
   bits, since this ABI doesn't mean anything on AArch64.

 - Make the BR2_GCC_TARGET_FPU option depends on ARM 32 bits, since
   there is no -mfpu option on AArch64.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in         |  6 +-----
 arch/Config.in.aarch64 |  7 -------
 arch/Config.in.arm     | 14 +++++++++-----
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index df4db0b..d59cbd7 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -354,14 +354,10 @@ if BR2_arcle || BR2_arceb
 source "arch/Config.in.arc"
 endif
 
-if BR2_arm || BR2_armeb
+if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
-if BR2_aarch64 || BR2_aarch64_be
-source "arch/Config.in.aarch64"
-endif
-
 if BR2_bfin
 source "arch/Config.in.bfin"
 endif
diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
deleted file mode 100644
index 34cd409..0000000
--- a/arch/Config.in.aarch64
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_ARCH
-	default "aarch64"	if BR2_aarch64
-	default "aarch64_be"	if BR2_aarch64_be
-
-config BR2_ENDIAN
-	default "LITTLE" if BR2_aarch64
-	default "BIG"	 if BR2_aarch64_be
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index ee612f5..002ed04 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -399,6 +399,7 @@ endchoice
 
 choice
 	prompt "ARM instruction set"
+	depends on BR2_arm || BR2_armeb
 
 config BR2_ARM_INSTRUCTIONS_ARM
 	bool "ARM"
@@ -434,12 +435,14 @@ config BR2_ARM_INSTRUCTIONS_THUMB2
 endchoice
 
 config BR2_ARCH
-	default "arm"	if BR2_arm
-	default "armeb"	if BR2_armeb
+	default "arm"		if BR2_arm
+	default "armeb"		if BR2_armeb
+	default "aarch64"	if BR2_aarch64
+	default "aarch64_be"	if BR2_aarch64_be
 
 config BR2_ENDIAN
-	default "LITTLE" if BR2_arm
-	default "BIG"	 if BR2_armeb
+	default "LITTLE" if (BR2_arm || BR2_aarch64)
+	default "BIG"	 if (BR2_armeb || BR2_aarch64_be)
 
 config BR2_GCC_TARGET_CPU
 	default "arm920t"	if BR2_arm920t
@@ -467,9 +470,10 @@ config BR2_GCC_TARGET_CPU
 	default "iwmmxt"	if BR2_iwmmxt
 
 config BR2_GCC_TARGET_ABI
-	default "aapcs-linux"
+	default "aapcs-linux"	if BR2_arm || BR2_armeb
 
 config BR2_GCC_TARGET_FPU
+	depends on BR2_arm || BR2_armeb
 	default "vfp"		if BR2_ARM_FPU_VFPV2
 	default "vfpv3"		if BR2_ARM_FPU_VFPV3
 	default "vfpv3-d16" 	if BR2_ARM_FPU_VFPV3D16
