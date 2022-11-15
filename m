Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A2CC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 344D6409F9;
	Tue, 15 Nov 2022 13:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 344D6409F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gpcdo2xubGr; Tue, 15 Nov 2022 13:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51186409E2;
	Tue, 15 Nov 2022 13:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51186409E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16FEE1BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD982409E2
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD982409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbW4UxQKz8uZ for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:25:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02EBF409EF
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02EBF409EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E41B783C7B; Tue, 15 Nov 2022 13:25:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:21:42 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4e8d2508c4b303625b008fa043227607f5c88bb2
X-Git-Newrev: f5c143672f1554e53bd46ccbb82cd0d4242f8d8c
X-Patchwork-Hint: ignore
Message-Id: <20221115132518.E41B783C7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] arch/arch.mk.xtensa:
 relax check on overlay file to apply only to internal toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5c143672f1554e53bd46ccbb82cd0d4242f8d8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 6465c79166fed0c9a9b99a15d34c555a3141344f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
