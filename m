From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:15:03 +0200
Subject: [Buildroot] [git commit] toolchain-external: musl toolchain on ARM
	is for MMU-systems only
Message-ID: <20160728201546.B0672819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9f6ef8204831e67f695500b5d494286a5987b5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have introduced the support for ARM no-MMU in Buildroot,
we need to update the dependencies of the musl external toolchain. It
supports only MMU-capable ARM cores, so it must depend on BR2_USE_MMU,
at least for the ARM platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ee07ddb..f54fbee 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -586,10 +586,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl 1.1.12 toolchain"
-	depends on (BR2_arm && BR2_ARM_EABI) || \
-		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
-		(BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A) || BR2_i386 || \
-		(BR2_mips && !BR2_SOFT_FLOAT) || \
+	depends on (BR2_arm && BR2_ARM_EABI && BR2_USE_MMU) || \
+		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4 && BR2_USE_MMU) || \
+		(BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A && BR2_USE_MMU) || \
+		BR2_i386 || (BR2_mips && !BR2_SOFT_FLOAT) || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
 		BR2_sh4 || BR2_sh4eb || \
 		BR2_x86_64
