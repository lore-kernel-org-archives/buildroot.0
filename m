From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Tue, 19 Mar 2019 18:15:48 +0000
Subject: [Buildroot] [PATCH v4 3/5] boot/opensbi: Initial commit of OpenSBI
 for RISC-V
In-Reply-To: <20190319181449.25067-1-alistair.francis@wdc.com>
References: <20190319181449.25067-1-alistair.francis@wdc.com>
Message-ID: <20190319181449.25067-3-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenSBI is a much improved alternative to BBL (riscv-pk). Add OpenSBI
support to buildroot.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 DEVELOPERS              |  1 +
 boot/Config.in          |  1 +
 boot/opensbi/Config.in  | 25 +++++++++++++++++++++++++
 boot/opensbi/opensbi.mk | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 boot/opensbi/Config.in
 create mode 100644 boot/opensbi/opensbi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3e0ac08e11..91eda42949 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -122,6 +122,7 @@ F:	package/kvazaar/
 F:	package/v4l2loopback/
 
 N:	Alistair Francis <alistair@alistair23.me>
+F:	boot/opensbi/
 F:	package/xen/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
diff --git a/boot/Config.in b/boot/Config.in
index 74481e7545..97bd3de6e9 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -14,6 +14,7 @@ source "boot/lpc32xxcdl/Config.in"
 source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
+source "boot/opensbi/Config.in"
 source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
new file mode 100644
index 0000000000..5f3cc13312
--- /dev/null
+++ b/boot/opensbi/Config.in
@@ -0,0 +1,25 @@
+config BR2_TARGET_OPENSBI
+	bool "opensbi"
+	depends on BR2_riscv
+	help
+	  OpenSBI aims to provide an open-source and extensible
+	  implementation of the RISC-V SBI specification for a platform
+	  specific firmware (M-mode) and a general purpose OS,
+	  hypervisor or bootloader (S-mode or HS-mode). OpenSBI
+	  implementation can be easily extended by RISC-V platform or
+	  System-on-Chip vendors to fit a particular hadware
+	  configuration.
+
+	  https://github.com/riscv/opensbi.git
+
+if BR2_TARGET_OPENSBI
+config BR2_TARGET_OPENSBI_PLAT
+	string "OpenSBI Platform"
+	default ""
+	help
+	  Specifies the OpenSBI platform to build. If no platform is
+	  specified only the OpenSBI platform independent static
+	  library libsbi.a is built. If a platform is specified then
+	  the platform specific static library libplatsbi.a and firmware
+	  examples are built.
+endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
new file mode 100644
index 0000000000..13dffb9ce0
--- /dev/null
+++ b/boot/opensbi/opensbi.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# OpenSBI
+#
+################################################################################
+
+OPENSBI_VERSION = v0.3
+OPENSBI_SITE = $(call github,riscv,opensbi,$(OPENSBI_VERSION))
+OPENSBI_LICENSE = BSD-2-Clause
+OPENSBI_LICENSE_FILES = COPYING.BSD
+OPENSBI_INSTALL_IMAGES = YES
+
+OPENSBI_MAKE_ENV = \
+	CROSS_COMPILE=$(TARGET_CROSS)
+
+OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
+ifneq ($(OPENSBI_PLAT),)
+OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
+endif
+
+define OPENSBI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+ifneq ($(OPENSBI_PLAT),)
+define OPENSBI_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.21.0
