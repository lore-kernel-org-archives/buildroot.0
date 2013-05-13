From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 May 2013 17:51:52 +0200
Subject: [Buildroot] [PATCH v2] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <517A1C3D.1010009@mind.be>
References: <517A1C3D.1010009@mind.be>
Message-ID: <1368460312-9566-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, $(PKG)_PATCH allow only to download patches from same URL than tarball.
This patch allow to detect when plain URL are used in $(PKG)_PATCH and correctly
handle them.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

---
v2: 
  - Rebase to apply to HEAD
  - Drop patch called "Add $(PKG_NAME) in name of downloaded patches" since I am
    not personally convinced of its usefulness

---
 package/pkg-generic.mk |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d25797c..db34c13 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -40,7 +40,12 @@ ifeq ($(DL_MODE),DOWNLOAD)
 	fi
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
-	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
+	$(foreach p,$($(PKG)_PATCH),\
+		$(if $(findstring ://,$(p)),\
+			$(call DOWNLOAD,$(p)),\
+			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
+		)\
+	$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
@@ -86,7 +91,7 @@ $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
-	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
+	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
 	for D in $(PATCH_BASE_DIRS); do \
 	  if test -d $${D}; then \
-- 
1.7.9.5
