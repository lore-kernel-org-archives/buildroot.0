From: Petr Kulhavy <brain@jikos.cz>
Date: Wed, 20 Sep 2017 12:10:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: fix wrong symlink for
	systemd service
Message-ID: <1505902234-4876-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The symlink to /etc/systemd/system/syslog.service was pointing 4 levels up
to /usr/lib instead of 3 levels up.

This wasn't an issue on the actual system (/../ equals to / ) but was causing a
deadlink in the TARGET directory.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
---
 package/rsyslog/rsyslog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index bbf7d95..e32505b 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -91,7 +91,7 @@ define RSYSLOG_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../usr/lib/systemd/system/rsyslog.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rsyslog.service
-	ln -sf ../../../../usr/lib/systemd/system/rsyslog.service \
+	ln -sf ../../../usr/lib/systemd/system/rsyslog.service \
 		$(TARGET_DIR)/etc/systemd/system/syslog.service
 endef
 
-- 
2.7.4
