From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 00:03:49 +0200
Subject: [Buildroot] [git commit] toolchain-external: add support for Arago
	2011.09 ARMv7A
Message-ID: <20130611100807.64F779AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93d2b247f969bda955ff0b2470c3536cef8d29c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   18 ++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    8 ++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f87b6ac..3ce58ac 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -136,6 +136,23 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
+config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
+	bool "Arago ARMv7 2011.09"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	help
+	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
+	  binutils 2.20.1, glibc 2.12, gdb 7.2.
+
+	  This toolchain uses -mfloat-abi=softfp (i.e use FPU
+	  instructions, but pass floating point function arguments in
+	  non-floating point registers).
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	bool "Sourcery CodeBench MIPS 2013.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -749,6 +766,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
+	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 0f8ede0..0d29d36 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -200,6 +200,13 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
+TOOLCHAIN_EXTERNAL_SITE=http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
+TOOLCHAIN_EXTERNAL_SOURCE=arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
+define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
+	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
+	rm -rf $(@D)/arago-2011.09/
+endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03),y)
 TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.03/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
@@ -333,6 +340,7 @@ $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 	mkdir -p $(@D)
 	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(@D) $(TAR_OPTIONS) -
+	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
 	$(Q)touch $@
 endif
 
