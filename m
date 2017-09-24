From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:50:29 +0200
Subject: [Buildroot] [git commit] package/rsyslog: fix wrong symlink for
	systemd service
Message-ID: <20170924140311.BF30B80DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f8163a5ca9a3baa8f2bf02f82acb6e12be9008e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symlink to /etc/systemd/system/syslog.service was pointing 4 levels up
to /usr/lib instead of 3 levels up.

This wasn't an issue on the actual system (/../ equals to / ) but was causing a
deadlink in the TARGET directory.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
 
