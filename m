Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B449CFC5FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 19:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CD5E400E7;
	Thu, 10 Oct 2024 19:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6LPR8za2Ltq; Thu, 10 Oct 2024 19:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4046C40494
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4046C40494;
	Thu, 10 Oct 2024 19:28:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E35471BF41A
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 19:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC2C181F13
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 19:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQDTdiVrreSL for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 19:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C1ED81F0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C1ED81F0C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C1ED81F0C
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 19:28:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DACA8780395;
 Thu, 10 Oct 2024 21:27:55 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39744])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Oct 2024 21:27:55 +0200
MIME-Version: 1.0
Date: Thu, 10 Oct 2024 21:27:55 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <ff5c88fb-c745-483c-9f8e-8aa49164e76b@dawncrow.de>
References: <20241009213719.49469-1-ju.o@free.fr>
 <ff5c88fb-c745-483c-9f8e-8aa49164e76b@dawncrow.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <7600b20432d4e3749dca9f5300bc8df4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728588478;
 bh=/Hf1bOf4TbEp8VpCSK4SUKKNQGM60k1ro4Ut5Tn0+AQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tdv6bBmDhW9X5O2Cc3VH6r7oxp7/NoN9nrcDCtBZIFAgWq1CPoBKgwdi68O/EfNhm
 W36LE/X4UrW9ZlSeGph3/fL+3lk2DIbbJiip3dnWx79+AOgrx5kIIxzJt+v3cnLNv0
 Ojtk8sogqEj5UAOQbsiOt/TOAuZrMxavHqwUg7kxFqu3S2cj8Le1khF++54gUV7fHr
 Jfvlt0sGTgcKAblVOBbEQSc5rQKXlpnvvsi7W2wDPojxrk9hTLXPkiFVmYgDIhAbhC
 GL0/rDSQA5LLHPTqQLTXtbfmUsNC4YJ7MDdShSlpRQWdRv6lEXaHpluHwArbZ8BwUC
 SbeEpW9ImMz7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Tdv6bBmD
Subject: Re: [Buildroot] [PATCH 1/1] package/wine: bump to version 9.19
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcsOpLCBUaG9tYXMsCgpPbiAxMC8xMC8yMDI0IDE3OjM5LCBBbmRyw6kgWndpbmcgd3Jv
dGU6Cj4gQW0gMDkuMTAuMjQgdW0gMjM6Mzcgc2NocmllYiBKdWxpZW4gT2xpdmFpbjoKPj4gRm9y
IGEgc3VtbWFyeSBvZiBjaGFuZ2VzIHNpbmNlIDguMC4yLCBzZWU6Cj4+IGh0dHBzOi8vd3d3Lndp
bmVocS5vcmcvbmV3cy8KPj4gCj4+IFRoaXMgY29tbWl0IGFkZHMgdGhlIHNoYTUxMiBoYXNoIHB1
Ymxpc2hlZCBvbiB0aGUgZG93bmxvYWQgc2l0ZS4KPj4gVGhlIExJQ0VOU0UgaGFzaCBhbHNvIGNo
YW5nZWQsIGR1ZSB0byBhIHllYXIgdXBkYXRlLgo+PiAKPj4gVGhpcyBjb21taXQgYWxzbyBhZGRz
IG5ldyBvcHRpb25hbCBkZXBlbmRlbmNpZXMgZm9yOgo+PiB4bGliX2xpYlhmaXhlcywgZmZtcGVn
LCBwY3NjLWxpdGUsIGFuZCB3YXlsYW5kLgo+PiAKPj4gQWxsIG5ldyBidWlsZCBvcHRpb25zIGFy
ZSBkaXNhYmxlZCBpbiBIT1NUX1dJTkVfQ09ORl9PUFRTOgo+PiBmZm1wZWcsIHBjc2MtbGl0ZSwg
dWRldiwgd2F5bGFuZCBhbmQgeGZpeGVzLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9s
aXZhaW4gPGp1Lm9AZnJlZS5mcj4KPj4gLS0tCj4+IFBhdGNoIHRlc3RlZCBpbjoKPj4gaHR0cHM6
Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2pvYnMvODAzODIwOTg4NAo+IAo+IEhp
IEp1bGllbiwKPiAKPiBJSVJDIHdlIGFncmVlZCBhdCBzb21lIHBvaW50IHRvIG9ubHkgdXNlIHN0
YWJsZSB2ZXJzaW9ucyAoZS5nLiA5LjApIGluIAo+IGJ1aWxkcm9vdC4gQW5kIHllcywgSSBoYXZl
bid0IGRvbmUgdGhhdCB5ZXQgdGhpcyB5ZWFyLgo+IFNvLCBwbGVhc2UgY29uc2lkZXIgYWRkaW5n
IDkuMCBpbnN0ZWFkLgoKU29ycnksIEkgd2FzIG5vdCBhd2FyZSBvZiB0aGlzIHJlY29tbWVuZGF0
aW9uLgoKSSB0aGluayB3ZSBzaG91bGQgYWRkIGEgY29tbWVudCB0byBwcmVmZXIgc3RhYmxlIHJl
bGVhc2VzIGJlZm9yZQpXSU5FX1ZFUlNJT04uIElkZWFsbHksIHdpdGggYSBsaW5rIHRvIHRoZSBk
aXNjdXNzaW9uLiBUaGUgbmVhcmVzdApyZWZlcmVuY2UgSSBjb3VsZCBmaW5kIG5vdyBpczoKaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIwMDcx
MzIwMjc1OC4xNDA4MS0xLWhlaWtvLnRoaWVyeUBnbWFpbC5jb20vIzI1NjUyNTkKCkRvIHlvdSBo
YXZlIGEgYmV0dGVyIHJlZmVyZW5jZT8KClNpbmNlIFRob21hcyBoYXMgYWxyZWFkeSBtZXJnZWQg
dGhpcyBjb21taXQgaW4KaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vY29tbWl0LzdjYjQ5ZTc3MTI3MGEwZWNiZTY1MWU0MGFkYzRiOTY2MGVhOGFlOGIKd2UgY2Fu
IGVpdGhlcjoKCjEuIHdhaXQgYSBiaXQgdW50aWwgdGhlIG5leHQgc3RhYmxlIDEwLjAgaXMgcmVs
ZWFzZWQ/IFNpbmNlIHRoaXMKYnVtcCBpcyA5LjE5LCB3ZSBzaG91bGQgbm90IGJlIHRoYXQgZmFy
IGZyb20gaXQuIEl0IG1pZ2h0IGhhcHBlbgphZnRlciB0aGUgbmV4dCBCdWlsZHJvb3QgMjAyNC4x
MSB0YWcsIHRob3VnaC4KCjIuIEkgY2FuIHNlbmQgYSBwYXRjaCBub3cgZG93bmdyYWRpbmcgdG8g
OS4wLgoKd2hhdCBkbyB5b3UgcmVjb21tZW5kIHRvIGRvPwoKVW5sZXNzIHRoZXJlIGlzIG1ham9y
IGlzc3VlcyB3aXRoIHRoaXMgdGhpcyA5LjE5LCBJJ20gbGVhbmluZyB0b3dhcmQgCm9wdGlvbiAj
MS4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
