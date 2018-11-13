From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Date: Tue, 13 Nov 2018 06:55:53 +0100
Subject: [Buildroot] [PATCH v2] package/linux-tools: add support for pcitest
 tool
Message-ID: <ffbc28844740f39f96b54a32d623bd1bf8409814.1542088510.git.gustavo.pimentel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for selection and compiling the pcitest tool on buildroot.

This tool is available to be compiled since kernel 4.20.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 package/linux-tools/Config.in            |  9 +++++++++
 package/linux-tools/linux-tool-pci.mk.in | 27 +++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-pci.mk.in

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 349dc6b..f4199fd 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -34,6 +34,15 @@ config BR2_PACKAGE_LINUX_TOOLS_IIO
 
 	  These tools are available only from kernel version 4.7.
 
+config BR2_PACKAGE_LINUX_TOOLS_PCI
+	bool "pci"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  pcitest is a tool for testing capabilities related to a
+	  PCI Endpoint (only works with specific Endpoints).
+
+	  These tools are available only from kernel version 4.20.
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
new file mode 100644
index 0000000..4ef0368
--- /dev/null
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -0,0 +1,27 @@
+################################################################################
+#
+# pci
+#
+################################################################################
+
+LINUX_TOOLS += pci
+
+PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+
+define PCI_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
+		echo "At least kernel 4.20 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
+		$(PCI_MAKE_OPTS)
+endef
+
+define PCI_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
+		$(PCI_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
-- 
2.7.4
