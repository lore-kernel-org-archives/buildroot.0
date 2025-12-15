Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A11FD5B874
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E3E760F63;
	Mon, 15 Dec 2025 22:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IBVitihaDJJ; Mon, 15 Dec 2025 22:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF7460F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839020;
	bh=UI6Z7XWRjQuHHsmjj/wZedebpbFNFEZfQI5s47l1MhM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LfGvRmmsf2OwXe6ecF+MzD4/MuzVWRkI+ubQzbLBv82ZtpvJ5Jr+CJZhBtXgEAFTk
	 cWxC43VXg6bOyw9eOKfMJm0CZVN+nwX0CisbuiAlktrNgg2hdrK4BEqenazNMnRhVh
	 IAhQakoBpG0ira5S6KZu4E/IypKU61a0F58zGUgXsdXNzX+NExAD3UltFkBlK+Zxzh
	 8wJvIbqFbxsQpxX2oTYMpKpTPdf9b2hErrbp2ceI+zyeGogGSBeAz1gUZhapoWVnAj
	 BFj4Rryb+Gy8jSb9O73HtPYIPnyTPk6gCg5ViDJ5huV9vNO3KRVH67fsPHjbBxXQTe
	 OkhuDRwAaA1dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF7460F2F;
	Mon, 15 Dec 2025 22:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC145151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE29980FBC
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO9KZXd31-lX for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08DD381197
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08DD381197
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08DD381197
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 390E44E41C18
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0ECB860664;
 Mon, 15 Dec 2025 22:50:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0490A11942986; Mon, 15 Dec 2025 23:50:10 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Dec 2025 23:49:41 +0100
Message-ID: <20251215224952.1253359-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839012; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=6IcVmKn3CmebMaA2krAI6irvMyAzhdRq85bXgkYkVSg=;
 b=Lqj6XRLg+LZokgUkaWglcsZsb1Kl+T+egEaDHlvGiwyOwG/pbSqsWIL0hg4WJ0r0cdr4+f
 2bqW67uQFnFc+vdMT0M5lZ4ACfYfa7yaRJExQmrcpKyKRBC9hX4+1+KMDSKineknWaXq5k
 dVAN7TMICfsgOcTGCTwqQgZg2ZneUHHnAuqAPZj1kB5fH5YcJ8QsD3zjrWWi+6WGxrduUf
 XVyCEKsZRB71V/Cj4Sy3OFT22SMxjNCHUjDtWIPGl5niMdhmKyRb//Fk1w3x/LXuGJXRdM
 OZMO2iDz16TFLAIbNTMcHIYhfU38Muvf0rLaXIXcDXZF55r+yHGjMkeV2VLIcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Lqj6XRLg
Subject: [Buildroot] [PATCH 09/13] package/mpv: drop rpi-userland support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the rpi-userland package, drop support for it
from package/mpv.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/mpv.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 8832b68ece..a6e0641bd0 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -24,7 +24,8 @@ MPV_CONF_OPTS = \
 	-Dopensles=disabled \
 	-Drubberband=disabled \
 	-Duchardet=disabled \
-	-Dvapoursynth=disabled
+	-Dvapoursynth=disabled \
+	-Drpi=disabled
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 MPV_CONF_OPTS += -Dbuild-date=false
@@ -162,14 +163,6 @@ else
 MPV_CONF_OPTS += -Dsdl2=disabled
 endif
 
-# Raspberry Pi support
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-MPV_CONF_OPTS += -Drpi=enabled -Dgl=enabled
-MPV_DEPENDENCIES += rpi-userland
-else
-MPV_CONF_OPTS += -Drpi=disabled
-endif
-
 # va-api support
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += -Dvaapi=enabled
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
