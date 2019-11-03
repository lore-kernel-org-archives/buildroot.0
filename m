From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sun,  3 Nov 2019 17:56:29 +0100
Subject: [Buildroot] [PATCH 04/15] fix trivial packages with
 buildroot-provided services
In-Reply-To: <20191103165640.21819-1-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
Message-ID: <20191103165640.21819-5-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the packages in this list have the following properties
* units are provided by buildroot in the package directory
* the SYSTEMD_INSTALL_INIT_HOOK is exactly equivalent to what the
  [Install] section of the unit does

The fix removes the soflinking in the .mk file

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/acpid/acpid.mk                           | 3 ---
 package/apache/apache.mk                         | 3 ---
 package/babeld/babeld.mk                         | 5 -----
 package/bandwidthd/bandwidthd.mk                 | 5 -----
 package/bind/bind.mk                             | 5 -----
 package/brltty/brltty.mk                         | 4 ----
 package/chrony/chrony.mk                         | 3 ---
 package/collectd/collectd.mk                     | 3 ---
 package/darkhttpd/darkhttpd.mk                   | 3 ---
 package/dcron/dcron.mk                           | 3 ---
 package/dhcp/dhcp.mk                             | 5 -----
 package/dhcpcd/dhcpcd.mk                         | 3 ---
 package/domoticz/domoticz.mk                     | 3 ---
 package/dropbear/dropbear.mk                     | 3 ---
 package/exim/exim.mk                             | 3 ---
 package/freescale-imx/imx-uuc/imx-uuc.mk         | 3 ---
 package/haveged/haveged.mk                       | 3 ---
 package/i2pd/i2pd.mk                             | 3 ---
 package/ifupdown-scripts/ifupdown-scripts.mk     | 3 ---
 package/igd2-for-linux/igd2-for-linux.mk         | 3 ---
 package/inadyn/inadyn.mk                         | 3 ---
 package/input-event-daemon/input-event-daemon.mk | 3 ---
 package/irqbalance/irqbalance.mk                 | 3 ---
 package/iucode-tool/iucode-tool.mk               | 3 ---
 package/kodi/kodi.mk                             | 5 -----
 package/mariadb/mariadb.mk                       | 3 ---
 package/mender/mender.mk                         | 3 ---
 package/mini-snmpd/mini-snmpd.mk                 | 3 ---
 package/minidlna/minidlna.mk                     | 5 -----
 package/minissdpd/minissdpd.mk                   | 3 ---
 package/motion/motion.mk                         | 3 ---
 package/netplug/netplug.mk                       | 3 ---
 package/nginx/nginx.mk                           | 5 -----
 package/nss-pam-ldapd/nss-pam-ldapd.mk           | 3 ---
 package/ntp/ntp.mk                               | 3 ---
 package/olsr/olsr.mk                             | 3 ---
 package/openntpd/openntpd.mk                     | 3 ---
 package/openssh/openssh.mk                       | 3 ---
 package/openvmtools/openvmtools.mk               | 3 ---
 package/oracle-mysql/oracle-mysql.mk             | 3 ---
 package/postgresql/postgresql.mk                 | 3 ---
 package/proftpd/proftpd.mk                       | 3 ---
 package/psplash/psplash.mk                       | 6 ------
 package/ptpd/ptpd.mk                             | 3 ---
 package/ptpd2/ptpd2.mk                           | 3 ---
 package/pulseaudio/pulseaudio.mk                 | 3 ---
 package/python-web2py/python-web2py.mk           | 3 ---
 package/rabbitmq-server/rabbitmq-server.mk       | 5 -----
 package/redis/redis.mk                           | 3 ---
 package/rng-tools/rng-tools.mk                   | 3 ---
 package/rpcbind/rpcbind.mk                       | 3 ---
 package/rpi-userland/rpi-userland.mk             | 3 ---
 package/rygel/rygel.mk                           | 3 ---
 package/sane-backends/sane-backends.mk           | 6 ------
 package/supervisor/supervisor.mk                 | 3 ---
 package/suricata/suricata.mk                     | 3 ---
 package/tcf-agent/tcf-agent.mk                   | 3 ---
 package/thttpd/thttpd.mk                         | 3 ---
 package/ti-gfx/ti-gfx.mk                         | 3 ---
 package/tinyhttpd/tinyhttpd.mk                   | 3 ---
 package/triggerhappy/triggerhappy.mk             | 3 ---
 61 files changed, 206 deletions(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 20295aa5a4..ff6e62b5cd 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -13,9 +13,6 @@ ACPID_LICENSE_FILES = COPYING
 define ACPID_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/acpid/acpid.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/acpid.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/acpid.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/acpid.service
 endef
 
 define ACPID_INSTALL_INIT_SYSV
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 1d62538b19..22e7be8832 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -109,9 +109,6 @@ endef
 define APACHE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/apache/apache.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/apache.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/apache.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 5fbfa65485..f864b5db26 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -25,11 +25,6 @@ endef
 define BABELD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/babeld/babeld.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/babeld.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -fs ../../../../usr/lib/systemd/system/babeld.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/babeld.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index e9bc871a6a..990d8c5d8f 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -34,11 +34,6 @@ endif
 define BANDWIDTHD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/bandwidthd/bandwidthd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -sf /usr/lib/systemd/system/bandwidthd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/bandwidthd.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 08cad22d42..eece65e75f 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -111,11 +111,6 @@ endef
 define BIND_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(BIND_PKGDIR)/named.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/named.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -sf /usr/lib/systemd/system/named.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/named.service
 endef
 else
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_SERVER
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 3ae8b899b8..11b8c0d35f 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -121,10 +121,6 @@ endef
 define BRLTTY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/brltty/brltty.service \
 		   $(TARGET_DIR)/usr/lib/systemd/system/brltty.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
-	ln -fs  ../../../../usr/lib/systemd/system/brltty.service \
-		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/brltty.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index f6dcb11794..21c2d62afa 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -66,9 +66,6 @@ endef
 define CHRONY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/chrony/chrony.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/chrony.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/chrony.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 820547b511..e4ccdf7770 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -229,9 +229,6 @@ endef
 define COLLECTD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/collectd/collectd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/collectd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/collectd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/collectd.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index df80899371..f4831a9426 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -21,9 +21,6 @@ endef
 define DARKHTTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/darkhttpd/darkhttpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/darkhttpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/darkhttpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/darkhttpd.service
 endef
 
 define DARKHTTPD_INSTALL_INIT_SYSV
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 2ee0709af5..51ebb18745 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -31,9 +31,6 @@ endef
 define DCRON_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dcron/dcron.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/dcron.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dcron.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 0abb0aebd7..e0abb4ff6f 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -92,11 +92,6 @@ define DHCP_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dhcpd.service
 
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -sf ../../../../usr/lib/systemd/system/dhcpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
-
 	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
 	echo "d /var/lib/dhcp 0755 - - - -" > \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index cd20d8f9f3..63dbbee86c 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -48,9 +48,6 @@ endef
 define DHCPCD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/dhcpcd/dhcpcd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dhcpcd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/dhcpcd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpcd.service
 endef
 endif
 
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index c0568c61c6..ab560ba05f 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -78,9 +78,6 @@ endef
 define DOMOTICZ_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/domoticz/domoticz.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/domoticz.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/domoticz.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/domoticz.service
 endef
 
 $(eval $(cmake-package))
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 7cbc16bc3d..23e5e3f600 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -90,9 +90,6 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/dropbear.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
 endef
 
 ifeq ($(BR2_USE_MMU),y)
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 014565c85b..040b292a87 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -145,9 +145,6 @@ endef
 define EXIM_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/exim/exim.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/exim.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/exim.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/exim.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index 040d7bd874..2ed910cb84 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -33,9 +33,6 @@ endef
 define IMX_UUC_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/freescale-imx/imx-uuc/imx-uuc.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/imx-uuc.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
-	ln -fs ../../../../usr/lib/systemd/system/imx-uuc.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/imx-uuc.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 05b59a1685..cc834304df 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -21,9 +21,6 @@ endef
 define HAVEGED_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/haveged/haveged.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/haveged.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs /usr/lib/systemd/system/haveged.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/haveged.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 5fa815c21d..de975d66a4 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -59,9 +59,6 @@ endef
 define I2PD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/i2pd/i2pd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/i2pd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/i2pd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/i2pd.service
 endef
 
 $(eval $(cmake-package))
diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 17364aed03..abb4575777 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -48,9 +48,6 @@ endef
 define IFUPDOWN_SCRIPTS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(IFUPDOWN_SCRIPTS_PKGDIR)/network.service \
 		$(TARGET_DIR)/etc/systemd/system/network.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../network.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
index 38170b4f57..478c353997 100644
--- a/package/igd2-for-linux/igd2-for-linux.mk
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -40,9 +40,6 @@ endef
 define IGD2_FOR_LINUX_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/igd2-for-linux/upnpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/upnpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/upnpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/upnpd.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 96a37d4768..5f67849252 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -34,9 +34,6 @@ endef
 define INADYN_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/inadyn/inadyn.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/inadyn.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/inadyn.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/inadyn.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 632c9eeecb..dbe2d4bfb2 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -30,9 +30,6 @@ endef
 define INPUT_EVENT_DAEMON_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/input-event-daemon/input-event-daemon.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/input-event-daemon.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf /usr/lib/systemd/system/input-event-daemon.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/input-event-daemon.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 8e550df3bf..59ab7c5c1d 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -55,9 +55,6 @@ endef
 define IRQBALANCE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/irqbalance/irqbalance.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/irqbalance.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/irqbalance.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/irqbalance.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index e900888d7d..bddc37295c 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -21,9 +21,6 @@ endef
 define IUCODE_TOOL_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/iucode-tool/iucode.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/iucode.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/iucode.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/iucode.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 028bf551bc..86c5d33390 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -398,11 +398,6 @@ endef
 define KODI_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/kodi/kodi.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/kodi.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -fs ../../../../usr/lib/systemd/system/kodi.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/kodi.service
 endef
 
 $(eval $(cmake-package))
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 6a18db48ab..5d46502c66 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -118,9 +118,6 @@ endef
 define MARIADB_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/mariadb/mysqld.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mysqld.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/mysqld.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mysqld.service
 endef
 endif
 
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index e085d542c9..d69093d976 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -70,9 +70,6 @@ MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
 define MENDER_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mender.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/mender.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mender.service
 endef
 
 define MENDER_INSTALL_INIT_SYSV
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index f2480e3168..698402bc51 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -13,9 +13,6 @@ MINI_SNMPD_AUTORECONF = YES
 define MINI_SNMPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mini-snmpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/mini-snmpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mini-snmpd.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 262480cbff..c66e97b073 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -31,11 +31,6 @@ endef
 define MINIDLNA_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/minidlna/minidlnad.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/minidlnad.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -fs  ../../../../usr/lib/systemd/system/minidlnad.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/minidlnad.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 31d942eac5..d97eece680 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -32,9 +32,6 @@ endef
 define MINISSDPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/minissdpd/minissdpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/minissdpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/minissdpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/minissdpd.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 165e402fc8..ae58c54935 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -71,9 +71,6 @@ endef
 define MOTION_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/motion/motion.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/motion.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/motion.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/motion.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 9363a71811..b5083120f1 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -26,9 +26,6 @@ endef
 define NETPLUG_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/netplug/netplug.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/netplug.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/netplug.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/netplug.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 96f9b37bfa..83ffce5fcf 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -281,11 +281,6 @@ endef
 define NGINX_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/nginx/nginx.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/nginx.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -fs ../../../../usr/lib/systemd/system/nginx.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nginx.service
 endef
 
 define NGINX_INSTALL_INIT_SYSV
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index c094db96ac..f8358cc01d 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -29,9 +29,6 @@ endif
 define NSS_PAM_LDAPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -m 644 -D package/nss-pam-ldapd/nslcd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/nslcd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/nslcd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nslcd.service
 endef
 
 define NSS_PAM_LDAPD_INSTALL_INIT_SYSV
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index d53fcc5d0b..fb138a8fba 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -108,9 +108,6 @@ endef
 
 define NTP_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/ntpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
 endef
 endif
 
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index faff2533d9..766b1432c1 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -43,9 +43,6 @@ endef
 define OLSR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/olsr/olsr.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/olsr.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/olsr.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/olsr.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index f5a5690479..f2eaee7efd 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -24,9 +24,6 @@ OPENNTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -pthread"
 define OPENNTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/openntpd/ntpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/ntpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
 endef
 
 define OPENNTPD_INSTALL_INIT_SYSV
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 47a724d839..0411133bdc 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -74,9 +74,6 @@ endif
 define OPENSSH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openssh/sshd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/sshd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/sshd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
 	$(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
 endef
 
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index e97eaf224e..8a90aca830 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -79,9 +79,6 @@ endef
 define OPENVMTOOLS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openvmtools/vmtoolsd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/vmtoolsd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/vmtoolsd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vmtoolsd.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 0275a8428f..c33ae02033 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -116,9 +116,6 @@ endef
 define ORACLE_MYSQL_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(ORACLE_MYSQL_PKGDIR)/mysqld.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mysqld.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/mysqld.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mysqld.service
 endef
 
 else
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 58f829ee00..e89063bb28 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -128,9 +128,6 @@ endef
 define POSTGRESQL_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/postgresql/postgresql.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/postgresql.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/postgresql.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index da1c07b410..2c3e0a6877 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -123,9 +123,6 @@ endef
 define PROFTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/proftpd/proftpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/proftpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/proftpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/proftpd.service
 endef
 
 ifneq ($(BR2_PACKAGE_PROFTPD_BUFFER_SIZE),0)
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 4a2e0de5ce..3dd2f4d579 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -13,15 +13,9 @@ PSPLASH_AUTORECONF = YES
 define PSPLASH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
-	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
-	ln -sf  ../../../../usr/lib/systemd/system/psplash-start.service \
-		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/
 
 	$(INSTALL) -D -m 644 package/psplash/psplash-quit.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-quit.service
-	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf  ../../../../usr/lib/systemd/system/psplash-quit.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
 endef
 
 $(eval $(autotools-package))
diff --git a/package/ptpd/ptpd.mk b/package/ptpd/ptpd.mk
index dad8ccfe10..49587231e0 100644
--- a/package/ptpd/ptpd.mk
+++ b/package/ptpd/ptpd.mk
@@ -25,9 +25,6 @@ endef
 define PTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/ptpd/ptpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/ptpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/ptpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptpd.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index f4a70760ad..0de336464d 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -32,9 +32,6 @@ endef
 define PTPD2_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/ptpd2/ptpd2.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/ptpd2.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/ptpd2.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptpd2.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index b833d4ad27..0e78724634 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -167,9 +167,6 @@ endef
 define PULSEAUDIO_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/pulseaudio/pulseaudio.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/pulseaudio.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/pulseaudio.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/pulseaudio.service
 endef
 
 endif
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 0b86fb148e..8706c87968 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -57,9 +57,6 @@ endef
 define PYTHON_WEB2PY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/python-web2py/web2py.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/web2py.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib//systemd/system/web2py.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/web2py.service
 endef
 
 # www-data user and group are used for web2py. Because these user and group
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index 6df770793a..f9c28e6677 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -36,11 +36,6 @@ endef
 define RABBITMQ_SERVER_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/rabbitmq-server/rabbitmq-server.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rabbitmq-server.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -fs ../../../../usr/lib/systemd/system/rabbitmq-server.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rabbitmq-server.service
 endef
 
 define RABBITMQ_SERVER_INSTALL_INIT_SYSV
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a321eb9347..43ff79332c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -49,9 +49,6 @@ endef
 define REDIS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/redis/redis.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/redis.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/redis.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/redis.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index fa23b3316f..cb7b2cf8a1 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -37,9 +37,6 @@ endef
 define RNG_TOOLS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/rng-tools/rngd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rngd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/rngd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rngd.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 0f5011e522..4329c9803a 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -26,9 +26,6 @@ define RPCBIND_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.service
 	$(INSTALL) -m 0644 -D package/rpcbind/rpcbind.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.socket
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/rpcbind.socket \
-		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/rpcbind.socket
 endef
 
 define RPCBIND_INSTALL_INIT_SYSV
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 20ef2fca98..b398472d84 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -23,9 +23,6 @@ endef
 define RPI_USERLAND_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/rpi-userland/vcfiled.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/vcfiled.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/vcfiled.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vcfiled.service
 endef
 endif
 
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index 1bf3ab4350..5ffb6a9400 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -68,9 +68,6 @@ endef
 define RYGEL_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/rygel/rygel.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rygel.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/rygel.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rygel.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 092123e194..52e03da518 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -66,14 +66,8 @@ endef
 define SANE_BACKENDS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -m 0644 -D package/sane-backends/saned.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/saned.socket
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/socket.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/saned.socket \
-		$(TARGET_DIR)/etc/systemd/system/socket.target.wants/saned.socket
 	$(INSTALL) -m 0644 -D package/sane-backends/saned at .service \
 		$(TARGET_DIR)/usr/lib/systemd/system/saned at .service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/saned at .service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/saned at .service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index e99a9b18ce..424f46a7c2 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -26,9 +26,6 @@ endef
 define SUPERVISOR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/supervisor/supervisord.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/supervisord.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/supervisord.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/supervisord.service
 endef
 
 $(eval $(python-package))
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 56eb6a706f..7dc38d30cb 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -132,9 +132,6 @@ endef
 define SURICATA_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/suricata/suricata.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/suricata.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/suricata.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/suricata.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
index 5a0a991b1d..2b8a61b66f 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -24,9 +24,6 @@ TCF_AGENT_CONF_OPTS = \
 define TCF_AGENT_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/tcf-agent/tcf-agent.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/tcf-agent.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/tcf-agent.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/tcf-agent.service
 endef
 
 define TCF_AGENT_INSTALL_INIT_SYSV
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 6cf86e4b95..fe96f7df65 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -36,9 +36,6 @@ endef
 define THTTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/thttpd/thttpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/thttpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
-	ln -fs ../../../../usr/lib/systemd/system/thttpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/thttpd.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 9fad553780..2728572776 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -196,9 +196,6 @@ define TI_GFX_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/scripts/ti-gfx
 	$(INSTALL) -D -m 644 package/ti-gfx/ti-gfx.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/ti-gfx.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/ti-gfx.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ti-gfx.service
 endef
 
 define TI_GFX_INSTALL_TARGET_CMDS
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 058f6bd186..6b3ba5f305 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -27,9 +27,6 @@ endef
 define TINYHTTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/tinyhttpd/tinyhttpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/tinyhttpd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/tinyhttpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/tinyhttpd.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index 7c4bf40476..f83a557804 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -41,9 +41,6 @@ endef
 define TRIGGERHAPPY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/triggerhappy/triggerhappy.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/triggerhappy.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/triggerhappy.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/triggerhappy.service
 endef
 
 $(eval $(generic-package))
-- 
2.24.0.rc1
