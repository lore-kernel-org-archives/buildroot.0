From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:52:41 +0200
Subject: [Buildroot] [git commit] spidev_test: new package
Message-ID: <20141025085349.D64C4B0F00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cb26103d6bbc302f0741b2a3bb46c76088ae774
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: instead of building spidev_test directly from the source in
$(BR2_DL_DIR), use SPIDEV_TEST_EXTRACT_CMDS to copy the downloaded
source to the build directory, and build it from here. Allows to
manually tweak the source in the build directory for testing, allows
to apply patches over the source if needed, etc.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/spidev_test/Config.in      |   17 +++++++++++++++++
 package/spidev_test/spidev_test.mk |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 84e7bd2..e5686f6 100644
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
index 0000000..0d8214c
--- /dev/null
+++ b/package/spidev_test/Config.in
@@ -0,0 +1,17 @@
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
+	  The version used is based on your toolchain headers version,
+	  if it's older than 3.15 then 3.0 is used, otherwise 3.15
+	  is used.
+	  This means you won't have quad-pumped SPI support if your
+	  toolchain is too old.
+
+	  https://www.kernel.org/doc/Documentation/spi/spidev_test.c
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
new file mode 100644
index 0000000..646372f
--- /dev/null
+++ b/package/spidev_test/spidev_test.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# spidev_test
+#
+################################################################################
+
+# v3.15+ requires SPI_TX_QUAD/SPI_RX_QUAD to build
+# Normally kernel headers can't be newer than kernel so switch based on that.
+# If you need quad-pumped spi support you need to upgrade your toolchain.
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
+SPIDEV_TEST_VERSION = v3.15
+else
+SPIDEV_TEST_VERSION = v3.0
+endif
+SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi
+SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
+SPIDEV_TEST_LICENSE = GPLv2
+
+define SPIDEV_TEST_EXTRACT_CMDS
+	cp $(BR2_DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
+endef
+
+define SPIDEV_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) \
+		-o $(@D)/spidev_test $(@D)/spidev_test.c
+endef
+
+define SPIDEV_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/spidev_test \
+		$(TARGET_DIR)/usr/sbin/spidev_test
+endef
+
+$(eval $(generic-package))
