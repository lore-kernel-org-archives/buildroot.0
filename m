From: kostap at marvell.com <kostap@marvell.com>
Date: Tue, 5 Feb 2019 09:40:29 +0200
Subject: [Buildroot] [PATCH 1/3] package/arm-gnu-rm-toolchain: new package
In-Reply-To: <20190205074031.7989-1-kostap@marvell.com>
References: <20190205074031.7989-1-kostap@marvell.com>
Message-ID: <20190205074031.7989-2-kostap@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Konstantin Porotchkin <kostap@marvell.com>

Add cross-compialtion ARM RM toolchain for supporting firmware
builds for Armv8-based SoCs utilizing Cortex-M/Cortex-R
service CPUs.
The cross-toolchain used for building Armv8 application CPU
code cannot be used for Cortex-M/Cortex-R 32-bit THUMB code
generation.
This patch installs pre-built bate metal ARM GNU-RM toolchain
into the host file system folder $(HOST_DIR)/opt/gcc-arm-none-eabi
for covering the above mentioned cases.

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 .../arm-gnu-rm-toolchain.hash                    |  2 ++
 .../arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
 create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk

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
index 0000000000..a72a172fce
--- /dev/null
+++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
@@ -0,0 +1,16 @@
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
+define HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/opt/gcc-arm-none-eabi/
+	cp -a $(@D)/* $(HOST_DIR)/opt/gcc-arm-none-eabi/
+endef
+
+$(eval $(host-generic-package))
-- 
2.17.1
