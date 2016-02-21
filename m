From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 21 Feb 2016 14:09:15 +0100
Subject: [Buildroot] [PATCH 2/2] collectd: Add service file
In-Reply-To: <1456060155-27515-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1456060155-27515-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1456060155-27515-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The service file was taken from Debian.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/collectd/collectd.mk      |  8 ++++++++
 package/collectd/collectd.service | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 package/collectd/collectd.service

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index eb66f25..78e24b8 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -185,4 +185,12 @@ define COLLECTD_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
 endef
 
+define COLLECTD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/collectd/collectd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/collectd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/collectd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/collectd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/collectd/collectd.service b/package/collectd/collectd.service
new file mode 100644
index 0000000..e203806
--- /dev/null
+++ b/package/collectd/collectd.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Statistics collection and monitoring daemon
+After=local-fs.target network.target
+Requires=local-fs.target network.target
+ConditionPathExists=/etc/collectd.conf
+
+[Service]
+Type=notify
+NotifyAccess=main
+EnvironmentFile=-/etc/default/collectd
+ExecStartPre=/usr/sbin/collectd -t
+ExecStart=/usr/sbin/collectd
+Restart=always
+RestartSec=10
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.0
