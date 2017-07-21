From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 22:49:18 +0200
Subject: [Buildroot] [git commit] arch/mips: add option for toolchains
	supporting -mfpxx
Message-ID: <20170721205511.D5B0F7FAAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=087be35e22192460773489e3959e6c920ae7889a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-mfpxx option was added in gcc-5.1.0 so make sure that users cannot
select the "xx" fp32 mode when using toolchains that have a gcc older
than 5.1.0.

-mfp32 and -mfp64 were added in gcc-4.1.0, so given the older gcc
version we support in Buildroot (in the GCC_AT_LEAST options) is 4.3 we
don't need to do anything else for them.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips           | 3 ++-
 toolchain/toolchain-common.in | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 3d2dfe3..89e6eff 100644
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
@@ -150,6 +150,7 @@ config BR2_MIPS_FP32_MODE_32
 
 config BR2_MIPS_FP32_MODE_XX
 	bool "xx"
+	depends on BR2_TOOLCHAIN_HAS_MFPXX_OPTION
 
 config BR2_MIPS_FP32_MODE_64
 	bool "64"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 0002682..dd192b9 100644
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
