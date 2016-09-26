From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 26 Sep 2016 07:55:47 +0200
Subject: [Buildroot] [PATCH v2] package/linux-tools: add gpio
Message-ID: <20160926055547.29069-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v1 -> v2:
 * Adapt to new linux-tools infra, which is moved to package/ directory
   (suggested by Yann)

 package/linux-tools/Config.in          |  9 +++++++++
 package/linux-tools/linux-tool-gpio.mk | 28 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-gpio.mk

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 61c196f..a1bf00d 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -20,6 +20,15 @@ comment "cpupower needs a toolchain w/ wchar"
 	depends on !BR2_bfin
 	depends on !BR2_USE_WCHAR && BR2_NEEDS_GETTEXT
 
+config BR2_PACKAGE_LINUX_TOOLS_GPIO
+	bool "gpio"
+	help
+	  gpio is a collection of tools to get information about,
+	  control and monitor gpios present on system.
+
+	  These tools use new gpio ABI which will deprecate sysfs gpio
+	  interface in the future.
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-gpio.mk b/package/linux-tools/linux-tool-gpio.mk
new file mode 100644
index 0000000..db0094a
--- /dev/null
+++ b/package/linux-tools/linux-tool-gpio.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# gpio
+#
+################################################################################
+
+LINUX_TOOLS += gpio
+
+GPIO_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS)
+
+define GPIO_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have the gpio tools." ; \
+		echo "At least kernel 4.8 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(GPIO_MAKE_OPTS) \
+		gpio
+endef
+
+define GPIO_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(GPIO_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		gpio_install
+endef
-- 
2.10.0
