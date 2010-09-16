From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] gvfs: convert to new style hook,
	remove useless stripping
Message-ID: <20100916113831.F21AB8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7811b05c9be41bfe67068d71c90bb28c54165efd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gvfs/gvfs.mk |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 64e6df4..7638f54 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -69,12 +69,10 @@ else
 GVFS_CONF_OPT += --disable-samba
 endif
 
-$(eval $(call AUTOTARGETS,package,gvfs))
-
-$(GVFS_HOOK_POST_INSTALL): $(GVFS_TARGET_INSTALL_TARGET)
+define GVFS_REMOVE_USELESS_BINARY
 	rm $(TARGET_DIR)/usr/bin/gvfs-less
-ifneq ($(BR2_ENABLE_DEBUG),y)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gvfs*
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/libexec/gvfs*
-endif
-	touch $@
+endef
+
+GVFS_POST_INSTALL_TARGET_HOOKS += GVFS_REMOVE_USELESS_BINARY
+
+$(eval $(call AUTOTARGETS,package,gvfs))
-- 
1.7.1
