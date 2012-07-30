From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 23:12:17 +0200
Subject: [Buildroot] [git commit] Add systemd unit for lighttpd
Message-ID: <20120730211657.93D8F96FBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7eb4104b32a6cfca15c081649065659da75d9c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/lighttpd.mk      |   13 +++++++++++--
 package/lighttpd/lighttpd.service |   10 ++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

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
