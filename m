From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri,  6 Mar 2020 08:14:37 +0100
Subject: [Buildroot] [PATCH 4/7] package/mali-bifrost-driver: new package
In-Reply-To: <20200306071440.30433-1-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
Message-ID: <20200306071440.30433-5-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new package to build and install a generic ARM Mali Bifrost GPU
Linux kernel module.

This module is compliant with the standard kernel-module
infrastructure.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 package/Config.in                               |  1 +
 package/mali-bifrost-driver/Config.in           | 17 +++++++++++++++++
 .../mali-bifrost-driver.hash                    |  3 +++
 .../mali-bifrost-driver/mali-bifrost-driver.mk  | 15 +++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/mali-bifrost-driver/Config.in
 create mode 100644 package/mali-bifrost-driver/mali-bifrost-driver.hash
 create mode 100644 package/mali-bifrost-driver/mali-bifrost-driver.mk

diff --git a/package/Config.in b/package/Config.in
index f2217ee1d5..f9f71fc9eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ endmenu
 	source "package/lsuio/Config.in"
 	source "package/luksmeta/Config.in"
 	source "package/lvm2/Config.in"
+	source "package/mali-bifrost-driver/Config.in"
 	source "package/mali-t76x/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
diff --git a/package/mali-bifrost-driver/Config.in b/package/mali-bifrost-driver/Config.in
new file mode 100644
index 0000000000..c278048b98
--- /dev/null
+++ b/package/mali-bifrost-driver/Config.in
@@ -0,0 +1,17 @@
+comment "Mali Bifrost driver needs a Linux kernel to be built"
+	depends on BR2_PACKAGE_MALI_BIFROST_DRIVER
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_MALI_BIFROST_DRIVER
+	bool "mali-bifrost-driver"
+	default n
+	depends on BR2_PACKAGE_ROCKCHIP_MALI_BIFROST # runtime
+	depends on BR2_LINUX_KERNEL
+	help
+	  This package builds and installs the Linux kernel driver for
+	  the Mali Bifrost GPU, compatible with recent Linux kernels
+	  (>= 5.4). Note that it should be installed together with the
+	  corresponding userspace OpenGL libraries, which are usually
+	  provided as binaries only by hardware vendors.
+
+	  mali-bifrost-driver requires a Linux kernel >= 5.4.
diff --git a/package/mali-bifrost-driver/mali-bifrost-driver.hash b/package/mali-bifrost-driver/mali-bifrost-driver.hash
new file mode 100644
index 0000000000..40d3b749bf
--- /dev/null
+++ b/package/mali-bifrost-driver/mali-bifrost-driver.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 915873382580ba86518ee0552980ce9726d51a819c90548e31dc4a528d532b1a  mali-bifrost-driver-v0.1.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-bifrost-driver/mali-bifrost-driver.mk b/package/mali-bifrost-driver/mali-bifrost-driver.mk
new file mode 100644
index 0000000000..5d1990676e
--- /dev/null
+++ b/package/mali-bifrost-driver/mali-bifrost-driver.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# mali-bifrost-driver
+#
+################################################################################
+
+MALI_BIFROST_DRIVER_VERSION = v0.1
+MALI_BIFROST_DRIVER_SITE = $(call github,bootlin,mali-bifrost,$(MALI_BIFROST_DRIVER_VERSION))
+MALI_BIFROST_DRIVER_DEPENDENCIES = linux
+MALI_BIFROST_DRIVER_LICENSE = GPL-2.0
+MALI_BIFROST_DRIVER_LICENSE_FILE = LICENSE
+MALI_BIFROST_DRIVER_MODULE_SUBDIRS = r8p0/drivers/gpu/arm/midgard
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.20.1
