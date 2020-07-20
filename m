From: Marco Oliverio <marco.oliverio@tanaza.com>
Date: Mon, 20 Jul 2020 12:22:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/hostapd: add support for hostapd_cli
Message-ID: <20200720102247.9780-1-marco.oliverio@tanaza.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marco Oliverio <marco.oliverio@tanaza.com>
---
 package/hostapd/Config.in  | 6 ++++++
 package/hostapd/hostapd.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 54d2086c09..185fa04626 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -111,4 +111,10 @@ comment "netlink-based VLAN support needs a toolchain w/ threads"
 
 endif # BR2_PACKAGE_HOSTAPD_VLAN
 
+config BR2_PACKAGE_HOSTAPD_HOSTAPD_CLI
+	bool "Install hostapd_cli"
+	default n
+	help
+	  Install hostapd command-line interface
+
 endif
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index b94a0e4578..d65e4b03fd 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -144,4 +144,12 @@ define HOSTAPD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/hostapd.conf
 endef
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_HOSTAPD_CLI),y)
+define HOSTAPD_INSTALL_TARGET_CMDS +=
+
+	$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
+		$(TARGET_DIR)/usr/sbin/hostapd_cli
+endef
+endif
+
 $(eval $(generic-package))
-- 
2.27.0
