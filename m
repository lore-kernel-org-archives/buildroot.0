From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:38 -0000
Subject: [Buildroot] [git commit branch/next] input-event-daemon: systemd
	support
Message-ID: <20150808105631.1F9197FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=030fc25c9200cf48a5fd68aaea8d8decde443360
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/input-event-daemon/input-event-daemon.mk   |    8 ++++++++
 .../input-event-daemon/input-event-daemon.service  |    9 +++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

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
