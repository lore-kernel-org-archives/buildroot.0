From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 17:05:55 +0100
Subject: [Buildroot] [PATCH-NEXT v2 2/4] package/linux-firmware: make
 install logic macro accept a destination parameter
In-Reply-To: <20210215160558.19574-1-peter@korsgaard.com>
References: <20210215160558.19574-1-peter@korsgaard.com>
Message-ID: <20210215160558.19574-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So it can be reused for also installing into the images directory.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- Reworked after patch 1 changed install logic

package/linux-firmware/linux-firmware.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9bc59435ef..8defedd309 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -674,10 +674,10 @@ endif
 # sure we canonicalize the pointed-to file, to cover the symlinks of the form
 # a/foo -> ../b/foo  where a/ (the directory where to put the symlink) does
 # not yet exist.
-define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/lib/firmware
-	$(TAR) xf $(@D)/br-firmware.tar -C $(TARGET_DIR)/lib/firmware/
-	cd $(TARGET_DIR)/lib/firmware/ ; \
+define LINUX_FIRMWARE_INSTALL_FW
+	mkdir -p $(1)
+	$(TAR) xf $(@D)/br-firmware.tar -C $(1)
+	cd $(1) ; \
 	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
 	while read f d; do \
 		if test -f $$(readlink -m $$(dirname $$f)/$$d); then \
@@ -687,4 +687,8 @@ define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	done
 endef
 
+define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
+	$(call LINUX_FIRMWARE_INSTALL_FW, $(TARGET_DIR)/lib/firmware)
+endef
+
 $(eval $(generic-package))
-- 
2.20.1
