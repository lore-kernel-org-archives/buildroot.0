From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 17 Sep 2016 13:58:37 +0200
Subject: [Buildroot] [RFC: PATCH 1/3] systemd: configure DHCP via networkd
In-Reply-To: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1474113519-24713-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If systemd-networkd is enabled and $BR2_SYSTEM_DHCP is set, then create
a .network file to configure the selected network interface via DHCP.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fb07819..5062750 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -275,6 +275,18 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
 endef
+SYSTEMD_NETWORK_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
+ifneq ($(SYSTEMD_NETWORK_DHCP_IFACE),)
+define SYSTEMD_INSTALL_NETWORK_CONFS
+	( \
+		echo "[Match]"; \
+		echo "Name=$(SYSTEMD_NETWORK_DHCP_IFACE)"; \
+		echo; \
+		echo "[Network]"; \
+		echo "DHCP=ipv4"; \
+	) > $(TARGET_DIR)/etc/systemd/network/dhcp.network
+endef
+endif
 else
 SYSTEMD_CONF_OPTS += --disable-networkd
 define SYSTEMD_INSTALL_SERVICE_NETWORK
@@ -377,6 +389,7 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_INSTALL_SERVICE_TTY)
 	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
 	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
+	$(SYSTEMD_INSTALL_NETWORK_CONFS)
 endef
 
 $(eval $(autotools-package))
-- 
2.4.11
