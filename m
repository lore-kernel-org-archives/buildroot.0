From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:23 +0100
Subject: [Buildroot] [PATCH 01/19] infra/pkg-generic: display MESSAGE before
 running PRE_HOOKS
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <ae12267ba7e9adc1dd34cffb99de6fc2ed4b8fcb.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... so that we have a consistent behaviour throughout all steps.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f5cab2b9c2..7602765139 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -133,7 +133,6 @@ endif
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 	@$(call step_start,download)
-	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
 	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
 		if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then \
@@ -141,6 +140,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
+	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
@@ -302,9 +302,9 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
+	@$(call MESSAGE,"Installing to images directory")
 	@mkdir -p $(BINARIES_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
-	@$(call MESSAGE,"Installing to images directory")
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call step_end,install-image)
-- 
2.14.1
