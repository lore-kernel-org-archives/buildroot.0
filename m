From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:49:42 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/pkg-generic.mk:
 in image install, print message before pre-hooks
Message-ID: <20200314173657.1EEA88393F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa2197c93cfe1e557dd1c28e2ae3ccbd26946e8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

In all steps, we print the message indicating the start of the step
using the MESSAGE macro before running pre-hooks. Except in the image
installation step, where the message is printed after the pre-hooks.

Let's fix this inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 15e96f94172d190a5c6b48d38438dc50603bfd9e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8ba1747d07..a5ed64e5f0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -333,8 +333,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
 	@mkdir -p $(BINARIES_DIR)
-	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Installing to images directory")
+	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call step_end,install-image)
