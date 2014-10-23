From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 22:11:44 +0200
Subject: [Buildroot] [git commit] tftpd: install TFTP client as well
Message-ID: <20141023201255.D3E09B07BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0659ca799fe0b8945880fb768364a6e7721b132e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch installs TFTP client as well and overrides BusyBox
implementations if BusyBox is enabled.

[Thomas: fix typo SYSKLOGD_DEPENDENCIES -> TFTPD_DEPENDENCIES noticed
by Baruch.]

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tftpd/tftpd.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index c8457db..816a25e 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -13,7 +13,13 @@ ifneq ($(BR2_INET_IPV6),y)
 TFTPD_CONF_OPTS += --without-ipv6
 endif
 
+# Override BusyBox implementations if BusyBox is enabled.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+TFTPD_DEPENDENCIES += busybox
+endif
+
 define TFTPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
 	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
 	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
 endef
