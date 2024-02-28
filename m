Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47C0C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F0488247F;
	Wed, 28 Feb 2024 20:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpjyLaOe5_-K; Wed, 28 Feb 2024 20:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2B448248F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B448248F;
	Wed, 28 Feb 2024 20:02:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 426C91BF4D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 20:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EC0D8248F
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 20:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPf7KR0XyAVr for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 20:02:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6319D8247F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6319D8247F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6319D8247F
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 20:02:19 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5C8772C80248
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:02:17 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 21:02:16 +0100
Message-Id: <20240228200216.715455-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1709150537; bh=pKZSMShgcyHUK4ZxoHq7G0ahX8PBQEPx4blunHncSb4=;
 h=From:To:Subject:Date;
 b=E8QlfHPsIv5EH3hlf0XHygxPtQY1i6xNvyTGcYqFA6Qamc1oWyFPJMoxCkm162hW/
 0b1+33YqEYTRgaLUTLpPxJUbpayKKp5tX+JviRdDq2WWJUeQqxVkCefjSVmHRrz6Ja
 CzeNNMUQwJnRATxIHgsGHCIe88UfO3n1bVsoZJfx/ALF7TwvlFa9WcJYVpm7WG/JvX
 N80PDeN4AFJlLzn1EdXVBEk4Fdb1eddgvR1xvK7tVw8mzAd5oWDWNEx1Go5ZlZDLfP
 VImQDLY+N6Mel1t32L/uDaeV67pBozJnvJsk10vvix/7Hyw1CydPNGa4GJoVBWsmbh
 Vd7GAdQ4xAR8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=E8QlfHPs
Subject: [Buildroot] [PATCH] package/ccache: disable building tests
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/ccache/ccache.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index ac4bc4aba5..96b1b65c5c 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -16,7 +16,8 @@ HOST_CCACHE_CONF_OPTS += \
 	-UCMAKE_C_COMPILER_LAUNCHER \
 	-UCMAKE_CXX_COMPILER_LAUNCHER \
 	-DZSTD_FROM_INTERNET=OFF \
-	-DHIREDIS_FROM_INTERNET=OFF
+	-DHIREDIS_FROM_INTERNET=OFF \
+	-DENABLE_TESTING=OFF
 
 # Patch host-ccache as follows:
 #  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
