From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:53:15 +0200
Subject: [Buildroot] [git commit] pkg-generic: don't use DL_MODE in
	.stamp_downloaded
Message-ID: <20150426202108.6B49F81734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a86dae0abe9686eee6fc75356a7a91b2332f636e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The .stamp_downloaded target is now only being used to really
download, and no longer for other activities like "source check" or
"external deps". So the check on DL_MODE being equal to DOWNLOAD is no
longer necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 81fc535..082b234 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -71,7 +71,6 @@ endif
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
-ifeq ($(DL_MODE),DOWNLOAD)
 # Only show the download message if it isn't already downloaded
 	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
 		if test ! -e $(DL_DIR)/`basename $$p` ; then \
@@ -79,7 +78,6 @@ ifeq ($(DL_MODE),DOWNLOAD)
 			break ; \
 		fi ; \
 	done
-endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
 	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
 		$(if $(findstring ://,$(p)),\
@@ -94,10 +92,8 @@ endif
 		)\
 	$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
-ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
-endif
 
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
