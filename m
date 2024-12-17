Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83CEE7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 18:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0BA381E62;
	Tue, 17 Dec 2024 18:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRdV6HyNAVkK; Tue, 17 Dec 2024 18:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61AB81F12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C61AB81F12;
	Tue, 17 Dec 2024 18:45:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4200CCE
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23FBD40925
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffJ9vMucr-9J for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 18:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F25B0404A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F25B0404A4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F25B0404A4
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:45:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B77C02003AE;
 Tue, 17 Dec 2024 19:45:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34854])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Dec 2024 19:45:04 +0100
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 19:45:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20241217141443.3381247-1-vincent.stehle@arm.com>
References: <20241217141443.3381247-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b022b52cc87cb9f56835f9e79183a016@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734461109;
 bh=3oreHCSk4KMzzjRU6vNNe+pL5b+TW++AjMJM3YxvGg8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kFWOgJzr+/oFBGb4ioitYkuuJRvuniDU/+eKv/boBk1Cet9W7Nvg6HZ1ZvL0XrzF7
 gQVaYeQa7xp3cF0zIWHip03jeAVJZfT2I65NnuDd+rMkP+QGu2zul6t2sqkniLqDr9
 rvN8GSvluNg9SQ+XziHoRkh94nBiCvo5hIov41pD3l56gSjxRNCl0Gp8Oi+DSEExHj
 oCGWgWW2XAGZc3p4PiUxa8d04giLs3g4F1WySCS1NQJ1kTl/rV9G2Cm7gn7DGyux4t
 1lQo6C6z8Xm0HdleVvc8SiMSsw0YzMIkVpeLte0S9Cpmay4RfF8qFr35zv+RhtypO7
 Uohmg37lL6IzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kFWOgJzr
Subject: Re: [Buildroot] [PATCH] board/pine64/rockpro64: add TF-A hash
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
Pgo+IENjOiBTdW5pZWwgTWFoZXNoIDxzdW5pbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiBDYzog
SmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gQ2M6IEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KCj4gLS0tCj4gCj4gSGksCj4gCj4gVGhpcyBpcyB0byBmb2xsb3ctdXAg
d2l0aCB0aGUgZGlzY3Vzc2lvbiB3aXRoIEp1bGllbiBvbiBURi1BLiBbMV0KPiBJIGRpZCBidWls
ZCB0ZXN0IGl0IG9rLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBWaW5jZW50Lgo+IAo+IFsxXSAKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI0LURlY2Vt
YmVyLzc2OTEyNS5odG1sCj4gCj4gIC4uLi9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2Fy
bS10cnVzdGVkLWZpcm13YXJlLmhhc2ggICAgICB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgCj4gYm9hcmQvcGluZTY0L3JvY2tw
cm82NC9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhh
c2gKPiAKPiBkaWZmIC0tZ2l0IAo+IGEvYm9hcmQvcGluZTY0L3JvY2twcm82NC9wYXRjaGVzL2Fy
bS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2ggCj4gYi9ib2FyZC9w
aW5lNjQvcm9ja3BybzY0L3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQt
ZmlybXdhcmUuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
OGI3N2UxZjE2NQo+IC0tLSAvZGV2L251bGwKPiArKysgCj4gYi9ib2FyZC9waW5lNjQvcm9ja3By
bzY0L3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFz
aAo+IEBAIC0wLDAgKzEsMiBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIAo+
IGMwZjIzY2NjNzFjNDk5ODllOWFkMjM4YWNmMzM0NDczYzE3YjdjODhmNzlhMjBjODI5YzNkNDQz
ZTM3OTRhMjIgIAo+IGFybS10cnVzdGVkLWZpcm13YXJlLXYyLjExLWdpdDQudGFyLmd6Cj4gLS0K
PiAyLjQ1LjIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
