From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Feb 2020 16:04:20 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: in image install,
 print message before pre-hooks
Message-ID: <20200228150421.1240651-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In all steps, we print the message indicating the start of the step
using the MESSAGE macro before running pre-hooks. Except in the image
installation step, where the message is printed after the pre-hooks.

Let's fix this inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7b240ca012..c1b9fe2e59 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -347,8 +347,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
 	@mkdir -p $(BINARIES_DIR)
-	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Installing to images directory")
+	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call step_end,install-image)
-- 
2.24.1
