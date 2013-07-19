From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 19 Jul 2013 18:37:51 -0500
Subject: [Buildroot] [PATCH 1/4] a10disp: new package
In-Reply-To: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
References: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1374277074-14455-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in          |  1 +
 package/a10disp/Config.in  | 12 ++++++++++++
 package/a10disp/a10disp.mk | 21 +++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/a10disp/Config.in
 create mode 100644 package/a10disp/a10disp.mk

diff --git a/package/Config.in b/package/Config.in
index 286a605..0ba8ee4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -229,6 +229,7 @@ source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
 endmenu
 source "package/freescale-imx/Config.in"
+source "package/a10disp/Config.in"
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
 source "package/dbus/Config.in"
diff --git a/package/a10disp/Config.in b/package/a10disp/Config.in
new file mode 100644
index 0000000..b4edf31
--- /dev/null
+++ b/package/a10disp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_A10DISP
+	bool "a10disp"
+	depends on BR2_arm
+	depends on BR2_LINUX_KERNEL
+	help
+	  Program to change the display mode of Allwinner ARM SOCs running
+	  the linux-sunxi kernel (and not the mainline kernel.)
+
+	  http://github.com/hglm/a10disp
+
+comment "a10disp requires the linux kernel"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
new file mode 100644
index 0000000..7dfc1b5
--- /dev/null
+++ b/package/a10disp/a10disp.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# a10disp
+#
+################################################################################
+
+A10DISP_VERSION = a899cc6dcf
+A10DISP_SITE = http://github.com/hglm/a10disp/tarball/$(A10DISP_VERSION)
+
+A10DISP_DEPENDENCIES = linux
+
+define A10DISP_BUILD_CMDS
+	cp -f $(LINUX_DIR)/include/video/sunxi_disp_ioctl.h $(@D)/
+	$(TARGET_CC) $(TARGET_CFLAGS) $(@D)/a10disp.c -o $(@D)/a10disp
+endef
+
+define A10DISP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/a10disp $(TARGET_DIR)/usr/bin/a10disp
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
