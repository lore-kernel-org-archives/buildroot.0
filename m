From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 10 Jun 2019 11:27:16 +0200
Subject: [Buildroot] [PATCH] Allow overriding the VCS exclude list with
 *_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS
Message-ID: <0c1450782e9b2f0a44af5ab18ccfda69d385f900.1560158856.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have some internal packages which automatically bake a version string
from the git checkout, and we usually combine these with a
*_OVERRIDE_SRCDIR. I would like to let Buildroot *not* skip the .git
directory when picking up sources from the local checkout.  It turns out
that the existing mechanism (*_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) only
supports adding to the exclude list because `rsync` simply uses the
first match from the provided filtering rules.

Solve this by using the user-provided values first. If they match, then
`rsync` won't exclude stuff based on the generic VCS exclude patterns.

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3b5ee7b356..b00967c648 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -184,7 +184,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@mkdir -p $(@D)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
+	rsync -au --chmod=u=rwX,go=rX $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@$(call step_end,rsync)
 	$(Q)touch $@
-- 
2.21.0
