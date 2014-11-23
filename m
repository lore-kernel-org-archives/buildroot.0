From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:42 +0100
Subject: [Buildroot] [PATCH 10/51] stunnel: use the <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the existing STUNNEL_INSTALL_CONF_SCRIPT hook no longer installs
the init script, we rename it to STUNNEL_INSTALL_CONF.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stunnel/stunnel.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index dc56261..ac2963e 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -18,14 +18,17 @@ else
 STUNNEL_CONF_OPTS += --disable-systemd
 endif
 
-define STUNNEL_INSTALL_CONF_SCRIPT
-	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
+define STUNNEL_INSTALL_CONF
 	[ -f $(TARGET_DIR)/etc/stunnel/stunnel.conf ] || \
 		$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf \
 			$(TARGET_DIR)/etc/stunnel/stunnel.conf
 	rm -f $(TARGET_DIR)/etc/stunnel/stunnel.conf-sample
 endef
 
-STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF_SCRIPT
+STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF
+
+define STUNNEL_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
+endef
 
 $(eval $(autotools-package))
-- 
2.1.0
