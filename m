From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:42:54 +0200
Subject: [Buildroot] [PATCHv3 10/18] pkg-generic: don't use DL_MODE in
	.stamp_downloaded
In-Reply-To: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429972982-25495-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The .stamp_downloaded target is now only being used to really
download, and no longer for other activities like "source check" or
"external deps". So the check on DL_MODE being equal to DOWNLOAD is no
longer necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 05831d4..cb901ae 100644
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
-- 
2.1.0
