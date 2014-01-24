From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 23 Jan 2014 21:32:08 -0500
Subject: [Buildroot] [PATCH 1/1] Makefile: move skeleton overlay
	installations before strip step
Message-ID: <1390530729-1830-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nothing prevents the skeleton overlays from having pre-built
executables or libraries in them.  Therefore, we should install
the overlays prior to stripping, so that any such pre-built stuff
gets stripped too.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 Makefile |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 9dfb1e0..9235c31 100644
--- a/Makefile
+++ b/Makefile
@@ -513,6 +513,13 @@ ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
+
+	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
+		$(call MESSAGE,"Copying overlay $(d)"); \
+		rsync -a $(RSYNC_VCS_EXCLUSIONS) \
+			--exclude .empty --exclude '*~' \
+			$(d)/ $(TARGET_DIR)$(sep))
+
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
@@ -545,12 +552,6 @@ endif
 		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 	) >  $(TARGET_DIR)/etc/os-release
 
-	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
-		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a $(RSYNC_VCS_EXCLUSIONS) \
-			--exclude .empty --exclude '*~' \
-			$(d)/ $(TARGET_DIR)$(sep))
-
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
-- 
1.7.9.5
