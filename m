Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EB0C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 22:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00D5140481;
	Wed, 19 Oct 2022 22:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D5140481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtN47G-yC0PO; Wed, 19 Oct 2022 22:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3620401FB;
	Wed, 19 Oct 2022 22:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3620401FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD401BF983
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD1F360B1E
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD1F360B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxzw8GFAhe-x for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 22:01:11 +0000 (UTC)
X-Greylist: delayed 13:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9718060AE1
Received: from mail.h6t.eu (cloud.h6t.eu [167.235.55.38])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9718060AE1
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 22:01:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A6272147CB; Thu, 20 Oct 2022 00:01:09 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 00:00:18 +0200
Message-Id: <20221019220019.8418-2-moritz@h6t.eu>
In-Reply-To: <20221019220019.8418-1-moritz@h6t.eu>
References: <20221019220019.8418-1-moritz@h6t.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666216869; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=obcmvSzhDQBPPiSZQkCAR4z5RaA2iUmvqauu9NlJ71o=;
 b=A/kIxFJA4ao7z70rphOf5MB5ZVjl9fjyZR24qL7Oh1hyOfZ5cQCnNXhGPab5eqHAbMt5AO
 XUs9+7raDZqhBGTh4AmpFSbu6eYsT3VH19lDOgVUlrt3gLTV59j8q4E8a55SejKpazEJf+
 rr/V/+WNRHdZ4FrypuKhElm99wSaLf8zifl3ayVeqRhkrPy3MLJybQ90rk9Ypwwl6S+Nth
 LmRDpz38KzVTMNhWgFUSYL0bGqBuqh25RTBP7rAUBJofnnwry6X7Vmhe9VP/clbIpPABjc
 Nsk7P2vlHUaziOrGG1GBs/28daHUn2+MbV+fJRLxJEAXG76ZSIxwTLza9gjr5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=A/kIxFJA
Subject: [Buildroot] [PATCH 1/2] package/pkg-cargo.mk: fix handling of
 runtime debug builds
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: moritz@h6t.eu
Cc: Moritz Bitsch <moritz@h6t.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Moritz Bitsch <moritz@h6t.eu>

The cargo --release flag is used to create optimized builds, not supplying
--release has major performance implications.

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index f7e3f39503..e0556252fa 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -119,7 +119,7 @@ define $(2)_BUILD_CMDS
 		$$($(2)_CARGO_ENV) \
 		cargo build \
 			--offline \
-			$$(if $$(BR2_ENABLE_DEBUG),,--release) \
+			$$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
 			--manifest-path Cargo.toml \
 			--locked \
 			$$($(2)_CARGO_BUILD_OPTS)
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
