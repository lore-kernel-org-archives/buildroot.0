From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Thu, 23 Oct 2014 19:13:24 +0800
Subject: [Buildroot]  [PATCH] tftpd: Install TFTP client as well
Message-ID: <1414062804-11701-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch installs TFTP client as well and overrides
BusyBox implementations if BusyBox is enabled.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 package/tftpd/tftpd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index c8457db..74e7cfa 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -13,7 +13,13 @@ ifneq ($(BR2_INET_IPV6),y)
 TFTPD_CONF_OPTS += --without-ipv6
 endif
 
+# Override BusyBox implementations if BusyBox is enabled.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+SYSKLOGD_DEPENDENCIES = busybox
+endif
+
 define TFTPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
 	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
 	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
 endef
-- 
1.9.1
