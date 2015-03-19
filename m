From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 15:57:54 -0400
Subject: [Buildroot] [PATCH] thttpd: add systemd service file
Message-ID: <1426795074-9129-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on Arch service file, adjust to point to /usr/sbin.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/thttpd/thttpd.mk      |  5 +++++
 package/thttpd/thttpd.service | 10 ++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 package/thttpd/thttpd.service

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 1a028c8..565ade6 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -44,4 +44,9 @@ define THTTPD_INSTALL_INIT_SYSV
 	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
 endef
 
+define THTTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/thttpd/thttpd.service $(TARGET_DIR)/usr/lib/systemd/system/thttpd.service
+	ln -fs /usr/lib/systemd/system/thttpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/thttpd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/thttpd/thttpd.service b/package/thttpd/thttpd.service
new file mode 100644
index 0000000..e3c93e7
--- /dev/null
+++ b/package/thttpd/thttpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Tiny HTTP Daemon
+
+[Service]
+PIDFile=/run/thttpd.pid
+ExecStart=/usr/sbin/thttpd -D -C /etc/thttpd.conf
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.1.0
