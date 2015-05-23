From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:13:37 +0300
Subject: [Buildroot] [PATCH 31/38] transmission: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <34ef01e3789585c066c0db5b3e7d0007bad06b14.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/transmission/transmission.mk      |  8 ++++++++
 package/transmission/transmission.service | 11 +++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/transmission/transmission.service

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index bbc32bf..7587a6a 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -41,6 +41,14 @@ define TRANSMISSION_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S92transmission
 endef
 
+define TRANSMISSION_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/transmission/transmission.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/transmission.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/transmission.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/transmission.service
+endef
+
 else
 TRANSMISSION_CONF_OPTS += --disable-daemon
 endif
diff --git a/package/transmission/transmission.service b/package/transmission/transmission.service
new file mode 100644
index 0000000..0cc22be
--- /dev/null
+++ b/package/transmission/transmission.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Transmission BitTorrent Daemon
+After=network.target
+
+[Service]
+User=transmission
+ExecStart=/usr/bin/transmission-daemon -f --log-error
+ExecReload=/bin/kill -s HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
