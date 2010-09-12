From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:09 +0200
Subject: [Buildroot] [PATCH 23/74] lite: convert old-style hook to new-style
	hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c42d2a3afe5e988d5cb2eab7581ed5fb66cb3f29.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lite/lite.mk |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index 881c43b..678be86 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -12,12 +12,14 @@ LITE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/l
 LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
 LITE_DEPENDENCIES = directfb
 
-$(eval $(call AUTOTARGETS,package,lite))
-
-$(LITE_HOOK_POST_INSTALL):
+define LITE_FINALIZE_INSTALL
 	$(INSTALL) -d $(TARGET_DIR)/usr/share/LiTE/examples/
 	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/truetype/
-	$(INSTALL) -m0644 $(LITE_DIR)/data/*.png $(TARGET_DIR)/usr/share/LiTE/
-	$(INSTALL) -m0644 $(LITE_DIR)/examples/*.png $(TARGET_DIR)/usr/share/LiTE/examples/
-	$(INSTALL) -m0644 $(LITE_DIR)/fonts/*.ttf $(TARGET_DIR)/usr/share/fonts/truetype/
-	touch $@
+	$(INSTALL) -m0644 $(@D)/data/*.png $(TARGET_DIR)/usr/share/LiTE/
+	$(INSTALL) -m0644 $(@D)/examples/*.png $(TARGET_DIR)/usr/share/LiTE/examples/
+	$(INSTALL) -m0644 $(@D)/fonts/*.ttf $(TARGET_DIR)/usr/share/fonts/truetype/
+endef
+
+LITE_POST_INSTALL_TARGET_HOOKS += LITE_FINALIZE_INSTALL
+
+$(eval $(call AUTOTARGETS,package,lite))
-- 
1.7.0.4
