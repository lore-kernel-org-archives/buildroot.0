From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:31 +0200
Subject: [Buildroot] [PATCH 19/22] toolchain: remove toolchain/Makefile.in
	and toolchain/gcc/Makefile.in
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6e213ba2e15b59d8baedfa3b7a7e643b2957ac24.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-integrate in gcc-uclibc-4.x.mk things from
toolchain/gcc/Makefile.in that were completely gcc-specific. There was
no reason to pull that when building with other backends than the
internal one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                        |    1 -
 package/Makefile.in             |    2 +
 toolchain/Makefile.in           |    2 -
 toolchain/gcc/Makefile.in       |   62 ---------------------------------------
 toolchain/gcc/gcc-uclibc-4.x.mk |   62 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 65 deletions(-)
 delete mode 100644 toolchain/Makefile.in
 delete mode 100644 toolchain/gcc/Makefile.in

diff --git a/Makefile b/Makefile
index a48fb87..0ed323e 100644
--- a/Makefile
+++ b/Makefile
@@ -262,7 +262,6 @@ endif
 
 all: world
 
-include toolchain/Makefile.in
 include package/Makefile.in
 include support/dependencies/dependencies.mk
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 7c75406..2be933b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -50,6 +50,8 @@ REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 
 STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
 
+TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION+=-O0
 endif
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
deleted file mode 100644
index 5f32f82..0000000
--- a/toolchain/Makefile.in
+++ /dev/null
@@ -1,2 +0,0 @@
-# gcc has a bunch of needed stuff....
-include toolchain/gcc/Makefile.in
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
deleted file mode 100644
index 3e82a32..0000000
--- a/toolchain/gcc/Makefile.in
+++ /dev/null
@@ -1,62 +0,0 @@
-# gcc has a bunch of options that need to be shared with
-# both gcc-uclibc-4.x.mk, and are use by other packages...
-# So include them in this file and arrange to include it
-# soon after invoking make from the top level.
-
-TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
-EXTRA_GCC_CONFIG_OPTIONS:=$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
-
-
-ifeq ($(BR2_SOFT_FLOAT),y)
-SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
-ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
-TARGET_SOFT_FLOAT:=-mfloat-abi=soft
-else
-TARGET_SOFT_FLOAT:=-msoft-float
-endif
-else # no softfloat support
-SOFT_FLOAT_CONFIG_OPTION:=
-TARGET_SOFT_FLOAT:=
-endif
-
-# some additional defaults
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-GCC_WITH_ARCH:=--with-arch=$(BR2_GCC_TARGET_ARCH)
-endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
-GCC_WITH_TUNE:=--with-tune=$(BR2_GCC_TARGET_TUNE)
-endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
-GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
-endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
-GCC_WITH_CPU:=--with-cpu=$(BR2_GCC_TARGET_CPU)
-endif
-
-# AVR32 GCC configuration
-ifeq ($(BR2_avr32),y)
-EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
-SOFT_FLOAT_CONFIG_OPTION:=
-endif
-
-# Disable mudflap and enable proper double/long double for SPE ABI
-ifeq ($(BR2_powerpc_SPE),y)
-EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap --enable-e500_double --with-long-double-128
-endif
-
-ifeq ($(BR2_PACKAGE_GCC_TARGET),y)
-EXTRA_TARGET_GCC_CONFIG_OPTIONS:=
-
-# AVR32 target GCC configuration
-ifeq ($(BR2_avr32),y)
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
-endif
-
-
-# and finally pull in config opts from the user
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=$(call qstrip,$(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS))
-
-TARGETS+=gcc_target
-endif
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 3d0228d..3f97a47 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -66,6 +66,64 @@ ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 GCC_QUADMATH=--disable-libquadmath
 endif
 
+# Determine soft-float options
+ifeq ($(BR2_SOFT_FLOAT),y)
+SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
+ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
+TARGET_SOFT_FLOAT:=-mfloat-abi=soft
+else
+TARGET_SOFT_FLOAT:=-msoft-float
+endif
+else # no softfloat support
+SOFT_FLOAT_CONFIG_OPTION:=
+TARGET_SOFT_FLOAT:=
+endif
+
+# Determine arch/tune/abi/cpu options
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
+GCC_WITH_ARCH:=--with-arch=$(BR2_GCC_TARGET_ARCH)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
+GCC_WITH_TUNE:=--with-tune=$(BR2_GCC_TARGET_TUNE)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
+GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+GCC_WITH_CPU:=--with-cpu=$(BR2_GCC_TARGET_CPU)
+endif
+
+# AVR32 GCC special configuration
+ifeq ($(BR2_avr32),y)
+# For the cross-compiler
+EXTRA_GCC_CONFIG_OPTIONS += \
+	--disable-libmudflap
+SOFT_FLOAT_CONFIG_OPTION:=
+
+# For the target compiler
+EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
+	--disable-libmudflap
+EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
+	--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin
+EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
+	--with-as=$(TARGET_CROSS)as
+endif
+
+# Disable mudflap and enable proper double/long double for SPE ABI
+ifeq ($(BR2_powerpc_SPE),y)
+EXTRA_GCC_CONFIG_OPTIONS +=  \
+	--disable-libmudflap \
+	--enable-e500_double \
+	--with-long-double-128
+endif
+
+# End with user-provided options, so that they can override previously
+# defined options.
+EXTRA_GCC_CONFIG_OPTIONS += \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
+EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
+	$(call qstrip,$(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS))
+
 #############################################################
 #
 # Setup some initial stuff
@@ -586,3 +644,7 @@ gcc_target-clean:
 
 gcc_target-dirclean:
 	rm -rf $(GCC_BUILD_DIR4)
+
+ifeq ($(BR2_PACKAGE_GCC_TARGET),y)
+TARGETS+=gcc_target
+endif
-- 
1.7.4.1
