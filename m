From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 16:06:44 +0200
Subject: [Buildroot] [git commit] audit: Add systemd support
Message-ID: <20151011140707.3DDA881D64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bdd9724ee66eb1dad514afad1f0e1cefbfdb8d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main .service file is installed by audit.
We are using tmpfiles mechanisms to create the log directory, which
would not exists otherwise since /var/log points to /tmp

[Thomas: add explicit --disable-systemd when systemd is not used.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/audit.mk            |   16 ++++++++++++++++
 package/audit/audit_tmpfiles.conf |    1 +
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 7548135..329f8c5 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -31,10 +31,26 @@ ifeq ($(BR2_aarch64),y)
 AUDIT_CONF_OPTS += --with-aarch64
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+AUDIT_CONF_OPTS += --enable-systemd
+else
+AUDIT_CONF_OPTS += --disable-systemd
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
