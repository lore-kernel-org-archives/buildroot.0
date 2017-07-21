From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Jul 2017 18:06:32 +0100
Subject: [Buildroot] [PATCH 2/5] arch/mips: add option for toolchains
	supporting -mfpxx
In-Reply-To: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
References: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
Message-ID: <20170721170635.41202-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-mfpxx option was added in gcc-5.1.0 so make sure that users cannot
select the "xx" fp32 mode when using toolchains that have a gcc older
than 5.1.0.

-mfp32 and -mfp64 were added in gcc-4.1.0, so given the older gcc
version we support in Buildroot (in the GCC_AT_LEAST options) is 4.3 we
don't need to do anything else for them.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips           | 3 ++-
 toolchain/toolchain-common.in | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 3d2dfe3f49..de37f0eb82 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -137,7 +137,7 @@ config BR2_MIPS_SOFT_FLOAT
 choice
 	prompt "FP mode"
 	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
-	default BR2_MIPS_FP32_MODE_XX
+	default BR2_MIPS_FP32_MODE_XX if BR2_TOOLCHAIN_HAS_MFPXX_OPTION
 	help
 	  MIPS32 supports different FP modes (32,xx,64). Information about FP
 	  modes can be found here:
@@ -149,6 +149,7 @@ config BR2_MIPS_FP32_MODE_32
 	depends on !BR2_MIPS_CPU_MIPS32R6
 
 config BR2_MIPS_FP32_MODE_XX
+	depends on BR2_TOOLCHAIN_HAS_MFPXX_OPTION
 	bool "xx"
 
 config BR2_MIPS_FP32_MODE_64
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 0002682e12..dd192b9ba4 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -346,6 +346,10 @@ config BR2_TOOLCHAIN_HAS_MNAN_OPTION
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+config BR2_TOOLCHAIN_HAS_MFPXX_OPTION
+	bool
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_TOOLCHAIN_HAS_SYNC_1
 	bool
 	default y
-- 
2.13.0
