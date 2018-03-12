From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Mar 2018 18:44:46 +0100
Subject: [Buildroot] [PATCH v2 3/6] zynqmp-pmufw-binaries: new package
In-Reply-To: <1520876689-2975-1-git-send-email-luca@lucaceresoli.net>
References: <1520876689-2975-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1520876689-2975-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Downloads pre-built binary firmwares for the Xilinx ZynqMP SoCs PMU.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v1 -> v2: none.
---
 DEVELOPERS                                         |  1 +
 boot/Config.in                                     |  1 +
 boot/zynqmp-pmufw-binaries/Config.in               | 19 ++++++++++++++++
 .../zynqmp-pmufw-binaries.hash                     |  3 +++
 .../zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk | 26 ++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 boot/zynqmp-pmufw-binaries/Config.in
 create mode 100644 boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.hash
 create mode 100644 boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3df820e71214..331a195c5e77 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1046,6 +1046,7 @@ F:	package/ti-sgx-um/
 
 N:	Luca Ceresoli <luca@lucaceresoli.net>
 F:	board/olimex/a20_olinuxino/
+F:	boot/zynqmp-pmufw-binaries/
 F:	configs/olimex_a20_olinuxino_*
 F:	package/agentpp/
 F:	package/exim/
diff --git a/boot/Config.in b/boot/Config.in
index 3687c41a2c00..a23886997c9f 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,5 +19,6 @@ source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/xloader/Config.in"
+source "boot/zynqmp-pmufw-binaries/Config.in"
 
 endmenu
diff --git a/boot/zynqmp-pmufw-binaries/Config.in b/boot/zynqmp-pmufw-binaries/Config.in
new file mode 100644
index 000000000000..e39561cbf91e
--- /dev/null
+++ b/boot/zynqmp-pmufw-binaries/Config.in
@@ -0,0 +1,19 @@
+config BR2_TARGET_ZYNQMP_PMUFW_BINARIES
+	bool "Zynqmp PMU firmware"
+	depends on BR2_aarch64
+	help
+	  This package provides precompiled firmwares for the Platform
+	  Management Unit (PMU) of the Xilinx ZynqMP family of SoCs.
+
+	  https://github.com/lucaceresoli/zynqmp-pmufw-binaries
+
+if BR2_TARGET_ZYNQMP_PMUFW_BINARIES
+
+config BR2_TARGET_ZYNQMP_PMUFW_BINARIES_IMAGE
+	string "PMU firmware image file"
+	help
+	  Enter the path to the PMU firmware file for your board and
+	  configuration, relative to the repository top directory.
+	  Example: "zcu106-default/pmufw.bin".
+
+endif
diff --git a/boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.hash b/boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.hash
new file mode 100644
index 000000000000..a60566445290
--- /dev/null
+++ b/boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  b74808c93522a39bedecd64bd5a75fd766f267e1d540f45dbfe868694f49b1d7  zynqmp-pmufw-binaries-ec64e06b836a0841f40bd52434f6919c5dafb133.tar.gz
+sha256  235b467980655706d5fded5baf3d8b52ddb102a9e0c26804a67c0ec719042d38  license.txt
diff --git a/boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk b/boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk
new file mode 100644
index 000000000000..91aec04f907a
--- /dev/null
+++ b/boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# zynqmp-pmufw-binaries
+#
+################################################################################
+
+ZYNQMP_PMUFW_BINARIES_VERSION = ec64e06b836a0841f40bd52434f6919c5dafb133
+ZYNQMP_PMUFW_BINARIES_SITE = $(call github,lucaceresoli,zynqmp-pmufw-binaries,$(ZYNQMP_PMUFW_BINARIES_VERSION))
+
+ZYNQMP_PMUFW_BINARIES_LICENSE = X11 with Xilinx exception
+ZYNQMP_PMUFW_BINARIES_LICENSE_FILES = license.txt
+
+ZYNQMP_PMUFW_BINARIES_IMAGE = $(call qstrip,$(BR2_TARGET_ZYNQMP_PMUFW_BINARIES_IMAGE))
+ZYNQMP_PMUFW_BINARIES_INSTALL_IMAGES = YES
+
+define ZYNQMP_PMUFW_BINARIES_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/$(ZYNQMP_PMUFW_BINARIES_IMAGE) $(BINARIES_DIR)/pmufw.bin
+endef
+
+ifeq ($(ZYNQMP_PMUFW_BINARIES),y)
+ifeq ($(ZYNQMP_PMUFW_BINARIES_IMAGE),)
+$(error No PMU firmware image file name set. Check your BR2_TARGET_ZYNQMP_PMUFW_BINARIES_IMAGE setting)
+endif
+endif
+
+$(eval $(generic-package))
-- 
2.7.4
