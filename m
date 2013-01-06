From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:41 +0100
Subject: [Buildroot] [PATCH 01/15] package: support multiple patches
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f5ece4483245655f4786d5b893bc1ece91a08e36.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit, we extend the behaviour of the <pkg>_PATCH variable
so that it now allows to list several patches to be downloaded and
applied, and no longer just one patch.

This will be useful for the elfutils package, and should anyway not
break the existing behaviour for packages using just one patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a570ad7..59de0f0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -28,12 +28,19 @@
 $(BUILD_DIR)/%/.stamp_downloaded:
 ifeq ($(DL_MODE),DOWNLOAD)
 # Only show the download message if it isn't already downloaded
-	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
-		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
-		$(call MESSAGE,"Downloading")
+	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
+		$(call MESSAGE,"Downloading") ; \
+	else \
+		for p in $($(PKG)_PATCH) ; do \
+			if test ! -e $(DL_DIR)/$$p ; then \
+				$(call MESSAGE,"Downloading") ; \
+				break ; \
+			fi ; \
+		done ; \
+	fi
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
-	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_PATCH)))
+	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
@@ -78,7 +85,7 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
-	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
+	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
 	$(Q)( \
 	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
 	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
-- 
1.7.9.5
