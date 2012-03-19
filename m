From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 19 Mar 2012 16:59:40 +0100
Subject: [Buildroot] [PATCH 6/6] Add systemd unit for lighttpd
In-Reply-To: <cover.1332172636.git.maxime.ripard@free-electrons.com>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
Message-ID: <b405dff28f234161c91302a003a361dd3e162a11.1332172636.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/lighttpd/lighttpd.mk      |   11 +++++++++++
 package/lighttpd/lighttpd.service |   10 ++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/lighttpd/lighttpd.service

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 58617a6..966b787 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -89,6 +89,17 @@ endef
 
 LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
 
+define LIGHTTPD_INSTALL_INIT_SYSTEMD
+[ -f $(TARGET_DIR)/etc/systemd/system/lighttpd.service ] || \
+	$(INSTALL) -D -m 755 package/lighttpd/lighttpd.service \
+		$(TARGET_DIR)/etc/systemd/system/lighttpd.service
+
+mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+ln -fs ../lighttpd.service \
+	$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
+endef
+
 define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
diff --git a/package/lighttpd/lighttpd.service b/package/lighttpd/lighttpd.service
new file mode 100644
index 0000000..0ca5357
--- /dev/null
+++ b/package/lighttpd/lighttpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Lighttpd Web Server
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/lighttpd-angel -f /etc/lighttpd/lighttpd.conf -D
+ExecReload=/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.5.4
