From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 28 Jul 2012 09:21:21 +0200
Subject: [Buildroot] [PATCH 2/3] Add systemd unit for lighttpd
In-Reply-To: <cover.1343460025.git.maxime.ripard@free-electrons.com>
References: <cover.1343460025.git.maxime.ripard@free-electrons.com>
Message-ID: <fe9f2d2a9291b2817f1a9eb8e05600d6f2b17ac7.1343460025.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/lighttpd/lighttpd.mk      |   13 +++++++++++--
 package/lighttpd/lighttpd.service |   10 ++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 package/lighttpd/lighttpd.service

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 9f554cb..c9decb1 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -87,13 +87,22 @@ endef
 
 LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
 
-define LIGHTTPD_INSTALL_INIT_SCRIPT
+define LIGHTTPD_INSTALL_INIT_SYSV
 	[ -f $(TARGET_DIR)/etc/init.d/S50lighttpd ] || \
 		$(INSTALL) -D -m 755 package/lighttpd/S50lighttpd \
 			$(TARGET_DIR)/etc/init.d/S50lighttpd
 endef
 
-LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_INIT_SCRIPT
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
 
 define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd
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
