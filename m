From: Matias Garcia <mgarcia@rossvideo.com>
Date: Fri, 06 May 2011 17:57:24 -0400
Subject: [Buildroot] [PATCH] external toolchain: add arbitrary arguments to
 sysroot discovery and toolchain wrapper
Message-ID: <4DC46EC4.2060000@rossvideo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CodeSourcery uses non-standard arguments to determine which sysroot to 
use and to set other optimizations (e.g. which floating point ABI to 
use). This patch allows one to pass an arbitrary argument to the sysroot 
discovery in ext-tool.mk and adds the same option to the argument list 
in ext-toolchain-wrapper.c. I have not tested it with an empty option. 
Use at your own risk as this is my first open-source patch ever... (Am I 
supposed to write 'signed-off by...'?)

Cheers,
Matias

diff --git a/toolchain/toolchain-external/Config.in 
b/toolchain/toolchain-external/Config.in
index ca9892b..3b8ed2c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -125,6 +125,14 @@ config BR2_TOOLCHAIN_EXTERNAL_PATH
      help
        Path to where the external toolchain is installed.

+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS
+    string "Custom toolchain arguments (e.g. for selecting 
sysroot/optimizations)"
+    default ""
+    help
+      These arguments will be passed to the external toolchain
+      to determine its sysroot, and also passed to the toolchain
+      when calling the wrapper generated in $(HOST_DIR)/usr/bin.
+
  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
      string "Toolchain prefix"
      depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
diff --git a/toolchain/toolchain-external/ext-tool.mk 
b/toolchain/toolchain-external/ext-tool.mk
index 328f908..019bf30 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -132,6 +132,10 @@ CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))

  # march/mtune/floating point mode needs to be passed to the external 
toolchain
  # to select the right multilib variant
+ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
+TOOLCHAIN_EXTERNAL_CFLAGS += $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += 
-DBR_OPT='$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'
+endif
  ifneq ($(CC_TARGET_TUNE_),)
  TOOLCHAIN_EXTERNAL_CFLAGS += -mtune=$(CC_TARGET_TUNE_)
  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_TUNE='"$(CC_TARGET_TUNE_)"'
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c 
b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index a485e74..2fc22c4 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -22,6 +22,9 @@ static char path[PATH_MAX] = BR_CROSS_PATH;
  static char *args[MAXARGS] = {
      path,
      "--sysroot", BR_SYSROOT,
+#ifdef BR_OPT
+    BR_OPT,
+#endif /* BR_OPT */
  #ifdef BR_ARCH
      "-march=" BR_ARCH,
  #endif /* BR_ARCH */



-- 
	*Matias Garcia*
/Embedded Software Developer/
Ross Video | Live Production Technology
www.rossvideo.com <http://www.rossvideo.com>
