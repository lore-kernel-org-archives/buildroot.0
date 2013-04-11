From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 11 Apr 2013 10:09:01 +0800
Subject: [Buildroot] [PATCH v4 4/7] arch: toolchain: Introduce binary format
	FLAT types.
In-Reply-To: <1365646144-8214-1-git-send-email-sonic.adi@gmail.com>
References: <1365646144-8214-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1365646144-8214-4-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Just introduce the symbol and options in arch generic Config.in.
Append FLAT types specific link flags into external toolchain wrapper.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

---

v3-changes:
- Add dependancy to bfin and m68k
- Add help text for FLAT binary types.
- Split shared flat flags.
---
 arch/Config.in                                     |   26 ++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk           |    8 ++++++
 .../toolchain-external/ext-toolchain-wrapper.c     |    7 +++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 047abc1..255b8b0 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -211,6 +211,32 @@ config BR2_BINFMT_FLAT
 
 endchoice
 
+# Set up flat binary type
+choice
+	prompt "FLAT Binary type"
+	depends on BR2_BINFMT_FLAT
+	default BR2_BINFMT_FLAT_ONE
+
+config BR2_BINFMT_FLAT_ONE
+	bool "One memory region"
+	help
+	  All segments are linked into one memory region.
+
+config BR2_BINFMT_FLAT_SEP_DATA
+	bool "Separate data and code region"
+	depends on BR2_bfin || BR2_m68k
+	help
+	  Allow for the data and text segments to be separated and placed in
+	  different regions of memory.
+
+config BR2_BINFMT_FLAT_SHARED
+	bool "Shared binary"
+	depends on BR2_bfin || BR2_m68k
+	help
+	  Allow to load and link indiviual FLAT binaries at run time.
+
+endchoice
+
 if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
 endif
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 27fd296..0ca1307 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -168,6 +168,14 @@ ifeq ($(BR2_BINFMT_FLAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
 endif
+ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -msep-data
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT_SEP_DATA
+endif
+ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mid-shared-library -mshared-library-id=0
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT_SHARED
+endif
 
 ifneq ($(BR2_TARGET_OPTIMIZATION),)
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 9a2fc70..78f1152 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -50,6 +50,13 @@ static char *predef_args[] = {
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
+#ifdef BR_BINFMT_FLAT_SEP_DATA
+	"-msep-data",
+#endif
+#ifdef BR_BINFMT_FLAT_SHARED
+	"-mid-shared-library",
+	"-mshared-library-id=0",
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
-- 
1.7.0.4
