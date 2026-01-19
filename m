Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DCCCCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279294025B;
	Mon, 19 Jan 2026 10:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0w751xGb0iR; Mon, 19 Jan 2026 10:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E7D40D28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817375;
	bh=ahxabZNHUUYg1fpbw1fww93+LKw813lOzD+3P8YI9nw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sdrfG1jKJ+1Ep3tP3G8A/m5K5TOiTfPnn65JehOnW/mUTyw2iexS66lb5YP5iiaVt
	 IGmKrEzaxTqJeYCb+tWAkR279umt0pDe4n0Qm58zVou972jAaYL96lyaUf9J5oI6Vi
	 jznt23mR8m7yGpd6qtMQTP+aUsrkRh2OTC8Te/3WOi9APatHKE2XKZsugjtPbcIF1Z
	 i3vP9JHpBkDFA0NEaZ5EX1uNPXk5zLX47v1eBdVG/pAc0BAVh/pDSmTufZ6zvJjhl1
	 2ZzbxZ/8issnESOQdRMyovZ9TXda0X5d+i+xZTrR1OOYQVZWVuESb4IQYslpCCkjwc
	 8cP+ZHVvGrQaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E7D40D28;
	Mon, 19 Jan 2026 10:09:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50ED42CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31E8040CD4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rIOPVf8E8-f for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11B384025B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B384025B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11B384025B
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA346B97A968; Mon, 19 Jan 2026 11:09:27 +0100 (CET)
To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:27 +0100
Message-ID: <20260119100927.13052-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109163816.131696-2-vincent.stehle@arm.com>
References: <20260109163816.131696-2-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dowHT3mGbJtQZIVFNBlIdMzaVq6M/m+oYcwpBEXSoo8=;
 b=k6VN6C17ZH4hvQvnEnGIWXaQMJFC2dSsbiI7g09E5wBG2G6hbZwJZG8l6ZBgWvdEnMpTZy
 W2fyz50/aNKrS11kMtoQXuirHfXnIJdrdzjY3lJ/ZoJkkTtgPRT5Ujvgkr7WN2tCsxSFb5
 Nl7k0w1P3nPNhoeiXhofa3kVdUE1nu3yEzxX4uU/FNdDWJoxHjp75XSmELp7qUrs9f1BH8
 HlzZbHLcuhxPjnj3RO02cW45fUIixxJfSJAvKoZnPG8zMXmBS+LGEg5osNvs37CGwPtI90
 X5Cbna4HPcNdz+nKUVOYQwtNO+7Io4jZqYOh8SZiXdSas5diGW8F2m+PHPkAbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=k6VN6C17
Subject: Re: [Buildroot] [PATCH 1/2] package/xen: xen tools need coreutils
 stat at runtime
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gWGVuIHRvb2xzIHNjcmlwdHMgbmVlZCB0aGUgc3RhdCBwcm9ncmFtIGZy
b20gY29yZXV0aWxzIHRvIHdvcmsKPiBjb3JyZWN0bHksIGFuZCBub3QgdGhlIG9uZSBmcm9tIGJ1
c3lib3guCj4gT25lIHN1Y2ggZXhhbXBsZSBpcyB0aGUgL2V0Yy94ZW4vc2NyaXB0cy9sb2NraW5n
LnNoIHNjcmlwdCwgd2hpY2ggd2lsbAo+IGNhdXNlIHRpbWVvdXRzIGZvciBvcGVyYXRpb25zIHN1
Y2ggYXMgInhsIGJsb2NrLWF0dGFjaCIsIG9yIHdoZW4KPiBzdGFydGluZyBhIERvbVUgd2l0aCBh
IGRpc2suCj4gCj4gQWRkIHRoZSBkZXBlbmRlbmN5IG9uIGNvcmV1dGlscyB0byBmaXggdGhpcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5j
b20+Cj4gQ2M6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+CgpBcHBs
aWVkIHRvIDIwMjUuMDIueCBhbmQgMjAyNS4xMS54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2thZ2Uv
eGVuL0NvbmZpZy5pbiB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS94ZW4vQ29uZmlnLmluIGIvcGFja2FnZS94ZW4vQ29uZmln
LmluCj4gaW5kZXggNzBhMDZmM2NiZi4uZTgxNjhjYThjOCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3hlbi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3hlbi9Db25maWcuaW4KPiBAQCAtMzUsNiAr
MzUsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfWEVOX1RPT0xTCj4gIAlzZWxlY3QgQlIyX1BBQ0tB
R0VfQVJHUF9TVEFOREFMT05FIGlmICFCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPiAgCXNlbGVj
dCBCUjJfUEFDS0FHRV9CQVNIICMgcnVudGltZSAoc2NyaXB0cykKPiAgCXNlbGVjdCBCUjJfUEFD
S0FHRV9CVVNZQk9YX1NIT1dfT1RIRVJTIGlmIEJSMl9QQUNLQUdFX0JVU1lCT1ggIyBiYXNoCj4g
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfQ09SRVVUSUxTICMgcnVudGltZSAoc3RhdCkKPiAgCWhlbHAK
PiAgCSAgVGhlIFhlbiB0b29scyBjYW4gYmUgYWNjZXNzZWQgYnkgdGhlIHhsIGNvbW1hbmQuCj4g
IAo+IC0tIAo+IDIuNTEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
