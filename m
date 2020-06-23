From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 23 Jun 2020 13:38:59 +0200
Subject: [Buildroot] [PATCH] linux: run depmod only if modules directory
 exists
Message-ID: <20200623113859.172177-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the modules directory that corresponds to the version of the kernel
being built has been deleted, don't try to run depmod, which will
obviously fail.

This can happen for instance when the modules are stripped from the main
root filesystem, and placed into a separate filesystem image, so that
the root filesystem and the kernel can be updated separately.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index b90b032bb9..d31933fea1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -490,7 +490,8 @@ endef
 # Run depmod in a target-finalize hook, to encompass modules installed by
 # packages.
 define LINUX_RUN_DEPMOD
-	if grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
+	if test -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
+		&& grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
 		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED); \
 	fi
 endef
-- 
2.27.0
