Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697A8C67871
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14BCF40399;
	Tue, 17 Jan 2023 09:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14BCF40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8AQunV4yd65; Tue, 17 Jan 2023 09:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C59040153;
	Tue, 17 Jan 2023 09:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C59040153
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5E61BF95F
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B90081330
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B90081330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUMXLqWnw0qo for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BC5F812F5
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC5F812F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28B7487C19; Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 15:42:02 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5b8918a99ea16fe191af3b9ea9b6d33c2d1e0900
X-Git-Newrev: 71bb1b27ea3bc53138a5fcf1ae08409759f1790f
X-Patchwork-Hint: ignore
Message-Id: <20230117093419.28B7487C19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-generic.mk:
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

commit: https://git.buildroot.net/buildroot/commit/?id=71bb1b27ea3bc53138a5fcf1ae08409759f1790f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index fdf53063be..a88934b866 100644
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
