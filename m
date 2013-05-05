From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:46:37 +0200
Subject: [Buildroot] [git commit] arch: toolchain: Introduce binary formats
	BINFMT_*.
Message-ID: <20130505205712.E124799B59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57133825c930a193ce9223b4372b900c4c84c9b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just introduce the symbol and options in arch generic Config.in.
Append FLAT format link flags to external toolchain wrapper.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                                   |   10 ++++++
 arch/Config.in                                     |   34 ++++++++++++++++++++
 arch/Config.in.bfin                                |   11 ------
 toolchain/toolchain-external/Config.in             |   12 +++---
 toolchain/toolchain-external/ext-tool.mk           |    4 ++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 ++
 6 files changed, 57 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fc9f68f..7748ab3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -172,4 +172,14 @@ config BR2_PACKAGE_INPUT_TOOLS_EVTEST
 	help
 	  The evtest program from input-tools is now a separate package.
 
+config BR2_BFIN_FDPIC
+	bool "BR2_BFIN_FDPIC is now BR2_BINFMT_FDPIC"
+	select BR2_BINFMT_FDPIC
+	select BR2_LEGACY
+
+config BR2_BFIN_FLAT
+	bool "BR2_BFIN_FLAT is now BR2_BINFMT_FLAT"
+	select BR2_BINFMT_FLAT
+	select BR2_LEGACY
+
 endmenu
diff --git a/arch/Config.in b/arch/Config.in
index 2006f1e..e32cfd9 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -189,6 +189,40 @@ config BR2_GCC_TARGET_ABI
 config BR2_GCC_TARGET_CPU
 	string
 
+# Set up target binary format
+choice
+	prompt "Target Binary Format"
+	depends on BR2_bfin || BR2_m68k
+	default BR2_BINFMT_FDPIC
+
+config BR2_BINFMT_ELF
+	bool "ELF"
+	depends on !BR2_bfin && !BR2_m68k
+	help
+	  ELF (Executable and Linkable Format) is a format for libraries and
+	  executables used across different architectures and operating
+	  systems.
+
+config BR2_BINFMT_FDPIC
+	bool "FDPIC"
+	depends on BR2_bfin || BR2_m68k
+	help
+	  ELF FDPIC binaries are based on ELF, but allow the individual load
+	  segments of a binary to be located in memory independently of each
+	  other. This makes this format ideal for use in environments where no
+	  MMU is available.
+
+config BR2_BINFMT_FLAT
+	bool "FLAT"
+	depends on BR2_bfin || BR2_m68k
+	select BR2_PREFER_STATIC_LIB
+	help
+	  FLAT binary is a relatively simple and lightweight executable format
+	  based on the original a.out format. It is widely used in environment
+	  where no MMU is available.
+
+endchoice
+
 if BR2_arcle || BR2_arceb
 source "arch/Config.in.arc"
 endif
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 0b137ae..2a7ff54 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -1,14 +1,3 @@
-choice
-	prompt "Target ABI"
-	depends on BR2_bfin
-	default BR2_BFIN_FDPIC
-config BR2_BFIN_FDPIC
-	bool "FDPIC"
-config BR2_BFIN_FLAT
-	bool "FLAT"
-	select BR2_PREFER_STATIC_LIB
-endchoice
-
 config BR2_ARCH
 	default "bfin"
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b1aab6a..a93ada3 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -784,12 +784,12 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && !BR2_BFIN_FDPIC
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BFIN_FDPIC
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && !BR2_BFIN_FDPIC
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BFIN_FDPIC
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && !BR2_BFIN_FDPIC
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BFIN_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BINFMT_FLAT
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BINFMT_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BINFMT_FLAT
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BINFMT_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FLAT
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 616f453..dce0299 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -160,6 +160,10 @@ ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
+ifeq ($(BR2_BINFMT_FLAT),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
+endif
 
 ifneq ($(BR2_TARGET_OPTIMIZATION),)
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index a92bada..9a2fc70 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -47,6 +47,9 @@ static char *predef_args[] = {
 #ifdef BR_64
 	"-m64",
 #endif
+#ifdef BR_BINFMT_FLAT
+	"-Wl,-elf2flt",
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
