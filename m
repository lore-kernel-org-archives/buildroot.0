From: Peter Sanford <psanford@nearbuysystems.com>
Date: Tue,  3 Sep 2013 10:22:54 -0700
Subject: [Buildroot] [PATCH 1/1] netplug: properly install init.d script.
Message-ID: <1378228974-3369-1-git-send-email-psanford@nearbuysystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Looks like this was lost in 20d4792e.

Signed-off-by: Peter Sanford <psanford@nearbuysystems.com>
---
 package/netplug/netplug.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index fbc7a2d..36bd3f7 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -16,6 +16,13 @@ define NETPLUG_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
+define NETPLUG_INSTALL_INITSCRIPT
+	$(INSTALL) -m 0755 -D package/netplug/S29netplug \
+		$(TARGET_DIR)/etc/init.d/S29netplug
+endef
+
+NETPLUG_POST_INSTALL_TARGET_HOOKS += NETPLUG_INSTALL_INITSCRIPT
+
 define NETPLUG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/netplugd
 	rm -rf $(TARGET_DIR)/etc/netplug*
-- 
1.7.9.5
