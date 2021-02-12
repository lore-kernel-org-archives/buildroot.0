From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 19:40:46 +0100
Subject: [Buildroot] [PATCH-NEXT 1/4] package/linux-firmware: make target
 install macros accept a destination parameter
In-Reply-To: <20210212184049.13202-1-peter@korsgaard.com>
References: <20210212184049.13202-1-peter@korsgaard.com>
Message-ID: <20210212184049.13202-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So we can reuse them for also installing into the images directory

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f23da171c6..3420266335 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -642,7 +642,7 @@ ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
 		$(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
-		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware
+		$(TAR) xf install.tar -C $(1)
 endef
 endif
 
@@ -651,9 +651,9 @@ ifneq ($(LINUX_FIRMWARE_DIRS),)
 # into it in itself, should we re-install the package.
 define LINUX_FIRMWARE_INSTALL_DIRS
 	$(foreach d,$(LINUX_FIRMWARE_DIRS), \
-		rm -rf $(TARGET_DIR)/lib/firmware/$(d); \
-		mkdir -p $(dir $(TARGET_DIR)/lib/firmware/$(d)); \
-		cp -a $(@D)/$(d) $(TARGET_DIR)/lib/firmware/$(d)$(sep))
+		rm -rf $(1)/$(d); \
+		mkdir -p $(dir $(1)/$(d)); \
+		cp -a $(@D)/$(d) $(1)/$(d)$(sep))
 endef
 endif
 
@@ -687,7 +687,7 @@ endif
 # a/foo -> ../b/foo  where a/ (the directory where to put the symlink) does
 # not yet exist.
 define LINUX_FIRMWARE_CREATE_SYMLINKS
-	cd $(TARGET_DIR)/lib/firmware/ ; \
+	cd $(1) ; \
 	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
 	while read f d; do \
 		if test -f $$(readlink -m $$(dirname $$f)/$$d); then \
@@ -699,9 +699,9 @@ endef
 
 define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware
-	$(LINUX_FIRMWARE_INSTALL_FILES)
-	$(LINUX_FIRMWARE_INSTALL_DIRS)
-	$(LINUX_FIRMWARE_CREATE_SYMLINKS)
+	$(call LINUX_FIRMWARE_INSTALL_FILES,$(TARGET_DIR)/lib/firmware)
+	$(call LINUX_FIRMWARE_INSTALL_DIRS,$(TARGET_DIR)/lib/firmware)
+	$(call LINUX_FIRMWARE_CREATE_SYMLINKS,$(TARGET_DIR)/lib/firmware)
 endef
 
 $(eval $(generic-package))
-- 
2.20.1
