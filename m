From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:58:12 +0200
Subject: [Buildroot] [git commit] Complain loudly if BR2_GLOBAL_PATCH_DIR
	does not exit
Message-ID: <20141024235845.91AE9B0C8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=202bd70dfb7fbf2eb92bedb68e571426e32c65ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the BR2_GLOBAL_PATCH_DIR is misspelled in the .config or if somebody
renamed the existing directory with patches, buildroot happily builds
everything but without the patches. As this can lead to surprising
results, it is better to fail and give a user a message that
BR2_GLOBAL_PATCH_DIR is wrongly configured.

Signed-off-by: Michal Sojka <sojka@merica.cz>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7a6d5e6..9643a30 100644
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
