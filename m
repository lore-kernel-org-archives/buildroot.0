From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:01:12 +0100
Subject: [Buildroot] [git commit] boot/grub: use install instead of cp
Message-ID: <20141201104837.4EE257FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5dac9fddbf46223d0a5967aa0560a89ee7fbac3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This way we don't depend on the permissions of files under boot/grub/,
which aren't tracked.

While we're at it, change all 'cp' usages into 'install' with the
correct mode for each file.

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

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
 
