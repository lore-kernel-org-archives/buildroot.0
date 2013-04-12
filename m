From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 12 Apr 2013 18:18:23 +0800
Subject: [Buildroot] [PATCH v5 1/7] arch: toolchain: Introduce binary
	formats BINFMT_*.
Message-ID: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Just introduce the symbol and options in arch generic Config.in.
Append FLAT format link flags to external toolchain wrapper.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

---

v3-changes:
- Rename the BINFMT dependency names in external toolchain config file.
- Add some help text to BINFMT macros.
---
 arch/Config.in                                     |   34 ++++++++++++++++++++
 toolchain/toolchain-external/Config.in             |   12 +++---
 toolchain/toolchain-external/ext-tool.mk           |    4 ++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 ++
 4 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 472b10c..2a14c29 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -174,6 +174,40 @@ config BR2_GCC_TARGET_ABI
 config BR2_GCC_TARGET_CPU
 	string
 
+# Set up target binary format
+choice
+	prompt "Target Binary Format"
+	default BR2_BINFMT_FDPIC if BR2_bfin
+	default BR2_BINFMT_ELF
+
+config BR2_BINFMT_ELF
+	bool "ELF"
+	depends on !BR2_bfin
+	help
+	  ELF (Executable and Linkable Format) is a format for libraries and
+	  executables used across different architectures and operating
+	  systems.
+
+config BR2_BINFMT_FDPIC
+	bool "FDPIC"
+	depends on BR2_bfin
+	help
+	  ELF FDPIC binaries are based on ELF, but allow the individual load
+	  segments of a binary to be located in memory independently of each
+	  other. This makes this format ideal for use in environments where no
+	  MMU is available.
+
+config BR2_BINFMT_FLAT
+	bool "FLAT"
+	depends on BR2_bfin
+	select BR2_PREFER_STATIC_LIB
+	help
+	  FLAT binary is a relatively simple and lightweight executable format
+	  based on the original a.out format. It is widely used in environment
+	  where no MMU is available.
+
+endchoice
+
 if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
 endif
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5b26aa9..6cf29aa 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -758,12 +758,12 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
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
index b477bc0..92183a4 100644
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
-- 
1.7.0.4
