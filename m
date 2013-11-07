From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 07 Nov 2013 11:41:21 +0100
Subject: [Buildroot] [PATCH 1 of 4 v2] infra: Add POST_RSYNC_HOOKS support
In-Reply-To: <patchbomb.1383820880@argentina>
References: <patchbomb.1383820880@argentina>
Message-ID: <22e9fb4805df27235a24.1383820881@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One of the use cases is for the 'local packages' to restore
the SCM info.  Some packages use this information to generate
version info during build time.  In this case, the local package
can have this hook to restore it by symbolic link for example.

[Thomas: update commit title]
Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>

---
v2: no changes

 docs/manual/adding-packages-generic.txt | 1 +
 package/pkg-generic.mk                  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
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
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -69,6 +69,7 @@ endif
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
+	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
@@ -339,6 +340,7 @@ endif
 # post-steps hooks
 $(2)_POST_DOWNLOAD_HOOKS        ?=
 $(2)_POST_EXTRACT_HOOKS         ?=
+$(2)_POST_RSYNC_HOOKS           ?=
 $(2)_PRE_PATCH_HOOKS            ?=
 $(2)_POST_PATCH_HOOKS           ?=
 $(2)_PRE_CONFIGURE_HOOKS        ?=
