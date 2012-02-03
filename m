From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  3 Feb 2012 15:27:26 +0100
Subject: [Buildroot] [PATCH 4/5] Add systemd unit for lighttpd
In-Reply-To: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1328279247-7277-5-git-send-email-maxime.ripard@free-electrons.com>
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
