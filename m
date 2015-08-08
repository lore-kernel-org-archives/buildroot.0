From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:49 -0000
Subject: [Buildroot] [git commit branch/next] host-zynq-boot-bin: new package
Message-ID: <20150808105637.A5BE080414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee845a46e2e7d60ac52c38555c183020ce8cd711
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The package provides a Python script that can create the file BOOT.BIN
to boot Xilinx Zynq based boards.

The script zynq-boot-bin.py is contained in the Xilinx repository of
U-Boot (it is not in upstream).

[Thomas:
 - remove appearance of the package in menuconfig, U-Boot will depend
   on it directly, so there's no need for it to appear in menuconfig
 - use $(INSTALL) instead of cp for the installation
 - remove @ before the extract and install commands.]

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zynq-boot-bin/zynq-boot-bin.hash |    2 ++
 package/zynq-boot-bin/zynq-boot-bin.mk   |   22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

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
index 0000000..46051fb
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
+	cp $(DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
+endef
+
+define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/usr/bin/$(ZYNQ_BOOT_BIN_SOURCE)
+endef
+
+$(eval $(host-generic-package))
