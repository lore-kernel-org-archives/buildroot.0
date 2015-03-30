From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:39:01 +0200
Subject: [Buildroot] [git commit] pkg-generic: refactor the "Downloading"
	message logic
Message-ID: <20150330214111.8A75F7FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59e19c7e243c09513b5e133446691cdd68101475
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the .stamp_downloaded hook, the logic to decide whether or not to
display the "Downloading" message is treating the check of
<pkg>_SOURCE as a special case. But in fact, there is no real reason
to do so: the existing loop used for <pkg>_PATCH and
<pkg>_EXTRA_DOWNLOADS could work just as well.

This commit therefore refactors this piece of code, to have a single
loop checking <pkg>_SOURCE, <pkg>_PATCH and <pkg>_EXTRA_DOWNLOADS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 003fd69..3c86878 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -73,16 +73,12 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 # Only show the download message if it isn't already downloaded
-	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
-		$(call MESSAGE,"Downloading") ; \
-	else \
-		for p in $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
-			if test ! -e $(DL_DIR)/`basename $$p` ; then \
-				$(call MESSAGE,"Downloading") ; \
-				break ; \
-			fi ; \
-		done ; \
-	fi
+	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
+		if test ! -e $(DL_DIR)/`basename $$p` ; then \
+			$(call MESSAGE,"Downloading") ; \
+			break ; \
+		fi ; \
+	done
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
 	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
