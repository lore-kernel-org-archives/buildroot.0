From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jul 2011 21:03:37 +0200
Subject: [Buildroot] [git commit] busybox: only install S01logging if
	syslogd applet is enabled
Message-ID: <20110704191002.1D1B48A31E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=abf7af17e95855e9fe2535729f7d83fce603463f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 4931b07..509c3bb 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -123,8 +123,10 @@ endef
 endif
 
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
-	$(INSTALL) -m 0755 -D package/busybox/S01logging \
-		$(TARGET_DIR)/etc/init.d/S01logging
+	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
+		$(INSTALL) -m 0755 -D package/busybox/S01logging \
+			$(TARGET_DIR)/etc/init.d/S01logging; \
+	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
 
 # We do this here to avoid busting a modified .config in configure
-- 
1.7.3.4
