From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 31 Jan 2013 09:18:29 +0100
Subject: [Buildroot] [PATCH 1/2] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <8398960.ALrh5xOxZ9@sagittae>
References: <8398960.ALrh5xOxZ9@sagittae>
Message-ID: <1359620310-13640-1-git-send-email-jezz@sysmic.org>
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
 package/pkg-generic.mk |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b0eca0a..fbc2bb9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -40,7 +40,12 @@ ifeq ($(DL_MODE),DOWNLOAD)
 	fi
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
-	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$(p))$(sep))
+	$(foreach p,$($(PKG)_PATCH),\
+		$(if $(findstring ://,$(p)),\
+			$(call DOWNLOAD,$(p)),\
+			$(call DOWNLOAD,$($(PKG)_SITE)/$(p))\
+		)\
+	$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
@@ -85,7 +90,7 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
-	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
+	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
 	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
 	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
-- 
1.7.9.5
