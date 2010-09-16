From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] dmraid: remove useless strip
	and use correct step override method
Message-ID: <20100916113828.959338AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=020e028108d53c14ae257c8a643aa2d22ac00f4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the target installation step, do not rely on the package being
installed in the staging directory, as it may not be true. So the
dmraid binary is directly taken from the build directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmraid/dmraid.mk |   24 +++++++-----------------
 1 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 93d6561..ccd6a36 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -12,23 +12,13 @@ DMRAID_MAKE = $(MAKE1)
 DMRAID_DEPENDENCIES:=lvm2
 DMRAID_INSTALL_STAGING:=yes
 
-$(eval $(call AUTOTARGETS,package,dmraid))
-
-$(DMRAID_TARGET_INSTALL_TARGET): $(DMRAID_TARGET_INSTALL_STAGING)
-	$(call MESSAGE,"Installing to target")
-	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/sbin/dmraid $(TARGET_DIR)/usr/sbin
+define DMRAID_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/$(DMRAID_SUBDIR)/tools/dmraid $(TARGET_DIR)/usr/sbin
 	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/dmraid
-	touch $@
-
-ifeq ($(BR2_ENABLE_DEBUG),)
-$(DMRAID_HOOK_POST_INSTALL): $(DMRAID_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/dmraid
-	touch $@
-endif
+endef
 
-$(DMRAID_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
-#	makefile has no uninstall target..
-#	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DMRAID_DIR) uninstall
+define DMRAID_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/dmraid $(TARGET_DIR)/etc/init.d/dmraid
-	rm -f $(DMRAID_TARGET_INSTALL_TARGET) $(DMRAID_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,dmraid))
-- 
1.7.1
