Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43165C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1305680DC3;
	Wed,  7 Feb 2024 16:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cpd56KDw_lDB; Wed,  7 Feb 2024 16:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27ED481244
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27ED481244;
	Wed,  7 Feb 2024 16:25:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4AA1BF59A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87EAA420AA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0YuWKGacyGbZ for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C55F941F01
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C55F941F01
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:24:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B16EA87623; Wed,  7 Feb 2024 16:24:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:24:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 538332d944883ebeb2b91d3b31425593165c0d34
X-Git-Newrev: 13f8df8ed6e69f102d71d2040176b9374ff81706
X-Patchwork-Hint: ignore
Message-Id: <20240207162449.B16EA87623@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: fix aarch64 build
 with BR2_OPTIMIZE_0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=13f8df8ed6e69f102d71d2040176b9374ff81706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
