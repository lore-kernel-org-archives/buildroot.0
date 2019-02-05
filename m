From: kostap at marvell.com <kostap@marvell.com>
Date: Tue, 5 Feb 2019 12:45:10 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/arm-gnu-rm-toolchain: new package
In-Reply-To: <20190205104512.23718-1-kostap@marvell.com>
References: <20190205104512.23718-1-kostap@marvell.com>
Message-ID: <20190205104512.23718-2-kostap@marvell.com>
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
 .../arm-gnu-rm-toolchain.hash                 |  3 ++
 .../arm-gnu-rm-toolchain.mk                   | 28 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
 create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk

diff --git a/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
new file mode 100644
index 0000000000..d8797d9c13
--- /dev/null
+++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
@@ -0,0 +1,3 @@
+# taken from the distribution site
+md5 299ebd3f1c2c90930d28ab82e5d8d6c0 gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
+md5 7f88d3f1d0285e73e116cc3428bc1e13 gcc-arm-none-eabi-7-2018-q2-update-src.tar.bz2
diff --git a/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
new file mode 100644
index 0000000000..4c77fbf50e
--- /dev/null
+++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
@@ -0,0 +1,28 @@
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
+ARM_GNU_RM_TOOLCHAIN_LICENSE = GPL-3.0+, GPL-2.0+, LGPL-2.1+, LGPL-2.0+, LGPL-3.0+
+ARM_GNU_RM_TOOLCHAIN_LICENSE_FILES = license.txt
+ARM_GNU_RM_TOOLCHAIN_ACTUAL_SOURCE_TARBALL = https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-src.tar.bz2
+
+HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
+
+define HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_CMDS
+	rm -rf $(HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR)
+	mkdir -p $(HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR)
+	mv $(@D)/* $(HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR)/
+
+	cd $(HOST_DIR)/bin; \
+	for i in $(HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR)/bin/*; do \
+		ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
+	done
+endef
+
+$(eval $(host-generic-package))
-- 
2.17.1
