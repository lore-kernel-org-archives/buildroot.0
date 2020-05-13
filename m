From: Eugen Hristev <eugen.hristev@microchip.com>
Date: Wed, 13 May 2020 18:03:24 +0300
Subject: [Buildroot] [PATCH] package/linux-tools: introduce spi linux tools
Message-ID: <20200513150324.330435-1-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new linux tools package : spi. This is present in the Linux Kernel since
4.5.
It now includes spidev_test and spidev_fdx tools.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---

Inspired by the linux-tools iio mk.in file.

 package/linux-tools/Config.in            |  7 ++++++
 package/linux-tools/linux-tool-spi.mk.in | 29 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-spi.mk.in

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ceb58c668a..60df99dc4a 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -108,6 +108,13 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dyna
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || BR2_STATIC_LIBS
 
+config BR2_PACKAGE_LINUX_TOOLS_SPI
+	bool "spi"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  spi is a collection of tools to test and measure performances
+	  of SPI (Serial Peripheral Interface) bus devices.
+
 config BR2_PACKAGE_LINUX_TOOLS_TMON
 	bool "tmon"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-spi.mk.in b/package/linux-tools/linux-tool-spi.mk.in
new file mode 100644
index 0000000000..f6c4298380
--- /dev/null
+++ b/package/linux-tools/linux-tool-spi.mk.in
@@ -0,0 +1,29 @@
+################################################################################
+#
+# spi
+#
+################################################################################
+
+LINUX_TOOLS += spi
+
+SPI_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+
+define SPI_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/spi/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have install section in the spi tools." ; \
+		echo "At least kernel 4.5 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/spi \
+		$(SPI_MAKE_OPTS)
+endef
+
+# DESTDIR used since kernel version 4.14
+define SPI_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/spi \
+		$(SPI_MAKE_OPTS) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
-- 
2.25.1
