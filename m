From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:48:44 +0200
Subject: [Buildroot] [git commit] imx-uuc: new package
Message-ID: <20160417204853.210AB81D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a8b94819c7a747e84b4fd02a86f437f4321b208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Thomas:
 - test return value from start-stop???daemon in init script, and
   reindent the init script
 - fix dependency of the comment
 - rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/Config.in               |  1 +
 package/freescale-imx/imx-uuc/Config.in       | 19 +++++++++++++
 package/freescale-imx/imx-uuc/S80imx-uuc      | 27 ++++++++++++++++++
 package/freescale-imx/imx-uuc/imx-uuc.hash    |  2 ++
 package/freescale-imx/imx-uuc/imx-uuc.mk      | 40 +++++++++++++++++++++++++++
 package/freescale-imx/imx-uuc/imx-uuc.service | 11 ++++++++
 6 files changed, 100 insertions(+)

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
index 0000000..d181575
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_IMX_UUC
+	bool "imx-uuc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm # Only relevant for i.MX
+	select BR2_PACKAGE_HOST_DOSFSTOOLS
+	help
+	  This package provides the Universal Adapter user-space
+	  utility that is used to receive commands from the
+	  Manufacturing Tool using the Freescale UTP Protocol.
+
+	  It requires a Freescale/NXP kernel whose configuration
+	  contains the CONFIG_FSL_UTP option.
+
+	  This package is provided by Freescale/NXP as-is and doesn't
+	  have an upstream.
+
+comment "imx-uuc needs a toolchain w/ threads"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/freescale-imx/imx-uuc/S80imx-uuc b/package/freescale-imx/imx-uuc/S80imx-uuc
new file mode 100644
index 0000000..8a02f88
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/S80imx-uuc
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+NAME=uuc
+DAEMON=/usr/bin/$NAME
+
+case "$1" in
+    start)
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -b -p /var/run/${NAME}.pid -x $DAEMON
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+    stop)
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p /var/run/${NAME}.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+    restart|reload)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
new file mode 100644
index 0000000..05501c8
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -0,0 +1,2 @@
+# Locally computed
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
