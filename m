From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  9 Dec 2010 10:55:14 +0100
Subject: [Buildroot] [PATCH 16/16] directfb-examples: rework target
	installation rule to match package infrastructure
In-Reply-To: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291888514-31385-17-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/directfb-examples/directfb-examples.mk |  111 ++++++++++++------------
 1 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 065f720..aed9790 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -38,67 +38,68 @@ DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO) += usr/bin/df_v
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE) += usr/bin/df_video_particle
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/bin/df_window
 
-$(eval $(call AUTOTARGETS,package,directfb-examples))
+DIRECTFB_EXAMPLES_DATA_ :=
+DIRECTFB_EXAMPLES_DATA_y :=
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/share/directfb-examples/destination_mask.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/share/directfb-examples/tux.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/share/directfb-examples/wood_andi.jpg
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/biglogo.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/card.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/melted.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/meter.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/pngtest*.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/colorkeyed.gif
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/intro.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/fish.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/swirl.png
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/share/directfb-examples/pngtest.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/share/directfb-examples/testmask.png
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/share/directfb-examples/joystick.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/share/directfb-examples/gnu-keys.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/share/directfb-examples/gnome-mouse.png
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/share/directfb-examples/apple-red.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/share/directfb-examples/gnome-*.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/share/directfb-examples/gnu-*.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/share/directfb-examples/background*.jpg
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS) += usr/share/directfb-examples/melted.png
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE) += usr/share/directfb-examples/texture.png
 
-$(DIRECTFB_EXAMPLES_TARGET_INSTALL_TARGET): $(DIRECTFB_EXAMPLES_TARGET_INSTALL_STAGING)
-	$(call MESSAGE,"Installing to target")
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO) += usr/share/directfb-examples/shot.png
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE) += usr/share/directfb-examples/convergence.png
+
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/share/directfb-examples/desktop.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/share/directfb-examples/dfblogo.png
+
+DIRECTFB_EXAMPLES_FONT_y :=
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS),y)
+DIRECTFB_EXAMPLES_FONT_y = usr/share/directfb-examples/fonts/*
+endif
+
+define DIRECTFB_EXAMPLES_INSTALL_TARGET_CMDS
 	$(Q)mkdir -p $(TARGET_DIR)/usr/bin
 	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/
 	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/fonts/
-	for file in $(DIRECTFB_EXAMPLES_TARGETS_y); do \
+	$(Q)for file in $(DIRECTFB_EXAMPLES_TARGETS_y); do \
 	        cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
 		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$$file; \
 	done
 	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/fonts/decker.ttf $(TARGET_DIR)/usr/share/directfb-examples/fonts/
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/destination_mask.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/tux.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/wood_andi.jpg $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/biglogo.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/card.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/melted.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/meter.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/pngtest*.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/colorkeyed.gif $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/intro.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/fish.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/swirl.png $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/pngtest.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/testmask.png $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/fonts/* $(TARGET_DIR)/usr/share/directfb-examples/fonts/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/joystick.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/gnu-keys.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/gnome-mouse.png $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/apple-red.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/gnome-*.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/gnu-*.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/background*.jpg $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/melted.png $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/texture.png $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/shot.png $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/convergence.png $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW),y)
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/desktop.png $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/dfblogo.png $(TARGET_DIR)/usr/share/directfb-examples/
-endif
-	touch $@
+	$(Q)for file in $(DIRECTFB_EXAMPLES_FONT_y); do \
+		$(INSTALL) -m 0644 $(STAGING_DIR)/$$file $(TARGET_DIR)/usr/share/directfb-examples/fonts/; \
+	done
+	$(Q)$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/directfb-examples
+	$(Q)for file in $(DIRECTFB_EXAMPLES_DATA_y); do \
+		$(INSTALL) -m 0644 $(STAGING_DIR)/$$file $(TARGET_DIR)/usr/share/directfb-examples; \
+	done
+endef
+
+$(eval $(call AUTOTARGETS,package,directfb-examples))
 
-- 
1.7.2.3
