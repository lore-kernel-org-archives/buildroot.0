From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon,  7 Jan 2019 11:24:52 +0100
Subject: [Buildroot] [PATCH v3 1/7] boot/optee-os: new package
In-Reply-To: <1542996547-5003-1-git-send-email-etienne.carriere@linaro.org>
References: <1542996547-5003-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OP-TEE OS is maintained by the OP-TEE project. It provides an
open source solution for development and integration of secure
services for Armv7-A and Armv8-A CPU based platforms supporting
the TrustZone technology. This technology enables CPUs to
concurrently host a secure world as the OP-TEE OS and a non-secure
world as a Linux based OS.

The OP-TEE project maintains other packages to leverage OP-TEE on
Linux kernel based OSes. An OP-TEE interface driver is available
in the Linux kernel since 4.12 upon CONFIG_OPTEE.

This change references in Buildroot the today's latest OP-TEE
revision release tagged 3.3.0 with 2 patches:
- fix a issue in the OP-TEE OS Qemu platform regarding Qemu v2.12.1+.
- Introduce CFG_USER_TA_TARGETS to have Aarch64 building Aarch64 only.

https://www.op-tee.org/
https://github.com/OP-TEE/optee_os

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Chages v2-> v3
  - Add an entry in file DEVELOPERS.
  - Fix BR2_ARM_CPU_ARMV7 into BR2_ARM_CPU_ARMV7A and replace dependency
    on BR2_aarch64 with dep on BR2_ARM_CPU_ARMV8A which is more accurate.
  - Many cleaning in description sections of Config.in and layout
    reordering.
  - Reordering in optee-os.mk layout.
  - Correct dependency openssl into host-openssl.
  - Use OPTEE_OS_INSTALL_STAGING_CMDS for installs in the staging dir.
  - Clean in-tree TAs install command (s/@(foreach ...)/$(INSTALL) ...)
  - BR2_TARGET_OPTEE_OS_SERVICES selects BR2_TARGET_OPTEE_OS_CORE
    instead of depending on BR2_TARGET_OPTEE_OS_SDK. This because
    core build also builds the in-tree TAs.
  - Replace common optee-os.hash with per-version .hash files.
    Support the released 3.x tags from OP-TEE project.
  - Remove useless indirection in OPTEE_OS_INSTALL_STAGING_CMDS definition.
  - Fix issue of Aarch64 OS to attempt to build Aarch32 user mode support
    while the selected cross compilation toolchain cannot compile for
    Aarch32 targets. OP-TEE OS 3.3.0 is patched to backport support for
    CFG_USER_TA_TARGETS directive, allowing to restrict build to Aarch64.

Changes v1 -> v2:
  - Replace dependency on BR2_arm with BR2_ARM_CPU_ARMV7 as BR2_arm
    is enabled for non Armv7 targets.
  - Correct build dependencies on OpenSSL and pycrypto.
    Remove patch on package python scripts since pycrypto dependency
    is now handled.
  - Correct location of in-tree services TAs (s/ta_services/ta/).
    Remvoe OPTEE_OS_BUILD_SERVICES as service TAs are already built built when OP-TEE OS core is built.
    Correct BR2_TARGET_OPTEE_OS_SERVICES options: it only installs the
  - Fix bad reference in Config.in package description.
  - Fix wrong hash for the optee-os v3.3.0 tarball.
  - Fix bad use of OPTEE_OS_VERSION where it is the value content that
    is expected: $(OPTEE_OS_VERSION).
  - Clarify output build directory name: use out/.
  - Minor replace use if/endif with use of depends on in Config.mk.
  - Add missing dependency of BR2_TARGET_OPTEE_OS_SERVICES
    on BR2_TARGET_OPTEE_OS_SDK.
  - Change commit header comment to "boot/optee-os: new package".

---
 DEVELOPERS                                         |   3 +
 boot/Config.in                                     |   1 +
 ...1-qemu-increase-CFG_DTB_MAX_SIZE-to-1-MiB.patch |  41 +++++++++
 ...0002-workaround-multiple-ta-targets-issue.patch |  45 +++++++++
 boot/optee-os/3.3.0/optee-os.hash                  |   4 +
 boot/optee-os/Config.in                            | 101 +++++++++++++++++++++
 boot/optee-os/optee-os.mk                          |  97 ++++++++++++++++++++
 7 files changed, 292 insertions(+)
 create mode 100644 boot/optee-os/3.3.0/0001-qemu-increase-CFG_DTB_MAX_SIZE-to-1-MiB.patch
 create mode 100644 boot/optee-os/3.3.0/0002-workaround-multiple-ta-targets-issue.patch
 create mode 100644 boot/optee-os/3.3.0/optee-os.hash
 create mode 100644 boot/optee-os/Config.in
 create mode 100644 boot/optee-os/optee-os.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9654fcf..83c0ec8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -681,6 +681,9 @@ F:	package/mxsldr/
 N:	Ernesto L. Williams Jr <realcontrols@gmail.com>
 F:	package/szip/
 
+N:	Etienne Carriere <etienne.carriere@linaro.org>
+F:	boot/optee-os/
+
 N:	Eugene Tarassov <eugene@largest.net>
 F:	package/tcf-agent/
 
diff --git a/boot/Config.in b/boot/Config.in
index 8e0c8e5..cd14731 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -13,6 +13,7 @@ source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
+source "boot/optee-os/Config.in"
 source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
diff --git a/boot/optee-os/3.3.0/0001-qemu-increase-CFG_DTB_MAX_SIZE-to-1-MiB.patch b/boot/optee-os/3.3.0/0001-qemu-increase-CFG_DTB_MAX_SIZE-to-1-MiB.patch
new file mode 100644
index 0000000..a1def96
--- /dev/null
+++ b/boot/optee-os/3.3.0/0001-qemu-increase-CFG_DTB_MAX_SIZE-to-1-MiB.patch
@@ -0,0 +1,41 @@
+From 078b214af05c1a95f26e288d7b6547a8f7f369d0 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Thu, 18 Oct 2018 11:16:23 +0200
+Subject: [PATCH] qemu: increase CFG_DTB_MAX_SIZE to 1 MiB
+
+Since upstream QEMU commit 14ec3cbd7c1e ("device_tree: Increase
+FDT_MAX_SIZE to 1 MiB"), which is included in release v2.12.1 and later,
+OP-TEE initialization fails with the following error (-3 is
+-FDT_ERR_NOSPACE):
+
+ E/TC:0 0 init_fdt:808 Invalid Device Tree at 0x40000000: error -3
+
+Increase CFG_DTB_MAX_SIZE accordingly. Tested with the current tip of the
+QEMU master branch, in 32- and 64-bit modes (note that our 64-bit QEMU
+setup needs a TF-A patch -- PLAT_QEMU_DT_MAX_SIZE needs to be set to 1 MiB
+too).
+
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/plat-vexpress/conf.mk | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/core/arch/arm/plat-vexpress/conf.mk b/core/arch/arm/plat-vexpress/conf.mk
+index 91442801b1..7535c03834 100644
+--- a/core/arch/arm/plat-vexpress/conf.mk
++++ b/core/arch/arm/plat-vexpress/conf.mk
+@@ -90,6 +90,7 @@ endif
+ $(call force,CFG_BOOT_SECONDARY_REQUEST,y)
+ $(call force,CFG_PSCI_ARM32,y)
+ $(call force,CFG_DT,y)
++CFG_DTB_MAX_SIZE ?= 0x100000
+ # SE API is only supported by QEMU Virt platform
+ CFG_SE_API ?= y
+ CFG_SE_API_SELF_TEST ?= y
+@@ -108,4 +109,5 @@ CFG_SHMEM_SIZE  ?= 0x00200000
+ # When Secure Data Path is enable, last MByte of TZDRAM is SDP test memory.
+ CFG_TEE_SDP_MEM_SIZE ?= 0x00400000
+ $(call force,CFG_DT,y)
++CFG_DTB_MAX_SIZE ?= 0x100000
+ endif
diff --git a/boot/optee-os/3.3.0/0002-workaround-multiple-ta-targets-issue.patch b/boot/optee-os/3.3.0/0002-workaround-multiple-ta-targets-issue.patch
new file mode 100644
index 0000000..0cf0c80
--- /dev/null
+++ b/boot/optee-os/3.3.0/0002-workaround-multiple-ta-targets-issue.patch
@@ -0,0 +1,45 @@
+core: configure for a single user mode architecture
+
+This change introduces CFG_USER_TA_TARGETS to allow a configuration
+to select a unique user TA execution architecture even if the
+platform supports several (Aarch32/Aarch64).
+
+CFG_USER_TA_TARGETS shall be set to either ta_arm32 or ta_arm64.
+
+This feature can be used in build environments that do not support
+several cross compilation toolchains when building a single target.
+Buildroot (at least up to 2018.11) is such of an environment.
+The environment will likely use an Aarch64 toolchain for the
+TEE/REE which toolchain may not be able to compile Aarch32 targets
+and build to fail with a error message like:
+
+    CC      out/ta_arm32-lib/libmbedtls/mbedtls/library/aes.o
+  aarch64-linux-gnu-gcc: error: unrecognized command line option '-mthumb'
+
+This changes is a less invasive yet less safe change in OP-TEE
+OS to support CFG_USER_TA_TARGETS. A better implementation for
+this configuration directive was merged as [1] from [2] before
+3.4.0 tag. One should prefer the official integration [1] rahter
+than this change but the later is likely to apply on older
+versions of OP-TEE one may need to use.
+
+[1] optee_os.git commit dc701d99e0d0 ("Introduce CFG_USER_TA_TARGETS to select user mode architecture(s)"
+[2] https://github.com/OP-TEE/optee_os/pull/2703
+
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -69,6 +69,10 @@ cmd-echo-silent := true
+ endif
+ endif
+ 
++# Non-invasive hack for well formed CFG_USER_TA_TARGETS to define ta-targets
++ifneq ($(strip $(CFG_USER_TA_TARGETS)),)
++override ta-targets := $(CFG_USER_TA_TARGETS)
++endif
+ 
+ include core/core.mk
+ 
+
diff --git a/boot/optee-os/3.3.0/optee-os.hash b/boot/optee-os/3.3.0/optee-os.hash
new file mode 100644
index 0000000..02828a3
--- /dev/null
+++ b/boot/optee-os/3.3.0/optee-os.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_os/archive/3.3.0.tar.gz
+sha256 7b62e9fe650e197473eb2f4dc35c09d1e6395eb48dc1c16cc139d401b359ac6f  optee-os-3.3.0.tar.gz
+# Locally computed
+sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
new file mode 100644
index 0000000..a8a2982
--- /dev/null
+++ b/boot/optee-os/Config.in
@@ -0,0 +1,101 @@
+config BR2_TARGET_OPTEE_OS
+	bool "optee_os"
+	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A
+	help
+	  OP-TEE OS provides the secure world boot image and the trust
+	  application development kit of the OP-TEE project. OP-TEE OS
+	  also provides generic trusted application one can embedded
+	  into its system.
+
+	  http://github.com/OP-TEE/optee_os
+
+if BR2_TARGET_OPTEE_OS
+
+choice
+	prompt "OP-TEE OS version"
+	default BR2_TARGET_OPTEE_OS_LATEST
+	help
+	  Select the version of OP-TEE OS you want to use
+
+config BR2_TARGET_OPTEE_OS_LATEST
+	bool "3.3.0"
+	help
+	  This fetches the registered release tag from the
+	  OP-TEE OS official Git repository.
+
+config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+
+config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL
+	string "URL of custom repository"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+	help
+	  Specific location of the reference source tree Git
+	  repository.
+
+config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+	help
+	  Reference in the target git repository to sync with.
+
+endif
+
+config BR2_TARGET_OPTEE_OS_VERSION
+	string
+	default "3.3.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
+				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+
+config BR2_TARGET_OPTEE_OS_CORE
+	bool "Build core"
+	default y
+	help
+	  This option will build and install the OP-TEE core
+	  boot images.
+
+config BR2_TARGET_OPTEE_OS_SDK
+	bool "Build TA devkit"
+	default y
+	help
+	  This option will build and install the OP-TEE development
+	  kit for building OP-TEE trusted application images. It is
+	  installed in the staging directory /lib/optee.
+
+config BR2_TARGET_OPTEE_OS_SERVICES
+	bool "Build service TAs"
+	select BR2_TARGET_OPTEE_OS_CORE
+	default y
+	help
+	  This option installs the service trusted applications built
+	  from OP-TEE OS source tree. These are installed in the target
+	  /lib/optee_armtz directory as other trusted applications.
+	  At runtime OP-TEE OS can load trusted applications from this
+	  non-secure filesystem/directory into the secure world for
+	  execution.
+
+config BR2_TARGET_OPTEE_OS_PLATFORM
+	string "Mandatory target PLATFORM"
+	help
+	  Value for the mandated PLATFORM build directive provided to
+	  OP-TEE OS.
+
+config BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR
+	string "Optional target PLATFORM_FLAVOR"
+	help
+	  Value for the optional PLATFORM_FLAVOR build directive
+	  provided to OP-TEE OS.
+
+config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
+	string "Additional OP-TEE OS build variables"
+	help
+	  Additional parameters for the OP-TEE OS build
+	  E.g. 'CFG_TEE_CORE_LOG_LEVEL=3 CFG_UNWIND=y'
+
+endif # BR2_TARGET_OPTEE_OS
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
new file mode 100644
index 0000000..d10249e
--- /dev/null
+++ b/boot/optee-os/optee-os.mk
@@ -0,0 +1,97 @@
+################################################################################
+#
+# optee-os
+#
+################################################################################
+
+OPTEE_OS_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_VERSION))
+OPTEE_OS_LICENSE = BSD-2-Clause
+OPTEE_OS_LICENSE_FILES = LICENSE
+
+OPTEE_OS_INSTALL_STAGING = YES
+OPTEE_OS_INSTALL_IMAGES = YES
+
+ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
+OPTEE_OS_SITE = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL))
+OPTEE_OS_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
+else
+OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
+endif
+
+OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycrypto
+
+# On 64bit targets, OP-TEE OS can be built in 32bit mode, or
+# can be built in 64bit mode and support 32bit and 64bit
+# trusted applications. Since buildroot currently references
+# a single cross compiler, build exclusively in 32bit
+# or 64bit mode.
+OPTEE_OS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
+		     CROSS_COMPILE_core="$(TARGET_CROSS)" \
+		     CROSS_COMPILE_ta_arm64="$(TARGET_CROSS)" \
+		     CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)"
+
+ifeq ($(BR2_aarch64),y)
+OPTEE_OS_MAKE_OPTS += CFG_ARM64_core=y \
+		      CFG_USER_TA_TARGETS=ta_arm64
+endif
+
+# Get mandatory PLAFORM and optional PLATFORM_FLAVOR and additional variables
+OPTEE_OS_MAKE_OPTS += PLATFORM=$(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM))
+ifneq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR)),)
+OPTEE_OS_MAKE_OPTS += PLATFORM_FLAVOR=$(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR))
+endif
+OPTEE_OS_MAKE_OPTS += $(call qstrip,$(BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES))
+
+# Requests OP-TEE OS to build from subdirectory out/ of its sourcetree root path
+# otherwise the output directory path depends on the target platform name.
+OPTEE_OS_BUILDDIR_OUT = out
+ifeq ($(BR2_aarch64),y)
+OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm64
+endif
+ifeq ($(BR2_arm),y)
+OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm32
+endif
+
+ifeq ($(BR2_TARGET_OPTEE_OS_CORE),y)
+define OPTEE_OS_BUILD_CORE
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
+		$(TARGET_CONFIGURE_OPTS) $(OPTEE_OS_MAKE_OPTS) all
+endef
+define OPTEE_OS_INSTALL_IMAGES_CORE
+	mkdir -p $(BINARIES_DIR)
+	cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee.bin $(BINARIES_DIR)
+	cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee-*_v2.bin $(BINARIES_DIR)
+endef
+endif # BR2_TARGET_OPTEE_OS_CORE
+
+ifeq ($(BR2_TARGET_OPTEE_OS_SERVICES),y)
+define OPTEE_OS_INSTALL_IMAGES_SERVICES
+	mkdir -p $(TARGET_DIR)/lib/optee_armtz
+	$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
+				$(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta
+endef
+endif # BR2_TARGET_OPTEE_OS_SERVICES
+
+ifeq ($(BR2_TARGET_OPTEE_OS_SDK),y)
+define OPTEE_OS_BUILD_SDK
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
+		 $(TARGET_CONFIGURE_OPTS) $(OPTEE_OS_MAKE_OPTS) ta_dev_kit
+endef
+define OPTEE_OS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/lib/optee
+	cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK) $(STAGING_DIR)/lib/optee
+endef
+endif # BR2_TARGET_OPTEE_OS_SDK
+
+define OPTEE_OS_BUILD_CMDS
+	$(OPTEE_OS_BUILD_CORE)
+	$(OPTEE_OS_BUILD_SDK)
+endef
+
+define OPTEE_OS_INSTALL_IMAGES_CMDS
+	$(OPTEE_OS_INSTALL_IMAGES_CORE)
+	$(OPTEE_OS_INSTALL_IMAGES_SERVICES)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
