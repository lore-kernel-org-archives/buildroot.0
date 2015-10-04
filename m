From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:28:41 +0100
Subject: [Buildroot] [PATCH v2 01/18] toolchain-external: move wrapper to
	toolchain directory
In-Reply-To: <1443961738-12149-1-git-send-email-arnout@mind.be>
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
Message-ID: <1443961738-12149-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain wrapper will be reused for the internal toolchain, so it
belongs in the toolchain directory. Also, the ext- prefix is removed
from it. The build commands are moved to a new toolchain-wrapper.mk.

The wrapper arguments that are also relevant for the internal toolchain
wrapper are moved to toolchain-wrapper.mk, the rest stays in
toolchain-external.mk.

While we're at it, move the building of the toolchain wrapper to the
build step of toolchain-external. There is no specific reason to do
this, other than that it fits better semantically. Also remove the
MESSAGE call, otherwise we'd see:
>>> toolchain-external undefined Building
>>> toolchain-external undefined Building toolchain wrapper
/usr/bin/gcc ...
Having an extra "Building toolchain wrapper' message is pointless.

The useless condition on $(BR2_TARGET_OPTIMIZATION) is removed. It was
always true because it wasn't qstrip'ped first, so clearly it works
without that condition as well.

Also rewrapped some comments and removed the 'external' reference.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v2: Remove references to 'external' in comments [Romain]
    Rewrap some comments [Arnout]
---
 toolchain/toolchain-external/toolchain-external.mk | 55 +++++++---------------
 ...ext-toolchain-wrapper.c => toolchain-wrapper.c} |  6 +--
 toolchain/toolchain-wrapper.mk                     | 26 ++++++++++
 3 files changed, 47 insertions(+), 40 deletions(-)
 rename toolchain/{toolchain-external/ext-toolchain-wrapper.c => toolchain-wrapper.c} (96%)
 create mode 100644 toolchain/toolchain-wrapper.mk

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 342f13e..6efc013 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -153,15 +153,14 @@ TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX
 TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc
 TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++
 TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
 # TOOLCHAIN_EXTERNAL_BIN points outside HOST_DIR => absolute path
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
 	-DBR_CROSS_PATH_ABS='"$(TOOLCHAIN_EXTERNAL_BIN)"'
 else
 # TOOLCHAIN_EXTERNAL_BIN points inside HOST_DIR => relative path
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
 	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
 endif
 
@@ -180,59 +179,54 @@ CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 # to select the right multilib variant
 ifeq ($(BR2_x86_64),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m64
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_64
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
 endif
 ifneq ($(CC_TARGET_ARCH_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
 endif
 ifneq ($(CC_TARGET_CPU_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
 endif
 ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
 ifneq ($(CC_TARGET_FPU_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
 endif
 ifneq ($(CC_TARGET_FLOAT_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_ABI_)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
 endif
 ifneq ($(CC_TARGET_MODE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_MODE_)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
 endif
 ifeq ($(BR2_BINFMT_FLAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_BINFMT_FLAT
 endif
 ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EL
 endif
 ifeq ($(BR2_mips)$(BR2_mips64),y)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EB
 endif
 ifeq ($(BR2_arceb),y)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EB
 endif
-ifneq ($(BR2_TARGET_OPTIMIZATION),)
+
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
-# We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each
-# flag is a separate argument when used in execv() by the external
-# toolchain wrapper.
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
-endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
 # The Linaro ARMhf toolchain expects the libraries in
@@ -688,15 +682,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT
 endef
 endif
 
-# We use --hash-style=both to increase the compatibility of
-# the generated binary with older platforms, except for MIPS,
-# where the only acceptable hash style is 'sysv'
-ifeq ($(findstring mips,$(HOSTARCH)),mips)
-TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE = sysv
-else
-TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE = both
-endif
-
 # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
 # symlinks for everything else. Skip gdb symlink when we are building our
 # own gdb to prevent two gdb's in output/host/usr/bin.
@@ -707,8 +692,6 @@ endif
 # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
 # *-ranlib and *-nm.
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
-	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
-	$(Q)mkdir -p $(HOST_DIR)/usr/bin
 	$(Q)cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
@@ -717,7 +700,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
 			;; \
 		*cc|*cc-*|*++|*++-*|*cpp) \
-			ln -sf ext-toolchain-wrapper $$base; \
+			ln -sf toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
 			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
@@ -729,10 +712,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 			;; \
 		esac; \
 	done
-	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) \
-		-s -Wl,--hash-style=$(TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE) \
-		toolchain/toolchain-external/ext-toolchain-wrapper.c \
-		-o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
 endef
 
 # This sed magic is taken from Linux headers_install.sh script.
@@ -771,6 +750,8 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 	fi
 endef
 
+TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
+
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
similarity index 96%
rename from toolchain/toolchain-external/ext-toolchain-wrapper.c
rename to toolchain/toolchain-wrapper.c
index b3b02d8..ac40dec 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -1,7 +1,7 @@
 /**
- * Buildroot wrapper for external toolchains. This simply executes the real
- * toolchain with a number of arguments (sysroot/arch/..) hardcoded,
- * to ensure the external toolchain uses the correct configuration.
+ * Buildroot wrapper for toolchains. This simply executes the real toolchain
+ * with a number of arguments (sysroot/arch/..) hardcoded, to ensure the
+ * toolchain uses the correct configuration.
  * The hardcoded path arguments are defined relative to the actual location
  * of the binary.
  *
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
new file mode 100644
index 0000000..899947d
--- /dev/null
+++ b/toolchain/toolchain-wrapper.mk
@@ -0,0 +1,26 @@
+# This file contains the definition of the toolchain wrapper build commands
+
+# We use --hash-style=both to increase the compatibility of the generated
+# binary with older platforms, except for MIPS, where the only acceptable
+# hash style is 'sysv'
+ifeq ($(findstring mips,$(HOSTARCH)),mips)
+TOOLCHAIN_WRAPPER_HASH_STYLE = sysv
+else
+TOOLCHAIN_WRAPPER_HASH_STYLE = both
+endif
+
+TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
+
+# We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
+# separate argument when used in execv() by the toolchain wrapper.
+TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
+
+# For simplicity, build directly into the install location
+define TOOLCHAIN_BUILD_WRAPPER
+	$(Q)mkdir -p $(HOST_DIR)/usr/bin
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
+		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
+		toolchain/toolchain-wrapper.c \
+		-o $(HOST_DIR)/usr/bin/toolchain-wrapper
+endef
-- 
2.5.3
