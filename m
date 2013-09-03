From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Sep 2013 00:16:50 +0200
Subject: [Buildroot] [git commit] netplug: properly install init.d script.
Message-ID: <20130903222437.518A29AF97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e20d072ae2ceef8d5b54022616c8f6bcd194e7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Looks like this was lost in 20d4792e.

[Peter: use _INSTALL_INIT_SYSV, explicitly delete script on uninstall]
Signed-off-by: Peter Sanford <psanford@nearbuysystems.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netplug/netplug.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index fbc7a2d..fdb1937 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -16,10 +16,15 @@ define NETPLUG_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
+define NETPLUG_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/netplug/S29netplug \
+		$(TARGET_DIR)/etc/init.d/S29netplug
+endef
+
 define NETPLUG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/netplugd
 	rm -rf $(TARGET_DIR)/etc/netplug*
-	rm -f $(TARGET_DIR)/etc/init.d/S*netplug
+	rm -f $(TARGET_DIR)/etc/init.d/S29netplug
 endef
 
 define NETPLUG_CLEAN_CMDS
