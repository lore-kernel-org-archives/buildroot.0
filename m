From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:25:14 +0100
Subject: [Buildroot] [git commit] rsyslog: install init script and config
	file unconditionally
Message-ID: <20141201233009.553AF80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a6482db88fc9f6076bc25f9b2b9defadc8fc809
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Also, we take this opportunity to rename RSYSLOG_INSTALL_CONF_SCRIPT
to RSYSLOG_INSTALL_CONF because it is no longer installing an init
script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index d7dc930..6b72bb5 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -39,18 +39,16 @@ else
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S01rsyslog ] || \
-		$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
-			$(TARGET_DIR)/etc/init.d/S01rsyslog
+	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
+		$(TARGET_DIR)/etc/init.d/S01rsyslog
 endef
 
-define RSYSLOG_INSTALL_CONF_SCRIPT
-	[ -f $(TARGET_DIR)/etc/rsyslog.conf ] || \
-		$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
-			$(TARGET_DIR)/etc/rsyslog.conf
+define RSYSLOG_INSTALL_CONF
+	$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
+		$(TARGET_DIR)/etc/rsyslog.conf
 	mkdir -p $(TARGET_DIR)/etc/rsyslog.d
 endef
 
-RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF_SCRIPT
+RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF
 
 $(eval $(autotools-package))
