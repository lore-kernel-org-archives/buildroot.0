From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 13:49:13 +0100
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: make
 install logic macro accept a destination parameter
Message-ID: <20210223122839.235917FED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cadbbfdb136f54b098d6c83128bf4c0191f80d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

So it can be reused for also installing into the images directory.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
