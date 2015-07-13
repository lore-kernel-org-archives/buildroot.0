From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:18:49 +0200
Subject: [Buildroot] [git commit] pkg-generic.mk: don't depend on external
	package permissions
Message-ID: <20150713151902.6655A7F9E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8810036a8714c88573983878859ed994aa8d3b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reset permissions for rsynced packages (when using OVERRIDE_SRCDIR) to
755/644. We do this under the assumption that source files shouldn't
care about their permissions, except possibly for the exec bit.

This guarantees that if a package uses 'rsync -a' or 'cp -p' to copy
a file from its build dir to the target, it'll end up with the same
permissions on the target every time.

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e85b4bf..beff2d7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -102,7 +102,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
-	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
+	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
