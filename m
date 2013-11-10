From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:10:45 +0100
Subject: [Buildroot] [git commit] infra: Add POST_RSYNC_HOOKS support
Message-ID: <20131110231541.72A669BB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8ab39a7b5205e6a1a076fdda257a5baa32be765
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

One of the use cases is for the 'local packages' to restore
the SCM info.  Some packages use this information to generate
version info during build time.  In this case, the local package
can have this hook to restore it by symbolic link for example.

[Thomas: update commit title]
Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt |    1 +
 package/pkg-generic.mk                  |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 59a2684..d6c1e0b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -467,6 +467,7 @@ The following hook points are available:
 
 * +LIBFOO_POST_DOWNLOAD_HOOKS+
 * +LIBFOO_POST_EXTRACT_HOOKS+
+* +LIBFOO_POST_RSYNC_HOOKS+
 * +LIBFOO_PRE_PATCH_HOOKS+
 * +LIBFOO_POST_PATCH_HOOKS+
 * +LIBFOO_PRE_CONFIGURE_HOOKS+
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4bba4b5..f1835a1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -69,6 +69,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
+	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
@@ -339,6 +340,7 @@ $(2)_EXTRACT_CMDS ?= \
 # post-steps hooks
 $(2)_POST_DOWNLOAD_HOOKS        ?=
 $(2)_POST_EXTRACT_HOOKS         ?=
+$(2)_POST_RSYNC_HOOKS           ?=
 $(2)_PRE_PATCH_HOOKS            ?=
 $(2)_POST_PATCH_HOOKS           ?=
 $(2)_PRE_CONFIGURE_HOOKS        ?=
