From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Jan 2015 14:18:55 +0100
Subject: [Buildroot] [PATCH] linux: fix fbtft kernel extension
Message-ID: <1420982335-6015-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes fbtft kernel extension bug reported by Richard Fergusson ([1]):

drivers/video/Kconfig:2525: can't open file
"drivers/video/fbdev/fbtft/Kconfig"

Fix: write the right fbtft/KConfig path to video/Kconfig or
video/fbdev/Kconfig (instead of hard coded one)

[1] http://lists.busybox.net/pipermail/buildroot/2015-January/117057.html

Reported-by: Richard Fergusson <fergie4000@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 linux/linux-ext-fbtft.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
index 36f4fd2..71ebdf3 100644
--- a/linux/linux-ext-fbtft.mk
+++ b/linux/linux-ext-fbtft.mk
@@ -12,15 +12,15 @@ LINUX_DEPENDENCIES += fbtft
 # for linux < 3.15 install to drivers/video/fbtft
 define FBTFT_PREPARE_KERNEL
 	if [ -e $(LINUX_DIR)/drivers/video/fbdev ]; then \
-		dest=$(LINUX_DIR)/drivers/video/fbdev ; \
+		dest=drivers/video/fbdev ; \
 	else \
-		dest=$(LINUX_DIR)/drivers/video/ ; \
+		dest=drivers/video ; \
 	fi ; \
-	mkdir -p $${dest}/fbtft; \
-	cp -dpfr $(FBTFT_DIR)/* $${dest}/fbtft/ ; \
-	echo 'source "drivers/video/fbdev/fbtft/Kconfig"' \
-		>> $${dest}/Kconfig ; \
-	echo 'obj-y += fbtft/' >> $${dest}/Makefile
+	mkdir -p $(LINUX_DIR)/$${dest}/fbtft; \
+	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$${dest}/fbtft/ ; \
+	echo "source \"$${dest}/fbtft/Kconfig\"" \
+		>> $(LINUX_DIR)/$${dest}/Kconfig ; \
+	echo 'obj-y += fbtft/' >> $(LINUX_DIR)/$${dest}/Makefile
 endef
 
 LINUX_PRE_PATCH_HOOKS += FBTFT_PREPARE_KERNEL
-- 
2.1.2
