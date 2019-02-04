From: kostap at marvell.com <kostap@marvell.com>
Date: Mon, 4 Feb 2019 16:31:35 +0200
Subject: [Buildroot] [PATCH 1/3] package: arm-gnu-rm-toolchain: Add ARM-RM
 toolchain
In-Reply-To: <20190204143137.32224-1-kostap@marvell.com>
References: <20190204143137.32224-1-kostap@marvell.com>
Message-ID: <20190204143137.32224-2-kostap@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Konstantin Porotchkin <kostap@marvell.com>

Add host-only ARM RM toolchain for supporting firmware
builds for Armv8-based SoCs utilizing Cortex-M/Cortex-R
service CPUs.
The cross-toolchain used for building Armv8 application CPU
code cannot be used for Cortex-M/Cortex-R 32-bit THUMB code
generation.
This patch installs pre-build bate metal ARM GNU-RM toolchain
into the host file system folder /opt/gcc-arm for covering the
above mentioned cases.

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 package/Config.in.host                        |  1 +
 package/arm-gnu-rm-toolchain/Config.in.host   | 13 +++++++++++
 .../arm-gnu-rm-toolchain.hash                 |  2 ++
 .../arm-gnu-rm-toolchain.mk                   | 22 +++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/arm-gnu-rm-toolchain/Config.in.host
 create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
 create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474fc9d..41dfd76785 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -67,5 +67,6 @@ menu "Host utilities"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 	source "package/zstd/Config.in.host"
+	source "package/arm-gnu-rm-toolchain/Config.in.host"
 
 endmenu
diff --git a/package/arm-gnu-rm-toolchain/Config.in.host b/package/arm-gnu-rm-toolchain/Config.in.host
new file mode 100644
index 0000000000..3341760acd
--- /dev/null
+++ b/package/arm-gnu-rm-toolchain/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_ARM_GNU_RM_TOOLCHAIN
+	bool "host arm-gnu-rm-toolchain"
+	depends on BR2_HOSTARCH = "x86_64"
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	help
+	  The GNU Embedded Toolchain for Arm is an open-source pre-built
+	  suite of tools for C, C++ and Assembly programming targeting
+	  Arm Cortex-M and Cortex-R family of processors.
+	  It includes the GNU Compiler (GCC) and is available free of charge
+	  directly from Arm for embedded software development.
+
+
+	  https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads
\ No newline at end of file
diff --git a/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
new file mode 100644
index 0000000000..a08e8e6208
--- /dev/null
+++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69 gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
diff --git a/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
new file mode 100644
index 0000000000..be02130f28
--- /dev/null
+++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# arm-gnu-rm-toolchain
+#
+################################################################################
+
+ARM_GNU_RM_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2
+ARM_GNU_RM_TOOLCHAIN_VERSION = 7-2018-q2-update
+ARM_GNU_RM_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_RM_TOOLCHAIN_VERSION)-linux.tar.bz2
+
+define HOST_ARM_GNU_RM_TOOLCHAIN_EXTRACT_CMDS
+	$(TAR) xf $(HOST_ARM_GNU_RM_TOOLCHAIN_DL_DIR)/$(ARM_GNU_RM_TOOLCHAIN_SOURCE) -C $(BUILD_DIR)
+	mv $(BUILD_DIR)/gcc-arm-none-eabi-$(ARM_GNU_RM_TOOLCHAIN_VERSION)/* $(@D)
+	rmdir $(BUILD_DIR)/gcc-arm-none-eabi-$(ARM_GNU_RM_TOOLCHAIN_VERSION)/
+endef
+
+define HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/opt/gcc-arm/
+	cp -a $(@D)/* $(HOST_DIR)/opt/gcc-arm/
+endef
+
+$(eval $(host-generic-package))
-- 
2.17.1
