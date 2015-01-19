From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Mon, 19 Jan 2015 20:35:37 +0100
Subject: [Buildroot] [PATCH] spidev_test: use the one from the kernel we
	build
Message-ID: <1421696137-17377-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a configuration option to use the spidev_test.c from the Linux kernel we
build. This allows to be perfectly consistent between spidev_test and the
kernel in use.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---

Hi,

Do not hesitate to let me know if you don't like the variables names; for
example BR2_PACKAGE_SPIDEV_TEST_FROM_KERNEL and SPIDEV_TEST_C_FILE_SRC.

Best regards,

V.

 package/spidev_test/Config.in      | 11 +++++++++++
 package/spidev_test/spidev_test.mk | 13 ++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
index 0d8214c..8da096e 100644
--- a/package/spidev_test/Config.in
+++ b/package/spidev_test/Config.in
@@ -15,3 +15,14 @@ config BR2_PACKAGE_SPIDEV_TEST
 	  toolchain is too old.
 
 	  https://www.kernel.org/doc/Documentation/spi/spidev_test.c
+
+if BR2_PACKAGE_SPIDEV_TEST
+
+config BR2_PACKAGE_SPIDEV_TEST_FROM_KERNEL
+	bool "spidev_test.c of the linux kernel we build"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Use directly the spidev_test.c from the kernel sources we build,
+	  instead of retrieving from kernel.org.
+
+endif
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 646372f..5ab80a6 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -4,6 +4,14 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_SPIDEV_TEST_FROM_KERNEL),y)
+# Use the spidev_test.c from the kernel we build.
+SPIDEV_TEST_SOURCE =
+SPIDEV_TEST_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+SPIDEV_TEST_DEPENDENCIES = linux
+SPIDEV_TEST_C_FILE_SRC = $(LINUX_DIR)/Documentation/spi/spidev_test.c
+else
+# Get spidev_test.c from kernel.org.
 # v3.15+ requires SPI_TX_QUAD/SPI_RX_QUAD to build
 # Normally kernel headers can't be newer than kernel so switch based on that.
 # If you need quad-pumped spi support you need to upgrade your toolchain.
@@ -14,10 +22,13 @@ SPIDEV_TEST_VERSION = v3.0
 endif
 SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi
 SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
+SPIDEV_TEST_C_FILE_SRC = $(BR2_DL_DIR)/$(SPIDEV_TEST_SOURCE)
+endif
+
 SPIDEV_TEST_LICENSE = GPLv2
 
 define SPIDEV_TEST_EXTRACT_CMDS
-	cp $(BR2_DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
+	cp $(SPIDEV_TEST_C_FILE_SRC) $(@D)/spidev_test.c
 endef
 
 define SPIDEV_TEST_BUILD_CMDS
-- 
2.1.4
