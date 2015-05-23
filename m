From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:07:01 +0300
Subject: [Buildroot] [PATCH 24/38] smstools3: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <142f0a6ba96f097f1fea57227786b9cf341aedca.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/smstools3/smsd.service | 14 ++++++++++++++
 package/smstools3/smstools3.mk |  8 ++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 package/smstools3/smsd.service

diff --git a/package/smstools3/smsd.service b/package/smstools3/smsd.service
new file mode 100644
index 0000000..fd6e088
--- /dev/null
+++ b/package/smstools3/smsd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=SMS Server Tools 3
+After=syslog.target
+
+[Service]
+ExecStartPre=mkdir -p /var/spool/sms/outgoing
+ExecStartPre=mkdir -p /var/spool/sms/incoming
+ExecStartPre=mkdir -p /var/spool/sms/checked
+ExecStart=/usr/bin/smsd -c /etc/smsd.conf -s
+Restart=always
+PermissionsStartOnly=true
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index a1684de..60ca5b6 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -22,6 +22,14 @@ define SMSTOOLS3_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50smsd
 endef
 
+define SMSTOOLS3_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/smstools3/smsd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/smsd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/smsd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/smsd.service
+endef
+
 define SMSTOOLS3_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/smsd \
 		$(TARGET_DIR)/usr/bin/smsd
-- 
2.0.3
