Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42680C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA85F419C5;
	Mon, 20 Feb 2023 21:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA85F419C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhqWt_rK4v4y; Mon, 20 Feb 2023 21:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67FA342D28;
	Mon, 20 Feb 2023 21:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67FA342D28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0341BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9AAD610C6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9AAD610C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_NJXVV7Mo7O for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5499610B2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5499610B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A940E8648F; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:32:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6facb6fa1022a6bc5aa6fbdbaf20b1a57f420259
X-Git-Newrev: 6465c79166fed0c9a9b99a15d34c555a3141344f
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.A940E8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/arch.mk.xtensa: relax
 check on overlay file to apply only to internal toolchains
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
