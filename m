From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Apr 2018 22:53:04 +0200
Subject: [Buildroot] [PATCH] core/pkg-infra: add missing  step hooks
Message-ID: <20180428205304.3122-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also call the step hooks from the three steps they are currently not
called in:
  - download,
  - actual download (when main archive is not the real source, like
    external toolchains),
  - rsync (for local or override-srcdir).

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ebfc24dd70..47f381550b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -134,6 +134,7 @@ endif
 
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
+	@$(call step_start,download)
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
 	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
@@ -145,12 +146,15 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
+	@$(call step_end,download)
 	$(Q)touch $@
 
 # Retrieve actual source archive, e.g. for prebuilt external toolchains
 $(BUILD_DIR)/%/.stamp_actual_downloaded:
+	@$(call step_start,actual-download)
 	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
 	$(Q)mkdir -p $(@D)
+	@$(call step_end,actual-download)
 	$(Q)touch $@
 
 # Unpack the archive
@@ -169,11 +173,13 @@ $(BUILD_DIR)/%/.stamp_extracted:
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
 # used.
 $(BUILD_DIR)/%/.stamp_rsynced:
+	@$(call step_start,rsync)
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,rsync)
 	$(Q)touch $@
 
 # Patch
-- 
2.14.1
