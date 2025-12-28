Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46353E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DBB14054A;
	Sun, 28 Dec 2025 19:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0xCXvCxCz0V; Sun, 28 Dec 2025 19:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8703440476
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766950706;
	bh=qoRJ9mZeo0/sJvLP6euYPdnNi5imxeyYp55obK/Qqdo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UC7w+IU0GkNT5VgZc1JiBwJZRGPP9uSezDeyB4kdgbRkd8ZHuKRxE+HRrMqdznaBk
	 1EE2FKAhJt3TxXnpOGaTsA8JVaoishFc5K2wd3y38w/WNfAkhGMuP+i8HnJw00semz
	 Z6LmPMK563ljuV/YPVW400Q9wsAefN5Q63ZVqS16rFkK6QRPJrRUEELuhQ1VVlpjeS
	 lr8NDjzLLjWT4T2YtkojYP8xrYPiXttosQYHQVtd3FRYnJJAuZNWLy2cKt6NBJISmp
	 afmus3h2ZNZTolkH6SZNEGwyky+4+b9Fj0kHB115C85Zp5r1BvriD/5wsEbeEitR4b
	 sfOCs5upXWRow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8703440476;
	Sun, 28 Dec 2025 19:38:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45BFED8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A06740083
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yKguD2lnQYx for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 19:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE47440072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE47440072
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE47440072
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:38:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9CB151A24BD
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:38:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73E3660725
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:38:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FB0111978E86; Sun, 28 Dec 2025 20:38:16 +0100 (CET)
Date: Sun, 28 Dec 2025 20:38:15 +0100
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= via buildroot <buildroot@buildroot.org>
Cc: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Message-ID: <20251228203815.47cd6d02@windsurf>
In-Reply-To: <DBCMY08KG84D.1F2PPB3UFPRK8@bootlin.com>
References: <DBCMY08KG84D.1F2PPB3UFPRK8@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766950696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tR+SDvyMXeES6tyEXWmVxTUy2em7I9uP8ZvU6sD3pdw=;
 b=Sqi7uZwSLozRmHS5Wz33ThVvlPwbNH0pMp74UM8Qt+WgeGabDjSjlWT10n6y/Vk568B2sT
 KEODhPXX1+qmJ1ASlRpw+Vv/69FTYZPVOvMD7Ix1hfxZ7+oq4ULDhCCzLplhvoTxg2Uh3k
 sd/B4gfXMVMKe4PQsJVo4oNjYjk55lNMvzkGaSg85nWhod+9onumLSLOJCMWqcaWDmYzG6
 bf2uigkpPBQhMIL+aqq5QAk/eLaVX+mPgjsB/vP7TNyDB7zPjm2zC8nRSmqWVUpLzLWn2A
 aT2d99pplxSb4F6v93CBowmQ3x+IDGIC8U1Cliu9APdQER9kEXFonJCXKtbUDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Sqi7uZwS
Subject: Re: [Buildroot] Build failure on qt5webkit
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGlzLAoKT24gVHVlLCAxNSBKdWwgMjAyNSAxNDo0MjoyMSArMDIwMApBbGV4aXMg
TG90aG9yw6kgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoK
PiBJIGFtIGZhY2luZyBhIGJ1aWxkIGlzc3VlIHdpdGggcXQ1d2Via2l0IHBhY2thZ2Ugb24gYnVp
bGRyb290IDIwMjUuMDIueC4KPiBUaGUgYnVpbGQgb3V0cHV0cyB0aGUgZm9sbG93aW5nIGVycm9y
OgoKRllJLCBJIGFsc28gZmFjZWQgdGhpcyBpc3N1ZSB0b2RheSwgYW5kIEkgaGF2ZSBhIGZpeCBm
b3IgaXQuIEknbGwKc3VibWl0IHRvZ2V0aGVyIHdpdGggc2V2ZXJhbCBvdGhlciBxdDV3ZWJraXQg
Zml4ZXMgKEkgaGF2ZSBhIHN1Y2Nlc3NmdWwKcXQ1d2Via2l0IGJ1aWxkIHdpdGggZ2NjIDE1Lngp
LgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
