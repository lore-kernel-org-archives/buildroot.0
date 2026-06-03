Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E6BCD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D65BF84677;
	Wed,  3 Jun 2026 18:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5B4w9PDgh1x; Wed,  3 Jun 2026 18:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 934F08466E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780510055;
	bh=sDxUux4I4fPPrYiV4BfU28KMuXIz8TL2k36JA2PxRgY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mriB9L4akqrWcYyqvKt4Hl82s4KdPrC1lnGJ+9EGybyjmt2Yq3KXNi0HSuEyTMEpc
	 KVfhA2LKygGJDw6UneDSvV8Bph9HQ5u0iAu3JjPlweXsrsQzvQ7M/ZoUllYOzcfLg0
	 CgBIMIbvAKkog+uOAon3ZE6A/RxS13Fl+ZsxGPV+M0QZaFA/7rA9hwHjX7UHuxN1BS
	 K31YqwvBhKjwJg73e1DMpKEyCj0P0SS50qAtmISReqSFlIQLrLMtTk2LxO8NMxO9qI
	 b6vOhriXEHx0YPzzqD3wbAcxECzORuzVB9X38RKNuYD+hUq2ugFNktk5CQiRBhWn3l
	 TFjGqI/ZekWLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 934F08466E;
	Wed,  3 Jun 2026 18:07:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7908DE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9919642036
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtcOQM-iVVcJ for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7FF741EE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7FF741EE7
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7FF741EE7
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:07:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Uq01winWm0dL0Uq01wkIKw; Wed, 03 Jun 2026 20:07:29 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  3 Jun 2026 20:07:28 +0200
Message-ID: <20260603180728.1392826-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGyG3LbmbouAAKeBuV94Ji8LlcRXzVb0pu7OO9O5l0icv8zY/oLzab9D5yQd1/NgQfKuiKo7QwPTfI6yzNWRLIGOcyMLkYvFUFnVuFVHFZsRqZxCaX+t
 dUPtwNXtNpdWnaX1oMILOZC59r3cnaf86f/7zFQVEZoUjb+2+VmNFefbd3AVRHugYIZYzRXTe5tw1HnNSIXUYXLoHNqk3hi55GJdGq92TmMtnc1auC+nknY9
 ITGkEHLXIhLnDEIyczehiGCWX9uiesZdk94nyFTsjTw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1780510049; bh=6EpJdJFO8trIjmW4lwNrHlelB+tIh8gwTuVtQ6HvOu4=;
 h=From:To:Subject:Date:MIME-Version;
 b=l3CtbiuAVKza/wIvTt9wnq0VxyNqNH9rwULJFV5b1FWcvElj8sRFCzjzGdAYCJeLK
 yvpneh2Lb0C61qGFk9m72qnVCWunZSKrrlH4X2B3cdP5NEn1aCWF4Io7lxhLOq3Aet
 qPmeJBTIceAdHieR1hz0HN2PbOJx1Tx/T9XaDtwGpvF8tGT6v5t0MD4sYVVsYLOeEm
 ptahUY6HHYRBe+VbjNHaK7QxIMx6oGghMLkfcpKhHhyWCotZRQW4bXUB2CrLysy1/a
 1kYM1o8Ebxv+P954VZ1uxUou5cj4L58eDTA5ltrJpF+Y0xNVMnTUsW++2ij64GGL5l
 OmlCEhyGYOvrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=l3CtbiuA
Subject: [Buildroot] [PATCH] package/esp-hosted: don't treat warnings as
 errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This driver fails to build because warnings are treated as errors but
this is too strict, so let's disable this behavior by setting:
KCFLAGS="-Wno-error"

Fixes:
https://autobuild.buildroot.org/results/df3763e74de4071331a41140fb5528523af9e374/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/esp-hosted.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 3de8f24123..5cf6571481 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -29,5 +29,7 @@ else
 ESP_HOSTED_MODULE_MAKE_OPTS = target=sdio
 endif
 
+ESP_HOSTED_MODULE_MAKE_OPTS += KCFLAGS="-Wno-error"
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
