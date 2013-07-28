From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sun, 28 Jul 2013 16:54:52 +0800
Subject: [Buildroot] [PATCH v2] buildroot: Add POST_RSYNC_HOOKS support
In-Reply-To: <CAAXf6LVM7yoWaVdKp90oYOyLbVS=OvNFMzQv2nvcXp-vUmTDww@mail.gmail.com>
References: <CAAXf6LVM7yoWaVdKp90oYOyLbVS=OvNFMzQv2nvcXp-vUmTDww@mail.gmail.com>
Message-ID: <1375001692-12024-1-git-send-email-tjlee@ambarella.com>
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
Include the comments aginst v1 from Thomas De Schampheleire:

  Updte manual for the new hook.
  Set the default hook to empty

 docs/manual/adding-packages-generic.txt | 1 +
 package/pkg-generic.mk                  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index faf70b1..2889add 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -441,6 +441,7 @@ The following hook points are available:
 
 * +LIBFOO_POST_DOWNLOAD_HOOKS+
 * +LIBFOO_POST_EXTRACT_HOOKS+
+* +LIBFOO_POST_RSYNC_HOOKS+
 * +LIBFOO_PRE_PATCH_HOOKS+
 * +LIBFOO_POST_PATCH_HOOKS+
 * +LIBFOO_PRE_CONFIGURE_HOOKS+
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d9a12f2..3d3adc9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -63,6 +63,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
+	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
@@ -337,6 +338,7 @@ $(2)_EXTRACT_CMDS ?= \
 # post-steps hooks
 $(2)_POST_DOWNLOAD_HOOKS        ?=
 $(2)_POST_EXTRACT_HOOKS         ?=
+$(2)_POST_RSYNC_HOOKS           ?=
 $(2)_PRE_PATCH_HOOKS            ?=
 $(2)_POST_PATCH_HOOKS           ?=
 $(2)_PRE_CONFIGURE_HOOKS        ?=
-- 
1.8.3.2
