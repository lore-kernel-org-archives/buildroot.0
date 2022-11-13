Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDAFC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54E0813ED;
	Sun, 13 Nov 2022 21:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54E0813ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emiow9R-tMqh; Sun, 13 Nov 2022 21:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4603813E3;
	Sun, 13 Nov 2022 21:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4603813E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 006701BF86C
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB592813E3
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB592813E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJuZE-lDHfEl for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:37:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0CBD813DF
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CBD813DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98C0A837FB; Sun, 13 Nov 2022 21:37:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:32:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6facb6fa1022a6bc5aa6fbdbaf20b1a57f420259
X-Git-Newrev: 6465c79166fed0c9a9b99a15d34c555a3141344f
X-Patchwork-Hint: ignore
Message-Id: <20221113213752.98C0A837FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/arch.mk.xtensa: relax check on
 overlay file to apply only to internal toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=6465c79166fed0c9a9b99a15d34c555a3141344f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4cbf7336914f25478aea943456ba7dc3c892c21a ("arch/xtensa: custom
configuration requires an overlay") added a check in
arch/arch.mk.xtensa to bail out if a custom Xtensa core is selected
but not overlay file is provided. While this is indeed a perfectly
valid check to make when building an internal toolchain, with an
external toolchain it's entirely possible to build with no overlay
file: the toolchain already exists, and there's no overlay to be
applied in the context of the Buildroot build.

And indeed commit 4cbf7336914f25478aea943456ba7dc3c892c21a broke some
of the runtime test cases that use a custom Xtensa core configuration,
with no overlay, to test the toolchains.bootlin.com Xtensa external
toolchain. By relaxing the check to only apply to internal toolchain
configurations, we fix those test cases.

It is to be noted that this still allows a configuration where gdb gets
built for a custom core, but with no overlay, so basically that means
the fsf variant, which can lead to build or run failures that
4cbf7336914f attempted to fix to begin with. This still covers the
most common cases.

Finally, it also means being able to build a kernel with no overlay, but
this is offset by the fact that the kernel may be already patched with
an overlay (as it is possible to specify a custom kernel), which is most
probably what people using a custom core would have.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261966
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261963

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: extend commit log with last two paragraphs]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/arch.mk.xtensa | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 7b6c59cecd..75145e725f 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -1,6 +1,6 @@
 BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 
-ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
+ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM)$(BR2_TOOLCHAIN_BUILDROOT):$(BR_ARCH_XTENSA_OVERLAY_FILE),yyy:)
 $(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
