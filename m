From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  4 Oct 2016 18:01:14 +0200
Subject: [Buildroot] [PATCH v4] package/linux-tools: add gpio
Message-ID: <20161004160114.4516-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v3 -> v4:
 * Use LINUX_MAKE_FLAGS instead of directly specifying CROSS_COMPILE
   (suggested by Yann)

Changes v2 -> v3:
 * Add info about supported Linux version in Config.in
   (suggested by Baruch)

Changes v1 -> v2:
 * Adapt to new linux-tools infra, which is moved to package/ directory
   (suggested by Yann)

 package/linux-tools/Config.in          | 12 ++++++++++++
 package/linux-tools/linux-tool-gpio.mk | 28 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-gpio.mk

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 61c196f..bd07509 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -20,6 +20,18 @@ comment "cpupower needs a toolchain w/ wchar"
 	depends on !BR2_bfin
 	depends on !BR2_USE_WCHAR && BR2_NEEDS_GETTEXT
 
+config BR2_PACKAGE_LINUX_TOOLS_GPIO
+	bool "gpio"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  gpio is a collection of tools to get information about,
+	  control and monitor gpios present on system.
+
+	  These tools use new gpio ABI which will deprecate sysfs gpio
+	  interface in the future.
+
+	  These tools are available only from kernel version 4.8.
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-gpio.mk b/package/linux-tools/linux-tool-gpio.mk
new file mode 100644
index 0000000..ba75ab4
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
+GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
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
