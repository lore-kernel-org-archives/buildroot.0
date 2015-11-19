From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 19 Nov 2015 11:36:06 +0100
Subject: [Buildroot] [PATCH 5/5] pkg-generic: tag sources if git is used
In-Reply-To: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
Message-ID: <1447929366-8972-6-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to simplify patch updating, tag original version of sources.
We may also provide a feature to automaticaly update patches in future.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 30155a6..6d7677b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -152,6 +152,12 @@ $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
+	$(Q)( \
+	if test -d $(@D)/.git; then \
+	  GIT_DIR=$(@D)/.git $(GIT) tag upstream; \
+	  GIT_DIR=$(@D)/.git $(GIT) tag $(NAMEVER); \
+	fi; \
+	)
 	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $(DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
 	for D in $(PATCH_BASE_DIRS); do \
-- 
2.1.4
