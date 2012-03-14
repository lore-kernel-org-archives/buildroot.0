From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 00:00:57 +0100
Subject: [Buildroot] [git commit] ext-toolchain: Automatically set -m64 if
	the architecture is x86_64
Message-ID: <20120314230153.A7FD990D93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a22dc0f2302c1879ad3bad4dc41348181c5807ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without the -m64, choosing the x86_64 architecture with a Sourcery external
toolchain will result in a 32-bit rootfs.

Also simplified the help text to reflect this change.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in             |   34 ++++++++++---------
 toolchain/toolchain-external/ext-tool.mk           |    4 ++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 ++
 3 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7f57952..24cad9c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -371,14 +371,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	  binutils 2.21.53, glibc 2.13, gdb 7.2.50 and kernel headers
 	  3.0.1. It has support for the following variants:
 	    - Intel Pentium 4, glibc, 32 bits
-              Default, nothing special to do.
-            - Intel Atom, glibc, 32 bits
-              Select an Atom core
-            - Intel Xeon, glibc, 64 bits
-              Set BR2_TARGET_OPTIMIZATION to -m64
-            - Intel Core 2, glibc, 64 bits
-              Select a Core 2 core
-              Set BR2_TARGET_OPTIMIZATION to -m64
+	      Default for x86, nothing special to do.
+	    - Intel Atom, glibc, 32 bits
+	      Select an Atom core
+	    - Intel Xeon, glibc, 64 bits
+	      Default for x86_64, nothing special to do.
+	    - Intel Core 2, glibc, 64 bits
+	      Select a Core 2 core
+	  Other architecture variants (beyond Pentium-4/Xeon) are
+	  supported as well, but glibc is not optimised for it.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	bool "Sourcery CodeBench x86/x86_64 2010.09"
@@ -391,14 +392,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	  binutils 2.20, glibc 2.11, gdb 7.2.50 and kernel headers
 	  2.6.35.2. It has support for the following variants:
 	    - Intel Pentium 4, glibc, 32 bits
-              Default, nothing special to do.
-            - Intel Atom, glibc, 32 bits
-              Select an Atom core
-            - Intel Xeon, glibc, 64 bits
-              Set BR2_TARGET_OPTIMIZATION to -m64
-            - Intel Core 2, glibc, 64 bits
-              Select a Core 2 core
-              Set BR2_TARGET_OPTIMIZATION to -m64
+	      Default for x86, nothing special to do.
+	    - Intel Atom, glibc, 32 bits
+	      Select an Atom core
+	    - Intel Xeon, glibc, 64 bits
+	      Default for x86_64, nothing special to do.
+	    - Intel Core 2, glibc, 64 bits
+	      Select a Core 2 core
+	  Other architecture variants (beyond Pentium-4/Xeon) are
+	  supported as well, but glibc is not optimised for it.
 
 config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1
 	bool "Blackfin.uclinux.org 2011R1-RC4"
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 01ab91f..dbd39b0 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -133,6 +133,10 @@ CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
+ifeq ($(BR2_x86_64),y)
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
