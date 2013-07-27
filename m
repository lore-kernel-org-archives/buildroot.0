From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sun, 28 Jul 2013 00:56:36 +0800
Subject: [Buildroot] [PATCH] buildroot: Add POST_RSYNC_HOOKS support
Message-ID: <1374944196-19580-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One of the use cases is for the 'local packages' to restore
the SCM info.  Some packages use this information to generate
version info during build time.  In this case, the local package
can have this hook to restore it by symbolic link for example.

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d9a12f2..06e865d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -63,6 +63,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
+	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
-- 
1.8.3.2
