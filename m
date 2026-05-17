Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C7FCD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 22:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C1E86F878;
	Sun, 17 May 2026 22:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKukufORJQig; Sun, 17 May 2026 22:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813386F867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779055236;
	bh=iSq90IPJlLaog2XLvqgftKtYxkBiFFg3fFTDS13c2Is=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dz7QFnnUnVHRvtD/FmrE5X6Wx+siLhKk6rHe97VVIvmvTbI4xVkLAHnNdqM12vdf8
	 V1Q2Vk8X0OthCSI4PzlKndlwh6DFBJQIhlupzjoYXyjq1GEiE4f+J8drjFh1TTsDwO
	 NnkxPMmcC3JhTQCr4vzNQ5B0UNGUsdw+Zzcr7NHLQnkDRlmkCJxW0i7Va2cC3DSrjm
	 lcfLl32P2s02rOWVZPUKQYO/fZkzQ/0E/LugLkJ3mUmpYjiE87M0oHUPMdGuzuyOL7
	 9aD2tcj2VPaIzsuLWwQYNpLo0syzxkp47gRzpqpo7MO69Ys7ARkRcu244/MH2Un+sG
	 7Ask4liN09bww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813386F867;
	Sun, 17 May 2026 22:00:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA7C390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C6C542871
 for <buildroot@buildroot.org>; Sun, 17 May 2026 22:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKKUCAAZdI26 for <buildroot@buildroot.org>;
 Sun, 17 May 2026 22:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C8E34286C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C8E34286C
 for <buildroot@buildroot.org>; Sun, 17 May 2026 22:00:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D3C286590; Sun, 17 May 2026 22:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 May 2026 23:59:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0f43c052ca0cbeaa3f68710dcd794c2e93bc5e6
X-Git-Newrev: 668b47bdab0bf4010a95187fed48b1489bace5c2
X-Patchwork-Hint: ignore
Message-Id: <20260517220026.9D3C286590@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: fix build failure for
 PowerPC soft-float
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/668b47bdab0bf4010a95187fed48b1489bace5c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As suggested in this review[1], when building for PowerPC with soft-float
enabled, let's also disable both WITH_POWER8/9 that in order disables
all the possible PowerPC acceleration instructions.

Fixes:
https://autobuild.buildroot.org/results/a0fa5a175c546993d818371a0de93b2e9845a183/

[1]: https://github.com/zlib-ng/zlib-ng/pull/2151/changes#r2803264882

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/zlib-ng/zlib-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 59e4e15282..448457799e 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -30,13 +30,13 @@ else
 ZLIB_NG_CONF_OPTS += -DWITH_NEON=OFF
 endif
 
-ifeq ($(BR2_powerpc_power8),y)
+ifeq ($(BR2_powerpc_power8):$(BR2_POWERPC_SOFT_FLOAT),y:)
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
 else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
 endif
 
-ifeq ($(BR2_powerpc_power9),y)
+ifeq ($(BR2_powerpc_power9):$(BR2_POWERPC_SOFT_FLOAT),y:)
 ZLIB_NG_CONF_OPTS += -DWITH_POWER9=ON
 else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER9=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
