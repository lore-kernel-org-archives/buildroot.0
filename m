Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83868CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 15:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37DCF812E0;
	Wed, 13 Aug 2025 15:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXhsK1avwmr3; Wed, 13 Aug 2025 15:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CBF28126B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CBF28126B;
	Wed, 13 Aug 2025 15:45:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2B131C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A98A78129A
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJ80IIejQ9nT for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 15:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51E1281232
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E1281232
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51E1281232
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:45:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A6CDA19F5C6;
 Wed, 13 Aug 2025 17:45:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 13 Aug 2025 17:45:04 +0200
Date: Wed, 13 Aug 2025 17:45:04 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <aJyzAFduKWIHzqy9@landeda>
References: <20250811153257.3746260-1-yann.morin.1998@free.fr>
 <20250812222457.7fipi2kzjjekmjtg@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250812222457.7fipi2kzjjekmjtg@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755099908;
 bh=mflaHOtUGEcRT6iDcwO0Q3meQfqP+NERBVrXWykI+3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9myioiPSanwVwoBcfrFPRqArX3gubm+Y6Jk9XNac4pj7McYeCPJMz3Y7hRZ+exlq
 k8saU5NZx5nP+UC7D/X1RT5PPw4zPIdDXVgbUMf7QTThGcE7uEosAoF9Hz9xBp2+3J
 mb0a5ElGShmNRk1Qs8ZvA0ZesZx6lFIh5Gs0j9kMaMvmtDraprwK00DnYEAs6umqN0
 I0DjCQdBG9z2pwUaxj44mRPSAxMMU4o4NPskyaez6ZMF6yIJB7Pla3NsNAmk79RAX2
 Ljupiiwq+GqREJr2jWKl40nqlCgEYNx1w1Tp/B5FySk93yudbqJLajnptpbrmKtIzj
 am/BRJ9gM9G8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h9myioiP
Subject: Re: [Buildroot] [PATCH] package/bash: fix build with gcc 15
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmxvcmlhbiwgQWxsLAoKT24gMjAyNS0wOC0xMyAwMDoyNCArMDIwMCwgRmxvcmlhbiBMYXJ5c2No
IHNwYWtlIHRodXNseToKPiBPbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCAwNTozMjo1N1BNICswMjAw
LCBZYW5uIEUuIE1PUklOIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiBDb21taXQgNmQwOWIyNWQw
OGZlIChwYWNrYWdlL2Jhc2g6IGZpeCBidWlsZCB3aXRoIGhvc3QgR0NDIDE1KSBkaWQKPiA+IGFw
cGx5IGEgd29ya2Fyb3VuZCBmb3Igd2hlbiB0aGUgaG9zdCBnY2MgaXMgZ2NjLTE1IChvciBsYXRl
ciksIGJ1dAo+ID4gbWlzc2VkIHRoZSBmYWN0IHRoYXQgdGhlIHRhcmdldCBjb21waWxlciBhbHNv
IGV4aGliaXRzIGJ1aWxkIGlzc3Vlcy4KPiBBdCB0aGF0IHBvaW50IGluIHRpbWUsIHRoZSBwYXRj
aCB0aGF0IGludHJvZHVjZWQKPiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xNSBoYWRuJ3Qg
YmVlbiBtZXJnZWQgeWV0CgpBaCwgdGhhdCBpbmRlZWQgZXhwbGFpbnMgaXQsIHRoZW4uIPCfkY0K
Cj4gSXQgc2VlbXMgdGhhdCBiYXNoIDUuMyAocmVsZWFzZWQgbGFzdCBtb250aCkgZml4ZXMgdGhl
c2UgaXNzdWVzWzFdLiBJJ3ZlCj4ganVzdCBidWlsZC10ZXN0ZWQgdGhpcyB3aXRoIEdDQyAxNSBv
biBteSBtYWNoaW5lIGFuZCBpdCBpbmRlZWQgc2VtcyB0bwo+IGJlIHdvcmtpbmcgZmluZSBub3cs
IHNvIHRoaXMgaXMgcHJvYmFibHkgd29ydGggYSB2ZXJzaW9uIGJ1bXAgc29vbi4gQnV0Cj4gZm9y
IHRoZSBvbGQgdmVyc2lvbiBpdCBtYWtlcyBzZW5zZSB0byBmaXggaXQgbGlrZSB0aGlzIGZvciBu
b3cuCgpFdmVuIGlmIHRoZSBidW1wIGZpeGVzIHRoZSBidWlsZCBpc3N1ZXMsIHdlIHdhbnQgdGhl
IGZpeCBzbyB0aGF0IGl0IGNhbgpiZSBiYWNrcG9ydGVkIHRvIG1haW50ZW5hbmNlIGJyYW5jaGVz
LCBJIHRoaW5rLgoKPiBSZXZpZXdlZC1ieTogRmxvcmlhbiBMYXJ5c2NoIDxmbEBuNjIxLmRlPgoK
VGhhbmtzISA6LSkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwg
Xy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
