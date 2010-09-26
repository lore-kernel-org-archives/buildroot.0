From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 22:25:06 +0200
Subject: [Buildroot] [git commit master 1/1] fbset: misc cleanup
Message-ID: <20100926202614.3FA258B6B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=789f61379afa8d065edeb6f876e9d0025c4f4fe5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use install -D so it doesn't fail if usr/sbin doesn't exist, remove
unneeded stripping and move target cleanup to _UNINSTALL_TARGET_CMDS.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbset/fbset.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 748920d..8926f4c 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -6,20 +6,20 @@
 FBSET_VERSION = 2.1
 FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
-FBSET_BINARY = fbset
-FBSET_TARGET_BINARY = usr/sbin/$(FBSET_BINARY)
 
 define FBSET_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define FBSET_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 $(@D)/$(FBSET_BINARY) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
+	$(INSTALL) -D -m 755 $(@D)/fbset $(TARGET_DIR)/usr/sbin/fbset
+endef
+
+define FBSET_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/fbset
 endef
 
 define FBSET_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
 	-$(MAKE) -C $(@D) clean
 endef
 
-- 
1.7.1
