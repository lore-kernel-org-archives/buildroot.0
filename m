From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:52:08 +0200
Subject: [Buildroot] [git commit] package/sysklogd: add systemd services
Message-ID: <20170924140311.CC6FD80DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74206149372352dc70deeaf7cd5551a1445a7ad8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sysklogd had only SYSV init scripts. Add systemd service files to start
klogd and syslogd.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sysklogd/klogd.service   | 11 +++++++++++
 package/sysklogd/sysklogd.mk     | 12 ++++++++++++
 package/sysklogd/syslogd.service | 13 +++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/package/sysklogd/klogd.service b/package/sysklogd/klogd.service
new file mode 100644
index 0000000..c66795b
--- /dev/null
+++ b/package/sysklogd/klogd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Kernel Log Daemon
+
+[Service]
+ExecStart=/usr/sbin/klogd -n
+StandardOutput=null
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
+WantedBy=syslogd.service
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index e1f0c34..1c8259a 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -32,4 +32,16 @@ define SYSKLOGD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S01logging
 endef
 
+define SYSKLOGD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(SYSKLOGD_PKGDIR)/syslogd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/syslogd.service
+	$(INSTALL) -D -m 644 $(SYSKLOGD_PKGDIR)/klogd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/klogd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/syslogd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslogd.service
+	ln -sf ../../../usr/lib/systemd/system/syslogd.service \
+		$(TARGET_DIR)/etc/systemd/system/syslog.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/sysklogd/syslogd.service b/package/sysklogd/syslogd.service
new file mode 100644
index 0000000..70e4cff
--- /dev/null
+++ b/package/sysklogd/syslogd.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=System Logging Service
+Requires=syslog.socket
+Wants=klogd.service
+
+[Service]
+ExecStart=/usr/sbin/syslogd -m 0 -n
+StandardOutput=null
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
+Alias=syslog.service
