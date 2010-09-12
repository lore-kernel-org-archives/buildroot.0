From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:28 +0200
Subject: [Buildroot] [PATCH 42/74] kismet: use correct step override method
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5c421dde681467f10bc70c0d7a3863e63152ff60.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
