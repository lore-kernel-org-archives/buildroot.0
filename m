Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB2CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10AA140467;
	Sun, 13 Feb 2022 15:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8YXPUjnBLin; Sun, 13 Feb 2022 15:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 195BA40360;
	Sun, 13 Feb 2022 15:30:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 113261BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F8B881501
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpEBBcQyfxvB for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F6F681836
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 15E9F82974; Sun, 13 Feb 2022 15:18:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:21:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85ee640eb5a3904eae0d743d32afa015dd6cc760
X-Git-Newrev: d0339905fcdfce98d2c0b45c0795ad79faf6c519
X-Patchwork-Hint: ignore
Message-Id: <20220213151835.15E9F82974@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptopp: disable altivec if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0339905fcdfce98d2c0b45c0795ad79faf6c519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
bf4cf9de833e2d571d98d1ca935ea08a3468e463:

blake2s_simd.cpp:715:8: error: 'uint32x4_p' does not name a type; did you mean 'uint32_t'?
  715 | inline uint32x4_p VecLoad32(const T* p)
      |        ^~~~~~~~~~
      |        uint32_t

Fixes:
 - http://autobuild.buildroot.org/results/9e9f8559b12b8e2cf99cfab435fa7dd5796bbcd5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cryptopp/cryptopp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 4353e35e0a..87d6fba237 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -47,6 +47,10 @@ ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
 CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
 endif
 
+ifneq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_ALTIVEC
+endif
+
 ifneq ($(BR2_ARM_CPU_HAS_NEON),y)
 CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_ARM_NEON
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
