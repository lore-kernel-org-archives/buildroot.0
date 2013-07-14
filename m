From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 14 Jul 2013 00:10:30 -0500
Subject: [Buildroot] [RFC 1/3] a10disp: new package
In-Reply-To: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373778632-16531-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in          |  1 +
 package/a10disp/Config.in  | 11 +++++++++++
 package/a10disp/a10disp.mk | 21 +++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/a10disp/Config.in
 create mode 100644 package/a10disp/a10disp.mk

diff --git a/package/Config.in b/package/Config.in
index 7c24dab..f565dd4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -227,6 +227,7 @@ source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
 endmenu
 source "package/freescale-imx/Config.in"
+source "package/a10disp/Config.in"
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
 source "package/dbus/Config.in"
diff --git a/package/a10disp/Config.in b/package/a10disp/Config.in
new file mode 100644
index 0000000..60ba44c
--- /dev/null
+++ b/package/a10disp/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_A10DISP
+	bool "a10disp"
+	depends on BR2_LINUX_KERNEL && BR2_arm
+	help
+	  Program to change the display mode of Allwinner devices running
+	  linux-sunxi.
+
+	  http://github.com/hglm/a10disp
+
+comment "a10disp requires the linux kernel"
+	depends on !(BR2_LINUX_KERNEL) && BR2_arm
diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
new file mode 100644
index 0000000..bac515a
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
+   cp -f $(LINUX_DIR)/include/video/sunxi_disp_ioctl.h $(@D)/
+   cd $(@D) && $(TARGET_CC) -Wall -O a10disp.c -o a10disp
+endef
+
+define A10DISP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/a10disp $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
