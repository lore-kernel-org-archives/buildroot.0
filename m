Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A60C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17BAB4FFC9;
	Fri, 28 Feb 2025 17:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CroTrOt_D9qE; Fri, 28 Feb 2025 17:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81CBD508A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81CBD508A3;
	Fri, 28 Feb 2025 17:22:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03CAD68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8096C42564
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GV9qyJ26-lfv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69DB74256F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69DB74256F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6544B86143; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 18:35:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 98aec6280a1255b93b0d04e81af1440590ca1f7b
X-Git-Newrev: 99d4180edae555c47d70ea40ca63316445c56ac2
X-Patchwork-Hint: ignore
Message-Id: <20250228163046.6544B86143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-generic.mk: factor
 out patch directories
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99d4180edae555c47d70ea40ca63316445c56ac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The .stamp_patched rule currently uses shell loops and conditions to
iterate over the patches in the package directory and
BR2_GLOBAL_PATCH_DIRS and to select between the versioned and
unversioned directory.

We want to add the patch list to show-info as well, so we need a way to
do this entirely in Make functions.

Introduce the function pkg-patches-dirs in pkg-utils which copies this
functionality in make syntax, and use it in the .stamp_patched rule.
As an extra simplification, only consider the version directory if
PKG_VERSION actually exists. Otherwise, we would use the directory with
a slash appended for packages without version. Why this does work, it
just looks weird for no reason.

Furthermore, introduce the function pkg-patch-hash-dirs which simply
enumerates the package directory and the package subdirectories of
BR2_GLOBAL_PATCH_DIRS. This function is used for _HASH_FILES as well.

Ideally, we should be able to factor our the handling of the version
subdirectory between the patches and hashes as well. Unfortunately, they
are treated subtly different: patches don't use the base directory if
the version directory exists, while hashes do use the base directory. We
don't want to change this behaviour.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Co-authored-by: Matthias Swiggers <matthias.swiggers@mind.be>
[Arnout:
 - split into a separate patch;
 - don't fully factor with _HASH_FILES because version is treaded
   differently;
 - introduce pkg-patch-hash-dirs;
 - retain the RAWNAME comment, but move it to pkg-patch-hash-dirs;
 - use foreach instead of shell loop, and $(seq) instead of exit 1;
 - rewrite to retain original behaviour of only using versioned dir.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 22 +++-------------------
 package/pkg-utils.mk   | 12 ++++++++++++
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8fb6f97be8..f22b6e981a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -231,29 +231,13 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	$(Q)touch $@
 
 # Patch
-#
-# The RAWNAME variable is the lowercased package name, which allows to
-# find the package directory (typically package/<pkgname>) and the
-# prefix of the patches
-#
-# For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $($(PKG)_DL_DIR) $(notdir $(p))$(sep))
-	$(Q)( \
-	for D in $(PATCH_BASE_DIRS); do \
-	  if test -d $${D}; then \
-	    if test -d $${D}/$($(PKG)_VERSION); then \
-	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch || exit 1; \
-	    else \
-	      $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
-	    fi; \
-	  fi; \
-	done; \
+	$(foreach dir,$(call pkg-patches-dirs,$(PKG)),\
+		$(Q)$(APPLY_PATCHES) $(@D) $(dir) \*.patch$(sep)\
 	)
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
 	@$(call step_end,patch)
@@ -517,7 +501,7 @@ $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
 
 $(2)_HASH_FILES = \
 	$$(strip \
-		$$(foreach d, $$($(2)_PKGDIR) $$(addsuffix /$$($(2)_RAWNAME), $$(call qstrip,$$(BR2_GLOBAL_PATCH_DIR))),\
+		$$(foreach d, $$(call pkg-patch-hash-dirs,$(2)),\
 			$$(if $$(wildcard $$(d)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
 				$$(d)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
 				$$(d)/$$($(2)_RAWNAME).hash\
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index a0dbeac18e..ca736da597 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -156,6 +156,18 @@ define _json-info-pkg
 	)
 endef
 
+# The RAWNAME variable is the lowercased package name, which allows to
+# find the package directory (typically package/<pkgname>) and the
+# prefix of the patches
+pkg-patch-hash-dirs = \
+	$($(1)_PKGDIR) $(addsuffix /$($(1)_RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
+
+pkg-patches-dirs = \
+	$(foreach dir, $(call pkg-patch-hash-dirs,$(1)),\
+		$(wildcard $(if $($(1)_VERSION),\
+			$(or $(wildcard $(dir)/$($(1)_VERSION)),$(dir)),\
+			$(dir))))
+
 define _json-info-pkg-details
 	"version": $(call mk-json-str,$($(1)_DL_VERSION)),
 	"licenses": $(call mk-json-str,$($(1)_LICENSE)),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
