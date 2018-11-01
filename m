From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu,  1 Nov 2018 15:02:30 +0100
Subject: [Buildroot] [PATCH 2/3] OVERRIDE_SOURCEDIR: Fix build with
 per-package infrastructure
In-Reply-To: <20181101140231.24380-1-anaumann@ultratronik.de>
References: <20181101140231.24380-1-anaumann@ultratronik.de>
Message-ID: <20181101140231.24380-3-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host/target per-package dirs are not created during the rsync step, so
make up for it in the configure_prepare step.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2cb4582d97..6d6a16e927 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -227,6 +227,7 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 $(BUILD_DIR)/%/.stamp_configure_prepared:
 	@$(call step_start,configure_prepared)
 	@$(call MESSAGE,"Prepare per-package host")
+	@mkdir -p $(HOST_DIR) $(STAGING_DIR)
 	$(foreach pkg,$($(PKG)_FINAL_DEPENDENCIES),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
 		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
-- 
2.19.1
