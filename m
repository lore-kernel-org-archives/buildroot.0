From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:47 +0200
Subject: [Buildroot] [PATCH 33/35] pkg-generic: introduce a
	<pkg>_ALL_DOWNLOADS variable and factorize code
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-34-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/pkg-generic.mk | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index be09a39..ba0943e 100644
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
@@ -359,6 +347,11 @@ ifndef $(2)_EXTRA_DOWNLOADS
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
@@ -569,10 +562,7 @@ $(1)-show-version:
 
 $(1)-source-check:
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
-	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
-		$$(if $$(findstring ://,$(p)),\
-			$$(call SOURCE_CHECK,$(p)),\
-			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$(p))))
+	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$(p))$$(sep))
 else
 	test -d $$($(2)_OVERRIDE_SRCDIR)
 endif
-- 
2.1.0
