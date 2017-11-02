From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 23:03:36 +0100
Subject: [Buildroot] [git commit] dhcpcd: add systemd start-up service
Message-ID: <20171102215619.72A248101B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e04c5d3c34961aebf254b01a2bcb8508979446aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add systemd start-up configuration for dhcpcd that is executed after
the network has been brought up.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/dhcpcd.mk      |  8 ++++++++
 package/dhcpcd/dhcpcd.service | 13 +++++++++++++
 2 files changed, 21 insertions(+)

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
