From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 23 Nov 2018 19:09:07 +0100
Subject: [Buildroot] [PATCH v2 1/5] boot/optee-os: new package
In-Reply-To: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
References: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1542996547-5003-1-git-send-email-etienne.carriere@linaro.org>
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

https://www.op-tee.org/
https://github.com/OP-TEE/optee_os

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
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
 boot/Config.in              |   1 +
 boot/optee-os/Config.in     | 100 +++++++++++++++++++++++++++++++++++++++++++
 boot/optee-os/optee-os.hash |   4 ++
 boot/optee-os/optee-os.mk   | 101 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 boot/optee-os/Config.in
 create mode 100644 boot/optee-os/optee-os.hash
 create mode 100644 boot/optee-os/optee-os.mk

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
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
new file mode 100644
index 0000000..7a598c6
--- /dev/null
+++ b/boot/optee-os/Config.in
@@ -0,0 +1,100 @@
+config BR2_TARGET_OPTEE_OS
+	bool "optee_os"
+	depends on BR2_aarch64 || BR2_ARM_CPU_ARMV7A
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
+	bool "sync with latest registered release tag"
+	help
+	  This fetches the latest registered release tag from
+	  the OP-TEE OS official Git repository.
+
+config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+	bool "sync on custom OP-TEE OS Git repository"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+config BR2_TARGET_OPTEE_OS_VERSION
+	string
+	default "3.3.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
+				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+
+config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL
+	string "sourcetree-site"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+	help
+	  Specific location of the reference source tree Git
+	  repository.
+
+config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION
+	string "git reference to pull"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+	help
+	  Reference in the target git repository to sync with.
+
+# Building core, TA libraries/devkit and/or generic TA services
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
+          installed in the staging filetree in /lib/optee directory.
+
+config BR2_TARGET_OPTEE_OS_SERVICES
+	bool "Build service TAs"
+	depends on BR2_TARGET_OPTEE_OS_SDK
+	default y
+	help
+	  This option install the generic trusted applications built
+	  from OP-TEE OS source tree. These are installed in the target
+	  /lib/optee_armtz directory. At runtime OP-TEE OS can load
+	  trusted applications from a non secure filesystem into the
+	  secure world for execution.
+
+# Building TA libraries and/or core images require target platform info
+
+config BR2_TARGET_OPTEE_OS_PLATFORM
+	string "mandatory target PLATFORM"
+	help
+	  Value for the mandated PLATFORM build directive provided to
+	  OP-TEE OS.
+
+config BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR
+	string "optional target PLATFORM_FLAVOR"
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
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
new file mode 100644
index 0000000..02828a3
--- /dev/null
+++ b/boot/optee-os/optee-os.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_os/archive/3.3.0.tar.gz
+sha256 7b62e9fe650e197473eb2f4dc35c09d1e6395eb48dc1c16cc139d401b359ac6f  optee-os-3.3.0.tar.gz
+# Locally computed
+sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
new file mode 100644
index 0000000..14ad143
--- /dev/null
+++ b/boot/optee-os/optee-os.mk
@@ -0,0 +1,101 @@
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
+ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
+OPTEE_OS_SITE = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL))
+OPTEE_OS_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
+else
+OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
+endif
+
+OPTEE_OS_DEPENDENCIES = openssl host-python-pycrypto
+
+# On 64bit targets, OP-TEE OS can be built in 32bit mode, or
+# can be built in 64bit mode and support 32bit and 64bit
+# trusted applications. Since buildroot currently references
+# a single cross compiler, build exclusively in 32bit
+# or 64bit mode.
+OPTEE_OS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)"
+OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_core="$(TARGET_CROSS)"
+ifeq ($(BR2_aarch64),y)
+OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_ta_arm64="$(TARGET_CROSS)"
+endif
+ifeq ($(BR2_arm),y)
+OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)"
+endif
+
+# Get mandatory PLAFORM and optional PLATFORM_FLAVOR
+OPTEE_OS_MAKE_OPTS += PLATFORM=$(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM))
+ifneq ($(BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR),)
+OPTEE_OS_MAKE_OPTS += PLATFORM_FLAVOR=$(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR))
+endif
+OPTEE_OS_MAKE_OPTS += $(call qstrip,$(BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES))
+
+# Requests OP-TEE OS to build from subdirectory out/ of its synced sourcetree root path
+# otherwise the output directory path depends on the target platform name.
+OPTEE_OS_BUILDDIR_OUT = out
+
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
+define OPTEE_OS_INSTALL_CORE
+	mkdir -p $(BINARIES_DIR)
+	cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee.bin $(BINARIES_DIR)
+	cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee-*_v2.bin $(BINARIES_DIR)
+endef
+endif
+
+ifeq ($(BR2_TARGET_OPTEE_OS_SDK),y)
+define OPTEE_OS_BUILD_SDK
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
+		 $(TARGET_CONFIGURE_OPTS) $(OPTEE_OS_MAKE_OPTS) ta_dev_kit
+endef
+define OPTEE_OS_INSTALL_SDK
+	mkdir -p $(STAGING_DIR)/lib/optee
+	cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK) $(STAGING_DIR)/lib/optee
+endef
+endif
+
+ifeq ($(BR2_TARGET_OPTEE_OS_SERVICES),y)
+# Core build already generates the TA services binaries. Install them.
+define OPTEE_OS_INSTALL_SERVICES
+	mkdir -p $(TARGET_DIR)/lib/optee_armtz
+	$(foreach f,$(wildcard $(@D)/ta/*/$(OPTEE_OS_BUILDDIR_OUT)/*.ta), \
+		$(INSTALL) -v -p --mode=444 \
+			--target-directory=$(TARGET_DIR)/lib/optee_armtz \
+			 $f &&) true
+endef
+endif
+
+define OPTEE_OS_BUILD_CMDS
+	$(OPTEE_OS_BUILD_CORE)
+	$(OPTEE_OS_BUILD_SDK)
+endef
+
+define OPTEE_OS_INSTALL_IMAGES_CMDS
+	$(OPTEE_OS_INSTALL_CORE)
+	$(OPTEE_OS_INSTALL_SDK)
+	$(OPTEE_OS_INSTALL_SERVICES)
+endef
+
+OPTEE_OS_INSTALL_STAGING = YES
+OPTEE_OS_INSTALL_IMAGES = YES
+
+$(eval $(generic-package))
-- 
1.9.1
