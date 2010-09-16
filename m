From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] nbd: use new style hook
Message-ID: <20100916113833.318078AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3d8ed998de6af8e3baf8ea9889a334f532c3e3eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nbd/nbd.mk |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index fa8dd4f..a09b10b 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -10,13 +10,17 @@ NBD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
 
-$(eval $(call AUTOTARGETS,package,nbd))
-
-$(NBD_HOOK_POST_INSTALL): $(NBD_TARGET_INSTALL_TARGET)
 ifneq ($(BR2_NBD_CLIENT),y)
-	rm -f $(TARGET_DIR)/usr/sbin/nbd-client
+	NBD_TOREMOVE += nbd-client
 endif
 ifneq ($(BR2_NBD_SERVER),y)
-	rm -f $(TARGET_DIR)/usr/bin/nbd-server
+	NBD_TOREMOVE += nbd-server
 endif
-	touch $@
+
+define NBD_CLEANUP_AFTER_INSTALL
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(NBD_TOREMOVE))
+endef
+
+NBD_POST_INSTALL_TARGET_HOOKS += NBD_CLEANUP_AFTER_INSTALL
+
+$(eval $(call AUTOTARGETS,package,nbd))
-- 
1.7.1
