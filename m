Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAACBCFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 22:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B808491D;
	Thu, 20 Nov 2025 22:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KSLJXAY73yy; Thu, 20 Nov 2025 22:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96F384907
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96F384907;
	Thu, 20 Nov 2025 22:06:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8FC122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9D6E41072
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBsDnB3MaFCt for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 22:05:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14BCF403AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14BCF403AE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14BCF403AE
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:05:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EF3141A1C61;
 Thu, 20 Nov 2025 22:05:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B75B1606F6;
 Thu, 20 Nov 2025 22:05:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E60810371BCD; Thu, 20 Nov 2025 23:05:54 +0100 (CET)
Date: Thu, 20 Nov 2025 23:05:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20251120230552.17b2f925@bootlin.com>
In-Reply-To: <20251120211347.1681108-1-bernd@kuhls.net>
References: <20251120211347.1681108-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763676355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wceOohvMdF7bh/gA2GA3+LjVUuDIkX0odpNWenskac4=;
 b=wWvggH4Osi6BWHsqnRddFJ0jDFTy82yPppXOYUyt5if2d+Fe2tFf54rqa1LWzsfuQ/4efM
 wGQAgxsE2TjdRyvjNre6TEAuQq5ZF7oeFPrSgHsSAeYQiP2ee8SdFiuOoSaXifrHGypIdA
 +w59qhJ28+ZJfR91DZqKfUPiTWMJggj70Wz9Zi3QgV/qEuxdR2CqlQPcu01IheiaMHEVeM
 qcvLVgReEIeSgWb2J8lQ0IKfJ3DgV+fmpDpUX1k+ImBjgZYpdQ/WU0lekCYao2SMlnnnGR
 Eio2qEXUE1EdRO0jbKeU/qB5hUIEHkY7Zxh1GchI7CCGI5oidQGIMY4a1D9Eqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=wWvggH4O
Subject: Re: [Buildroot] [PATCH 1/1] package/php-apcu: bump version to 5.1.27
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMCBOb3YgMjAyNSAyMjoxMzo0NyArMDEwMApCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PiB3cm90ZToKCj4gQ2hhbmdlbG9nOiBodHRwczovL3BlY2wucGhwLm5ldC9wYWNrYWdl
LWNoYW5nZWxvZy5waHA/cGFja2FnZT1BUEN1Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3Vo
bHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0KPiAgcGFja2FnZS9waHAtYXBjdS9waHAtYXBjdS5o
YXNoIHwgMiArLQo+ICBwYWNrYWdlL3BocC1hcGN1L3BocC1hcGN1Lm1rICAgfCAyICstCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQt
Ynk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgoKQmVzdCByZWdhcmRz
LApIZXJ2w6kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
