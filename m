From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 20:46:11 +0100
Subject: [Buildroot] [git commit] toolchain: add powerpc SPE ABI support
Message-ID: <20120107201230.8BA3F8FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a6087d62e5c2a272278606ebf1cc62830cf4c68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the ability for buildroot to build an SPE ABI enabled toolchain.

This is mandatory for e500v1/v2 cores since they don't support classic
FPU mode as the e500mc does.

Useful for Freescale's PowerQUICC III and single/dual-core QorIQ
line of processors.

The new TARGET_ABI variable is used rather than TARGET_CFLAGS for
uclibc's UCLIBC_EXTRA_CFLAGS to avoid breakish CFLAGS leaking in, a
good example being -mthumb for ARM.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in        |   17 ++++++++++++++++-
 target/Config.in.arch      |   21 ++++++++++++++++++++-
 toolchain/gcc/Makefile.in  |    5 +++++
 toolchain/uClibc/uclibc.mk |    8 +++++++-
 4 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c3af5d3..dc8d038 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -31,6 +31,21 @@ ABI=eabi
 endif
 endif
 
+# For FSL PowerPC there's SPE
+ifeq ($(BR2_powerpc_SPE),y)
+ABI=spe
+# MPC8540s are e500v1 with single precision FP
+ifeq ($(BR2_powerpc_8540),y)
+TARGET_ABI+=-mabi=spe -mfloat-gprs=single -Wa,-me500
+endif
+ifeq ($(BR2_powerpc_8548),y)
+TARGET_ABI+=-mabi=spe -mfloat-gprs=double -Wa,-me500x2
+endif
+ifeq ($(BR2_powerpc_e500mc),y)
+TARGET_ABI+=-mabi=spe -mfloat-gprs=double -Wa,-me500mc
+endif
+endif
+
 REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 
 STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
@@ -60,7 +75,7 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING=-g3
 endif
 
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 ifeq ($(BR2_x86_64),y)
diff --git a/target/Config.in.arch b/target/Config.in.arch
index 5e9fad4..417441d 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -447,7 +447,9 @@ config BR2_powerpc_860
 config BR2_powerpc_970
 	bool "970"
 config BR2_powerpc_8540
-	bool "8540"
+	bool "8540 / e500v1"
+config BR2_powerpc_8548
+	bool "8548 / e500v2"
 comment "e300c2 needs gcc >= 4.4.x"
 config BR2_powerpc_e300c2
 	bool "e300c2"
@@ -459,6 +461,22 @@ config BR2_powerpc_e500mc
 	bool "e500mc"
 endchoice
 
+choice
+	prompt "Target ABI"
+	depends on BR2_powerpc
+	default BR2_powerpc_CLASSIC if BR2_powerpc_e500mc
+	default BR2_powerpc_SPE if BR2_powerpc_8540 || BR2_powerpc_8548
+	help
+	  Application Binary Interface to use
+
+config BR2_powerpc_CLASSIC
+	bool "Classic"
+	depends on !(BR2_powerpc_8540 || BR2_powerpc_8548)
+config BR2_powerpc_SPE
+	bool "SPE"
+	depends on BR2_powerpc_8540 || BR2_powerpc_8548 || BR2_powerpc_e500mc
+endchoice
+
 config BR2_ARCH
 	string
 	default "arm"		if BR2_arm
@@ -614,6 +632,7 @@ config BR2_GCC_TARGET_TUNE
 	default 860		if BR2_powerpc_860
 	default 970		if BR2_powerpc_970
 	default 8540		if BR2_powerpc_8540
+	default	8548		if BR2_powerpc_8548
 	default e300c2		if BR2_powerpc_e300c2
 	default e300c3		if BR2_powerpc_e300c3
 	default e500mc		if BR2_powerpc_e500mc
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index 2e55ed0..d9efcf0 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -47,6 +47,11 @@ EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 SOFT_FLOAT_CONFIG_OPTION:=
 endif
 
+# Disable mudflap and enable proper double/long double for SPE ABI
+ifeq ($(BR2_powerpc_SPE),y)
+EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap --enable-e500_double --with-long-double-128
+endif
+
 ifeq ($(BR2_PACKAGE_GCC_TARGET),y)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS:=
 
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index fbfb0df..ee474bb 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -217,7 +217,7 @@ ifeq ($(UCLIBC_TARGET_ARCH),sparc)
 	$(SED) 's/^.*$(UCLIBC_SPARC_TYPE)[^B].*/$(UCLIBC_SPARC_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(UCLIBC_TARGET_ARCH),powerpc)
-ifeq ($(BR2_powerpc_8540)$(BR2_powerpc_e500mc),y)
+ifeq ($(BR2_powerpc_8540)$(BR2_powerpc_8548)$(BR2_powerpc_e500mc),y)
 	/bin/echo "# CONFIG_CLASSIC is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "CONFIG_E500=y" >> $(UCLIBC_DIR)/.oldconfig
 else
@@ -385,6 +385,7 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
+		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" \
 		oldconfig
 	touch $@
@@ -403,6 +404,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
+		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" headers \
 		lib/crt1.o lib/crti.o lib/crtn.o \
 		install_headers
@@ -424,6 +426,7 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate) $(LIBFLO
 		DEVEL_PREFIX=/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
+		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" \
 		all
 	touch -c $@
@@ -435,6 +438,7 @@ uclibc-menuconfig: dirs $(UCLIBC_DIR)/.config
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
+		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" \
 		menuconfig && \
 	touch -c $(UCLIBC_DIR)/.config
@@ -447,6 +451,7 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
+		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		install_runtime install_dev
 	# Install the kernel headers to the staging dir if necessary
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
@@ -477,6 +482,7 @@ $(TARGET_DIR)/lib/libc.so.0: $(STAGING_DIR)/usr/lib/libc.a
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
+		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		install_runtime
 	touch -c $@
 
