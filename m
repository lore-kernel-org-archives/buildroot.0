From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Jan 2012 19:04:43 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: Automatically set -m64 if the
	architecture is x86_64
Message-ID: <1327169083-15538-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Without the -m64, choosing the x86_64 architecture with a Sourcery external
toolchain will result in a 32-bit rootfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 This patch comes on top of ThomasP's external toolchain updates
http://free-electrons.com/~thomas/buildroot.git for-2012.02/ext-toolchain-updates
(Without those updates, the Sourcery x86 toolchain simply doesn't work,
because it creates 32-bit executables but the libc installed on the target
is 64-bit.)

 Thomas, it would be great if you could add this patch to your branch.

 Regards,
 Arnout
---
 toolchain/toolchain-external/Config.in             |   24 +++----------------
 toolchain/toolchain-external/ext-tool.mk           |    4 +++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 ++
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ce07eec..f4cbb51 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -341,16 +341,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.6.1,
 	  binutils 2.21.53, glibc 2.13, gdb 7.2.50 and kernel headers
-	  3.0.1. It has support for the following variants:
-	    - Intel Pentium 4, glibc, 32 bits
-              Default, nothing special to do.
-            - Intel Atom, glibc, 32 bits
-              Select an Atom core
-            - Intel Xeon, glibc, 64 bits
-              Set BR2_TARGET_OPTIMIZATION to -m64
-            - Intel Core 2, glibc, 64 bits
-              Select a Core 2 core
-              Set BR2_TARGET_OPTIMIZATION to -m64
+	  3.0.1. It has support for all the i386 and x86_64 variants
+	  mentioned in the Target Architecture Variant menu.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	bool "Sourcery CodeBench x86/x86_64 2010.09"
@@ -361,16 +353,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.5.1,
 	  binutils 2.20, glibc 2.11, gdb 7.2.50 and kernel headers
-	  2.6.35.2. It has support for the following variants:
-	    - Intel Pentium 4, glibc, 32 bits
-              Default, nothing special to do.
-            - Intel Atom, glibc, 32 bits
-              Select an Atom core
-            - Intel Xeon, glibc, 64 bits
-              Set BR2_TARGET_OPTIMIZATION to -m64
-            - Intel Core 2, glibc, 64 bits
-              Select a Core 2 core
-              Set BR2_TARGET_OPTIMIZATION to -m64
+	  2.6.35.2. It has support for all the i386 and x86_64 variants
+	  mentioned in the Target Architecture Variant menu.
 
 config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1
 	bool "Blackfin.uclinux.org 2011R1-RC4"
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 4f7a567..08b0231 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -133,6 +133,10 @@ CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
+ifeq ($(call qstrip,$(BR2_ARCH_IS_64)),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -m64
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_64
+endif
 ifneq ($(CC_TARGET_TUNE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mtune=$(CC_TARGET_TUNE_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_TUNE='"$(CC_TARGET_TUNE_)"'
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 719f13b..82595ea 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -40,6 +40,9 @@ static char *predef_args[] = {
 #ifdef BR_VFPFLOAT
 	"-mfpu=vfp",
 #endif /* BR_VFPFLOAT */
+#ifdef BR_64
+	"-m64",
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
-- 
1.7.8.3
