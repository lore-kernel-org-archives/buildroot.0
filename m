From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 29 May 2012 12:00:22 +0200
Subject: [Buildroot] [PATCH 2/2] Add systemd unit for lighttpd
In-Reply-To: <cover.1338285613.git.maxime.ripard@free-electrons.com>
References: <cover.1338285613.git.maxime.ripard@free-electrons.com>
Message-ID: <23dac19640ec6f2095e128c8b641ca2d5a0be8a1.1338285613.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/lighttpd/lighttpd.mk      |   11 +++++++++++
 package/lighttpd/lighttpd.service |   10 ++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/lighttpd/lighttpd.service

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 8d1f212..1f2f283 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -88,6 +88,17 @@ endef
 
 LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
 
+define LIGHTTPD_INSTALL_INIT_SYSTEMD
+	[ -f $(TARGET_DIR)/etc/systemd/system/lighttpd.service ] || \
+		$(INSTALL) -D -m 755 package/lighttpd/lighttpd.service \
+			$(TARGET_DIR)/etc/systemd/system/lighttpd.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../lighttpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
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
1.7.9.5
