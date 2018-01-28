From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 09:53:44 +0100
Subject: [Buildroot] [git commit] imx-m4fwloader: new package
Message-ID: <20180128085408.8AF5884399@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7be86525de04999ad35d1f4bf23dd23f0b4351ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a tool to load a firmware to the Cortex-M4 core
available in some i.MX processors such as i.MX6SX or i.MX7.

This package was tested on a i.MX7D Nitrogen7 platform:
 # imx-m4fwloader hello_world.bin 0x007F8000

Upstream repository:
https://github.com/codeauroraforum/imx-m4fwloader

[Peter: add license hash, install in /usr/sbin, tweak help text]
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/Config.in                    |  1 +
 package/freescale-imx/imx-m4fwloader/Config.in     |  8 ++++++++
 .../imx-m4fwloader/imx-m4fwloader.hash             |  3 +++
 .../freescale-imx/imx-m4fwloader/imx-m4fwloader.mk | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index e1dbdfb..b5e5ab2 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -72,6 +72,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-m4fwloader/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
diff --git a/package/freescale-imx/imx-m4fwloader/Config.in b/package/freescale-imx/imx-m4fwloader/Config.in
new file mode 100644
index 0000000..937f82f
--- /dev/null
+++ b/package/freescale-imx/imx-m4fwloader/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IMX_M4FWLOADER
+	bool "imx-m4fwloader"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  This package provides a tool to load a firmware to the
+	  Cortex-M4 core available in some i.MX processors.
+
+	  https://github.com/codeauroraforum/imx-m4fwloader
diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
new file mode 100644
index 0000000..2bf3f15
--- /dev/null
+++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 fb6334900972fe389e808845417dd9045fb0f7eb47952fc22a00f4cdaf94af1a  imx-m4fwloader-8cf4d17a09ba23250d43381b49ba00d92406fad9.tar.gz
+sha256 c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
new file mode 100644
index 0000000..cc48493
--- /dev/null
+++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# imx-m4fwloader
+#
+################################################################################
+
+IMX_M4FWLOADER_VERSION = 8cf4d17a09ba23250d43381b49ba00d92406fad9
+IMX_M4FWLOADER_SITE = $(call github,codeauroraforum,imx-m4fwloader,$(IMX_M4FWLOADER_VERSION))
+IMX_M4FWLOADER_LICENSE = GPL-2.0+
+IMX_M4FWLOADER_LICENSE_FILES = LICENSE
+
+define IMX_M4FWLOADER_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/imx-m4fwloader \
+		$(@D)/m4fwloader.c
+endef
+
+define IMX_M4FWLOADER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/imx-m4fwloader \
+		$(TARGET_DIR)/usr/sbin/imx-m4fwloader
+endef
+
+$(eval $(generic-package))
