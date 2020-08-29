From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:36:24 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Makefile: use $(Q)
 instead of @ to silence target-finalize commands
Message-ID: <20200829173326.8E8EB7F9A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eac943b2349c00890dca3011b96f54bb9fbd85af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

As 18f6c26118 just did to silence the file lists commands, switch to
using $(Q) instead of a plain @, to silence the commands.

Using $(Q) will allow to debug the commands with V=1.

We keep @ for the calls to MESSAGE, though.

The commands that are not currently silenced are left as-is, and they
can be converted to being silent in a followup patch, if need be,

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5754d9c9b17189d05e7436143a46098fdfeae762)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 384518d61b..9598ef4eca 100644
--- a/Makefile
+++ b/Makefile
@@ -799,9 +799,9 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 
-	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
-		$(call MESSAGE,"Sanity check in overlay $(d)"); \
-		not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
+	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
+		@$(call MESSAGE,"Sanity check in overlay $(d)")$(sep) \
+		$(Q)not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
 		test -n "$$not_merged_dirs" && { \
 			echo "ERROR: The overlay in $(d) is not" \
 				"using a merged /usr for the following directories:" \
@@ -811,9 +811,9 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 
 endif # merged /usr
 
-	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
-		$(call MESSAGE,"Copying overlay $(d)"); \
-		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
+	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
+		@$(call MESSAGE,"Copying overlay $(d)")$(sep) \
+		$(Q)$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
 
 	$(Q)$(if $(TARGET_DIR_FILES_LISTS), \
 		cat $(TARGET_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list.txt
@@ -822,9 +822,9 @@ endif # merged /usr
 	$(Q)$(if $(STAGING_DIR_FILES_LISTS), \
 		cat $(STAGING_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-staging.txt
 
-	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
-		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+	$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
+		@$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
+		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 	touch $(TARGET_DIR)/usr
 
