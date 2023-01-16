Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3C4C63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4945B417D1;
	Tue, 17 Jan 2023 09:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4945B417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcdJvtB2tDle; Tue, 17 Jan 2023 09:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3291441780;
	Tue, 17 Jan 2023 09:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3291441780
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7041BF95E
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE3840153
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE3840153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_u-v3HtGqK1 for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11E62402A7
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11E62402A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC14687C3B; Tue, 17 Jan 2023 09:40:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 15:44:06 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 352f5bd46c46f0e9146a93f2221d05b2d28ba6e2
X-Git-Newrev: 8fb5d033329f51e8a07ff252a25daa7239d80c6a
X-Patchwork-Hint: ignore
Message-Id: <20230117094049.EC14687C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/pkg-generic.mk:
 no legal info WARNING if REDISTRIBUTE = NO
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fb5d033329f51e8a07ff252a25daa7239d80c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Packages making use of OVERRIDE_SRC_DIR or of the local SITE_METHOD,
will trigger a warning when the legal-info target is built, for example:

WARNING: foo: sources not saved (local packages not handled)

But in the situation where the packages has explicitly defined
FOO_REDISTRIBUTE = NO
in its .mk file, it makes no sense since the sources wouldn't be saved
anyway.

This patch swap the conditions on the type of package and on the
REDISTRIBUTE value, so that the warnings get issued only if
REDISTRIBUTE equals YES.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c541df41806f0940128ab333d693fb7766e98da7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f24e03a325..b31c563ae5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1145,6 +1145,7 @@ else
 	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
+ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
@@ -1155,7 +1156,6 @@ else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 else
 # Other packages
 
-ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Save the source tarball and any extra downloads, but not
 # patches, as they are handled specially afterwards.
 	$$(foreach e,$$($(2)_ACTUAL_SOURCE_TARBALL) $$(notdir $$($(2)_EXTRA_DOWNLOADS)),\
@@ -1169,9 +1169,9 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 			$$($(2)_REDIST_SOURCES_DIR) || exit 1; \
 		printf "%s\n" "$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
 	done <$$($(2)_DIR)/.applied_patches_list
-endif # redistribute
-
 endif # other packages
+
+endif # redistribute
 	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
