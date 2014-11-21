From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 21 Nov 2014 13:19:07 -0300
Subject: [Buildroot] [PATCH v4 8/9] boot/grub: use install instead of cp
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1416586748-12936-9-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This way we don't depend on the permissions of files under boot/grub/,
which aren't tracked.

While we're at it, change all 'cp' usages into 'install' with the
correct mode for each file.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 boot/grub/grub.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 535ada6..ae687d6 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -81,7 +81,7 @@ GRUB_CONF_OPTS = \
 
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 define GRUB_INSTALL_SPLASH
-	cp boot/grub/splash.xpm.gz $(TARGET_DIR)/boot/grub/
+	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz $(TARGET_DIR)/boot/grub/splash.xpm.gz
 endef
 else
 define GRUB_INSTALL_SPLASH
@@ -95,14 +95,14 @@ endif
 # of a disk or disk image.
 
 define GRUB_INSTALL_TARGET_CMDS
-	install -m 0755 -D $(@D)/grub/grub $(HOST_DIR)/sbin/grub
-	mkdir -p $(TARGET_DIR)/boot/grub
-	cp $(@D)/stage1/stage1 $(TARGET_DIR)/boot/grub
+	$(INSTALL) -D -m 0755 $(@D)/grub/grub $(HOST_DIR)/sbin/grub
+	$(INSTALL) -D -m 0755 $(@D)/stage1/stage1 $(TARGET_DIR)/boot/grub/stage1
 	for f in $(GRUB_STAGE_1_5_TO_INSTALL) ; do \
-		cp $(@D)/stage2/$${f}_stage1_5 $(TARGET_DIR)/boot/grub ; \
+		$(INSTALL) -D -m 0755 $(@D)/stage2/$${f}_stage1_5 \
+			$(TARGET_DIR)/boot/grub/$${f}_stage1_5 ; \
 	done
-	cp $(@D)/stage2/stage2 $(TARGET_DIR)/boot/grub
-	cp boot/grub/menu.lst $(TARGET_DIR)/boot/grub
+	$(INSTALL) -D -m 0644 $(@D)/stage2/stage2 $(TARGET_DIR)/boot/grub/stage2
+	$(INSTALL) -D -m 0644 boot/grub/menu.lst $(TARGET_DIR)/boot/grub/menu.lst
 	$(GRUB_INSTALL_SPLASH)
 endef
 
-- 
2.1.3
