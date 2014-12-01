From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:20:46 +0100
Subject: [Buildroot] [git commit] lighttpd: install init script and config
	file unconditionally
Message-ID: <20141201233009.3A45C80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa36ccd2f549b141c241bf2232dd56dedd218d9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.mk |   46 ++++++++++++++---------------------------
 1 files changed, 16 insertions(+), 30 deletions(-)

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
 
