From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 08:52:31 -0500
Subject: [Buildroot] [PATCH] package/swupdate: Add basic systemd service
Message-ID: <20200414135231.27737-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <sam.voss@rockwellcollins.com>

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/swupdate/swupdate.mk      | 10 ++++++++++
 package/swupdate/swupdate.service | 17 +++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 package/swupdate/swupdate.service

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 2b51edb66d..2300220d93 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -189,4 +189,14 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
+define SWUPDATE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/swupdate.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/swupdate.service
+endef
+endif
+
 $(eval $(kconfig-package))
diff --git a/package/swupdate/swupdate.service b/package/swupdate/swupdate.service
new file mode 100644
index 0000000000..cb065a0414
--- /dev/null
+++ b/package/swupdate/swupdate.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=SWUpdate daemon
+Documentation=https://github.com/sbabic/swupdate
+Documentation=https://sbabic.github.io/swupdate
+
+[Service]
+# Default environment variables in case /etc/default/swupdate isn't providing them
+Environment=SWU_POST_UPDATE_CMD="touch /tmp/.swu_complete"
+Environment=SWU_WEBSERVER_ARGS="-p 8080 -r /var/www/swupdate/"
+
+# Always take what is in the environment files when exists
+EnvironmentFile=/etc/default/swupdate
+
+ExecStart=/usr/bin/swupdate ${SWU_KEY_ARGS} -p ${SWU_POST_UPDATE_CMD} -v -L -w "${SWU_WEBSERVER_ARGS}"
+
+[Install]
+WantedBy=multi-user.target
-- 
2.18.0
