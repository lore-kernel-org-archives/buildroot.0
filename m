From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] kismet: use correct step
	override method
Message-ID: <20100916113828.D54468AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c421dde681467f10bc70c0d7a3863e63152ff60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/kismet/kismet.mk |   30 ++++++++++++++++++++++--------
 1 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index de66ee6..482c7db 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -29,24 +29,38 @@ ifeq ($(BR2_PACKAGE_KISMET_DRONE),y)
 	KISMET_TARGET_CONFIGS += kismet_drone.conf
 endif
 
-$(eval $(call AUTOTARGETS,package,kismet))
-
-$(KISMET_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing")
 ifdef KISMET_TARGET_BINARIES
+define KISMET_INSTALL_TARGET_BINARIES
 	$(INSTALL) -m 755 $(addprefix $(KISMET_DIR)/, $(KISMET_TARGET_BINARIES)) $(TARGET_DIR)/usr/bin
+endef
 endif
+
 ifdef KISMET_TARGET_CONFIGS
+define KISMET_INSTALL_TARGET_CONFIGS
 	$(INSTALL) -m 644 $(addprefix $(KISMET_DIR)/conf/, $(KISMET_TARGET_CONFIGS)) $(TARGET_DIR)/etc
+endef
 endif
-	touch $@
 
-$(KISMET_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define KISMET_INSTALL_TARGET_CMDS
+	$(KISMET_INSTALL_TARGET_BINARIES)
+	$(KISMET_INSTALL_TARGET_CONFIGS)
+endef
+
 ifdef KISMET_TARGET_BINARIES
+define KISMET_UNINSTALL_TARGET_BINARIES
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
+endef
 endif
+
 ifdef KISMET_TARGET_CONFIGS
+define KISMET_UNINSTALL_TARGET_CONFIGS
 	rm -f $(addprefix $(TARGET_DIR)/etc/, $(KISMET_TARGET_CONFIGS))
+endef
 endif
-	rm -f $(KISMET_TARGET_INSTALL_TARGET) $(KISMET_HOOK_POST_INSTALL)
+
+define KISMET_UNINSTALL_TARGET_CMDS
+	$(KISMET_UNINSTALL_TARGET_BINARIES)
+	$(KISMET_UNINSTALL_TARGET_CONFIGS)
+endef
+
+$(eval $(call AUTOTARGETS,package,kismet))
-- 
1.7.1
