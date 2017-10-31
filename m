From: Markus Mayer <code@mmayer.net>
Date: Tue, 31 Oct 2017 15:36:59 -0700
Subject: [Buildroot] [PATCH 2/2] dhcpcd: add systemd start-up service
In-Reply-To: <20171031223659.6831-1-code@mmayer.net>
References: <20171031223659.6831-1-code@mmayer.net>
Message-ID: <20171031223659.6831-3-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

Add systemd start-up configuration for dhcpcd that is executed after
the network has been brought up.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/dhcpcd/dhcpcd.mk      |  8 ++++++++
 package/dhcpcd/dhcpcd.service | 13 +++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/dhcpcd/dhcpcd.service

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index cf1da4f..dc5c69b 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -41,6 +41,14 @@ define DHCPCD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S41dhcpcd
 endef
 
+define DHCPCD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/dhcpcd/dhcpcd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/dhcpcd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/dhcpcd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpcd.service
+endef
+
 # NOTE: Even though this package has a configure script, it is not generated
 # using the autotools, so we have to use the generic package infrastructure.
 
diff --git a/package/dhcpcd/dhcpcd.service b/package/dhcpcd/dhcpcd.service
new file mode 100644
index 0000000..0552b5c
--- /dev/null
+++ b/package/dhcpcd/dhcpcd.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=DHCP client
+After=network.target
+
+[Service]
+Type=forking
+EnvironmentFile=-/etc/default/dhcpcd
+PIDFile=/var/run/dhcpcd.pid
+ExecStart=/sbin/dhcpcd $DAEMON_ARGS
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
