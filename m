From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:04:42 +0300
Subject: [Buildroot] [PATCH 11/38] input-event-daemon: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <73247e1067366656f155dfb11120c83b7a26c470.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/input-event-daemon/input-event-daemon.mk      | 8 ++++++++
 package/input-event-daemon/input-event-daemon.service | 9 +++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/input-event-daemon/input-event-daemon.service

diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 67b8cc4..0d23037 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -27,4 +27,12 @@ define INPUT_EVENT_DAEMON_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S99input-event-daemon
 endef
 
+define INPUT_EVENT_DAEMON_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/input-event-daemon/input-event-daemon.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/input-event-daemon.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/input-event-daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/input-event-daemon.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/input-event-daemon/input-event-daemon.service b/package/input-event-daemon/input-event-daemon.service
new file mode 100644
index 0000000..d91e655
--- /dev/null
+++ b/package/input-event-daemon/input-event-daemon.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Input Event Daemon
+
+[Service]
+ExecStart=/usr/bin/input-event-daemon --no-daemon
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
