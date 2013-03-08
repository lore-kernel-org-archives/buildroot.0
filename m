From: Carlo Caione <carlo.caione@gmail.com>
Date: Fri,  8 Mar 2013 07:22:54 +0100
Subject: [Buildroot] [PATCH 1/3] sunxi-tools: new host package
Message-ID: <1362723776-23330-1-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tools to help hacking Allwinner A10 (aka sun4i) based devices

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
 package/Config.in.host             |  1 +
 package/sunxi-tools/Config.in.host |  7 +++++++
 package/sunxi-tools/sunxi-tools.mk | 20 ++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/sunxi-tools/Config.in.host
 create mode 100644 package/sunxi-tools/sunxi-tools.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 79050f2..b2b9fbd 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
+source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 
 endmenu
diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
new file mode 100644
index 0000000..71e0418
--- /dev/null
+++ b/package/sunxi-tools/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SUNXI_TOOLS
+	bool "host sunxi-tools"
+	help
+          Tools to help hacking Allwinner A10 (aka sun4i) based devices and
+	  possibly it's successors
+
+	  https://github.com/linux-sunxi/sunxi-tools
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
new file mode 100644
index 0000000..60acff5
--- /dev/null
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# sunxi-tools
+#
+#############################################################
+
+SUNXI_TOOLS_VERSION = master
+SUNXI_TOOLS_SITE = git://github.com/linux-sunxi/sunxi-tools.git
+
+define HOST_SUNXI_TOOLS_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define HOST_SUNXI_TOOLS_INSTALL_CMDS
+	for f in fexc bin2fex fex2bin bootinfo fel pio nand-part ; do \
+		install -m 755 -D $(@D)/$$f $(HOST_DIR)/usr/bin/$$f ; \
+	done
+endef
+
+$(eval $(host-generic-package))
-- 
1.8.1.5
