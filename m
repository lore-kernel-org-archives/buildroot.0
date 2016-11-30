From: Nielsen, David Marqvar <david.nielsen@cobham.com>
Date: Wed, 30 Nov 2016 09:23:19 +0000
Subject: [Buildroot] [PATCH 1/1] tftpd: make installation of tftp client
	optional
Message-ID: <6A3F8AF4AF06764EBB67BDF72AE0FB4701F8E8F554@ly-ex-02.thrane.tt.ad>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Marqvar <david.nielsen@cobham.com>
---
 package/tftpd/Config.in |  8 ++++++++
 package/tftpd/tftpd.mk  | 11 ++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index ea5cb30..9d6addd 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -6,3 +6,11 @@ config BR2_PACKAGE_TFTPD
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  HPA's Trivial File Transfer Protocol (tftp) server.
+
+config BR2_PACKAGE_TFTPD_OVERRIDE_BUSYBOX_TFTP
+	bool "install tftp"
+	default y
+	depends on BR2_PACKAGE_TFTPD
+	depends on BR2_PACKAGE_BUSYBOX
+	help
+	  This will also override tftp from Busybox
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 78df835..8080f97 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -9,13 +9,18 @@ TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
 TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPTS = --without-tcpwrappers
 
-# Override BusyBox implementations if BusyBox is enabled.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+
+ifeq ($(BR2_PACKAGE_TFTPD_OVERRIDE_BUSYBOX_TFTP),y)
+# override BusyBox - install after busybox
 TFTPD_DEPENDENCIES += busybox
+define TFTPD_INSTALL_TARGET_TFTP
+	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
+endef
 endif
 
+
 define TFTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
+	$(TFTPD_INSTALL_TARGET_TFTP)
 	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
 endef
 
-- 
1.8.3.4
