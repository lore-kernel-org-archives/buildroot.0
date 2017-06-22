From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 22 Jun 2017 18:11:33 +0100
Subject: [Buildroot] [PATCH v2 2/2] infra: add support for MIPS32 FP mode
In-Reply-To: <20170622171133.58513-1-Vincent.Riera@imgtec.com>
References: <20170622171133.58513-1-Vincent.Riera@imgtec.com>
Message-ID: <20170622171133.58513-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS32 support different FP modes (32,xx,64), so give the user the
opportunity to choose between them. That will cause host-gcc to be built
using the --with-fp-32=[32|xx|64] configure option. Also the
-mfp[32|xx|64] gcc option will be added to TARGET_CFLAGS and to the
toolchain wrapper.

Information about FP modes here:

- https://sourceware.org/binutils/docs/as/MIPS-Options.html
- https://dmz-portal.imgtec.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking#5._Generating_modeless_code

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Nothing. This patch didn't exist in v1.
---
 arch/Config.in                                     |  3 +++
 arch/Config.in.mips                                | 25 ++++++++++++++++++++++
 package/gcc/gcc.mk                                 |  7 ++++++
 .../toolchain-external/pkg-toolchain-external.mk   |  5 +++++
 toolchain/toolchain-wrapper.c                      |  3 +++
 5 files changed, 43 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index e921879d0..f385745e4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -267,6 +267,9 @@ config BR2_GCC_TARGET_ABI
 config BR2_GCC_TARGET_NAN
 	string
 
+config BR2_GCC_TARGET_FP32_MODE
+	string
+
 config BR2_GCC_TARGET_CPU
 	string
 
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index a9c27a0e8..2303bd367 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -128,6 +128,31 @@ config BR2_MIPS_SOFT_FLOAT
 	  floating point functions, then everything will need to be
 	  compiled with soft floating point support (-msoft-float).
 
+choice
+	prompt "FP mode"
+	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
+	default BR2_MIPS_FP32_MODE_XX
+
+	help
+	  FP mode to be used
+
+config BR2_MIPS_FP32_MODE_32
+	bool "32"
+	depends on !BR2_MIPS_CPU_MIPS32R6
+
+config BR2_MIPS_FP32_MODE_XX
+	bool "xx"
+
+config BR2_MIPS_FP32_MODE_64
+	bool "64"
+	depends on !BR2_MIPS_CPU_MIPS32
+endchoice
+
+config BR2_GCC_TARGET_FP32_MODE
+	default "32"	if BR2_MIPS_FP32_MODE_32
+	default "xx"	if BR2_MIPS_FP32_MODE_XX
+	default "64"	if BR2_MIPS_FP32_MODE_64
+
 config BR2_MIPS_NAN_LEGACY
 	bool
 	default y		if BR2_MIPS_CPU_MIPS32 || BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64 || BR2_MIPS_CPU_MIPS64R2
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index c0249cd50..4edcf5280 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -207,6 +207,9 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_NAN)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-nan=$(BR2_GCC_TARGET_NAN)
 endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_FP32_MODE)),)
+HOST_GCC_COMMON_CONF_OPTS += --with-fp-32=$(BR2_GCC_TARGET_FP32_MODE)
+endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
@@ -258,6 +261,7 @@ endif
 HOST_GCC_COMMON_WRAPPER_TARGET_ARCH := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
 HOST_GCC_COMMON_WRAPPER_TARGET_ABI := $(call qstrip,$(BR2_GCC_TARGET_ABI))
 HOST_GCC_COMMON_WRAPPER_TARGET_NAN := $(call qstrip,$(BR2_GCC_TARGET_NAN))
+HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
 HOST_GCC_COMMON_WRAPPER_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 HOST_GCC_COMMON_WRAPPER_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
@@ -274,6 +278,9 @@ endif
 ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_NAN),)
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(HOST_GCC_COMMON_WRAPPER_TARGET_NAN)"'
 endif
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FP32_MODE='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE)"'
+endif
 ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FPU),)
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FPU)"'
 endif
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 29c0aade1..ccb298bec 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -157,6 +157,7 @@ endif
 CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
 CC_TARGET_NAN_ := $(call qstrip,$(BR2_GCC_TARGET_NAN))
+CC_TARGET_FP32_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
 CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
@@ -183,6 +184,10 @@ ifneq ($(CC_TARGET_NAN_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mnan=$(CC_TARGET_NAN_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(CC_TARGET_NAN_)"'
 endif
+ifneq ($(CC_TARGET_FP32_MODE_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfp$(CC_TARGET_FP32_MODE_)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FP32_MODE='"$(CC_TARGET_FP32_MODE_)"'
+endif
 ifneq ($(CC_TARGET_FPU_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 28066e425..575c4668d 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -57,6 +57,9 @@ static char *predef_args[] = {
 #ifdef BR_FPU
 	"-mfpu=" BR_FPU,
 #endif
+#ifdef BR_FP32_MODE
+	"-mfp" BR_FP32_MODE,
+#endif
 #ifdef BR_SOFTFLOAT
 	"-msoft-float",
 #endif /* BR_SOFTFLOAT */
-- 
2.13.0
