From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Wed, 28 Jan 2015 14:54:05 +0100
Subject: [Buildroot] [PATCH] package: add support for the wf111 WiFi driver
	and its utilities
Message-ID: <1422453245-11725-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support for the BlueGiga WF111 WiFi driver and the binary utilities
distributed alongside the driver. An account is required to download the
sources from the BlueGiga website, which can be created freely. The
driver is available for armv5, arvmv7a and i386.

It is not possible to automatically retrieve the sources, because of the
required user account needed on the BlueGiga website, an option is added
to let the Buildroot user specify the directory were the driver's
tarball was downloaded.

Finally, two options must be selected in the Linux kernel configuration:
CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 package/Config.in       |  1 +
 package/wf111/Config.in | 25 +++++++++++++++++++++++++
 package/wf111/wf111.mk  | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 package/wf111/Config.in
 create mode 100644 package/wf111/wf111.mk

diff --git a/package/Config.in b/package/Config.in
index d65de7057ff4..dc0b0bc15e06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -387,6 +387,7 @@ endif
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
+	source "package/wf111/Config.in"
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 endmenu
diff --git a/package/wf111/Config.in b/package/wf111/Config.in
new file mode 100644
index 000000000000..4806a6958476
--- /dev/null
+++ b/package/wf111/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_WF111
+	bool "wf111"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
+	# Binary tools are distributed alongside the driver, and are
+	# dynamically linked against the glibc.
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  BlueGiga WF111 WiFi driver and utilities.
+
+	  Warning: CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV must be
+	  selected in the Linux kernel configuration.
+
+if BR2_PACKAGE_WF111
+
+config BR2_PACKAGE_WF111_TARBALL_PATH
+	string "WF111 tarball directory location"
+	help
+	  The WF111 tarball can be retrieve on the BlueGiga website after
+	  registration. This options specify the path were the tarball is
+	  locally saved.
+
+	  http://www.bluegiga.com/en-US/products/wifi-modules/wf111-wifi-module/
+
+endif
diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
new file mode 100644
index 000000000000..a9642e5d724a
--- /dev/null
+++ b/package/wf111/wf111.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# wf111
+#
+################################################################################
+
+WF111_VERSION = 5.2.2
+WF111_SITE_METHOD = file
+WF111_SITE = $(BR2_PACKAGE_WF111_TARBALL_PATH)
+WF111_DEPENDENCIES = linux
+
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv7-a.tar.gz
+else ifeq ($(BR2_ARM_CPU_ARMV5),y)
+WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv5t.tar.gz
+else ifeq ($(BR2_i386),y)
+WF111_SOURCE = wf111-linux-driver_5.2.2-r1_x86.tar.gz
+endif
+
+define WF111_BUILD_CMDS
+	make \
+		-C $(@D) PWD=$(@D) ARCH=arm \
+		CC=$(TARGET_CC) LD=$(TARGET_LD) \
+		KDIR=$(LINUX_DIR) \
+		install_static
+endef
+
+define WF111_INSTALL_TARGET_CMDS
+	rsync -a $(@D)/output/ $(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.2.2
