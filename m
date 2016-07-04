From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 10:58:40 +0200
Subject: [Buildroot] [git commit] gcc: add hidden symbol for defaults
Message-ID: <20160704090122.A0CA3819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c101f1b1b8fe0b6cf6feb5916d045bc9713e76bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some architectures, f.e. Blackfin doesn't support to configure GCC with
--with-cpu to set some CPU specific default CFLAGS (-mcpu=foo). Use a
hidden config symbol to give a hint which architecture supports it,
otherwise add defaults to toolchain wrapper for internal toolchains.

Idea from Thomas Petazzoni.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas:
 - simplify the Config.in logic with just one option named
   BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS, defined in package/gcc in one
   place.
 - improve the organization of the code and name of variables.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |  7 +++++++
 package/gcc/gcc.mk         | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index edb93fb..d691752 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -89,6 +89,13 @@ choice
 
 endchoice
 
+# Indicates if GCC for architecture supports --with-{arch,cpu,..}  to
+# set default CFLAGS, otherwise values will be used by toolchain
+# wrapper.
+config BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS
+	bool
+	default y if !BR2_bfin
+
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
 	default y
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index d2359a3..032015c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -193,6 +193,7 @@ HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
 endif
 
 # Determine arch/tune/abi/cpu options
+ifeq ($(BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS),y)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
@@ -221,6 +222,7 @@ GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
 ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
+endif # BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS
 
 # Enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
@@ -230,6 +232,37 @@ HOST_GCC_COMMON_CONF_OPTS += \
 endif
 
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
+ifeq ($(BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS),)
+ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
+HOST_GCC_COMMON_WRAPPER_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU))
+else
+HOST_GCC_COMMON_WRAPPER_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+endif
+HOST_GCC_COMMON_WRAPPER_TARGET_ARCH := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
+HOST_GCC_COMMON_WRAPPER_TARGET_ABI := $(call qstrip,$(BR2_GCC_TARGET_ABI))
+HOST_GCC_COMMON_WRAPPER_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
+HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+HOST_GCC_COMMON_WRAPPER_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
+
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_ARCH),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(HOST_GCC_COMMON_WRAPPER_TARGET_ARCH)"'
+endif
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_CPU),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(HOST_GCC_COMMON_WRAPPER_TARGET_CPU)"'
+endif
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_ABI),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(HOST_GCC_COMMON_WRAPPER_TARGET_ABI)"'
+endif
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FPU),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FPU)"'
+endif
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FLOATABI_),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FLOATABI_)"'
+endif
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_MODE),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(HOST_GCC_COMMON_WRAPPER_TARGET_MODE)"'
+endif
+endif # !BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS
 
 # For gcc-initial, we need to tell gcc that the C library will be
 # providing the ssp support, as it can't guess it since the C library
