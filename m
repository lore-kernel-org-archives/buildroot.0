From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Jul 2013 17:08:05 +0200
Subject: [Buildroot] [PATCH 1/8] arch: introduce BR2_GCC_TARGET_{FPU, FLOAT}
In-Reply-To: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373123292-15085-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot already has the BR2_GCC_TARGET_{TUNE,ARCH,ABI,CPU} hidden
kconfig strings that allow per-architecture Config.in files to feed
the appropriate values of --with-{tune,arch,abi-cpu} when building
gcc, or the appropriate flags for the external toolchain wrapper.

This commit has two additional options: BR2_GCC_TARGET_{FPU,FLOAT},
that allows to define the --with-{fpu,float} gcc configure options for
the internal backend, or the -mfpu/-mfloat-abi options for the flags
of the external toolchain wrapper.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in                                       |  6 ++++++
 package/gcc/gcc.mk                                   | 10 ++++++++++
 toolchain/toolchain-external/ext-tool.mk             | 10 ++++++++++
 toolchain/toolchain-external/ext-toolchain-wrapper.c |  6 ++++++
 4 files changed, 32 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 5ca05cd..d95d4ef 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -192,6 +192,12 @@ config BR2_GCC_TARGET_CPU
 config BR2_GCC_TARGET_CPU_REVISION
 	string
 
+config BR2_GCC_TARGET_FPU
+	string
+
+config BR2_GCC_TARGET_FLOAT_ABI
+	string
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 968354b..c5ca857 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -165,6 +165,16 @@ HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 endif
 endif
 
+GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
+ifneq ($(GCC_TARGET_FPU),)
+HOST_GCC_COMMON_CONF_OPT += --with-fpu=$(GCC_TARGET_FPU)
+endif
+
+GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+ifneq ($(GCC_TARGET_FLOAT_ABI),)
+HOST_GCC_COMMON_CONF_OPT += --with-float=$(GCC_TARGET_FLOAT_ABI)
+endif
+
 # Branding works on >= 4.3
 ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
 HOST_GCC_COMMON_CONF_OPT += \
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index b8d77ad..5c51e06 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -145,6 +145,8 @@ CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISIO
 endif
 CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
+CC_TARGET_FLOAT_:=$(call qstrip,$(BR2_GCC_TARGET_FLOAT))
+CC_TARGET_FPU_:=$(call qstrip,$(BR2_GCC_TARGET_FPU))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
@@ -168,6 +170,14 @@ ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
+ifneq ($(CC_TARGET_FLOAT_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_FLOAT='"$(CC_TARGET_FLOAT_)"'
+endif
+ifneq ($(CC_TARGET_FPU_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
+endif
 ifeq ($(BR2_BINFMT_FLAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 9d79d68..e504ff2 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -38,6 +38,12 @@ static char *predef_args[] = {
 #ifdef BR_ABI
 	"-mabi=" BR_ABI,
 #endif
+#ifdef BR_FLOAT
+	"-mfloat-abi=" BR_FLOAT,
+#endif
+#ifdef BR2_FPU
+	"-mfpu=" BR_FPU,
+#endif
 #ifdef BR_SOFTFLOAT
 	"-msoft-float",
 #endif /* BR_SOFTFLOAT */
-- 
1.8.1.2
