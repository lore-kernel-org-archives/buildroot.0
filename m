From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 14:27:29 +0200
Subject: [Buildroot] [PATCH] core/pkg-generic: sanitise FOO_OVERRIDE_SRCDIR
Message-ID: <1435494449-12837-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case FOO_OVERRIDE_SRCDIR has trailing spaces, like so:
    FOO_OVERRIDE_SRCDIR = /path/to/sources\x20

we would end up with a rsync command like so:
    rsync -au /path/to/sources / /path/to/build/foo

which would effectively rsync the whole vfs, eventually filling the
whole disk... :-(

So, just qstrip the variable before use.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
1.9.1
