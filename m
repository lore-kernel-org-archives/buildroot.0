From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 22:19:11 +0200
Subject: [Buildroot] [git commit branch/next] owl-linux: new package
Message-ID: <20120802195257.5AB288D2C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c35ab96d57969b63498865778ea4609aa154af7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/owl-linux/Config.in                        |   17 ++++++++++++++++
 ...linux-fix-CROSS_COMPILE-usage-in-Makefile.patch |   16 +++++++++++++++
 .../owl-linux/owl-linux-fix-for-linux-3.3.x.patch  |   21 ++++++++++++++++++++
 package/owl-linux/owl-linux.mk                     |   19 ++++++++++++++++++
 5 files changed, 74 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ab5781c..f664b8e 100644
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
index 0000000..f6e18d5
--- /dev/null
+++ b/package/owl-linux/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_OWL_LINUX
+	bool "owl-linux"
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
diff --git a/package/owl-linux/owl-linux-fix-CROSS_COMPILE-usage-in-Makefile.patch b/package/owl-linux/owl-linux-fix-CROSS_COMPILE-usage-in-Makefile.patch
new file mode 100644
index 0000000..14b4631
--- /dev/null
+++ b/package/owl-linux/owl-linux-fix-CROSS_COMPILE-usage-in-Makefile.patch
@@ -0,0 +1,16 @@
+Fix the owl-linux Makefile so that it protects spaces in the CROSS_COMPILE
+variable. For example, this variable will contain spaces if ccache is used.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nurp a/Makefile b/Makefile
+--- a/Makefile	2012-06-14 10:51:45.000000000 +0100
++++ b/Makefile	2012-07-20 10:46:41.636752148 +0100
+@@ -35,7 +35,7 @@ else
+ 	PWD := $(shell pwd)
+ 
+ default:
+-	$(MAKE) -C $(KERNELDIR) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) M=$(PWD) MODE=$(MODE) modules
++	$(MAKE) -C $(KERNELDIR) ARCH=$(ARCH) CROSS_COMPILE="$(CROSS_COMPILE)" M=$(PWD) MODE=$(MODE) modules
+ 
+ clean: 
+ 	-rm -f *.o *.mod.c *.ko modules.order Module.symvers
diff --git a/package/owl-linux/owl-linux-fix-for-linux-3.3.x.patch b/package/owl-linux/owl-linux-fix-for-linux-3.3.x.patch
new file mode 100644
index 0000000..831ac7f
--- /dev/null
+++ b/package/owl-linux/owl-linux-fix-for-linux-3.3.x.patch
@@ -0,0 +1,21 @@
+Kernel commit b81693d9149c598302e8eb9c20cb20330d922c8e changed the
+net_device_ops structure, removing the ndo_set_multicast_list callback. The
+ndo_set_rx_mode has also been added to this structure.
+
+The upshot of these changes is that owl-linux fails to compile with 3.3.x
+and later kernels.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nurp a/owl_net.c b/owl_net.c
+--- a/owl_net.c	2012-06-14 10:51:45.000000000 +0100
++++ b/owl_net.c	2012-07-20 13:16:28.772351464 +0100
+@@ -384,7 +384,9 @@ static const struct net_device_ops netde
+ #endif /* OWL_CONFIG_IFUPDOWN */
+         .ndo_start_xmit         = owl_net_tx,
+         .ndo_get_stats          = owl_net_get_stats,
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
+         .ndo_set_multicast_list = NULL,
++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0) */
+         .ndo_tx_timeout         = owl_net_tx_timeout,
+         .ndo_set_mac_address    = NULL,
+ };
diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
new file mode 100644
index 0000000..0a111c8
--- /dev/null
+++ b/package/owl-linux/owl-linux.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# owl-linux
+#
+#############################################################
+OWL_LINUX_VERSION = 1.0.7
+OWL_LINUX_SITE = http://linux.hd-wireless.se/pub/Linux/DownloadDrivers
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
+$(eval $(generic-package))
