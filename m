From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 09:51:59 +0200
Subject: [Buildroot] [git commit] apache: add systemd init script
Message-ID: <20180623080216.5494F7FE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ce4028d5ff53acc56c6f07b4c63ccc9105004d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.mk      |  8 ++++++++
 package/apache/apache.service | 13 +++++++++++++
 2 files changed, 21 insertions(+)

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
