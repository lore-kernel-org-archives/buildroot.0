From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:08:04 +0200
Subject: [Buildroot] [PATCH 30/31] toolchain-external: do not use
	BR2_GCC_TARGET_TUNE anymore
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-31-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the BR2_GCC_TARGET_TUNE value is always empty now, there is no
longer a point in using it in the external toolchain logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-toolchain-wrapper.c | 12 +++---------
 toolchain/toolchain-external/toolchain-external.mk   |  5 -----
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 8db4ac4..f459a7e 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -33,10 +33,9 @@ static char sysroot[PATH_MAX];
  * Currently, we have:
  * 	-mfloat-abi=
  * 	-march=
- * 	-mtune=
  * 	-mcpu=
  */
-#define EXCLUSIVE_ARGS	4
+#define EXCLUSIVE_ARGS	3
 
 static char *predef_args[] = {
 	path,
@@ -154,14 +153,12 @@ int main(int argc, char **argv)
 #endif
 
 #if defined(BR_ARCH) || \
-    defined(BR_TUNE) || \
     defined(BR_CPU)
-	/* Add our -march/cpu/tune/abi flags, but only if none are
+	/* Add our -march/cpu/abi flags, but only if none are
 	 * already specified on the commandline
 	 */
 	for (i = 1; i < argc; i++) {
 		if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
-		    !strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
 		    !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
 			break;
 	}
@@ -169,14 +166,11 @@ int main(int argc, char **argv)
 #ifdef BR_ARCH
 		*cur++ = "-march=" BR_ARCH;
 #endif
-#ifdef BR_TUNE
-		*cur++ = "-mtune=" BR_TUNE;
-#endif
 #ifdef BR_CPU
 		*cur++ = "-mcpu=" BR_CPU;
 #endif
 	}
-#endif /* ARCH || TUNE || CPU */
+#endif /* ARCH || CPU */
 
 	/* append forward args */
 	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b7a0e60..e16fce5 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -163,7 +163,6 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
 	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
 endif
 
-CC_TARGET_TUNE_ := $(call qstrip,$(BR2_GCC_TARGET_TUNE))
 ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
 else
@@ -181,10 +180,6 @@ ifeq ($(BR2_x86_64),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m64
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_64
 endif
-ifneq ($(CC_TARGET_TUNE_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mtune=$(CC_TARGET_TUNE_)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_TUNE='"$(CC_TARGET_TUNE_)"'
-endif
 ifneq ($(CC_TARGET_ARCH_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
-- 
2.0.0
