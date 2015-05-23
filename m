From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:03:07 +0300
Subject: [Buildroot] [PATCH 05/38] dnsmasq: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <143b50f3978ba45e465e255cf12ceb04e82fdb53.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/dnsmasq/dnsmasq.mk      |  8 ++++++++
 package/dnsmasq/dnsmasq.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/dnsmasq/dnsmasq.service

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 4b0999b..87daabe 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -111,4 +111,12 @@ define DNSMASQ_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S80dnsmasq
 endef
 
+define DNSMASQ_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/dnsmasq/dnsmasq.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/dnsmasq.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/dnsmasq.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dnsmasq.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/dnsmasq/dnsmasq.service b/package/dnsmasq/dnsmasq.service
new file mode 100644
index 0000000..7038b22
--- /dev/null
+++ b/package/dnsmasq/dnsmasq.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=DNS cacher and DHCP server
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/dnsmasq -k
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
