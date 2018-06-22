From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Jun 2018 23:08:58 +0200
Subject: [Buildroot] [PATCH 1/1] apache: add systemd init script
Message-ID: <20180622210858.18807-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apache/apache.mk      |  8 ++++++++
 package/apache/apache.service | 13 +++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/apache/apache.service

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index f4c522916e..6ebd30ca40 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -97,4 +97,12 @@ define APACHE_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50apache
 endef
 
+define APACHE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/apache/apache.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/apache.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/apache.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/apache/apache.service b/package/apache/apache.service
new file mode 100644
index 0000000000..b8747e2658
--- /dev/null
+++ b/package/apache/apache.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Apache HTTP Server
+After=network.target
+
+[Service]
+Type=forking
+ExecStart=/usr/bin/apachectl start
+ExecReload=/usr/bin/apachectl graceful
+ExecStop=/usr/bin/apachectl stop
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.14.1
