From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 14:52:32 +0200
Subject: [Buildroot] [git commit] arch: drop BR2_GCC_TARGET_CPU_REVISION
 option
Message-ID: <20181001125331.BF6548A5DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf2b12cbfba473fe1e4a2d4714b7a13ee19b64f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 325bb37942f8d3826dab9dc6e88b25234e67a2cf, support for the
Blackfin architecture was removed. This was our only use of
BR2_GCC_TARGET_CPU_REVISION, and since this config option somewhat
complicates the calculation of the --with-cpu/-mcpu option values,
let's drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in                                         | 3 ---
 arch/arch.mk                                           | 1 -
 package/gcc/gcc.mk                                     | 4 ----
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ----
 4 files changed, 12 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 8bd57fe1cc..f50760a0cf 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -317,9 +317,6 @@ config BR2_GCC_TARGET_FP32_MODE
 config BR2_GCC_TARGET_CPU
 	string
 
-config BR2_GCC_TARGET_CPU_REVISION
-	string
-
 # The value of this option will be passed as --with-fpu=<value> when
 # building gcc (internal backend) or -mfpu=<value> in the toolchain
 # wrapper (external toolchain)
diff --git a/arch/arch.mk b/arch/arch.mk
index 6c15270903..289c5a1125 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -14,7 +14,6 @@ GCC_TARGET_ABI := $(call qstrip,$(BR2_GCC_TARGET_ABI))
 GCC_TARGET_NAN := $(call qstrip,$(BR2_GCC_TARGET_NAN))
 GCC_TARGET_FP32_MODE := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
 GCC_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU))
-GCC_TARGET_CPU_REVISION := $(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION))
 GCC_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 GCC_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 GCC_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5f6d53f106..9e9069ce0e 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -215,12 +215,8 @@ ifneq ($(GCC_TARGET_FP32_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-fp-32="$(GCC_TARGET_FP32_MODE)"
 endif
 ifneq ($(GCC_TARGET_CPU),)
-ifneq ($(GCC_TARGET_CPU_REVISION),)
-HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(GCC_TARGET_CPU)-$(GCC_TARGET_CPU_REVISION)
-else
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(GCC_TARGET_CPU)
 endif
-endif
 
 ifneq ($(GCC_TARGET_FPU),)
 HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(GCC_TARGET_FPU)
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 08e61af00b..241a39a5ee 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -151,11 +151,7 @@ TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 # Definition of the CFLAGS to use with the external toolchain, as well as the
 # common toolchain wrapper build arguments
 #
-ifeq ($(GCC_TARGET_CPU_REVISION),)
 CC_TARGET_CPU_ := $(GCC_TARGET_CPU)
-else
-CC_TARGET_CPU_ := $(GCC_TARGET_CPU)-$(GCC_TARGET_CPU_REVISION)
-endif
 CC_TARGET_ARCH_ := $(GCC_TARGET_ARCH)
 CC_TARGET_ABI_ := $(GCC_TARGET_ABI)
 CC_TARGET_NAN_ := $(GCC_TARGET_NAN)
