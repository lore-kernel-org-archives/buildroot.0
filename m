From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 11 Jul 2012 00:14:36 -0400
Subject: [Buildroot] [PATCH] avahi: only install
	default.script/S05avahi-setup.sh if not present in fs skeleton
Message-ID: <1341980076-28347-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To allow custom scripts in the target skeletons.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/avahi/avahi.mk |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 32e3df7..481da03 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -144,8 +144,14 @@ AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_REMOVE_INITSCRIPT
 
 define AVAHI_INSTALL_AUTOIPD
 	rm -rf $(TARGET_DIR)/etc/dhcp3/
-	$(INSTALL) -D -m 0755 package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
-	$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
+	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
+		$(INSTALL) -m 0755 -D package/avahi/busybox-udhcpc-default.script \
+			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
+	fi
+	if [ ! -f $(TARGET_DIR)/etc/init.d/S05avahi-setup.sh ]; then \
+		$(INSTALL) -m 0755 -D package/avahi/S05avahi-setup.sh \
+			$(TARGET_DIR)/etc/init.d/S05avahi-setup.sh; \
+	fi
 	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/lib
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
-- 
1.7.9.5
