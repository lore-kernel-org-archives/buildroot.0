From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Sep 2013 23:54:18 +0200
Subject: [Buildroot] [git commit] Add support for plain URL in $(PKG)_PATCH
	variable
Message-ID: <20130907061414.2478180474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e2d828c0a5c69a4b2929f330426d93e47ec5d25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, $(PKG)_PATCH allow only to download patches from same URL than tarball.
This patch allow to detect when plain URL are used in $(PKG)_PATCH and correctly
handle them.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 00f1cb3..4dd395b 100644
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
