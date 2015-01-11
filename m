From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 11 Jan 2015 13:31:34 +0800
Subject: [Buildroot] [PATCH] bandwidthd: Add systemd unit file and install
	it to run at startup.
Message-ID: <1420954296-27101-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/bandwidthd/bandwidthd.mk      | 10 ++++++++++
 package/bandwidthd/bandwidthd.service | 11 +++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/bandwidthd/bandwidthd.service

diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index ca991f9..2773490 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -31,4 +31,14 @@ else
 BANDWIDTHD_CONF_OPTS += --with-sqlite-storage=false
 endif
 
+define BANDWIDTHD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/bandwidthd/bandwidthd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf /usr/lib/systemd/system/bandwidthd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/bandwidthd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/bandwidthd/bandwidthd.service b/package/bandwidthd/bandwidthd.service
new file mode 100644
index 0000000..9c03d42
--- /dev/null
+++ b/package/bandwidthd/bandwidthd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Bandwidth usage monitor and reporter
+After=network.target
+
+[Service]
+Type=forking
+ExecStart=/usr/bin/bandwidthd
+PIDFile=/var/run/bandwidthd.pid
+
+[Install]
+WantedBy=multi-user.target
-- 
2.1.4
