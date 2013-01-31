From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 31 Jan 2013 09:18:30 +0100
Subject: [Buildroot] [PATCH 2/2] Add $(PKG_NAME) in name of downloaded
	patches
In-Reply-To: <1359620310-13640-1-git-send-email-jezz@sysmic.org>
References: <8398960.ALrh5xOxZ9@sagittae>
 <1359620310-13640-1-git-send-email-jezz@sysmic.org>
Message-ID: <1359620310-13640-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, patch was downloaded without be renamed. $(DL_DIR) quickly become a
mess. Downloaded patches are now named
$(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/pkg-generic.mk |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fbc2bb9..f2bf40a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -42,8 +42,8 @@ endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
 	$(foreach p,$($(PKG)_PATCH),\
 		$(if $(findstring ://,$(p)),\
-			$(call DOWNLOAD,$(p)),\
-			$(call DOWNLOAD,$($(PKG)_SITE)/$(p))\
+			$(call DOWNLOAD,$(p),$($(PKG)_NAME)-$($(PKG)_VERSION)-$(notdir $(p))),\
+			$(call DOWNLOAD,$($(PKG)_SITE)/$(p),$($(PKG)_NAME)-$($(PKG)_VERSION)-$(notdir $(p)))\
 		)\
 	$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
@@ -90,7 +90,8 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
-	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
+	$(foreach p,$($(PKG)_PATCH),\
+	  support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_NAME)-$($(PKG)_VERSION)-$(notdir $(p))$(sep))
 	$(Q)( \
 	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
 	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
-- 
1.7.9.5
