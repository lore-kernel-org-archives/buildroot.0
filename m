From: Gabe Evans <gabe@hashrabbit.co>
Date: Sat, 31 Oct 2015 21:27:17 +0000
Subject: [Buildroot] [PATCH 1/1] mosquitto: systemd support
Message-ID: <1446326837-15874-1-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/mosquitto/mosquitto.mk      |  8 ++++++++
 package/mosquitto/mosquitto.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/mosquitto/mosquitto.service

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 73365f9..efeb32d 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -83,6 +83,14 @@ define MOSQUITTO_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50mosquitto
 endef
 
+define MOSQUITTO_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/mosquitto/mosquitto.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mosquitto.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/mosquitto.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mosquitto.service
+endef
+
 define MOSQUITTO_USERS
 	mosquitto -1 nogroup -1 * - - - Mosquitto user
 endef
diff --git a/package/mosquitto/mosquitto.service b/package/mosquitto/mosquitto.service
new file mode 100644
index 0000000..2d1939d
--- /dev/null
+++ b/package/mosquitto/mosquitto.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Mosquitto MQTT broker
+
+[Service]
+ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.1
