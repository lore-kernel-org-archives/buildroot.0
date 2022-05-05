Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8BAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47F78407D;
	Thu,  5 May 2022 20:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eROaD5wiMUGt; Thu,  5 May 2022 20:37:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D43008406C;
	Thu,  5 May 2022 20:37:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9232E1BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 808BD419CB
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79lZNaUhRfbJ for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:37:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 764F3419C4
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8CD0985B74; Thu,  5 May 2022 20:27:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 22:34:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27ac6619aa48eee2e05a70d5b2a38e62e20840dd
X-Git-Newrev: f0c7cb01a960c6892d6082c74b7c07320ddaef0a
X-Patchwork-Hint: ignore
Message-Id: <20220505202700.8CD0985B74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-download: do not try to vendor
 _EXTRA_DOWNLOADS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f0c7cb01a960c6892d6082c74b7c07320ddaef0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For golang- or cargo-based packages, we apply a vendoring pass after the
package's "main" download is done. Whether to vendor or not is based on
the heuristic that a specific directory exists or not; for golang
packages, we look for '/vendor', while for cargo, we look for '/VENDOR'.

This is fine for the "main" (by lack of a better term) download, but
this falls flat on its face for extra downloads. Indeed, some packages
may need to download data sets, or assets, as _EXTRA_DOWNLOADS. Those
are usually just data blobs, and are not actual golang or cargo packages;
as such they do not need to be vendored, but worse, if we try to
actually vendor them, this fails because the required files for
vendoring are missing from the archives in such data sets.

We fix that by decoupling the download for the extra download, from the
download for the main archive. We pass the post-processing option only
to the main download.

This makes the hard assumption that extra downloads will never need to
be post-processed for vendoring, of course; we hope this will always be
correct in practice. If not, we can fix it later.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout:
 - no loop needed for MAIN_DOWNLOAD, it can have only one;
 - remove superfluous backslash in the definition of MAIN_DOWNLOAD;
 - introduce _ADDITIONAL_DOWNLOADS to avoid filter-out.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk |  3 ++-
 package/pkg-generic.mk  | 11 ++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a15e21e110..0718f21aad 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -103,6 +103,7 @@ endif
 #
 # Argument 1 is the source location
 # Argument 2 is the upper-case package name
+# Argument 3 is a space-separated list of optional arguments
 #
 ################################################################################
 
@@ -118,10 +119,10 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
-		$(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(if $($(2)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
+		$(3) \
 		$(QUIET) \
 		-- \
 		$($(2)_DL_OPTS)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1222526ba1..38219ce088 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -192,7 +192,8 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
-	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
+	$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)))
+	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	@$(call step_end,download)
@@ -601,12 +602,16 @@ ifndef $(2)_PATCH
  endif
 endif
 
-$(2)_ALL_DOWNLOADS = \
-	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
+$(2)_MAIN_DOWNLOAD = \
+	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE))
+
+$(2)_ADDITIONAL_DOWNLOADS = \
 	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
 		$$(if $$(findstring ://,$$(p)),$$(p),\
 			$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$(p)))
 
+$(2)_ALL_DOWNLOADS = $$($(2)_MAIN_DOWNLOAD) $$($(2)_ADDITIONAL_DOWNLOADS)
+
 ifndef $(2)_SITE
  ifdef $(3)_SITE
   $(2)_SITE = $$($(3)_SITE)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
