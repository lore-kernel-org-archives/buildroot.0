Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A79D5B874
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01BDC8196A;
	Mon, 15 Dec 2025 22:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9Eu08XXzrpO; Mon, 15 Dec 2025 22:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B79080FAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839016;
	bh=ALoINO+fqnryKlqxQpLQsNArYAXua2l/JQRE/XPUBsE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=sDPEHeh4xdBK5AqtjIHWTwJ80lmfIEdxjTlbxIKR6MNBZ1E2+XSVt0swe1Z3pg8ab
	 dwp6eL+9wslrsFYqD+xNBL+mxHzJ9DsHdiaFiF33FWbcf1bPa/iiK2fUXuyqJt8zbN
	 wRcQ4UrJ+qujngCm7OtF5/q3s6KC2pJE3M7Bb9es+U0cVZ5J2CeXwaWCzKnYOUtLpk
	 e0tCtKcVUPMEWn7LqZ+9SAnpf/g9vLLv5GFyX2Mf5C8SeFrYeisKIxVkSVyKK0WEkB
	 v51A+LHiYiKp9h4kuq/MFG3KIOjQJHjJStcYKkpOskGoV7XlhvfgJklKiLPwtsCogK
	 e27P6WvM7+SPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B79080FAE;
	Mon, 15 Dec 2025 22:50:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1A31219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8812480FA6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTbc__s5sPSZ for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8425180FB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8425180FB2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8425180FB2
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9A3961A21C7;
 Mon, 15 Dec 2025 22:50:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E86860664;
 Mon, 15 Dec 2025 22:50:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2328111942983; Mon, 15 Dec 2025 23:50:09 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Date: Mon, 15 Dec 2025 23:49:40 +0100
Message-ID: <20251215224952.1253359-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839010; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=wHPfZmmfIeDdnb+v2oIxz8hReSvl7Viw12wbDazqRSg=;
 b=lwbglkVyOWQmuVAR8xfDKdEt9MFAyOP1l0rff4fAR9OWtqq31rD0Pvzi0TXb4guDW6TVGi
 PZ7tyr7NlQVSoQ7HupQwE2cFH2rZP8yIG+XGBvngvXmWN+onbtbHfQ97XeYf5dIIDnquSy
 xllBgsNQRKNfEV52gLj7K6B7iOfrwdSt+GsMp+iRekUH4ek1HbNifsZYPMhWDMksOTRJOy
 LmN019yM16u6TfGznmxrOD2yMFfaCb+BhRvLpy+Os3pJFI9eWQzeIsO/1vEuKMFmXIx5I3
 97IPaN4WtyUwRRPmEMHCwXddf1v9QU2qyU8CIv2sI868bDM+eX7dr0N7lLuwNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=lwbglkVy
Subject: [Buildroot] [PATCH 08/13] package/libwpe: drop rpi-userland
 specific tweak
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the rpi-userland package, drop the special
tweak for it from package/libwpe.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libwpe/libwpe.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index d8d2caa08a..5d1ad27add 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -16,10 +16,4 @@ LIBWPE_DEPENDENCIES = libegl libxkbcommon
 LIBWPE_CFLAGS = $(TARGET_CFLAGS)
 LIBWPE_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# Workaround for https://github.com/raspberrypi/userland/issues/316
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBWPE_CFLAGS += -D_GNU_SOURCE
-LIBWPE_CXXFLAGS += -D_GNU_SOURCE
-endif
-
 $(eval $(meson-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
