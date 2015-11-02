From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 21:34:22 +0100
Subject: [Buildroot] [git commit] mosquitto: systemd support
Message-ID: <20151102203430.A658981D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e7f636c2cbc7483888fef1a032e98bdeb463fe9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosquitto/mosquitto.mk      |    8 ++++++++
 package/mosquitto/mosquitto.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

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
