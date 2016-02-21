From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:28:43 +0100
Subject: [Buildroot] [git commit] collectd: Add service file
Message-ID: <20160302202755.6E7D77FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f18274a92e4db5c4cac1c248a40cbd3be91db7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The service file was taken from Debian.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/collectd.mk      |  8 ++++++++
 package/collectd/collectd.service | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)

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
