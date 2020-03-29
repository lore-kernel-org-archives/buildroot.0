From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:08:23 +0200
Subject: [Buildroot] [git commit] package/arm-gnu-a-toolchain: new package
Message-ID: <20200329125648.E6AD58894D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9959b647f2afd09e564bddfc3d21476f9a0f669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of AArch64 platforms need to build some bits of ARM32 code,
for example in TF-A (ARM Trusted Firmware) or other
firmware/bootloader.

This package allows to get a pre-built cross-compilation toolchain to
build bare-metal ARM32 code.

https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
[Thomas:
 - drop empty LICENSE_FILES
 - use VERSION variable in SITE variable
 - simplify symlink creation
 - drop visible Config.in.host option]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 .../arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash   |  2 ++
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk | 26 ++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a43ca420d..2378264e7d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2389,6 +2389,9 @@ N:	Steven Noonan <steven@uplinklabs.net>
 F:	package/hwloc/
 F:	package/powertop/
 
+N:	Suniel Mahesh <sunil@amarulasolutions.com>
+F:	package/arm-gnu-a-toolchain/
+
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
 F:	package/lcdproc/
 F:	package/python-influxdb/
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
new file mode 100644
index 0000000000..b18e56c151
--- /dev/null
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ac952d89ae0fc3543e81099e7d34917efc621f5def112eee843fd1ce755eca8c  gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
new file mode 100644
index 0000000000..d7088892ca
--- /dev/null
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# arm-gnu-a-toolchain
+#
+################################################################################
+
+ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
+ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/$(ARM_GNU_A_TOOLCHAIN_VERSION)/binrel
+ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
+ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
+
+HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
+
+define HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_CMDS
+	rm -rf $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
+	mkdir -p $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
+	cp -rf $(@D)/* $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)/
+
+	mkdir -p $(HOST_DIR)/bin
+	cd $(HOST_DIR)/bin && \
+	for i in ../opt/gcc-arm-none-eabi/bin/*; do \
+		ln -sf $$i; \
+	done
+endef
+
+$(eval $(host-generic-package))
