From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 May 2021 22:51:35 +0200
Subject: [Buildroot] [PATCH v3 4/7] package/riscv64-elf-toolchain: new
 package
In-Reply-To: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210504205139.1055360-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new package for a prebuilt bare-metal toolchain for
RISC-V 64-bit. Indeed, some bootloader/firmware for the BeagleV (and
potentially later for other platforms?) do not build with a
Linux-capable toolchain.

This uses a pre-built toolchain from SiFive, precompiled for x86-64,
so all packages using this toolchain must have the appropriate
BR2_HOSTARCH dependency.

This package is modeled after package/arm-gnu-a-toolchain/, which
package a pre-built ARM32 bare-metal toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 .../riscv64-elf-toolchain.mk                  | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 package/riscv64-elf-toolchain/riscv64-elf-toolchain.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cec63a3715..7ce78742fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2651,6 +2651,7 @@ F:	package/python3/
 F:	package/python-mad/
 F:	package/python-serial/
 F:	package/qextserialport/
+F:	package/riscv64-elf-toolchain/
 F:	package/rpcbind/
 F:	package/rt-tests/
 F:	package/rtc-tools/
diff --git a/package/riscv64-elf-toolchain/riscv64-elf-toolchain.mk b/package/riscv64-elf-toolchain/riscv64-elf-toolchain.mk
new file mode 100644
index 0000000000..9b08ee0fec
--- /dev/null
+++ b/package/riscv64-elf-toolchain/riscv64-elf-toolchain.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# riscv64-elf-toolchain
+#
+################################################################################
+
+RISCV64_ELF_TOOLCHAIN_VERSION = 2020.12.8
+RISCV64_ELF_TOOLCHAIN_SITE = https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12
+RISCV64_ELF_TOOLCHAIN_SOURCE = riscv64-unknown-elf-toolchain-10.2.0-$(RISCV64_ELF_TOOLCHAIN_VERSION)-x86_64-linux-centos6.tar.gz
+
+HOST_RISCV64_ELF_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/riscv64-elf
+
+define HOST_RISCV64_ELF_TOOLCHAIN_INSTALL_CMDS
+	rm -rf $(HOST_RISCV64_ELF_TOOLCHAIN_INSTALL_DIR)
+	mkdir -p $(HOST_RISCV64_ELF_TOOLCHAIN_INSTALL_DIR)
+	cp -rf $(@D)/* $(HOST_RISCV64_ELF_TOOLCHAIN_INSTALL_DIR)/
+
+	mkdir -p $(HOST_DIR)/bin
+	cd $(HOST_DIR)/bin && \
+	for i in ../opt/riscv64-elf/bin/*; do \
+		ln -sf $$i; \
+	done
+endef
+
+$(eval $(host-generic-package))
-- 
2.30.2
