Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9331E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 18:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBC561241;
	Tue, 17 Dec 2024 18:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-63xcibkFZc; Tue, 17 Dec 2024 18:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8251761247
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8251761247;
	Tue, 17 Dec 2024 18:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED130CE
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DADEA612D3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKggMc13OHrX for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 18:44:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E105A61241
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E105A61241
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E105A61241
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 227E578035E;
 Tue, 17 Dec 2024 19:44:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51154])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Dec 2024 19:44:45 +0100
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 19:44:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241217141429.3381228-1-vincent.stehle@arm.com>
References: <20241217141429.3381228-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5f62a05645d41a91213271c73e5782fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734461086;
 bh=huqu0b2zAlMJsCvrg+M9D/fWBTe54Tgk0ow3mFDV+eE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JSEns7idYakit2Dad+X6qH3ZgxFEtinlJTfo+5fD/eizcwHbVGAMN5HQYm2L2uFzz
 HhhZr+qmETLirNHNBhSqmmLMTGQyuvUvpq3wcujJP2ULakPqqijgDqgkKamT8wQrUR
 hSvMbA7ZMfCBPyaMh4FlTk874YO0Qao21ttBSXElTXlBl3BAOrM+iIpUoy7h5dE/Ww
 GHYW0PAnD0NXHj74IylJE5ssoUNRzduX9a0CD7vbcDNbXMGg4tz8Y3dmjEMryhVEP0
 GMH3jX4iIEZsM+6psVWKrUWVQSXZLyt8hhd/8wqi18T4bwDFpLWLa7TMrr8U2R0Ck+
 he2mRBAelYrQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JSEns7id
Subject: Re: [Buildroot] [PATCH] board/arm/fvp-ebbr: add TF-A hash
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTcvMTIvMjAyNCAxNToxNCwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFdlIGhhdmUgbm8g
bW9yZSBoYXNoIGZpbGUgZm9yIFRGLUEgdjIuMTEgaW4gdGhlIHBhY2thZ2UgZGlyZWN0b3J5IHNp
bmNlCj4gY29tbWl0IDI0NjE1ZDE1MDJlMiAoImJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmU6IGJ1
bXAgdG8gdjIuMTIiKTsgYWRkCj4gb25lIGluIG91ciBnbG9iYWwgcGF0Y2hlcyBkaXJlY3Rvcnku
Cj4gCj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gCj4gICBXQVJOSU5HOiBu
byBoYXNoIGZpbGUgZm9yIGFybS10cnVzdGVkLWZpcm13YXJlLXYyLjExLWdpdDQudGFyLmd6Cj4g
Cj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29t
PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCj4gLS0tCj4gCj4gSGksCj4gCj4gVGhpcyBp
cyB0byBmb2xsb3ctdXAgd2l0aCBvdXIgZGlzY3Vzc2lvbiBvbiBURi1BLiBbMV0KPiBJIGRpZCBi
dWlsZCB0ZXN0IGl0IG9rLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBWaW5jZW50Lgo+IAo+IFsxXSAK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI0LURl
Y2VtYmVyLzc2OTEyNS5odG1sCj4gCj4gIC4uLi9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJl
L2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2ggICAgICB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgCj4gYm9hcmQvYXJtL2Z2cC1l
YmJyL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFz
aAo+IAo+IGRpZmYgLS1naXQgCj4gYS9ib2FyZC9hcm0vZnZwLWViYnIvcGF0Y2hlcy9hcm0tdHJ1
c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoIAo+IGIvYm9hcmQvYXJtL2Z2
cC1lYmJyL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUu
aGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uOGI3N2UxZjE2
NQo+IC0tLSAvZGV2L251bGwKPiArKysgCj4gYi9ib2FyZC9hcm0vZnZwLWViYnIvcGF0Y2hlcy9h
cm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCj4gQEAgLTAsMCAr
MSwyIEBACj4gKyMgTG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1NiAgCj4gYzBmMjNjY2M3MWM0
OTk4OWU5YWQyMzhhY2YzMzQ0NzNjMTdiN2M4OGY3OWEyMGM4MjljM2Q0NDNlMzc5NGEyMiAgCj4g
YXJtLXRydXN0ZWQtZmlybXdhcmUtdjIuMTEtZ2l0NC50YXIuZ3oKPiAtLQo+IDIuNDUuMgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
