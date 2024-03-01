Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850B9C54E41
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5572083131;
	Fri,  1 Mar 2024 10:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1d96jUuG5T8; Fri,  1 Mar 2024 10:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E8B8316A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E8B8316A;
	Fri,  1 Mar 2024 10:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E43B71BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEAAA83131
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leLLzyxgZYc0 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0B28316A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C0B28316A
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:55:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00B9C87EA2; Fri,  1 Mar 2024 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 11:54:06 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 3526dea52c22d5faeb6f13c6009837ed0ae78f4d
X-Git-Newrev: a1af858ee9d8d69cf1272a6a38cc3a0dd658dd4a
X-Patchwork-Hint: ignore
Message-Id: <20240301105527.00B9C87EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/bayer2rgb-neon:
 fix aarch64 build with BR2_OPTIMIZE_0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1af858ee9d8d69cf1272a6a38cc3a0dd658dd4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure with aarch64 and BR2_OPTIMIZE_0 raised
since commit 0512910e4901edcb78bb1daa4eb3be9bdc4dc8a9:

src/convert-neon-body-bayer8.inc.h: In function 'bayer2rgb_convert_neon':
src/convert-neon.c:233:17: error: third argument to '__builtin_prefetch' must be a constant
  233 |                 __builtin_prefetch(((void const *)(_addr)) + 64, 0, (_lvl)); \
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
src/convert-neon-body-bayer8.inc.h:8:9: note: in expansion of macro 'do_prefetch'
    8 |         do_prefetch(&in[+1*stride - 1], (rows_per_loop) < 3 ? 3 : 0);
      |         ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/307c1c448becd99dfba3a17b3ef816db0bb5cad6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 13f8df8ed6e69f102d71d2040176b9374ff81706)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bayer2rgb-neon/bayer2rgb-neon.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
index 212fe76766..5147a985e8 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.mk
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
@@ -19,6 +19,14 @@ ifeq ($(BR2_arm),y)
 BAYER2RGB_NEON_CFLAGS += -mfpu=neon
 endif
 
+# __builtin_prefetch() third argument must be a constant, but
+# bayer2rgb-neon uses a variable, derived from a constant, so some
+# optimization is needed to allow the compiler to turn it into a
+# constant, otherwise the build fails
+ifeq ($(BR2_OPTIMIZE_0),y)
+BAYER2RGB_NEON_CFLAGS += -O1
+endif
+
 BAYER2RGB_NEON_CONF_ENV = CFLAGS="$(BAYER2RGB_NEON_CFLAGS)"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
