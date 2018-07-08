From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:34 +0200
Subject: [Buildroot] [PATCH 09/50 v2] package/busybox: invert dependency
 with tftpd
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <075cf57017469a74487d422359be8b3615a032b7.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/tftpd/tftpd.mk     | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 36527ce24e..270dcc1416 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_TFTPD),tftpd) \
 	$(if $(BR2_PACKAGE_TRACEROUTE),traceroute) \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 78df835aa5..c42456afd1 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -9,11 +9,6 @@ TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
 TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPTS = --without-tcpwrappers
 
-# Override BusyBox implementations if BusyBox is enabled.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-TFTPD_DEPENDENCIES += busybox
-endif
-
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
 	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
-- 
2.14.1
