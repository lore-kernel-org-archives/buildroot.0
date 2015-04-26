From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:55:12 +0200
Subject: [Buildroot] [git commit] pkg-generic: introduce a
	<pkg>_ALL_DOWNLOADS variable and factorize code
Message-ID: <20150426202108.8975081734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c73e791bc14df1d6af27e1a47c1e6fbb1218e1c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now, both the download and source-check code are iterating over
<pkg>_SOURCE, <pkg>_PATCH and <pkg>_EXTRA_DOWNLOADS elements, figuring
out whether they contain full URLs or not. Instead of doing this
repeatdly, this patch introduces an internal <pkg>_ALL_DOWNLOADS
variable, which contains the list of everything that needs to be
downloaded, with URLs already expanded to take into account <pkg>_SITE
if needed.

This allows to simplify quite significantly the .stamp_download and
source-check implementation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |   26 ++++++++------------------
 1 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 082b234..d5b29f0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -72,25 +72,13 @@ endif
 $(BUILD_DIR)/%/.stamp_downloaded:
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
-	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
+	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
 		if test ! -e $(DL_DIR)/`basename $$p` ; then \
 			$(call MESSAGE,"Downloading") ; \
 			break ; \
 		fi ; \
 	done
-	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
-	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
-		$(if $(findstring ://,$(p)),\
-			$(call DOWNLOAD,$(p)),\
-			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
-		)\
-	$(sep))
-	$(foreach p,$($(PKG)_PATCH),\
-		$(if $(findstring ://,$(p)),\
-			$(call DOWNLOAD,$(p)),\
-			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
-		)\
-	$(sep))
+	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
@@ -355,6 +343,11 @@ ifndef $(2)_PATCH
  endif
 endif
 
+$(2)_ALL_DOWNLOADS = \
+	$$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
+		$$(if $$(findstring ://,$$(p)),$$(p),\
+			$$($(2)_SITE:/=)/$$(p)))
+
 ifndef $(2)_SITE
  ifdef $(3)_SITE
   $(2)_SITE = $$($(3)_SITE)
@@ -538,10 +531,7 @@ $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 
 $(1)-source-check:
-	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
-		$$(if $$(findstring ://,$$(p)),\
-			$$(call SOURCE_CHECK,$$(p)),\
-			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p)))$$(sep))
+	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
 
 $(1)-external-deps:
 	@for p in $$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS) ; do \
