From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 26 Jun 2012 09:10:49 +0100
Subject: [Buildroot] [PATCH resend v2] owl-linux: new package
Message-ID: <1340698249-6938-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Added Signed-off-by lines to patches, make configuration menu commentary
 less intrusive for non-ARM setups.

 package/Config.in                                  |    1 +
 package/owl-linux/Config.in                        |   17 +++++++++++++++
 ...1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch |   16 ++++++++++++++
 .../owl-linux-1.0.6-fix-for-linux-3.3.x.patch      |   23 ++++++++++++++++++++
 package/owl-linux/owl-linux.mk                     |   20 +++++++++++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 package/owl-linux/Config.in
 create mode 100644 package/owl-linux/owl-linux-1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch
 create mode 100644 package/owl-linux/owl-linux-1.0.6-fix-for-linux-3.3.x.patch
 create mode 100644 package/owl-linux/owl-linux.mk

diff --git a/package/Config.in b/package/Config.in
index 99257b4..cb8771d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -216,6 +216,7 @@ source "package/ntfs-3g/Config.in"
 source "package/ofono/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
+source "package/owl-linux/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
diff --git a/package/owl-linux/Config.in b/package/owl-linux/Config.in
new file mode 100644
index 0000000..ce677b2
--- /dev/null
+++ b/package/owl-linux/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_OWL_LINUX
+	bool "H&D Wireless SPB104 SD-card WiFi SIP"
+	depends on BR2_LINUX_KERNEL
+	depends on (BR2_arm920t || BR2_arm922t || BR2_arm926t)
+	depends on BR2_ARM_EABI
+	help
+	  Linux kernel driver for the H&D Wireless SPB104 SD-card WiFi SIP.
+
+	  http://linux.hd-wireless.se/bin/view/Linux/GettingStarted
+
+comment "owl-linux requires a Linux kernel"
+	depends on !BR2_LINUX_KERNEL
+	depends on BR2_arm || BR2_armeb
+
+comment "owl-linux is only supported on ARM9 architecture with EABI"
+	depends on !(BR2_arm920t || BR2_arm922t || BR2_arm926t) || !BR2_ARM_EABI
+	depends on BR2_arm || BR2_armeb
diff --git a/package/owl-linux/owl-linux-1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch b/package/owl-linux/owl-linux-1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch
new file mode 100644
index 0000000..5dc54a7
--- /dev/null
+++ b/package/owl-linux/owl-linux-1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch
@@ -0,0 +1,16 @@
+Fix the owl-linux Makefile so that it protects spaces in the CROSS_COMPILE
+variable. For example, this variable will contain spaces if ccache is used.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nur a/Makefile b/Makefile
+--- a/Makefile	2011-09-15 12:20:37.000000000 +0100
++++ b/Makefile	2012-05-10 08:53:55.727706424 +0100
+@@ -35,7 +35,7 @@
+ 	PWD := $(shell pwd)
+ 
+ default:
+-	$(MAKE) -C $(KERNELDIR) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) M=$(PWD) MODE=$(MODE) modules
++	$(MAKE) -C $(KERNELDIR) ARCH=$(ARCH) CROSS_COMPILE="$(CROSS_COMPILE)" M=$(PWD) MODE=$(MODE) modules
+ 
+ clean: 
+ 	-rm -f *.o *.mod.c *.ko modules.order Module.symvers
diff --git a/package/owl-linux/owl-linux-1.0.6-fix-for-linux-3.3.x.patch b/package/owl-linux/owl-linux-1.0.6-fix-for-linux-3.3.x.patch
new file mode 100644
index 0000000..15707c8
--- /dev/null
+++ b/package/owl-linux/owl-linux-1.0.6-fix-for-linux-3.3.x.patch
@@ -0,0 +1,23 @@
+Kernel commit b81693d9149c598302e8eb9c20cb20330d922c8e changed the
+net_device_ops structure, removing the ndo_set_multicast_list callback. The
+ndo_set_rx_mode has also been added to this structure.
+
+The upshot of these changes is that owl-linux fails to compile with 3.3.x
+and later kernels.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nurp a/owl_net.c b/owl_net.c
+--- a/owl_net.c	2011-09-15 12:20:37.000000000 +0100
++++ b/owl_net.c	2012-06-05 07:42:47.839807834 +0100
+@@ -376,7 +376,11 @@ static const struct net_device_ops netde
+ #endif /* OWL_CONFIG_IFUPDOWN */
+         .ndo_start_xmit         = owl_net_tx,
+         .ndo_get_stats          = owl_net_get_stats,
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
+         .ndo_set_multicast_list = NULL,
++#else
++        .ndo_set_rx_mode = NULL,
++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0) */
+         .ndo_tx_timeout         = owl_net_tx_timeout,
+         .ndo_set_mac_address    = NULL,
+ };
diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
new file mode 100644
index 0000000..8aa8709
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
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
+endef
+
+define OWL_LINUX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(@D)" modules_install
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
