From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:53:25 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: add Linaro
	2012.05
Message-ID: <20120802195258.24F428E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8d9fa9d601a5ec6c0e44c6c4803354482fdaed7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   17 +++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index dceeed2..cdcbb51 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,6 +3,22 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
+	bool "Linaro 2012.05"
+	depends on BR2_arm
+	depends on BR2_cortex_a8 || BR2_cortex_a9
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Linaro toolchain for the ARM architecture. It uses Linaro
+	  GCC 2012.05 (based on gcc 4.7), Linaro GDB 2012.05 (based on
+	  GDB 7.4), eglibc 2.13. It generates code that runs on all
+	  Cortex-A profile devices, but tuned for the Cortex-A9. The
+	  code generated is Thumb 2, with the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
+
+	  To use this toolchain, you must disable soft float usage.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04
 	bool "Linaro 2012.04"
 	depends on BR2_arm
@@ -534,6 +550,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 9c88776..3a14c74 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -202,6 +202,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linux.ta
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.04/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.04-20120426_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05),y)
+TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.05/+download/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.05-20120523_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
