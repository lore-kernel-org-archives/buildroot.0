From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Tue, 23 Jun 2015 14:49:10 +0200
Subject: [Buildroot] [PATCH v3 1/2] host-zynq-boot-bin: new package
In-Reply-To: <1435063751-27344-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <1435063751-27344-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Viktorin <viktorin@rehivetech.com>

The package creates file images/boot.bin to boot
Xilinx Zynq based boards. It might not work with
U-Boot older then 2015.07.

The script zynq-boot-bin.py is contained in the
Xilinx repository of U-Boot (it is not in upstream).

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
Changes:
 * v0->v1: create this package instead of patching U-Boot by zynq-boot-bin.py
 * v1->v2: call zynq-boot-bin.py from the package
 * v2->v3: remove python deps, do not download U-Boot, just the script

 package/Config.in.host                 |  1 +
 package/zynq-boot-bin/Config.in.host   |  8 ++++++++
 package/zynq-boot-bin/zynq-boot-bin.mk | 24 ++++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/zynq-boot-bin/Config.in.host
 create mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 1e047aa..030c91f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -27,5 +27,6 @@ menu "Host utilities"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
+	source "package/zynq-boot-bin/Config.in.host"
 
 endmenu
diff --git a/package/zynq-boot-bin/Config.in.host b/package/zynq-boot-bin/Config.in.host
new file mode 100644
index 0000000..bc151a7
--- /dev/null
+++ b/package/zynq-boot-bin/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ZYNQ_BOOT_BIN
+	bool "host zynq-boot-bin"
+	depends on BR2_TARGET_UBOOT_SPL
+	help
+	  This is a simple Python script that creates BOOT.BIN file
+	  to boot Xilinx Zynq based on U-Boot's SPL.
+
+	  https://github.com/Xilinx/u-boot-xlnx
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
new file mode 100644
index 0000000..aff4593
--- /dev/null
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# zynq-boot-bin
+#
+################################################################################
+
+ZYNQ_BOOT_BIN_VERSION = xilinx-v2015.1
+ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
+ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/$(ZYNQ_BOOT_BIN_VERSION)/tools
+
+HOST_ZYNQ_BOOT_BIN_INSTALL_STAGING = NO
+HOST_ZYNQ_BOOT_BIN_INSTALL_IMAGES = YES
+HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = uboot
+
+define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
+	@cp $(DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
+endef
+
+define HOST_ZYNQ_BOOT_BIN_BUILD_CMDS
+	@env python2 $(@D)/zynq-boot-bin.py -o $(BINARIES_DIR)/boot.bin \
+		-u $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)))
+endef
+
+$(eval $(host-generic-package))
-- 
2.4.4
