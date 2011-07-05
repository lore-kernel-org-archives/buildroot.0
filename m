From: Matias Garcia <mdhgarcia@gmail.com>
Date: Tue,  5 Jul 2011 18:15:36 -0400
Subject: [Buildroot] [PATCH] Add arbitrary arguments to sysroot selection
	and wrapper for external toolchains
In-Reply-To: <1309904136-28700-1-git-send-email-mdhgarcia@gmail.com>
References: <1309904136-28700-1-git-send-email-mdhgarcia@gmail.com>
Message-ID: <1309904136-28700-2-git-send-email-mdhgarcia@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CodeSourcery uses non-standard arguments to determine which sysroot to use and to set other optimizations (e.g. which floating point ABI to use). This patch allows one to pass an arbitrary argument to the sysroot discovery in ext-tool.mk and adds the same option to the argument list in ext-toolchain-wrapper.c

A new option is added to the external toolchain menu for these arguments rather than using BR2_TARGET_OPTIMIZATIONS because optimizations are more likely to be tweaked or dropped as needed.

Signed-off-by: Matias Garcia <mdhgarcia@gmail.com>
---
 toolchain/toolchain-external/Config.in             |    8 ++++++++
 toolchain/toolchain-external/ext-tool.mk           |    4 ++++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 +++
 3 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ca9892b..3b8ed2c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -125,6 +125,14 @@ config BR2_TOOLCHAIN_EXTERNAL_PATH
 	help
 	  Path to where the external toolchain is installed.
 
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS
+	string "Custom toolchain arguments (e.g. for selecting sysroot/optimizations)"
+	default ""
+	help
+	  These arguments will be passed to the external toolchain
+	  to determine its sysroot, and also passed to the toolchain
+	  when calling the wrapper generated in $(HOST_DIR)/usr/bin.
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
 	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 328f908..bdaf4b5 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -132,6 +132,10 @@ CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
+ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
+TOOLCHAIN_EXTERNAL_CFLAGS += $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_OPT='$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'
+endif
 ifneq ($(CC_TARGET_TUNE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mtune=$(CC_TARGET_TUNE_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_TUNE='"$(CC_TARGET_TUNE_)"'
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index a485e74..2fc22c4 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -22,6 +22,9 @@ static char path[PATH_MAX] = BR_CROSS_PATH;
 static char *args[MAXARGS] = {
 	path,
 	"--sysroot", BR_SYSROOT,
+#ifdef BR_OPT
+	BR_OPT,
+#endif /* BR_OPT */
 #ifdef BR_ARCH
 	"-march=" BR_ARCH,
 #endif /* BR_ARCH */
-- 
1.7.4.1
