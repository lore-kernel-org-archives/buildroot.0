Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C230C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 17:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CA5983FFC;
	Thu,  5 May 2022 17:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oojKbTe7cBv; Thu,  5 May 2022 17:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1900983FF1;
	Thu,  5 May 2022 17:19:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFDEE1BF354
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABEFE41997
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 17:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhN6WMXUJwCw for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 17:19:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79BC74055D
 for <buildroot@buildroot.org>; Thu,  5 May 2022 17:19:49 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar22.francetelecom.fr (ESMTP service) with ESMTPS id 4KvL6V6r82z2ybH; 
 Thu,  5 May 2022 19:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1651771187;
 bh=dUeDi035B3pncSUpOZKm/LYrjOJYmeNsC+N4PGx+GeY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=MhjYrytUlYiNdwawAKFG9keI+vTwxkUywmExEUGZl1AkLlqMLj1gcoiWkEkwOP/gN
 iCfyUJy850hnmSW8rL86mmOOE5iF6fWRChnyX08r5+4bD/1I6yEZ3i01cXThk3BpR1
 KvvRTsFlWPfnBa8s3QTyxczFkj/DSvUNYxga0GpYgkVI7Yct2RIUCfvfpQkfPtWYJB
 6dSmoIFnm+iSd/DJkGR43N+jgoA/kNs02HwUkk3GbXVdDbAZxrj4bCQJW7n5RvxbNU
 8h4NPq88gUDldS1pRKRmr9b3B0vvLfBAfoSpPG0candcZrReiuDTa7TYXDbM97vSOo
 LyVuZPaEa9dkw==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 05 May 2022 19:19:39 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 5 May 2022 19:19:39 +0200
Message-ID: <24588_1651771186_62740732_24588_360_1_2d4cd3ac6995d7b5119ef4dfdc22b975992b8a73.1651770627.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX205.corporate.adroot.infra.ftgroup (10.115.27.6)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH] package/pkg-download: do not try to vendor
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

For golang- or cargo-based packages, we apply a vendoring pass after the
package's "main" download is done. Whether to vendor or not is based on
the heuristic that a specific directory exists or not; for golang
packages, we look for '/vendor', while for cargo, we look for '/VENDOR'.

This is fine for the "main" (by lack of a better term) download, but
this falls flat on its face for extra downloads. Indeed, so packages may
need to download data sets, or assets, as _EXTRA_DOWNLOADS. Those are
usually just data blobs, and are not actual golang or cargo packages; as
such they do not need to be vendored, but worse, if we try to actually
vendor them, this fails because the required files for vendoring are
missing from the archives in such data sets.

We fix that by decoupling the download for the extra download, from the
download for the main archive. We pass the post-processing option only
to the main download.

This makes the hard assumption that extra downloads will never need to
be post-processed for vendoring, of course; we hope this will always be
correct in practice.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-download.mk | 3 ++-
 package/pkg-generic.mk  | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a15e21e110..28b31ca30e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -103,6 +103,7 @@ endif
 #
 # Argument 1 is the source location
 # Argument 2 is the upper-case package name
+# Argument 3 is a sapce-separated list of optional arguments
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
index 1222526ba1..3a3af44fc4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -192,7 +192,8 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
-	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
+	$(foreach p,$($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$(p),$(PKG),$(if $($(PKG)_DOWNLOAD_POST_PROCESS),-p '$($(PKG)_DOWNLOAD_POST_PROCESS)'))$(sep))
+	$(foreach p,$(filter-out $($(PKG)_MAIN_DOWNLOAD),$($(PKG)_ALL_DOWNLOADS)),$(call DOWNLOAD,$(p),$(PKG))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	@$(call step_end,download)
@@ -601,8 +602,11 @@ ifndef $(2)_PATCH
  endif
 endif
 
-$(2)_ALL_DOWNLOADS = \
+$(2)_MAIN_DOWNLOAD = \
 	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
+
+$(2)_ALL_DOWNLOADS = \
+	$$($(2)_MAIN_DOWNLOAD) \
 	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
 		$$(if $$(findstring ://,$$(p)),$$(p),\
 			$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$(p)))
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
