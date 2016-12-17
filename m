From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:00:03 +0100
Subject: [Buildroot] [git commit] pkg-generic: run $(PKG)_PRE_RSYNC_HOOKS
	before checking for the existence of $(SRCDIR)
Message-ID: <20161217150010.39AE281829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06a3e83b9a28d35ac6172854bebf20edb958da09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will allow packages to define their pre-rsync hooks which will be
guaranteed to run even if the source is missing.

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
