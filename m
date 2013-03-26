From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 26 Mar 2013 17:33:54 +0800
Subject: [Buildroot] [PATCH 3/7] arch: toolchain: Introduce binary formats
	BINFMT_*.
In-Reply-To: <1364290438-13987-1-git-send-email-sonic.adi@gmail.com>
References: <1364290438-13987-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1364290438-13987-3-git-send-email-sonic.adi@gmail.com>
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
 arch/Config.in                                     |   13 +++++++++++++
 toolchain/toolchain-external/ext-tool.mk           |    4 ++++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 +++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index c341848..be475c0 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -177,6 +177,19 @@ config BR2_GCC_TARGET_CPU
 config BR2_GCC_TARGET_CPU_REVISION
 	string
 
+# Set up target binary format
+choice
+	prompt "Target Binary Format"
+	default BR2_BINFMT_ELF
+config BR2_BINFMT_ELF
+	bool "ELF"
+config BR2_BINFMT_FDPIC
+	bool "FDPIC"
+config BR2_BINFMT_FLAT
+	bool "FLAT"
+	select BR2_PREFER_STATIC_LIB
+endchoice
+
 if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
 endif
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 407e1ad..27fd296 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -164,6 +164,10 @@ ifneq ($(CC_TARGET_ABI_),)
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
