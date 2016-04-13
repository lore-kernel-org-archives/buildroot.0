From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 13 Apr 2016 12:40:52 +0200
Subject: [Buildroot] [PATCH v2] imx-uuc: add new package
Message-ID: <1460544052-31608-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides the Universal Adapter user-space utility that is
used to receive commands from the Manufacturing Tool using the Freescale
UTP Protocol.

It requires a Freescale/NXP kernels whose configuration contains the
CONFIG_FSL_UTP option.

The /fat file is provided as a bootargs to the g_mass_storage driver
from U-Boot, see:
http://git.freescale.com/git/cgit.cgi/imx/uboot-imx.git/tree/include/
configs/mx6sabre_common.h?h=imx_v2015.04_3.14.52_1.1.0_ga#n116

Init scripts are provided so that the tool starts automatically at
bootup.

Tested on Nitrogen6_MAX + MFGTools.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

Changes v1 -> v2:
- add toolchain threads dependency
- add host-dosfstools selection
- add init scripts to start it as a daemon
- use manual install commands to control mkfs path and remove /linuxrc
- change Config.in comment

I have a few comments/questions on this new version:
- the install process still requires to use dd, hope using the system
  one is ok.
- I chose the init script number randomly (S80), hope it's ok.

Regards,
Gary
---
 package/freescale-imx/Config.in               |  1 +
 package/freescale-imx/imx-uuc/Config.in       | 19 +++++++++++++
 package/freescale-imx/imx-uuc/S80imx-uuc      | 28 +++++++++++++++++++
 package/freescale-imx/imx-uuc/imx-uuc.hash    |  1 +
 package/freescale-imx/imx-uuc/imx-uuc.mk      | 40 +++++++++++++++++++++++++++
 package/freescale-imx/imx-uuc/imx-uuc.service | 11 ++++++++
 6 files changed, 100 insertions(+)
 create mode 100644 package/freescale-imx/imx-uuc/Config.in
 create mode 100644 package/freescale-imx/imx-uuc/S80imx-uuc
 create mode 100644 package/freescale-imx/imx-uuc/imx-uuc.hash
 create mode 100644 package/freescale-imx/imx-uuc/imx-uuc.mk
 create mode 100644 package/freescale-imx/imx-uuc/imx-uuc.service

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 4a086ae..8c03190 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -51,6 +51,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
diff --git a/package/freescale-imx/imx-uuc/Config.in b/package/freescale-imx/imx-uuc/Config.in
new file mode 100644
index 0000000..75e4c87
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_IMX_UUC
+	bool "imx-uuc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm # Only relevant for i.MX
+	select BR2_PACKAGE_HOST_DOSFSTOOLS
+	help
+	  This package provides the Universal Adapter user-space utility
+	  that is used to receive commands from the Manufacturing Tool
+	  using the Freescale UTP Protocol.
+
+	  It requires a Freescale/NXP kernel whose configuration contains
+	  the CONFIG_FSL_UTP option.
+
+	  This package is provided by Freescale/NXP as-is and doesn't have
+	  an upstream.
+
+comment "imx-uuc needs a toolchain w/ threads"
+	depends on BR2_ARM
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/freescale-imx/imx-uuc/S80imx-uuc b/package/freescale-imx/imx-uuc/S80imx-uuc
new file mode 100644
index 0000000..8d6d8c1
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/S80imx-uuc
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+NAME=uuc
+DAEMON=/usr/bin/$NAME
+
+case "$1" in
+  start)
+    printf "Starting $NAME: "
+    start-stop-daemon -S -q -b -p /var/run/${NAME}.pid -x $DAEMON
+    echo "OK"
+    ;;
+  stop)
+    printf "Stopping $NAME: "
+    start-stop-daemon -K -q -p /var/run/${NAME}.pid
+    echo "OK"
+    ;;
+  restart|reload)
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart}"
+    exit 1
+esac
+
+exit $?
+
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
new file mode 100644
index 0000000..aab9ea8
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -0,0 +1 @@
+sha256 95d7f7b075f58fedc07602fbc0e5bf5212d28deea3d09cdbcbd80992dcd18482  imx-uuc-0.5.1.tar.gz
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
new file mode 100644
index 0000000..58e749e
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# imx-uuc
+#
+################################################################################
+
+IMX_UUC_VERSION = 0.5.1
+IMX_UUC_SITE = $(FREESCALE_IMX_SITE)
+IMX_UUC_LICENSE = GPLv2+
+IMX_UUC_LICENSE_FILES = COPYING
+
+# mkfs.vfat is needed to create a FAT partition used by g_mass_storage
+# so Windows do not offer to format the device when connected to the PC.
+IMX_UUC_DEPENDENCIES = host-dosfstools
+
+define IMX_UUC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC)
+endef
+
+define IMX_UUC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/uuc $(TARGET_DIR)/usr/bin/uuc
+	$(INSTALL) -D -m 755 $(@D)/sdimage $(TARGET_DIR)/usr/bin/sdimage
+	dd if=/dev/zero of=$(TARGET_DIR)/fat bs=1M count=1
+	$(HOST_DIR)/usr/sbin/mkfs.vfat $(TARGET_DIR)/fat
+endef
+
+define IMX_UUC_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/freescale-imx/imx-uuc/S80imx-uuc \
+		$(TARGET_DIR)/etc/init.d/S80imx-uuc
+endef
+
+define IMX_UUC_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/freescale-imx/imx-uuc/imx-uuc.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/imx-uuc.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+	ln -fs ../../../../usr/lib/systemd/system/imx-uuc.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/imx-uuc.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.service b/package/freescale-imx/imx-uuc/imx-uuc.service
new file mode 100644
index 0000000..fae7fc6
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/imx-uuc.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=i.MX Universal UTP Communication Service
+After=systemd-modules-load.service
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/uuc
+
+[Install]
+WantedBy=multi-user.target
+
-- 
2.7.0
