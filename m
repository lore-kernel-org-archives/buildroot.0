From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  9 May 2012 17:24:18 +0100
Subject: [Buildroot] [PATCH] owl-linux: new package
Message-ID: <1336580658-4324-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/owl-linux/Config.in                        |    6 ++++++
 .../owl-linux-1.0.6-fix-for-linux-3.3.x.patch      |   19 +++++++++++++++++++
 package/owl-linux/owl-linux.mk                     |   20 ++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/owl-linux/Config.in
 create mode 100644 package/owl-linux/owl-linux-1.0.6-fix-for-linux-3.3.x.patch
 create mode 100644 package/owl-linux/owl-linux.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..971b106 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -208,6 +208,7 @@ source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
+source "package/owl-linux/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
diff --git a/package/owl-linux/Config.in b/package/owl-linux/Config.in
new file mode 100644
index 0000000..0209440
--- /dev/null
+++ b/package/owl-linux/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_OWL_LINUX
+	bool "H&D Wireless SPB104 SD-card WiFi SIP"
+	help
+	  Linux kernel driver for the H&D Wireless SPB104 SD-card WiFi SIP.
+
+	  http://linux.hd-wireless.se/bin/view/Linux/GettingStarted
diff --git a/package/owl-linux/owl-linux-1.0.6-fix-for-linux-3.3.x.patch b/package/owl-linux/owl-linux-1.0.6-fix-for-linux-3.3.x.patch
new file mode 100644
index 0000000..2d4ea48
--- /dev/null
+++ b/package/owl-linux/owl-linux-1.0.6-fix-for-linux-3.3.x.patch
@@ -0,0 +1,19 @@
+Kernel commit b81693d9149c598302e8eb9c20cb20330d922c8e changed the
+net_device_ops structure, removing the ndo_set_multicast_list callback. The
+ndo_set_rx_mode has also been added to this structure.
+
+The upshot of these changes is that owl-linux fails to compile with 3.3.x
+kernels.
+
+diff -Nur a/owl_net.c b/owl_net.c
+--- a/owl_net.c	2011-09-15 12:20:37.000000000 +0100
++++ b/owl_net.c	2012-05-01 11:39:14.617658349 +0100
+@@ -376,7 +376,7 @@
+ #endif /* OWL_CONFIG_IFUPDOWN */
+         .ndo_start_xmit         = owl_net_tx,
+         .ndo_get_stats          = owl_net_get_stats,
+-        .ndo_set_multicast_list = NULL,
++        .ndo_set_rx_mode = NULL,
+         .ndo_tx_timeout         = owl_net_tx_timeout,
+         .ndo_set_mac_address    = NULL,
+ };
diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
new file mode 100644
index 0000000..fd62121
--- /dev/null
+++ b/package/owl-linux/owl-linux.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# owl-linux
+#
+#############################################################
+OWL_LINUX_VERSION = 1.0.6
+OWL_LINUX_SITE = http://linux.hd-wireless.se/pub/Linux/DownloadDrivers
+OWL_LINUX_SOURCE = owl-linux-$(OWL_LINUX_VERSION).tar.gz
+
+OWL_LINUX_DEPENDENCIES = linux
+
+define OWL_LINUX_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) KERNELDIR=$(LINUX_DIR) CROSS_COMPILE=$(TARGET_CROSS) ARCH=$(KERNEL_ARCH)
+endef
+
+define OWL_LINUX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) modules_install
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
