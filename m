From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  3 Apr 2013 10:28:48 +0200
Subject: [Buildroot] [PATCH] post-build: reimplement using a for loop and
	make verbose
Message-ID: <1364977729-27519-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the post-build system similar to the rootfs overlay system. This allows to
show each script filename before execution.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index c95bb1e..69996bc 100644
--- a/Makefile
+++ b/Makefile
@@ -509,11 +509,10 @@ endif
 			$${dir}/ $(TARGET_DIR); \
 	done
 
-ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
-	@$(call MESSAGE,"Executing post-build script\(s\)")
-	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
-		$(s) $(TARGET_DIR)$(sep))
-endif
+	@for scr in $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)); do \
+		$(call MESSAGE,"Executing post-build script $${scr}"); \
+		$${scr} $(TARGET_DIR); \
+	done
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
-- 
1.7.10.4
