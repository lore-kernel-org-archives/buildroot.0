From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Apr 2013 04:22:46 +0200
Subject: [Buildroot] [PATCH 1/2] package: use only the patch file name when
	applying patches
In-Reply-To: <1366770167-22834-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1366770167-22834-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1366770167-22834-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the <pkg>_PATCH variable assumes that the patches listed
are in the same directory as the downloaded tarball. This prevents to
get patches in other locations on the same site, like is the case with
Busybox patches: the tarball is at /downloads/, the patches are at
/downloads/fixes-<version>/. So if you put BUSYBOX_PATCH =
fixes-<version>/foobar.patch, the current logic downloads
foobar.patch, but tries to apply fixes-<version>/foobar.patch, which
doesn't make sense.

Therefore, we add a call to $(notdir ...) to get just the patch file
name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e6bc955..5dcfc8d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -86,7 +86,7 @@ $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME)
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
