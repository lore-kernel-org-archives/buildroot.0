Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFEFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:19:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16F4960EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16F4960EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E466A6068D;
	Tue,  3 Aug 2021 22:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IK59U4Q6Xmwz; Tue,  3 Aug 2021 22:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 462C7605EF;
	Tue,  3 Aug 2021 22:19:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12EFC1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4DF5608BC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jw0LnUYn8a6J for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24995608D8
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6779E87F55; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Jul 2021 22:53:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 31af8797d530706926694f58abbde9ac9bfb98d7
X-Git-Newrev: 80168aa3c65d019df1619fc31e72c98d279e80c1
X-Patchwork-Hint: ignore
Message-Id: <20210803211000.6779E87F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-generic: add
 post-prepare hooks
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=80168aa3c65d019df1619fc31e72c98d279e80c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, when a package needs to modify files it inherits from its
dependencies, because they contain paths, we can only do that in a
pre- or post-configure hook.

However, whatever is done as part of those hooks, will be accounted
to the package itself, and thus will trigger file-overwrite detection.

So, we need a way to be able to actually modify files before we
start monitoring changes in those files.

We introduce a new set of hooks that an individual package can set,
or that a package infra can set, and that are called right before
we snapshot the state of target, and host (to which staging belongs),

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ff877598e3..97ee204b80 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -255,6 +255,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
+	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -835,6 +836,7 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
+$(2)_POST_PREPARE_HOOKS         ?=
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
