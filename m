From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 14 Oct 2014 19:29:16 +0200
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5f5516c3-f0eb-478e-ae83-be53e797f4af@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias <gustavo@zacarias.com.ar> schreef:
>Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>---
> package/Config.in                  |  1 +
> package/spidev_test/Config.in      | 15 +++++++++++++++
> package/spidev_test/spidev_test.mk | 22 ++++++++++++++++++++++
> 3 files changed, 38 insertions(+)
> create mode 100644 package/spidev_test/Config.in
> create mode 100644 package/spidev_test/spidev_test.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index dda7716..fb8e93d 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -84,6 +84,7 @@ endif
> 	source "package/ramsmp/Config.in"
> 	source "package/ramspeed/Config.in"
> 	source "package/rt-tests/Config.in"
>+	source "package/spidev_test/Config.in"
> 	source "package/strace/Config.in"
> 	source "package/stress/Config.in"
> 	source "package/sysprof/Config.in"
>diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
>new file mode 100644
>index 0000000..c0ed9ef
>--- /dev/null
>+++ b/package/spidev_test/Config.in
>@@ -0,0 +1,15 @@
>+config BR2_PACKAGE_SPIDEV_TEST
>+	bool "spidev_test"
>+	depends on BR2_LINUX_KERNEL
>+	help
>+	  SPI testing utility (using spidev driver).
>+
>+	  This package builds and installs the userspace 'spidev_test'
>+	  command. It is up to the user to ensure that the kernel
>+	  configuration has all the suitable options enabled to allow a
>+	  proper operation of 'spidev_test'.
>+
>+	  https://www.kernel.org/doc/Documentation/spi/spidev_test.c
>+
>+comment "spidev_test needs Linux kernel to be built"

This should be '... needs a Linux ...'

>+	depends on !BR2_LINUX_KERNEL
>diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
>new file mode 100644
>index 0000000..24c0f89
>--- /dev/null
>+++ b/package/spidev_test/spidev_test.mk
>@@ -0,0 +1,22 @@
>+################################################################################
>+#
>+# spidev_test
>+#
>+################################################################################
>+
>+# Source taken from the Linux kernel tree
>+SPIDEV_TEST_SOURCE =
>+SPIDEV_TEST_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>+SPIDEV_TEST_DEPENDENCIES = linux

Here I think we should define the license and if possible license files, if needed using a hook to copy the license from the kernel...

>+
>+define SPIDEV_TEST_BUILD_CMDS
>+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/spidev_test \
>+		$(LINUX_DIR)/Documentation/spi/spidev_test.c
>+endef
>+
>+define SPIDEV_TEST_INSTALL_TARGET_CMDS
>+	$(INSTALL) -D -m 755 $(@D)/spidev_test \
>+		$(TARGET_DIR)/usr/sbin/spidev_test
>+endef
>+
>+$(eval $(generic-package))

Good idea to make this a package. We once copied this test to our own test repo, but this makes more sense.

Best regards,
Thomas
