From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Mon, 27 Jan 2014 18:00:05 -0800
Subject: [Buildroot] [PATCH 1/1] ntp: add systemd unit file for ntpd
Message-ID: <1390874405-25944-1-git-send-email-vsergeev@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
---
 package/ntp/ntp.mk       | 13 ++++++++++++-
 package/ntp/ntpd.service | 11 +++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 package/ntp/ntpd.service

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 40d8e4f..fe64a21 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -52,13 +52,24 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
 define NTP_INSTALL_TARGET_CMDS
 	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd)
 	test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
-	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp)
 	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
 		install -m 755 -d $(TARGET_DIR)/etc/default ; \
 		install -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
 	fi
 endef
 
+ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
+define NTP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
+endef
+
+define NTP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/etc/systemd/system/ntpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
+endef
+endif
+
 NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
 
 $(eval $(autotools-package))
diff --git a/package/ntp/ntpd.service b/package/ntp/ntpd.service
new file mode 100644
index 0000000..7964c53
--- /dev/null
+++ b/package/ntp/ntpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Network Time Service
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/run/ntpd.pid
+ExecStart=/usr/sbin/ntpd -g -p /run/ntpd.pid
+
+[Install]
+WantedBy=multi-user.target
-- 
1.8.5.3
