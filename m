From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:14:18 +0300
Subject: [Buildroot] [PATCH 35/38] supervisor: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <90fc7e95622b1b99fc97114e32d84798004f5afa.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running supervisord under systemd sounds wrong, but it is possible
and probably makes sense in some cases.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/supervisor/supervisor.mk       |  8 ++++++++
 package/supervisor/supervisord.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/supervisor/supervisord.service

diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 6bd64a9..43940e3 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -22,4 +22,12 @@ define SUPERVISOR_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S99supervisord
 endef
 
+define SUPERVISOR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/supervisor/supervisord.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/supervisord.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/supervisord.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/supervisord.service
+endef
+
 $(eval $(python-package))
diff --git a/package/supervisor/supervisord.service b/package/supervisor/supervisord.service
new file mode 100644
index 0000000..92c38c7
--- /dev/null
+++ b/package/supervisor/supervisord.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Process Control System
+After=syslog.target
+
+[Service]
+ExecStart=/usr/bin/supervisord -n
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
