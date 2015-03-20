From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:13:55 -0400
Subject: [Buildroot] [PATCH v2 04/25] psplash: move systemd service files to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-5-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/psplash/psplash.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 5901547..0e78c8c 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -10,16 +10,18 @@ PSPLASH_LICENSE = GPLv2+
 PSPLASH_AUTORECONF = YES
 
 define PSPLASH_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
 	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
-		$(TARGET_DIR)/etc/systemd/system/psplash-start.service
-	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
-	ln -sf  ../psplash-start.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
+	$(INSTALL) -d $(TARGET_DIR)/usr/lib/systemd/system/sysinit.target.wants
+	ln -sf  ../../../../usr/lib/systemd/system/psplash-start.service \
 		 $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/
 
 	$(INSTALL) -D -m 644 package/psplash/psplash-quit.service \
-		$(TARGET_DIR)/etc/systemd/system/psplash-quit.service
+		$(TARGET_DIR)/usr/lib/systemd/system/psplash-quit.service
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf  ../psplash-quit.service \
+	ln -sf  ../../../../usr/lib/systemd/system/psplash-quit.service \
 		 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
 endef
 
-- 
2.1.0
