From: Michal Sojka <sojka@merica.cz>
Date: Tue, 21 Oct 2014 10:42:54 +0200
Subject: [Buildroot] [PATCH] Complain loudly if BR2_GLOBAL_PATCH_DIR does
	not exit
Message-ID: <1413880974-30138-1-git-send-email-sojka@merica.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the BR2_GLOBAL_PATCH_DIR is misspelled in the .config or if somebody
renamed the existing directory with patches, buildroot happily builds
everything but without the patches. As this can lead to surprising
results, it is better to fail and give a user a message that
BR2_GLOBAL_PATCH_DIR is wrongly configured.

Signed-off-by: Michal Sojka <sojka@merica.cz>
---
 package/pkg-generic.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 259ee02..46d92aa 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -162,6 +162,11 @@ $(BUILD_DIR)/%/.stamp_patched:
 	$(Q)touch $@
 	@$(call step_end,patch)
 
+# Check that all directories specified in BR2_GLOBAL_PATCH_DIR exist.
+$(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
+	$(if $(wildcard $(dir)),,\
+		$(error BR2_GLOBAL_PATCH_DIR contains nonexistent directory $(dir))))
+
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
-- 
2.1.1
