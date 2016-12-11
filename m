From: Tal Shorer <tal.shorer@gmail.com>
Date: Sun, 11 Dec 2016 20:12:45 +0200
Subject: [Buildroot] [PATCH] pkg-generic: run $(PKG)_PRE_RSYNC_HOOKS before
	checking for the existence of $(SRCDIR)
In-Reply-To: <20161211174528.GD3599@free.fr>
References: <20161211174528.GD3599@free.fr>
Message-ID: <1481479965-26226-1-git-send-email-tal.shorer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow packages to define their pre-rsync hooks which will be
guaranteed to run even if the source is missing.

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 827de62..3ca71b0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -161,8 +161,8 @@ $(BUILD_DIR)/%/.stamp_extracted:
 # used.
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
-	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
+	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-- 
2.7.4
