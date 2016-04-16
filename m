From: Jan Viktorin <viktorin@rehivetech.com>
Date: Sat, 16 Apr 2016 19:08:10 +0200
Subject: [Buildroot] [PATCH v5] dpdk: new package
In-Reply-To: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
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

The patch assumes DPDK 16.04. This version contains support for the ARM
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
* dropped PPC support for now
* utilizing KCONFIG_ENABLE_OPT macro
* support for build & install of examples (ugly code)
* build with MAKE instead of MAKE1 seems OK now
* dropped COMBINE_LIBS (no more in DPDK)
* added HAS_SYNC_x
* few random fixes
v4 (suggestions by T. Petazzoni)
* bump to version 16.04-rc2
* fixed indentation in Config.in
* fixed depends in Config.in
* handling kernel modules by BR2_LINUX_NEEDS_MODULES
* simplified installation of examples
v5
* bump to version 16.04
* dropped (forgotten) LINUX_NEEDS_MODULES=y from mk
* reordered Config.in (T. Petazzoni)
* added forgotten BR2_x86_64 (T. Petazzoni)
* dropped support for examples (T. Petazzoni)
* fix install of kernel modules (T. Petazzoni)
* patch ARM ABI enforcing (T. Petazzoni)
* minor install fixes (T. Petazzoni)
---
 package/Config.in                                  |  1 +
 ...01-mk-do-not-enforce-any-specific-ARM-ABI.patch | 31 +++++++++++
 package/dpdk/Config.in                             | 60 ++++++++++++++++++++++
 package/dpdk/dpdk.hash                             |  2 +
 package/dpdk/dpdk.mk                               | 60 ++++++++++++++++++++++
 5 files changed, 154 insertions(+)
 create mode 100644 package/dpdk/0001-mk-do-not-enforce-any-specific-ARM-ABI.patch
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

diff --git a/package/Config.in b/package/Config.in
index bcfe13b..022d02f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1102,6 +1102,7 @@ menu "Networking"
 	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
+	source "package/dpdk/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/dpdk/0001-mk-do-not-enforce-any-specific-ARM-ABI.patch b/package/dpdk/0001-mk-do-not-enforce-any-specific-ARM-ABI.patch
new file mode 100644
index 0000000..9ac18a5
--- /dev/null
+++ b/package/dpdk/0001-mk-do-not-enforce-any-specific-ARM-ABI.patch
@@ -0,0 +1,31 @@
+From 524dc6e45487737f1465e7edade840613f083c8f Mon Sep 17 00:00:00 2001
+From: Jan Viktorin <viktorin@rehivetech.com>
+Date: Sat, 16 Apr 2016 00:11:18 +0200
+Subject: [PATCH] mk: do not enforce any specific ARM ABI
+
+The dpdk build system passes -mfloat-abi=softfp, which makes the build fail
+when the selected ABI is EABIhf. The dpdk build system should not make
+assumptions on the selected ARM ABI.
+
+Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
+Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ mk/machine/armv7a/rte.vars.mk | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/mk/machine/armv7a/rte.vars.mk b/mk/machine/armv7a/rte.vars.mk
+index abdb15e..36fa3de 100644
+--- a/mk/machine/armv7a/rte.vars.mk
++++ b/mk/machine/armv7a/rte.vars.mk
+@@ -54,8 +54,6 @@
+ # CPU_LDFLAGS =
+ # CPU_ASFLAGS =
+ 
+-CPU_CFLAGS += -mfloat-abi=softfp
+-
+ MACHINE_CFLAGS += -march=armv7-a
+ 
+ ifdef CONFIG_RTE_ARCH_ARM_TUNE
+-- 
+2.8.0
+
diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
new file mode 100644
index 0000000..27bf106
--- /dev/null
+++ b/package/dpdk/Config.in
@@ -0,0 +1,60 @@
+config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
+	bool
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 &&\
+		BR2_TOOLCHAIN_HAS_SYNC_2 &&\
+		BR2_TOOLCHAIN_HAS_SYNC_4 &&\
+		BR2_TOOLCHAIN_HAS_SYNC_8
+	default y if (BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 \
+			&& !BR2_x86_i586 && !BR2_x86_x1000)
+	default y if BR2_x86_64
+	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_aarch64 || BR2_aarch64_be
+
+comment "dpdk needs a glibc toolchain and a Linux Kernel to be built"
+	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_DPDK
+	bool "dpdk"
+	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_LINUX_KERNEL
+	select BR2_LINUX_NEEDS_MODULES
+	help
+	  DPDK is a set of libraries and drivers for fast packet processing. It
+	  was designed to run on any processors, however, Intel x86 has been
+	  the first CPU to be supported. Ports for other CPUs like IBM Power 8
+	  and ARM are under progress. It runs mostly in Linux userland. A
+	  FreeBSD port is now available for a subset of DPDK features.
+
+	  Notes:
+	  * To build the included Linux Kernel drivers, it is necessary to
+	    enable CONFIG_PCI_MSI, CONFIG_UIO.
+	  * To build the PCAP PMD properly, you need to enable the libpcap
+	    manually.
+	  * You may need to install the python2 interpreter if you want to use
+	    scripts dpdk_nic_bind.py and cpu_layout.py
+
+	  http://www.dpdk.org/
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
+endif
diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
new file mode 100644
index 0000000..3780c66
--- /dev/null
+++ b/package/dpdk/dpdk.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	d631495bc6e8d4c4aec72999ac03c3ce213bb996cb88f3bf14bb980dad1d3f7b  dpdk-16.04.tar.gz
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
new file mode 100644
index 0000000..ea53417
--- /dev/null
+++ b/package/dpdk/dpdk.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# dpdk
+#
+################################################################################
+
+DPDK_VERSION = 16.04
+DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
+
+DPDK_LICENSE = BSD-2c (core), GPLv2+ (Linux drivers)
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
+DPDK_CONFIG = $(call qstrip,$(BR2_PACKAGE_DPDK_CONFIG))
+
+define DPDK_CONFIGURE_CMDS
+	$(MAKE) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) \
+			   CROSS=$(TARGET_CROSS) config
+endef
+
+define DPDK_BUILD_CMDS
+	$(MAKE) -C $(@D) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS)
+endef
+
+define DPDK_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) prefix=/usr \
+		 CROSS=$(TARGET_CROSS) install-sdk
+endef
+
+ifeq ($(BR2_PACKAGE_DPDK_TEST),y)
+define DPDK_INSTALL_TARGET_TEST
+	mkdir -p $(TARGET_DIR)/usr/dpdk
+	$(INSTALL) -m 0755 -D $(@D)/build/app/test $(TARGET_DIR)/usr/dpdk/test
+	cp -dpfr $(@D)/app/test/*.py $(TARGET_DIR)/usr/dpdk
+endef
+endif
+
+define DPDK_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) CROSS=$(TARGET_CROSS) \
+		kerneldir=/lib/modules/$(LINUX_VERSION_PROBED)/extra/dpdk \
+		prefix=/usr install-runtime install-kmod
+	$(DPDK_INSTALL_TARGET_TEST)
+endef
+
+$(eval $(generic-package))
-- 
2.8.0
