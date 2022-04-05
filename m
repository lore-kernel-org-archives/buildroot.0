Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F10C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 19:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A261416B6;
	Tue,  5 Apr 2022 19:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knc1OSyYl5rG; Tue,  5 Apr 2022 19:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F34F040A03;
	Tue,  5 Apr 2022 19:03:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 823C01BF83E
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA1F4155C
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYG8-zTYJvon for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 19:02:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF31141523
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 19:02:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 09F348361A; Tue,  5 Apr 2022 18:53:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Apr 2022 19:12:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f54b5a64f2f51c7e30b291dfa177f855bd88d6f2
X-Git-Newrev: 43e859d47a5474d8acdaf81a0ea63aa9a909985f
X-Patchwork-Hint: ignore
Message-Id: <20220405185320.09F348361A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opus: fix build with
 BR2_OPTIMIZE_FAST
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

commit: https://git.buildroot.net/buildroot/commit/?id=43e859d47a5474d8acdaf81a0ea63aa9a909985f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/194/1941e194e1f5ad0bc4982ad39c3e34d266bc49c6/

opus requires that it is configured with --enable-float-approx when
-ffast-math (BR2_OPTIMIZE_FAST) is used, otherwise it errors out at build
time:

celt/arch.h:198:2: error: #error Cannot build libopus with -ffast-math
unless FLOAT_APPROX is defined.  This could result in crashes on extreme
(e.g.  NaN) input

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 4f816df477..2fa929c7df 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
 endif
 
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+OPUS_CONF_OPTS += --enable-float-approx
+endif
+
 # When we're on ARM, but we don't have ARM instructions (only
 # Thumb-2), disable the usage of assembly as it is not Thumb-ready.
 ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_ARM_CPU_HAS_ARM),y:)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
