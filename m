From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Nov 2011 23:28:30 +0100
Subject: [Buildroot] [git commit] rsyslog: only install S01rsyslog if not
	present in fs skeleton
Message-ID: <20111123222937.187D28F4CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fccc2031412d1025deda5f44c8b0a42c045f929
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To allow custom configurations.

Reported-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rsyslog/rsyslog.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 6582812..b7576cd 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -13,8 +13,9 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 endif
 
 define RSYSLOG_INSTALL_CONF_SCRIPT
-	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
-		$(TARGET_DIR)/etc/init.d/S01rsyslog
+	[ -f $(TARGET_DIR)/etc/init.d/S01rsyslog ] || \
+		$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
+			$(TARGET_DIR)/etc/init.d/S01rsyslog
 	[ -f $(TARGET_DIR)/etc/rsyslog.conf ] || \
 		$(INSTALL) -m 0644 -D $(@D)/rsyslog.conf \
 			$(TARGET_DIR)/etc/rsyslog.conf
