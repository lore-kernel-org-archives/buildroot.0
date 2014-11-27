From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:24:50 +0100
Subject: [Buildroot] [git commit branch/next] libz160: new package
Message-ID: <20141127212615.7768E7FF41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=820bd032af3c91139730e372b5faf9c32e295e30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

An API for user space programs to perform 2D accelerated graphics operations
on AMD GPU

[Thomas:
 - merge in the same patch the patch switching to the freescale-imx
   extract helper.
 - remove the dependency on "depends BR2_arm", since anyway the
   package Config.in file is only included if we are using the i.MX51
   or i.MX53 platforms.
 - use full installation paths (i.e $(INSTALL) -D), and install
   libraries 755, as it usually done.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/Config.in          |    3 +++
 package/freescale-imx/libz160/Config.in  |    5 +++++
 package/freescale-imx/libz160/libz160.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index d8c6efc..71b7f0b 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -45,6 +45,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
+source "package/freescale-imx/libz160/Config.in"
+endif
 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
 endif
diff --git a/package/freescale-imx/libz160/Config.in b/package/freescale-imx/libz160/Config.in
new file mode 100644
index 0000000..f956cce
--- /dev/null
+++ b/package/freescale-imx/libz160/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBZ160
+	bool "libz160"
+	help
+	  An API for user space programs to perform 2D accelerated graphics
+	  operations on AMD GPU (included for examples in iMX5x chipsets)
diff --git a/package/freescale-imx/libz160/libz160.mk b/package/freescale-imx/libz160/libz160.mk
new file mode 100644
index 0000000..55e7217
--- /dev/null
+++ b/package/freescale-imx/libz160/libz160.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# libz160
+#
+#############################################################
+LIBZ160_VERSION = 11.09.01
+LIBZ160_SOURCE = libz160-bin-$(LIBZ160_VERSION).bin
+LIBZ160_SITE = $(FREESCALE_IMX_SITE)
+LIBZ160_INSTALL_STAGING = YES
+
+# See freescale-imx
+LIBZ160_LICENSE = Freescale Semiconductor Software License Agreement
+LIBZ160_LICENSE_FILES = EULA
+LIBZ160_REDISTRIBUTE = NO
+
+define LIBZ160_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBZ160_SOURCE))
+endef
+
+define LIBZ160_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 755 $(@D)/usr/lib/libz160.so $(STAGING_DIR)/usr/lib/libz160.so
+	$(INSTALL) -D -m 644 $(@D)/usr/include/z160.h $(STAGING_DIR)/usr/include/z160.h
+endef
+
+define LIBZ160_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/usr/lib/libz160.so $(TARGET_DIR)/usr/lib/libz160.so
+endef
+
+$(eval $(generic-package))
