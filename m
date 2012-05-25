From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 25 May 2012 22:07:21 +0100
Subject: [Buildroot] [PATCH resend] owl-linux: new package
Message-ID: <1337980041-25675-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/owl-linux/Config.in                        |   18 ++++++++++++++++++
 ...1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch |   15 +++++++++++++++
 .../owl-linux-1.0.6-fix-for-linux-3.3.x.patch      |   19 +++++++++++++++++++
 package/owl-linux/owl-linux.mk                     |   20 ++++++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 package/owl-linux/Config.in
 create mode 100644 package/owl-linux/owl-linux-1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch
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
index 0000000..a5ab8e8
--- /dev/null
+++ b/package/owl-linux/Config.in
@@ -0,0 +1,18 @@
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
+
+comment "owl-linux is only supported on the ARM9 architecture"
+	depends on !(BR2_arm920t || BR2_arm922t || BR2_arm926t)
+
+comment "owl-linux requires the ARM EABI"
+	depends on !BR2_ARM_EABI
diff --git a/package/owl-linux/owl-linux-1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch b/package/owl-linux/owl-linux-1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch
new file mode 100644
index 0000000..a644406
--- /dev/null
+++ b/package/owl-linux/owl-linux-1.0.6-fix-CROSS_COMPILE-usage-in-Makefile.patch
@@ -0,0 +1,15 @@
+Fix the owl-linux Makefile so that it protects spaces in the CROSS_COMPILE
+variable. For example, this variable will contain spaces if ccache is used.
+
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
