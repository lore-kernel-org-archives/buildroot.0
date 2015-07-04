From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:30:25 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: sanitise
	FOO_OVERRIDE_SRCDIR
Message-ID: <20150704133104.A3D2081640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee435eb3f36999dbe55af8dd6aeb82d0abc517b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case FOO_OVERRIDE_SRCDIR has trailing spaces, like so:
    FOO_OVERRIDE_SRCDIR = /path/to/sources\x20

we would end up with a rsync command like so:
    rsync -au /path/to/sources / /path/to/build/foo

which would effectively rsync the whole vfs, eventually filling the
whole disk... :-(

So, just qstrip the variable before use.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d5b29f0..9fe01b8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -102,7 +102,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
-	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
+	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
