From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Mar 2012 21:00:09 +0100
Subject: [Buildroot] [PATCH 16/16] external-toolchain: add support for
	Linaro 2012.01
In-Reply-To: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e6e60becb008dd389c51d2d75cbfd63551300dae.1330977548.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linaro has just released a new pre-built toolchain, available as a
tarball, which is a pure toolchain (only the C library is
included). This makes this new Linaro 2012.01 toolchain usable in
Buildroot, so let's integrate the support for it.

In addition to simply adding the new external toolchain at the usual
locations, this patch allows need to adapt a few things to support
Linaro toolchains. Most toolchains store their libraries in the "lib/"
or "usr/lib" directories relative to the toolchain. Buildroot
toolchains on the other hand, store the libraries in the
"usr/<target-name>/lib" directory. And the Linaro toolchain has
choosen to use the "lib/<target-name>" directory. Therefore, this
patch adjust:

 * The logic to search a particular library when that library needs to
   be copied to the target directory

 * The logic to deduce the sysroot directory from the libc.a file
   location in the toolchain: removing "(usr/?)lib(64?)" is no longer
   sufficient, we need to take into account the "lib/<target-name>/"
   case.

Since the Linaro toolchain generates code for Cortex-A processors
only, the selection of this toolchain is limited to Cortex-A8 and
Cortex-A9.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                     |   31 ++++++++++++++++++++++++-----
 toolchain/toolchain-external/Config.in   |   15 ++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |   11 ++++++---
 3 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6e7f1f4..bb1ea90 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -7,11 +7,30 @@
 # directory to the target directory. Also optionaly strips the
 # library.
 #
-# Most toolchains have their libraries either in /lib or /usr/lib
-# relative to their ARCH_SYSROOT_DIR. Buildroot toolchains, however,
-# have basic libraries in /lib, and libstdc++/libgcc_s in
-# /usr/<target-name>/lib(64). Thanks to ARCH_LIB_DIR we also take into
-# account toolchains that have the libraries in lib64 and usr/lib64.
+# Most toolchains (CodeSourcery ones) have their libraries either in
+# /lib or /usr/lib relative to their ARCH_SYSROOT_DIR, so we search
+# libraries in:
+#
+#  $${ARCH_LIB_DIR}
+#  usr/$${ARCH_LIB_DIR}
+#
+# Buildroot toolchains, however, have basic libraries in /lib, and
+# libstdc++/libgcc_s in /usr/<target-name>/lib(64), so we also need to
+# search libraries in:
+#
+#  usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR}
+#
+# Finally, Linaro toolchains have the libraries in lib/<target-name>/,
+# so we need to search libraries in:
+#
+#  $${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX)
+#
+# Thanks to ARCH_LIB_DIR we also take into account toolchains that
+# have the libraries in lib64 and usr/lib64.
+#
+# Please be very careful to check the major toolchain sources:
+# Buildroot, Crosstool-NG, CodeSourcery and Linaro before doing any
+# modification on the below logic.
 #
 # $1: arch specific sysroot directory
 # $2: library directory ('lib' or 'lib64') from which libraries must be copied
@@ -25,7 +44,7 @@ copy_toolchain_lib_root = \
 	DESTDIR="$(strip $4)" ; \
  \
 	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
-		find -L $${ARCH_LIB_DIR} usr/$${ARCH_LIB_DIR} usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
+		find -L $${ARCH_LIB_DIR} usr/$${ARCH_LIB_DIR} usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} $${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
 			-maxdepth 1 -name "$${LIB}.*" 2>/dev/null \
 		)` ; \
 	for FILE in $${LIBS} ; do \
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f3f49e9..9db5cb6 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,6 +3,20 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01
+	bool "Linaro 2012.01"
+	depends on BR2_arm
+	depends on BR2_cortex_a8 || BR2_cortex_a9
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Linaro toolchain for the ARM architecture. It uses Linaro
+	  GCC 2012.01 (based on gcc 4.6), Linaro GDB 2011.12, eglibc
+	  2.13. It generates code that runs on all Cortex-A profile
+	  devices, but tuned for the Cortex-A9. The code generated is
+	  Thumb 2, with the softfp calling convention, and uses the
+	  VFPv3-D16 FPU instructions.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	bool "Sourcery CodeBench ARM 2011.09"
 	depends on BR2_arm
@@ -433,6 +447,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 8132caa..a638381 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -187,6 +187,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01),y)
+TOOLCHAIN_EXTERNAL_SITE=http://launchpad.net/linaro-toolchain-binaries/trunk/2012.01/+download/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.01-20120125_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
@@ -286,7 +289,7 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	@echo "Checking external toolchain settings"
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
-	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/libc\.a::'` ; \
+	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
@@ -343,14 +346,14 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 
 $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
-	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/libc\.a::'` ; \
+	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
 	ARCH_LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
-	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/libc\.a::'` ; \
-	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/libc.a:\1:'` ; \
+	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
+	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/(.*/)?libc.a:\1:'` ; \
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	mkdir -p $(TARGET_DIR)/lib ; \
 	echo "Copy external toolchain libraries to target..." ; \
-- 
1.7.4.1
