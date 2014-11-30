From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:44 +0100
Subject: [Buildroot] [PATCHv3 56/74] lighttpd: install init script and
	config file unconditionally
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-57-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/lighttpd.mk | 46 +++++++++++++++-----------------------------
 1 file changed, 16 insertions(+), 30 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index ef98298..804bdd4 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -62,44 +62,30 @@ endif
 define LIGHTTPD_INSTALL_CONFIG
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
-
-	[ -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ] || \
-		$(INSTALL) -D -m 755 $(@D)/doc/config/lighttpd.conf \
-			$(TARGET_DIR)/etc/lighttpd/lighttpd.conf
-
-	[ -f $(TARGET_DIR)/etc/lighttpd/modules.conf ] || \
-		$(INSTALL) -D -m 755 $(@D)/doc/config/modules.conf \
-			$(TARGET_DIR)/etc/lighttpd/modules.conf
-
-	[ -f $(TARGET_DIR)/etc/lighttpd/conf.d/access_log.conf ] || \
-		$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/access_log.conf \
-			$(TARGET_DIR)/etc/lighttpd/conf.d/access_log.conf
-
-	[ -f $(TARGET_DIR)/etc/lighttpd/conf.d/debug.conf ] || \
-		$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/debug.conf \
-			$(TARGET_DIR)/etc/lighttpd/conf.d/debug.conf
-
-	[ -f $(TARGET_DIR)/etc/lighttpd/conf.d/dirlisting.conf ] || \
-		$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/dirlisting.conf \
-			$(TARGET_DIR)/etc/lighttpd/conf.d/dirlisting.conf
-
-	[ -f $(TARGET_DIR)/etc/lighttpd/conf.d/mime.conf ] || \
-		$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/mime.conf \
-			$(TARGET_DIR)/etc/lighttpd/conf.d/mime.conf
+	$(INSTALL) -D -m 755 $(@D)/doc/config/lighttpd.conf \
+		$(TARGET_DIR)/etc/lighttpd/lighttpd.conf
+	$(INSTALL) -D -m 755 $(@D)/doc/config/modules.conf \
+		$(TARGET_DIR)/etc/lighttpd/modules.conf
+	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/access_log.conf \
+		$(TARGET_DIR)/etc/lighttpd/conf.d/access_log.conf
+	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/debug.conf \
+		$(TARGET_DIR)/etc/lighttpd/conf.d/debug.conf
+	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/dirlisting.conf \
+		$(TARGET_DIR)/etc/lighttpd/conf.d/dirlisting.conf
+	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/mime.conf \
+		$(TARGET_DIR)/etc/lighttpd/conf.d/mime.conf
 endef
 
 LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
 
 define LIGHTTPD_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S50lighttpd ] || \
-		$(INSTALL) -D -m 755 package/lighttpd/S50lighttpd \
-			$(TARGET_DIR)/etc/init.d/S50lighttpd
+	$(INSTALL) -D -m 755 package/lighttpd/S50lighttpd \
+		$(TARGET_DIR)/etc/init.d/S50lighttpd
 endef
 
 define LIGHTTPD_INSTALL_INIT_SYSTEMD
-	[ -f $(TARGET_DIR)/etc/systemd/system/lighttpd.service ] || \
-		$(INSTALL) -D -m 644 package/lighttpd/lighttpd.service \
-			$(TARGET_DIR)/etc/systemd/system/lighttpd.service
+	$(INSTALL) -D -m 644 package/lighttpd/lighttpd.service \
+		$(TARGET_DIR)/etc/systemd/system/lighttpd.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-- 
2.1.0
