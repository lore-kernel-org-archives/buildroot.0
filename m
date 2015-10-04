From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Oct 2015 19:29:34 +0200
Subject: [Buildroot] [PATCH] audit: Add systemd support
Message-ID: <1443979774-13743-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The main .service file is installed by audit.
We are using tmpfiles mechanisms to create the log directory, which
would not exists otherwise since /var/log points to /tmp

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/audit/audit.mk            | 14 ++++++++++++++
 package/audit/audit_tmpfiles.conf |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 package/audit/audit_tmpfiles.conf

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index d736070..2f601c2 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -34,10 +34,24 @@ ifeq ($(BR2_aarch64),y)
 AUDIT_CONF_OPTS += --with-aarch64
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+AUDIT_CONF_OPTS += --enable-systemd
+endif
+
 define AUDIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/audit/S01auditd $(TARGET_DIR)/etc/init.d/S01auditd
 endef
 
+define AUDIT_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/auditd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/auditd.service
+
+	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
+	$(INSTALL) -D -m 644 package/audit/audit_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
+endef
+
 define AUDIT_INSTALL_CLEANUP
 	$(RM) -rf $(TARGET_DIR)/etc/rc.d
 	$(RM) -rf $(TARGET_DIR)/etc/sysconfig
diff --git a/package/audit/audit_tmpfiles.conf b/package/audit/audit_tmpfiles.conf
new file mode 100644
index 0000000..6b8325b
--- /dev/null
+++ b/package/audit/audit_tmpfiles.conf
@@ -0,0 +1 @@
+d /var/log/audit 0755 - -
-- 
2.5.3
