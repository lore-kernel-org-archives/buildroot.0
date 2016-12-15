From: Adam Duskett <Adamduskett@outlook.com>
Date: Thu, 15 Dec 2016 21:21:20 +0000
Subject: [Buildroot] [PATCH 1/1] audit: Add systemd service.
Message-ID: <MWHPR19MB144029FE09AB17378DD835C2B99D0@MWHPR19MB1440.namprd19.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the auditd.service file needed to start auditd
during boot on devices running systemd.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/audit/audit.mk       | 10 ++++++++++
 package/audit/auditd.service | 24 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 package/audit/auditd.service

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 0e5bd27..313ebec 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -37,6 +37,16 @@ else
 AUDIT_CONF_OPTS += --disable-systemd
 endif
 
+define AUDIT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/audit/audit.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/audit.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/audit.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/audit.service
+endef
+
 define AUDIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/audit/S01auditd $(TARGET_DIR)/etc/init.d/S01auditd
 endef
diff --git a/package/audit/auditd.service b/package/audit/auditd.service
new file mode 100644
index 0000000..3fe3aa8
--- /dev/null
+++ b/package/audit/auditd.service
@@ -0,0 +1,24 @@
+[Unit]
+Description=Security Auditing Service
+DefaultDependencies=no
+After=local-fs.target systemd-tmpfiles-setup.service
+Conflicts=shutdown.target
+Before=sysinit.target shutdown.target
+RefuseManualStop=yes
+ConditionKernelCommandLine=!audit=0
+Documentation=man:auditd(8) https://people.redhat.com/sgrubb/audit/
+
+[Service]
+ExecStart=/sbin/auditd -n
+## To not use augenrules, copy this file to /etc/systemd/system/auditd.service
+## and comment/delete the next line and uncomment the auditctl line.
+## NOTE: augenrules expect any rules to be added to /etc/audit/rules.d/
+ExecStartPost=-/sbin/augenrules --load
+#ExecStartPost=-/sbin/auditctl -R /etc/audit/audit.rules
+ExecReload=/bin/kill -HUP $MAINPID
+# By default we don't clear the rules on exit. To enable this, uncomment
+# the next line after copying the file to /etc/systemd/system/auditd.service
+#ExecStopPost=/sbin/auditctl -R /etc/audit/audit-stop.rules
+
+[Install]
+WantedBy=multi-user.target
-- 
2.9.3
