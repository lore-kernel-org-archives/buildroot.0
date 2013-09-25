From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 25 Sep 2013 10:05:39 +0200
Subject: [Buildroot] [PATCH v5 4/4] pkg-generic: enable recursive make for
	$($(PKG)_BUILD_CMDS)
In-Reply-To: <1380096339-4686-1-git-send-email-fabio.porcedda@gmail.com>
References: <1380096339-4686-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1380096339-4686-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add '+' prefix to the $($(PKG)_BUILD_CMDS) command to enable jobserver
for the sub-make.

Without the '+' prefix GNU make does not detect the sub-make so the
jobserver is not avaiable for the sub-make.

From GNU make documentation:
Using the MAKE variable has the same effect as using a ?+? character
at the beginning of the recipe line.  This special feature is only
enabled if the MAKE variable appears directly in the recipe: it does
not apply if the MAKE variable is referenced through expansion of
another variable. In the latter case you must use the ?+? token to get
these special effects.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0de1f35..499362b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -117,7 +117,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 # Build
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call MESSAGE,"Building")
-	$($(PKG)_BUILD_CMDS)
+	+$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-- 
1.8.4
