From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Oct 2014 10:04:57 -0300
Subject: [Buildroot] [PATCHv2] spidev_test: new package
Message-ID: <1414155897-2687-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                  |  1 +
 package/spidev_test/Config.in      | 11 +++++++++++
 package/spidev_test/spidev_test.mk | 30 ++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 package/spidev_test/Config.in
 create mode 100644 package/spidev_test/spidev_test.mk

diff --git a/package/Config.in b/package/Config.in
index b0d8a80..a5d4dc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -85,6 +85,7 @@ endif
 	source "package/ramsmp/Config.in"
 	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
+	source "package/spidev_test/Config.in"
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
 	source "package/sysprof/Config.in"
diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
new file mode 100644
index 0000000..0fca030
--- /dev/null
+++ b/package/spidev_test/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SPIDEV_TEST
+	bool "spidev_test"
+	help
+	  SPI testing utility (using spidev driver).
+
+	  This package builds and installs the userspace 'spidev_test'
+	  command. It is up to the user to ensure that the kernel
+	  configuration has all suitable options enabled to allow a
+	  proper operation of 'spidev_test'.
+
+	  https://www.kernel.org/doc/Documentation/spi/spidev_test.c
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
new file mode 100644
index 0000000..5662eb1
--- /dev/null
+++ b/package/spidev_test/spidev_test.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# spidev_test
+#
+################################################################################
+
+# Newest version requires SPI_TX_QUAD/SPI_RX_QUAD to build
+# Pretty safe assumption that toolchain headers are <= runtime kernel version
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
+SPIDEV_TEST_VERSION = c2e78c34ef0bf4fa860b5fffc99c769d6ddaf52d
+else
+SPIDEV_TEST_VERSION = 925d16a209b40a3e7202a4f867991fb608834d36
+endif
+SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi
+SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
+
+# Downloaded file is C source
+SPIDEV_TEST_EXTRACT_CMDS =
+
+define SPIDEV_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) -x c \
+		-o $(@D)/spidev_test $(BR2_DL_DIR)/$(SPIDEV_TEST_SOURCE)
+endef
+
+define SPIDEV_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/spidev_test \
+		$(TARGET_DIR)/usr/sbin/spidev_test
+endef
+
+$(eval $(generic-package))
-- 
2.0.4
