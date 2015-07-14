From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 14 Jul 2015 17:14:13 +0200
Subject: [Buildroot] [PATCH v4 2/7] host-zynq-boot-bin: new package
In-Reply-To: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
Message-ID: <20150714171413.26a16828@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package provides a Python script that can create
the file BOOT.BIN to boot Xilinx Zynq based boards.

The script zynq-boot-bin.py is contained in the
Xilinx repository of U-Boot (it is not in upstream).

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/Config.in.host                   |  1 +
 package/zynq-boot-bin/Config.in.host     |  8 ++++++++
 package/zynq-boot-bin/zynq-boot-bin.hash |  2 ++
 package/zynq-boot-bin/zynq-boot-bin.mk   | 22 ++++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/zynq-boot-bin/Config.in.host
 create mode 100644 package/zynq-boot-bin/zynq-boot-bin.hash
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
diff --git a/package/zynq-boot-bin/zynq-boot-bin.hash b/package/zynq-boot-bin/zynq-boot-bin.hash
new file mode 100644
index 0000000..0bc23de
--- /dev/null
+++ b/package/zynq-boot-bin/zynq-boot-bin.hash
@@ -0,0 +1,2 @@
+# From https://raw.githubusercontent.com/Xilinx/u-boot-xlnx
+sha1	940331ee02b0007099effa61e382fe7ea4174054	zynq-boot-bin.py
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
new file mode 100644
index 0000000..3e9d63e
--- /dev/null
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# zynq-boot-bin
+#
+################################################################################
+
+ZYNQ_BOOT_BIN_VERSION = xilinx-v2015.1
+ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
+ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/$(ZYNQ_BOOT_BIN_VERSION)/tools
+ZYNQ_BOOT_BIN_LICENSE = GPLv3+
+
+HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
+
+define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
+	@cp $(DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
+endef
+
+define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
+	@cp $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/usr/bin/$(ZYNQ_BOOT_BIN_SOURCE)
+endef
+
+$(eval $(host-generic-package))
-- 
2.4.5




-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech                    Phone:  +420 606 201 868
   Brno, Czech Republic
