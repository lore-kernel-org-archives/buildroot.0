From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Dec 2012 09:24:10 +0100
Subject: [Buildroot] [git commit] toolchain-external: add support for
	'Linaro ARM 2012.12'
Message-ID: <20121221082524.9DF319A2F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e658cdf1ad6bb93fa1ff80fef7fcd2658dd2f656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   18 ++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index aa2f28f..9dda722 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,6 +3,23 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12
+	bool "Linaro 2012.12"
+	depends on BR2_arm
+	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Linaro toolchain for the ARM architecture. It uses Linaro
+	  GCC 2012.12 (based on gcc 4.7), Linaro GDB 2012.12 (based on
+	  GDB 7.5), eglibc 2.15. It generates code that runs on all
+	  Cortex-A profile devices, but tuned for the Cortex-A9. The
+	  code generated is Thumb 2, with the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
+
+	  To use this toolchain, you must disable soft float usage.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 	bool "Linaro 2012.11"
 	depends on BR2_arm
@@ -685,6 +702,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 5720cd2..ade706e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -193,6 +193,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.10-20121022_li
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.11/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.11-20121123_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12),y)
+TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.12/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.12-20121214_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.09-75-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
