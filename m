From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 22 Mar 2016 11:36:26 +0100
Subject: [Buildroot] [PATCH v3 3/3] dpdk: new package
In-Reply-To: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1458642986-32365-4-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces support of the DPDK library (www.dpdk.org) into
Buildroot. DPDK is a library for high-speed packet sending/receiving
while bypassing the Linux Kernel. It allows to reach a high throughput
for 10-100 Gbps networks on the x86 platform.

The package compiles and installs DPDK libraries on the target and
staging and allows to compile other applications depending on the DPDK
library. It can also install some basic tools the DPDK provides
(testpmd, python scripts, test suite).

The patch assumes DPDK 16.04-rc1. This version contains support for the ARM
architecture. The ARM ports can be tested by

 qemu_aarch64_virt_defconfig
 qemu_arm_vexpress_defconfig

The included hash was calculated locally by downloading the tar.gz archives by
hand.

There are unfortunately some pitfalls:

* it may require to enable PCI, MSIX, UIO in the Linux Kernel
  (some defconfigs does not include as default and it is platform
  dependent as ARMv7 almost does not use PCI)

* when building PCAP PMD driver, the libpcap is required (partially
  fixed as suggested by Arnout)

* some tools the DPDK provides depend on Python(2) so the user has
  to enable it to install those

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
v2: (mostly suggestions by Arnout)
* simplified Config.in - avoid version, source and config selection
* improved dependency on libpcap
* user python scripts are included if python package is enabled
* installing of tests includes autotest*.py scripts (we do not care
  about the python here, assuming the user will install it manually
  when testing)
* minor coding style fixes
* depends on python-pexpect package
* using version 2.2.0-rc3
v3
* bump to version 16.04-rc1
* utilizing the new install syntax of DPDK
* fixed line wrapping
* testpmd is now always installed (no option for this)
* fixed python dependencies (T. Petazzoni)
* supporting i686+ architectures (T. Petazzoni)
* dropped PPC support for now (T. Petazzoni)
* utilizing KCONFIG_ENABLE_OPT macro (T. Petazzoni)
* support for build & install of examples (ugly code)
* build with MAKE instead of MAKE1 seems OK now (T. Petazzoni)
* dropped COMBINE_LIBS (no more in DPDK) (T. Petazzoni)
* added HAS_SYNC_x
* few random fixes

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/Config.in      |   1 +
 package/dpdk/Config.in |  53 ++++++++++++++++++++++++
 package/dpdk/dpdk.hash |   2 +
 package/dpdk/dpdk.mk   | 109 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 165 insertions(+)
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

diff --git a/package/Config.in b/package/Config.in
index 6fc0466..ab38a76 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1095,6 +1095,7 @@ menu "Networking"
 	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
+	source "package/dpdk/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
new file mode 100644
index 0000000..a42271e
--- /dev/null
+++ b/package/dpdk/Config.in
@@ -0,0 +1,53 @@
+config BR2_PACKAGE_DPDK
+       bool "dpdk"
+       depends on (BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 \
+		      && !BR2_x86_i586 && !BR2_x86_x1000) \
+                  || BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_aarch64_be
+       depends on BR2_TOOLCHAIN_USES_GLIBC
+       depends on BR2_TOOLCHAIN_HAS_SYNC_1
+       depends on BR2_TOOLCHAIN_HAS_SYNC_2
+       depends on BR2_TOOLCHAIN_HAS_SYNC_4
+       depends on BR2_TOOLCHAIN_HAS_SYNC_8
+       help
+	 DPDK is a set of libraries and drivers for fast packet processing. It
+	 was designed to run on any processors, however, Intel x86 has been the
+	 first CPU to be supported. Ports for other CPUs like IBM Power 8 and
+	 ARM are under progress. It runs mostly in Linux userland. A FreeBSD
+	 port is now available for a subset of DPDK features.
+
+	 Notes:
+	 * To build the included Linux Kernel drivers, it is necessary to
+	   enable CONFIG_PCI_MSI, CONFIG_UIO.
+	 * To build the PCAP PMD properly, you need to enable the libpcap
+	   manually.
+	 * You may need to install the python2 interpreter if you want to use
+	   scripts dpdk_nic_bind.py and cpu_layout.py
+
+         http://www.dpdk.org/
+
+if BR2_PACKAGE_DPDK
+
+config BR2_PACKAGE_DPDK_CONFIG
+	string "Configuration"
+	default "i686-native-linuxapp-gcc" \
+		if BR2_x86_i686
+	default "x86_64-native-linuxapp-gcc" \
+		if BR2_x86_64
+	default "arm-armv7a-linuxapp-gcc" \
+		if BR2_ARM_CPU_ARMV7A
+	default "arm64-armv8a-linuxapp-gcc" \
+		if BR2_aarch64 || BR2_aarch64_be
+
+config BR2_PACKAGE_DPDK_TEST
+	bool "Install tests suite"
+	select BR2_PACKAGE_PYTHON_PEXPECT if BR2_PACKAGE_PYTHON
+	help
+	  Install all DPDK tests. If you want to run the tests by the included
+	  autotest.py script you need to enable python manually.
+
+config BR2_PACKAGE_DPDK_EXAMPLES
+	bool "Build & install examples"
+	help
+	  Build and install all examples selected by the current configuration.
+
+endif
diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
new file mode 100644
index 0000000..1c47f19
--- /dev/null
+++ b/package/dpdk/dpdk.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	18df4b6ac74a4383b65d7c79420b637d0c296636265388dbf4513d1ec5caa09f  dpdk-16.04-rc1.tar.gz
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
new file mode 100644
index 0000000..02860fd
--- /dev/null
+++ b/package/dpdk/dpdk.mk
@@ -0,0 +1,109 @@
+################################################################################
+#
+# dpdk
+#
+################################################################################
+
+DPDK_VERSION = 16.04-rc1
+DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
+DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.gz
+
+DPDK_LICENSE = BSD (core), GPLv2+ (Linux drivers)
+DPDK_LICENSE_FILES = GNUmakefile LICENSE.GPL
+DPDK_INSTALL_STAGING = YES
+
+DPDK_DEPENDENCIES += linux
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+DPDK_DEPENDENCIES += libpcap
+endif
+
+ifeq ($(BR2_SHARED_LIBS),y)
+define DPDK_ENABLE_SHARED_LIBS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RTE_BUILD_SHARED_LIB,\
+			$(@D)/build/.config)
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
+DPDK_CONFIG = $(call qstrip,$(BR2_PACKAGE_DPDK_CONFIG))
+
+ifeq ($(BR2_PACKAGE_DPDK_EXAMPLES),y)
+# Build of DPDK examples is not very straight-forward. It requires to have
+# the SDK and runtime installed on same place to reference it by RTE_SDK.
+# We place it locally in the build directory.
+define DPDK_BUILD_EXAMPLES
+	$(MAKE) -C $(@D) DESTDIR=$(@D)/examples-sdk \
+		CROSS=$(TARGET_CROSS) install-sdk install-runtime
+	$(MAKE) -C $(@D) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) \
+		RTE_SDK=$(@D)/examples-sdk/usr/local/share/dpdk \
+		T=$(DPDK_CONFIG) examples
+endef
+
+DPDK_EXAMPLES_PATH = $(@D)/examples-sdk/usr/local/share/dpdk/examples
+
+# Installation of examples is not supported in DPDK so we do it explicitly
+# here. As the binaries and libraries do not have a single or regular location
+# where to find them after build, we search for them by find.
+define DPDK_INSTALL_EXAMPLES
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/local/bin
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/local/lib
+	for f in `find $(DPDK_EXAMPLES_PATH) -executable -type f   \
+			-name '[a-z]*.so*' | grep '\/lib\/.*'`; do \
+		$(INSTALL) -m 0755 -D $$f                          \
+			$(TARGET_DIR)/usr/local/lib/`basename $$f`;\
+	done
+	for f in `find $(DPDK_EXAMPLES_PATH) -executable -type f   \
+			! -name '*.so*' | grep '\/app\/.*'`; do    \
+		$(INSTALL) -m 0755 -D $$f                          \
+			$(TARGET_DIR)/usr/local/bin/`basename $$f`;\
+	done
+endef
+
+# Build of the power example is broken (at least for 16.04).
+define DPDK_DISABLE_POWER
+	$(call KCONFIG_DISABLE_OPT,CONFIG_RTE_LIBRTE_POWER,\
+			$(@D)/build/.config)
+endef
+
+DPDK_POST_CONFIGURE_HOOKS += DPDK_DISABLE_POWER
+endif
+
+define DPDK_CONFIGURE_CMDS
+	$(MAKE) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) \
+			   CROSS=$(TARGET_CROSS) config
+endef
+
+define DPDK_BUILD_CMDS
+	$(MAKE) -C $(@D) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS)
+	$(DPDK_BUILD_EXAMPLES)
+endef
+
+define DPDK_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) prefix=/usr \
+		 CROSS=$(TARGET_CROSS) install-sdk
+endef
+
+ifeq ($(BR2_PACKAGE_DPDK_TEST),y)
+define DPDK_INSTALL_TARGET_TEST
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/dpdk
+	$(INSTALL) -m 0755 -D $(@D)/build/app/test $(TARGET_DIR)/usr/dpdk
+	$(INSTALL) -m 0755 -D $(@D)/app/test/*.py $(TARGET_DIR)/usr/dpdk
+endef
+endif
+
+define DPDK_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr \
+		CROSS=$(TARGET_CROSS) install-runtime
+	$(DPDK_INSTALL_TARGET_TEST)
+	$(DPDK_INSTALL_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
2.7.0
