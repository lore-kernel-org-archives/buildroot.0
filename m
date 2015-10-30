From: Jan Viktorin <viktorin@rehivetech.com>
Date: Fri, 30 Oct 2015 12:05:56 +0100
Subject: [Buildroot] [RFC PATCH] dpdk: new package
Message-ID: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces support of the DPDK library (www.dpdk.org) into
Buildroot. It compiles and installs DPDK libraries on the target and
staging and allows to compiler other applications depending on the DPDK
library. It can also install some basic tools the DPDK provides
(testpmd, python scripts, test suite).

The patch assumes DPDK 2.2 which is not out at the moment (scheduled
to the end of November). However, this version will contain support for
the ARM architecture that is currently being reviewed.

Testing of DPDK on ARM is possible by cloning

 https://github.com/RehiveTech/dpdk arm-support-v5

as the package allows customization of the download process.

The ARM ports can be tested by

 qemu_aarch64_virt_defconfig
 qemu_arm_vexpress_defconfig

I did not test, how it works with x86 as I do not use Buildroot
for this.

The included hashes are calculated locally by downloading the tar.gz
archives by hand.

There are unfortunately some pitfalls:

* it may require to enable PCI, MSIX, UIO in the Linux Kernel
  (some defconfigs does not include as default and it is platform
  dependent as ARMv7 almost does not use PCI)

* when building PCAP PMD driver, the libpcap is required (however,
  this dependency is difficult to express in Buildroot as this depends
  on the DPDK configuration file - similar to the issue above)

* some tools the DPDK provides depend on Python(2) so the user has
  to enable it to install those

I assume, the user knows what he is doing in those cases and configures
the Buildroot in the right way. Or any ideas? Yann?

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/Config.in      |   1 +
 package/dpdk/Config.in | 159 +++++++++++++++++++++++++++++++++++++++++++++++++
 package/dpdk/dpdk.hash |   6 ++
 package/dpdk/dpdk.mk   | 119 ++++++++++++++++++++++++++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..7ff7cc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -988,6 +988,7 @@ menu "Networking"
 	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
+	source "package/dpdk/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
new file mode 100644
index 0000000..5353708
--- /dev/null
+++ b/package/dpdk/Config.in
@@ -0,0 +1,159 @@
+config BR2_PACKAGE_DPDK
+       bool "dpdk"
+       depends on BR2_x86_i686 || BR2_x86_64 || BR2_powerpc_power8 || BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_aarch64_be
+       depends on BR2_TOOLCHAIN_USES_GLIBC
+       help
+         DPDK is a set of libraries and drivers for fast packet processing. It was designed to run on
+         any processors knowing Intel x86 has been the first CPU to be supported. Ports for other CPUs
+         like IBM Power 8 and ARM are under progress. It runs mostly in Linux userland. A FreeBSD port
+         is now available for a subset of DPDK features.
+
+	 To build the included Linux Kernel drivers, it is necessary to enable CONFIG_PCI_MSI,
+	 CONFIG_UIO.
+
+         http://www.dpdk.org/
+
+if BR2_PACKAGE_DPDK
+
+choice
+	prompt "DPDK version"
+
+config BR2_PACKAGE_DPDK_VERSION_LATEST
+	bool "2.2.0"
+
+config BR2_PACKAGE_DPDK_VERSION_CUSTOM
+	bool "Custom"
+
+config BR2_PACKAGE_DPDK_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_PACKAGE_DPDK_CUSTOM_GIT
+	bool "Custom Git repository"
+
+config BR2_PACKAGE_DPDK_CUSTOM_LOCAL
+	bool "Local directory"
+
+endchoice
+
+config BR2_PACKAGE_DPDK_VERSION_CUSTOM_VALUE
+	string "DPDK version"
+	depends on BR2_PACKAGE_DPDK_VERSION_CUSTOM
+
+config BR2_PACKAGE_DPDK_CUSTOM_TARBALL_LOCATION
+	string "URL of custom DPDK tarball"
+	depends on BR2_PACKAGE_DPDK_CUSTOM_TARBALL
+
+config BR2_PACKAGE_DPDK_CUSTOM_REPO_URL
+	string "URL of custom repository"
+	depends on BR2_PACKAGE_DPDK_CUSTOM_GIT
+
+config BR2_PACKAGE_DPDK_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	depends on BR2_PACKAGE_DPDK_CUSTOM_GIT
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, branch, ..
+
+config BR2_PACKAGE_DPDK_CUSTOM_LOCAL_PATH
+	string "Path to the local directory"
+	depends on BR2_PACKAGE_DPDK_CUSTOM_LOCAL
+
+config BR2_PACKAGE_DPDK_VERSION
+	string
+	default "2.1.0" if BR2_PACKAGE_DPDK_VERSION_LATEST
+	default BR2_PACKAGE_DPDK_VERSION_CUSTOM_VALUE \
+		if BR2_PACKAGE_DPDK_VERSION_CUSTOM
+	default "custom" if BR2_PACKAGE_DPDK_CUSTOM_TARBALL
+	default BR2_PACKAGE_DPDK_CUSTOM_REPO_VERSION \
+		if BR2_PACKAGE_DPDK_CUSTOM_GIT
+	default "custom" if BR2_PACKAGE_DPDK_CUSTOM_LOCAL
+
+config BR2_PACKAGE_DPDK_PATCH
+	string "Custom DPDK patches"
+	depends on !BR2_PACKAGE_DPDK_CUSTOM_LOCAL
+	help
+	  A space-separated list of patches to apply to the
+	  kernel. Each patch can be described as an URL, a local file
+	  path, or a directory. In the case of a directory, all files
+	  matching *.patch in the directory will be applied.
+
+choice
+       prompt "DPDK configuration"
+
+config BR2_PACKAGE_DPDK_x86_i686_gcc
+       bool "i686-native-linuxapp-gcc"
+       depends on BR2_x86_i686
+
+config BR2_PACKAGE_DPDK_x86_64_gcc
+       bool "x86_64-native-linuxapp-gcc"
+       depends on BR2_x86_64
+
+config BR2_PACKAGE_DPDK_PPC8_gcc
+       bool "ppc_64-power8-native-linuxapp-gcc"
+       depends on BR2_powerpc_power8
+
+config BR2_PACKAGE_DPDK_ARMv7_gcc
+       bool "arm-armv7a-linuxapp-gcc"
+       depends on BR2_ARM_CPU_ARMV7A
+
+config BR2_PACKAGE_DPDK_ARMv8_gcc
+       bool "arm64-armv8a-linuxapp-gcc"
+       depends on BR2_aarch64 || BR2_aarch64_be
+
+config BR2_PACKAGE_DPDK_CONFIG_CUSTOM
+       bool "Custom"
+
+endchoice
+
+config BR2_PACKAGE_DPDK_CONFIG_CUSTOM_STRING
+       string "DPDK custom configuration"
+       depends on BR2_PACKAGE_DPDK_CONFIG_CUSTOM
+       help
+         See the config/ directory of DPDK for available configurations
+	 or patch it with your own one.
+
+config BR2_PACKAGE_DPDK_CONFIG
+	string
+	default BR2_PACKAGE_DPDK_CONFIG_CUSTOM_STRING \
+		if BR2_PACKAGE_DPDK_CONFIG_CUSTOM
+	default "i686-native-linuxapp-gcc" \
+		if BR2_PACKAGE_DPDK_x86_i686_gcc
+	default "x86_64-native-linuxapp-gcc" \
+		if BR2_PACKAGE_DPDK_x86_64_gcc
+	default "ppc_64-power8-native-linuxapp-gcc" \
+		if BR2_PACKAGE_DPDK_PPC8_gcc
+	default "arm-armv7a-linuxapp-gcc" \
+		if BR2_PACKAGE_DPDK_ARMv7_gcc
+	default "arm64-armv8a-linuxapp-gcc" \
+		if BR2_PACKAGE_DPDK_ARMv8_gcc
+
+config BR2_PACKAGE_DPDK_TOOLS_INSTALL
+	bool "install tools"
+	help
+	  Install applications coming with the DPDK project.
+
+config BR2_PACKAGE_DPDK_TOOLS_PYSCRIPTS
+	bool "helper scripts"
+	depends on BR2_PACKAGE_DPDK_TOOLS_INSTALL
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  DPDK provides few Python scripts to determine configuration
+	  and status of the system and to configure drivers. These are:
+	  dpdk_nic_bind.py and cpu_layout.py. By enabling this option,
+	  the scripts are installed into the target system together with
+	  a Python 2 interpreter.
+
+config BR2_PACKAGE_DPDK_TOOLS_TESTPMD
+	bool "testpmd"
+	default y
+	depends on BR2_PACKAGE_DPDK_TOOLS_INSTALL
+	help
+	  Install application for general testing of DPDK and PMD drivers.
+
+config BR2_PACKAGE_DPDK_TOOLS_TEST
+	bool "tests suite"
+	depends on BR2_PACKAGE_DPDK_TOOLS_INSTALL
+	help
+	  Install all DPDK tests.
+
+endif
diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
new file mode 100644
index 0000000..a5c4dbd
--- /dev/null
+++ b/package/dpdk/dpdk.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+sha256	f7b322867a45f99afd9c8fbacdc56e1621676f9ca0f046656ec85eb6a99a3440  dpdk-2.1.0.tar.gz
+sha256  643789a3be5ba44dd84d6b248cdf5471b260f8736dada177dadf076aebfbff3f  dpdk-2.0.0.tar.gz
+sha256  9f5386830bd999355182e20408f3fc2cfa0802a4497fdded8d43202feede1939  dpdk-1.8.0.tar.gz
+sha256  9deeb7467c404883946735a1fbcf126b98216ae8f8862ea86bc0c15e3807a679  dpdk-1.7.1.tar.gz
+sha256  aafc290260b5002d248ab8f8c8ffa76454d4b1382aa3c82ae2700ecce481397a  dpdk-1.7.0.tar.gz
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
new file mode 100644
index 0000000..70ff4b8
--- /dev/null
+++ b/package/dpdk/dpdk.mk
@@ -0,0 +1,119 @@
+################################################################################
+#
+# dpdk
+#
+################################################################################
+
+DPDK_VERSION = $(call qstrip,$(BR2_PACKAGE_DPDK_VERSION))
+ifeq ($(BR2_PACKAGE_DPDK_CUSTOM_TARBALL),y)
+DPDK_TARBALL = $(call qstrip,$(BR2_PACKAGE_DPDK_CUSTOM_TARBALL_LOCATION))
+DPDK_SIZE = $(patsubst %/,%,$(dir $(DPDK_TARBALL)))
+DPDK_SOURCE = $(notdir $(DPDK_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(DPDK_SOURCE)
+else ifeq ($(BR2_PACKAGE_DPDK_CUSTOM_LOCAL),y)
+DPDK_SITE = $(call qstrip,$(BR2_PACKAGE_DPDK_CUSTOM_LOCAL_PATH))
+DPDK_SITE_METHOD = local
+else ifeq ($(BR2_PACKAGE_DPDK_CUSTOM_GIT),y)
+DPDK_SITE = $(call qstrip,$(BR2_PACKAGE_DPDK_CUSTOM_REPO_URL))
+DPDK_SITE_METHOD = git
+else
+DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
+DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.gz
+ifeq ($(BR2_PACKAGE_DPDK_VERSION_CUSTOM),y)
+BR_NO_CHECK_HASH_FOR += $(DPDK_SOURCE)
+endif
+endif
+
+DPDK_LICENSE = BSD
+DPDK_LICENSE_FILES = LICENSE.LGPL LICENSE.GPL
+DPDK_INSTALL_STAGING = YES
+
+DPDK_DEPENDENCIES += linux
+#DPDK_DEPENDENCIES += $(if $(BR2_PACKAGE_DPDK_PMD_PCAP),libpcap,)
+
+ifeq ($(BR2_SHARED_LIBS),y)
+define DPDK_ENABLE_SHARED_LIBS
+	@echo CONFIG_RTE_BUILD_COMBINE_LIBS=y >> $(@D)/build/.config
+	@echo CONFIG_RTE_BUILD_SHARED_LIB=y >> $(@D)/build/.config
+endef
+
+DPDK_POST_CONFIGURE_HOOKS += DPDK_ENABLE_SHARED_LIBS
+endif
+
+# We're building a kernel module without using the kernel-module infra,
+# so we need to tell we want module support in the kernel
+ifeq ($(BR2_PACKAGE_DPDK),y)
+LINUX_NEEDS_MODULES = y
+endif
+
+
+DPDK_CONFIG = $(call qstrip,$(BR2_PACKAGE_DPDK_CONFIG))
+
+define DPDK_CONFIGURE_CMDS
+	$(MAKE) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) config
+	@ln -sv build $(@D)/$(DPDK_CONFIG) # avoid calling install
+endef
+
+define DPDK_BUILD_CMDS
+	$(MAKE1) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) install
+endef
+
+ifeq ($(BR2_SHARED_LIBS),n)
+# Install static libs only (DPDK compiles either *.so or *.a)
+define DPDK_INSTALL_STAGING_LIBS
+	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 0644 -D $(@D)/build/lib/*.a $(STAGING_DIR)/usr/lib
+endef
+
+DPDK_INSTALL_TARGET_LIBS =
+else
+# Install shared libs only (DPDK compiles either *.so or *.a)
+define DPDK_INSTALL_STAGING_LIBS
+	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 0644 -D $(@D)/build/lib/*.so* $(STAGING_DIR)/usr/lib
+endef
+
+define DPDK_INSTALL_TARGET_LIBS
+	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 0644 -D $(@D)/build/lib/*.so* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DPDK_TOOLS_PYSCRIPTS),y)
+define DPDK_INSTALL_TARGET_PYSCRIPTS
+	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/tools/dpdk_nic_bind.py $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/tools/cpu_layout.py $(TARGET_DIR)/usr/bin
+endef
+
+DPDK_DEPENDENCIES += python
+endif
+
+ifeq ($(BR2_PACKAGE_DPDK_TOOLS_TESTPMD),y)
+define DPDK_INSTALL_TARGET_TESTPMD
+	$(INSTALL) -m 0755 -D -d $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/build/app/testpmd $(TARGET_DIR)/usr/bin
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DPDK_TOOLS_TEST),y)
+define DPDK_INSTALL_TARGET_TEST
+	$(INSTALL) -m 0755 -D -d $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/build/app/test $(TARGET_DIR)/usr/bin
+endef
+endif
+
+define DPDK_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/include
+	$(INSTALL) -m 0644 -D $(@D)/build/include/*.h $(STAGING_DIR)/usr/include
+	$(DPDK_INSTALL_STAGING_LIBS)
+endef
+
+define DPDK_INSTALL_TARGET_CMDS
+	$(DPDK_INSTALL_TARGET_LIBS)
+	$(DPDK_INSTALL_TARGET_PYSCRIPTS)
+	$(DPDK_INSTALL_TARGET_TESTPMD)
+	$(DPDK_INSTALL_TARGET_TEST)
+endef
+
+$(eval $(generic-package))
-- 
2.6.1
