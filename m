From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 06 Sep 2013 13:45:49 +0800
Subject: [Buildroot] [PATCH] arch/Config.in: Allow arm7tdmi to select
	BR2_BINFMT_FLAT
Message-ID: <1378446349.27719.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow BR2_arm7tdmi to select BR2_BINFMT_FLAT by adding BR2_arm7tdmi to
BR2_BINFMT_FLAT dependency.

Remove BR2_m68k dependency for BR2_BINFMT_FDPIC because m68k does not support
FDPIC.

Also update BR2_BINFMT_ELF dependency to exclude BR2_arm7tdmi. So users of
MMU-capable ARM variants wouldn't be confused by the availability of FLAT and
ELF as binary formats.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
This is v2 of "[PATCH 2/2] arch/Config.in: Allow ARM to select BR2_BINFMT_FLAT",
I change the subject line because it actually allows arm7tdmi to select
BR2_BINFMT_FLAT.

The changes in v2:
Add BR2_arm7tdmi rather than BR2_arm to BR2_BINFMT_FLAT dependency.
Remove BR2_m68k dependency for BR2_BINFMT_FDPIC.
Also update BR2_BINFMT_ELF dependency to exclude BR2_arm7tdmi.

Note:
I didn't add BR2_arm_cortex_m3 and BR2_arm_cortex_m4 to the dependency in this
patch because they are not exist in current build system. And I think it's ok
to have an incremental patch for adding them when they are supported by
buildroot.
I think further improvement for using !BR2_USE_MMU dependency suggested by
Thomas Petazzoni or having "ARCH_HAS_MMU and/or ARCH_SUPPORTS_FLAT_BINARY"
suggested by Thomas De Schampheleire can also be in incremental patchs.

Regards,
Axel

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 arch/Config.in | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 3fd8c1c..f88594c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -225,12 +225,13 @@ config BR2_GCC_TARGET_MODE
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
-	depends on BR2_bfin || BR2_m68k
-	default BR2_BINFMT_FDPIC
+	depends on BR2_arm7tdmi || BR2_m68k || BR2_bfin
+	default BR2_BINFMT_FLAT if BR2_arm7tdmi || BR2_m68k
+	default BR2_BINFMT_FDPIC if BR2_bfin
 
 config BR2_BINFMT_ELF
 	bool "ELF"
-	depends on !BR2_bfin && !BR2_m68k
+	depends on !BR2_arm7tdmi && !BR2_bfin && !BR2_m68k
 	help
 	  ELF (Executable and Linkable Format) is a format for libraries and
 	  executables used across different architectures and operating
@@ -238,7 +239,7 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
-	depends on BR2_bfin || BR2_m68k
+	depends on BR2_bfin
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load
 	  segments of a binary to be located in memory independently of each
@@ -247,7 +248,7 @@ config BR2_BINFMT_FDPIC
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
-	depends on BR2_bfin || BR2_m68k
+	depends on BR2_arm7tdmi || BR2_bfin || BR2_m68k
 	select BR2_PREFER_STATIC_LIB
 	help
 	  FLAT binary is a relatively simple and lightweight executable format
-- 
1.8.1.2
