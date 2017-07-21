From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Jul 2017 18:06:31 +0100
Subject: [Buildroot] [PATCH 1/5] arch/mips: add option for toolchains
	supporting -mnan
Message-ID: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-mnan option was added in gcc-4.9.0 so make sure that users cannot
select the NaN mode when using toolchains that have a gcc older
than 4.9.0, and also make sure that the -mnan option is not passed at
all to the toolchain-wrapper and target cflags.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips                                    | 1 +
 toolchain/toolchain-common.in                          | 4 ++++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index de71110e08..3d2dfe3f49 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -169,6 +169,7 @@ config BR2_MIPS_NAN_2008
 
 choice
 	prompt "Target NaN"
+	depends on BR2_TOOLCHAIN_HAS_MNAN_OPTION
 	depends on BR2_mips_32r5 || BR2_mips_64r5
 	default BR2_MIPS_ENABLE_NAN_2008
 	help
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 932eecac9a..0002682e12 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -342,6 +342,10 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST
 	default "4.4"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
 	default "4.3"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
 
+config BR2_TOOLCHAIN_HAS_MNAN_OPTION
+	bool
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_TOOLCHAIN_HAS_SYNC_1
 	bool
 	default y
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 3263199642..23cdf30b9f 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -178,10 +178,12 @@ ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
+ifeq ($(BR2_TOOLCHAIN_HAS_MNAN_OPTION),y)
 ifneq ($(CC_TARGET_NAN_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mnan=$(CC_TARGET_NAN_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(CC_TARGET_NAN_)"'
 endif
+endif
 ifneq ($(CC_TARGET_FP32_MODE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfp$(CC_TARGET_FP32_MODE_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FP32_MODE='"$(CC_TARGET_FP32_MODE_)"'
-- 
2.13.0
