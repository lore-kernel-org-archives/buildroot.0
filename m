From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed,  9 Dec 2015 15:11:53 +0100
Subject: [Buildroot] [PATCH v2 3/3] dpdk: new package
In-Reply-To: <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1449670313-3613-4-git-send-email-viktorin@rehivetech.com>
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
staging and allows to compiler other applications depending on the DPDK
library. It can also install some basic tools the DPDK provides
(testpmd, python scripts, test suite). The patch assumes DPDK 2.2.0 (rc3)
which introduces the ARM architecture support.

The included hashes are calculated locally by downloading the tar.gz
archives by hand.

The DPDK project is licensed under BSD license (see http://dpdk.org/),
however, there is no license file in the root of the project. Moreover,
there are parts (Linux Kernel modules) which are GPLv2. So the license
specification might look strange.

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
---
 package/Config.in      |   1 +
 package/dpdk/Config.in |  47 +++++++++++++++++++++
 package/dpdk/dpdk.hash |   4 ++
 package/dpdk/dpdk.mk   | 112 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

diff --git a/package/Config.in b/package/Config.in
index 77a92d2..fd07d5d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -999,6 +999,7 @@ menu "Networking"
 	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
+	source "package/dpdk/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
new file mode 100644
index 0000000..a4935ae
--- /dev/null
+++ b/package/dpdk/Config.in
@@ -0,0 +1,47 @@
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
+	 Notes:
+	 * To build the included Linux Kernel drivers, it is necessary to enable CONFIG_PCI_MSI,
+	   CONFIG_UIO.
+	 * To build the PCAP PMD properly, you need to enable the libpcap manually.
+	 * To install the python scripts (dpdk_nic_bind.py, cpu_layout.py), enable
+	   the python2 interpreter for the target.
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
+	default "ppc_64-power8-native-linuxapp-gcc" \
+		if BR2_powerpc_power8
+	default "arm-armv7a-linuxapp-gcc" \
+		if BR2_ARM_CPU_ARMV7A
+	default "arm64-armv8a-linuxapp-gcc" \
+		if BR2_aarch64 || BR2_aarch64_be
+
+config BR2_PACKAGE_DPDK_TOOLS_TESTPMD
+	bool "Install testpmd"
+	default y
+	help
+	  Install application for general testing of DPDK and PMD drivers.
+
+config BR2_PACKAGE_DPDK_TOOLS_TEST
+	bool "Install tests suite"
+	help
+	  Install all DPDK tests. If you want to run the tests by the included
+	  autotest.py script you need to enable python manually.
+
+endif
diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
new file mode 100644
index 0000000..c78ec85
--- /dev/null
+++ b/package/dpdk/dpdk.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256	f7b322867a45f99afd9c8fbacdc56e1621676f9ca0f046656ec85eb6a99a3440  dpdk-2.1.0.tar.gz
+sha256	530074d4eaefe1f717e7411e6a74e4ba0fa619af304c5e74e1097e51d33cc19e  dpdk-2.2.0-rc2.tar.gz
+sha256	7caf52554c0f724a09e9342ee6670b324a77dade5cd0b96ff5b66957ed1bc1f9  dpdk-2.2.0-rc3.tar.gz
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
new file mode 100644
index 0000000..2d8a5a3
--- /dev/null
+++ b/package/dpdk/dpdk.mk
@@ -0,0 +1,112 @@
+################################################################################
+#
+# dpdk
+#
+################################################################################
+
+DPDK_VERSION = 2.2.0-rc3
+DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
+DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.gz
+
+DPDK_LICENSE = BSD
+DPDK_LICENSE_FILES = LICENSE.LGPL LICENSE.GPL
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
+# We create symlink named $(DPDK_CONFIG) to the build directory
+# to avoid calling install which behaves strange in DPDK build system.
+define DPDK_CONFIGURE_CMDS
+	$(MAKE) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) config
+	@ln -sv build $(@D)/$(DPDK_CONFIG)
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
+ifeq ($(BR2_PACKAGE_PYTHON),y)
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
+	$(INSTALL) -m 0755 -D -d $(TARGET_DIR)/usr/dpdk
+	$(INSTALL) -m 0755 -D $(@D)/build/app/test $(TARGET_DIR)/usr/dpdk
+	$(INSTALL) -m 0755 -D $(@D)/app/test/*.py $(TARGET_DIR)/usr/dpdk
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+DPDK_DEPENDENCIES += python-pexpect
+endif
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
2.6.3
