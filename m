From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Fri, 19 Jun 2015 15:40:18 +0200
Subject: [Buildroot] [PATCH v1 1/2] host-zynq-boot-bin: new package
In-Reply-To: <20150618231816.513316f9@free-electrons.com>
References: <20150618231816.513316f9@free-electrons.com>
Message-ID: <1434721219-5824-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Viktorin <viktorin@rehivetech.com>

The purpose of this package is to provide a small
Python script zynq-boot-bin.py to Buildroot. The
script creates a BOOT.BIN file from U-Boot's SPL
to boot Xilinx Zynq without needing the Xilinx FSBL.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/Config.in.host                 |  1 +
 package/zynq-boot-bin/Config.in.host   |  7 +++++++
 package/zynq-boot-bin/zynq-boot-bin.mk | 16 ++++++++++++++++
 3 files changed, 24 insertions(+)
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
index 0000000..7342981
--- /dev/null
+++ b/package/zynq-boot-bin/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_ZYNQ_BOOT_BIN
+	bool "host zynq-boot-bin"
+	help
+	  This is a simple Python script that creates BOOT.BIN file
+	  to boot Xilinx Zynq based from U-Boot's SPL.
+
+	  https://github.com/Xilinx/u-boot-xlnx
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
new file mode 100644
index 0000000..8123f01
--- /dev/null
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# zynq-boot-bin
+#
+################################################################################
+
+ZYNQ_BOOT_BIN_VERSION = xilinx-v2015.1
+ZYNQ_BOOT_BIN_SOURCE = $(ZYNQ_BOOT_BIN_VERSION).tar.gz
+ZYNQ_BOOT_BIN_SITE = https://github.com/Xilinx/u-boot-xlnx/archive
+
+define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
+	cp $(@D)/tools/zynq-boot-bin.py $(HOST_DIR)/usr/bin/zynq-boot-bin.py
+	chmod u+x $(HOST_DIR)/usr/bin/zynq-boot-bin.py
+endef
+
+$(eval $(host-generic-package))
-- 
2.4.3
