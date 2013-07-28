From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sun, 28 Jul 2013 18:39:23 +0800
Subject: [Buildroot] [PATCH v2] <pkg>-rsync: support user custom cmds
In-Reply-To: <CAAXf6LXQWBEF2uM4e5MQg-QooTMwHmgZ99HT6PDH1DHNDDM-Gw@mail.gmail.com>
References: <CAAXf6LXQWBEF2uM4e5MQg-QooTMwHmgZ99HT6PDH1DHNDDM-Gw@mail.gmail.com>
Message-ID: <1375007963-15935-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows users to override the options or entire command
line of rsync.  The default options filters out object or libraries
during rsync.  For local packages which come with pre-built binaries,
the copy in build/ directory will not have complete files as src/

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---

Include the comments aginst v1 from Thomas De Schampheleire:

 Elaborate the use case of this feature.
 Update the document to relect the change.
 Restore a missing replacement for the original rsync command line.

 docs/manual/adding-packages-generic.txt | 9 +++++++++
 package/pkg-generic.mk                  | 6 +++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 2889add..681b2e3 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -358,6 +358,15 @@ LIBFOO_VERSION = 2.32
 Now, the variables that define what should be performed at the
 different steps of the build process.
 
+* +LIBFOO_RSYNC_CMDS+ lists the actions to be performed at the
+  fetch step for a package to be built from local source. By default,
+  the local source directory is copied to the build directory by rsync
+  with default options '-au --cvs-exclude --include core'. This works
+  fine and is efficient for general cases since it doesn't copy SCM
+  metadata as well as object files, and libraries. For packages that
+  come with pre-built binaries, user can override the default options
+  or entire command line to copy them at this fetch step.
+
 * +LIBFOO_CONFIGURE_CMDS+ lists the actions to be performed to
   configure the package before its compilation.
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6d49a29..10c3c2e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -62,7 +62,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
+	$($(PKG)_RSYNC_CMDS)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
@@ -310,6 +310,10 @@ $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
 $(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
 
+# default rsync command
+$(2)_RSYNC_CMDS ?= \
+	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
+
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
-- 
1.8.3.2
