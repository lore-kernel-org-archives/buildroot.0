From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 13:44:00 +0200
Subject: [Buildroot] [git commit] arch: introduce BR2_GCC_TARGET_{FPU,
	FLOAT_ABI}
Message-ID: <20130716115406.E051C9A5BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d774551787fc737823fe645bb3efd758619690a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot already has the BR2_GCC_TARGET_{TUNE,ARCH,ABI,CPU} hidden
kconfig strings that allow per-architecture Config.in files to feed
the appropriate values of --with-{tune,arch,abi-cpu} when building
gcc, or the appropriate flags for the external toolchain wrapper.

This commit has two additional options:
BR2_GCC_TARGET_{FPU,FLOAT_ABI}, that allows to define the
--with-{fpu,float} gcc configure options for the internal backend, or
the -m{fpu,float-abi} options for the flags of the external toolchain
wrapper.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in                                     |   12 ++++++++++++
 package/gcc/gcc.mk                                 |   10 ++++++++++
 toolchain/toolchain-external/ext-tool.mk           |   10 ++++++++++
 .../toolchain-external/ext-toolchain-wrapper.c     |    6 ++++++
 4 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 5ca05cd..5bb96c5 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -192,6 +192,18 @@ config BR2_GCC_TARGET_CPU
 config BR2_GCC_TARGET_CPU_REVISION
 	string
 
+# The value of this option will be passed as --with-fpu=<value> when
+# building gcc (internal backend) or -mfpu=<value> in the toolchain
+# wrapper (external toolchain)
+config BR2_GCC_TARGET_FPU
+	string
+
+# The value of this option will be passed as --with-float=<value> when
+# building gcc (internal backend) or -mfloat-abi=<value> in the toolchain
+# wrapper (external toolchain)
+config BR2_GCC_TARGET_FLOAT_ABI
+	string
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 8bd65fc..bfc41a4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -167,6 +167,16 @@ HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
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
index 8d9f458..9d3dec4 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -145,6 +145,8 @@ CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISIO
 endif
 CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
+CC_TARGET_FPU_:=$(call qstrip,$(BR2_GCC_TARGET_FPU))
+CC_TARGET_FLOAT_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
@@ -168,6 +170,14 @@ ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
+ifneq ($(CC_TARGET_FPU_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
+endif
+ifneq ($(CC_TARGET_FLOAT_ABI_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_ABI_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
+endif
 ifeq ($(BR2_BINFMT_FLAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 9d79d68..f81aed4 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -38,6 +38,12 @@ static char *predef_args[] = {
 #ifdef BR_ABI
 	"-mabi=" BR_ABI,
 #endif
+#ifdef BR_FLOAT_ABI
+	"-mfloat-abi=" BR_FLOAT_ABI,
+#endif
+#ifdef BR2_FPU
+	"-mfpu=" BR_FPU,
+#endif
 #ifdef BR_SOFTFLOAT
 	"-msoft-float",
 #endif /* BR_SOFTFLOAT */
