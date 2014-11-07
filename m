From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 16:57:51 +0100
Subject: [Buildroot] [PATCH 1/4] libz160: new package
In-Reply-To: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
References: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
Message-ID: <1415375874-17331-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An API for user space programs to perform 2D accelerated graphics operations
on AMD GPU

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/Config.in          |  3 +++
 package/freescale-imx/libz160/Config.in  |  6 +++++
 package/freescale-imx/libz160/libz160.mk | 40 ++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/freescale-imx/libz160/Config.in
 create mode 100644 package/freescale-imx/libz160/libz160.mk

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
index 0000000..b1001da
--- /dev/null
+++ b/package/freescale-imx/libz160/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBZ160
+	bool "libz160"
+	depends on BR2_arm # Only relevant for i.MX5
+	help
+	  An API for user space programs to perform 2D accelerated graphics
+	  operations on AMD GPU (included for examples in iMX5x chipsets)
diff --git a/package/freescale-imx/libz160/libz160.mk b/package/freescale-imx/libz160/libz160.mk
new file mode 100644
index 0000000..d083d81
--- /dev/null
+++ b/package/freescale-imx/libz160/libz160.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# libz160
+#
+#############################################################
+LIBZ160_VERSION = 11.09.01
+LIBZ160_SOURCE = libz160-bin-$(LIBZ160_VERSION).bin
+LIBZ160_SITE = $(FREESCALE_IMX_SITE)
+LIBZ160_INSTALL_STAGING = YES
+LIBZ160_LICENSE = Freescale Semiconductor Software License Agreement
+
+# No license file is included in the archive; we could extract it from
+# the self-extractor, but that's just too much effort.
+# This is a legal minefield: the EULA specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+LIBZ160_REDISTRIBUTE = NO
+
+# The archive is a shell-self-extractor of a bzipped tar. Output directory 
+# depends of version of source.
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info.
+define LIBZ160_EXTRACT_CMDS
+	(cd $(@D); \
+		sh $(DL_DIR)/$(LIBZ160_SOURCE) --force --auto-accept)
+	mv $(@D)/libz160-bin-$(LIBZ160_VERSION)/* $(@D)
+	rmdir $(@D)/libz160-bin-$(LIBZ160_VERSION)
+endef
+
+define LIBZ160_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 644 $(@D)/usr/lib/libz160.so $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -m 644 $(@D)/usr/include/z160.h $(STAGING_DIR)/usr/include/
+endef
+
+define LIBZ160_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 $(@D)/usr/lib/libz160.so $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
