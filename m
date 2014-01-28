From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
Date: Tue, 28 Jan 2014 11:14:50 +0100
Subject: [Buildroot] [PATCH] Run post scripts referenced by relative paths
Message-ID: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fix will let to run post scripts seamlessly while are referenced by
relative paths. Scripts referenced by full path still works.

Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 067458b..ef7f4c2 100644
--- a/Makefile
+++ b/Makefile
@@ -554,7 +554,7 @@ endif
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(USER_HOOKS_EXTRA_ENV) $(abspath $(s)) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
@@ -600,7 +600,7 @@ endif
 target-post-image:
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(USER_HOOKS_EXTRA_ENV) $(abspath $(s)) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
-- 
1.8.3.2
