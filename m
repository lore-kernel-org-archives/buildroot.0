Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA97AC87FD1
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 10:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC6160E93;
	Wed,  6 Aug 2025 10:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z-FZupkeK8B; Wed,  6 Aug 2025 10:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB92360E7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB92360E7B;
	Wed,  6 Aug 2025 10:24:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72B84233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5907B60E01
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iQnNSr3SDZP for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 10:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E96660B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E96660B8F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E96660B8F
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:24:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8C151FCE3;
 Wed,  6 Aug 2025 10:23:59 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 06 Aug 2025 12:23:59 +0200
Message-Id: <DBV9S1S4XEEA.2DHT8AEV8PEL9@bootlin.com>
Cc: <buildroot@buildroot.org>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806-php-dbus-v1-1-78cbe7d1797f@bootlin.com>
 <20250806110836.387c867c@windsurf>
In-Reply-To: <20250806110836.387c867c@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieelgeeftdeugeeuleehudeuffekhfffhfdtueevveelffdvtddujeeludelheenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754475840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuN3tj+nJDRT1Bri8ywCbNk4sHuUDwSaWu8Xg9QaAio=;
 b=lomIhYzHuttZ9aywFhzMq4k0saYxP/mEpkyXP/OL5fJN9iB9ZMxSacBbRuYsINRpRwQYUH
 fESiMLvf1Dow87D2wGuvTh4GVyr3EhEmiqWM5a5XAYGuWyfSSUJcC+6JTtCsmCM9CJnCmS
 XYoobGvQ0CGxUBTgSmUh4L2MItwsbhRTEwWrvEGHc1e9zWO3A5ylCsbL4OpPt3Kg2ooNSm
 Vku2not3LdzDXXFhzZ6LIrWZpL+VoMDzP5G+pcuiwolpUWYWEQ7pgBsjae+zgHQHFGXKcM
 G8bkOU2JBBPXCVsqYi8TOtQakl5LgqXtNYA4o0uVlc9hiz4LDFe8ir6O+8aXEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lomIhYzH
Subject: Re: [Buildroot] [PATCH] package/php-pecl-dbus: fix build with PHP8
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkIEF1ZyA2LCAyMDI1IGF0IDExOjA4IEFNIENFU1QsIFRob21hcyBQZXRhenpvbmkgdmlh
IGJ1aWxkcm9vdCB3cm90ZToKPiBIZWxsbyBBbGV4aXMsCj4KPiBPbiBXZWQsIDA2IEF1ZyAyMDI1
IDEwOjUzOjA3ICswMjAwCj4gQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGlu
LmNvbT4gd3JvdGU6Cj4KPj4gVGhlIHBocC1wZWNsLWRidXMgZW5jb3V0ZXJzIHR3byBidWlsZCBp
c3N1ZXMgaW4gYnVpbGRyb290IDIwMjUuMDIueCwKPj4gYm90aCByZWxhdGVkIHRvIFBIUDguIEJy
aW5nIHRoZSByZWxldmFudCBwYXRjaGVzIHRvIGZpeCB0aGlzIGJ1aWxkLgo+Cj4gQXJlIHRoZSBp
c3N1ZXMgYWZmZWN0aW5nIG1hc3RlciBhcyB3ZWxsPwoKWWVzLCBJIGhhdmUgdGhvc2UgaXNzdWVz
IG9uIHRoZSBtYXN0ZXIgYnJhbmNoLCBvbiAyZmQ1MjBjOGQ1MmIKKCJwYWNrYWdlL2dsbTogYnVt
cCB2ZXJzaW9uIHRvIDEuMC4xIikKPgo+IElzIHRoZSBpc3N1ZQo+IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9lOTgvZTk4OTJiYmVmYTc4MWI0MDNmZDNkODM0YjZjNDg1
MjdjOGUwNzhiYS9idWlsZC1lbmQubG9nCj4gcGVyaGFwcyA/IElmIHNvLCBwbGVhc2UgYWRkIGEg
cmVmZXJlbmNlIHRvIHRoZSBhdXRvYnVpbGRlciBmYWlsdXJlLgoKWWVzLCB0aGF0IGxvb2tzIGxp
a2UgdGhlIHNhbWUgaXNzdWUgISBPaywgSSdsbCBhZGQgYSByZWZlcmVuY2UuCj4KPiBGb3IgYnVn
L2J1aWxkIGZpeGVzLCB3ZSBsaWtlIHRvIHVuZGVyc3RhbmQgc2luY2Ugd2hlbiB0aGUgcHJvYmxl
bSBpcwo+IG9jY3VycmluZywgaS5lIHdoaWNoIGNvbW1pdCBpbnRyb2R1Y2VkIHRoZSByZWdyZXNz
aW9uLiBJZiB0aGlzIHBhY2thZ2UKPiB3YXMgYnVpbGRpbmcgb24gMjAyNC4wMiBhbmQgbm8gbG9u
Z2VyIG9uIDIwMjUuMDIsIEkgc3VzcGVjdCBpdCdzIG9uZSBvZgo+IHRoZSBQSFAgdmVyc2lvbiBi
dW1wIGJldHdlZW4gdGhvc2UgdHdvIHJlbGVhc2VzOgoKVGhlIHVwc3RyZWFtIGNvbW1pdCBpbiBQ
SFAgcHJvamVjdCBsZWFkaW5nIHRvIHRoaXMgaXNzdWUgaXMgYWN0dWFsbHkgdGhlCnNhbWUgYXMg
Zm9yIHRoZSBwaHAtbHVhIHBhY2thZ2UgKGNvbW1pdCA5MWVmNDEyNGU1NmEgKCJSZWZhY3Rvcgp6
ZW5kX29iamVjdF9oYW5kbGVycyBBUEkgdG8gcGFzcyB6ZW5kX29iamVjdCogYW5kIHplbmRfc3Ry
aW5nKiBpbnN0ZWQgb2YKenZhbChzKS4iKSwgc28gdGhlIGlzc3VlIGhhcyBiZWVuIGludHJvZHVj
ZWQgd2hlbiB0aGUgUEhQIHBhY2thZ2VkIGhhcyBiZWVuCmJ1bXBlZCB0byA4LjAuMCwgbm90IGxh
dGVyLiBBbmQgYWdhaW4sIEkgY2FuIHNlZSB0aGUgaXNzdWUgd2l0aCBhIG1pbmltYWwKZGVmY29u
ZmlnIF93aGVuIHVzaW5nIGJvb3RsaW4gYmxlZWRpbmctZWRnZSB0b29sY2hhaW5fLiBXaXRoIHN0
YWJsZQp0b29sY2hhaW4sIHdlIGNhbiBzcG90IHRoZSBjb3JyZXNwb25kaW5nIHdhcm5pbmcgaW4g
cGhwLWRidXMgYnVpbGQgbG9ncywKYnV0IGl0IGlzIG5vdCB0dXJuZWQgaW50byBhbiBhY3R1YWwg
ZXJyb3IuCj4KPiBiZWZkOTBiNzY1NTgwNGFhMzBlYWU0OTRmYWU2NjQwZmYxNzgyMTdjIHBhY2th
Z2UvcGhwOiBzZWN1cml0eSBidW1wIHZlcnNpb24gdG8gOC4zLjE5Cj4gMzJkZDkyZDE4ZWRiM2Q4
M2ZmNDY1ZTM2NmZmMjExZjc0MTc2NzIyMiBwYWNrYWdlL3BocDogYnVtcCB2ZXJzaW9uIHRvIDgu
My4xNwo+IDI2YTMyOGY4ZWYxNzhkYWI3NDZiNmNkNzY2MTQwNjYxYTVlZTRjNWQgcGFja2FnZS9w
aHA6IGJ1bXAgdmVyc2lvbiB0byA4LjMuMTYKPiAzYTIwZGZiNDI2N2YzZGM2YjExYTM5OTNhNmE2
ZGNjM2U1YzJlZDg4IHBhY2thZ2UvcGhwOiBiYWNrcG9ydCB1cHN0cmVhbSBwYXRjaCB0byBmaXgv
d29ya2Fyb3VuZCB4eGhhc2ggaXNzdWUKPiBiY2FmZmEwYTA0YWYyNzhkMTU0ZTZlMDhiODFhMDZh
NDBhMWIzZWU5IHBhY2thZ2UvcGhwOiBidW1wIHZlcnNpb24gdG8gOC4zLjE1Cj4gZTJmNDRiNTA2
MDJlNTFhM2QyNzlkYmFhNDY1MDkzNTM3YTMxMzYzOCBwYWNrYWdlL3BocDogZml4ICdkZWFjdGl2
YXRlJyB0eXBvCj4gNmQ4MWUzMjI1NjcyZDE0NjI0OGVkM2UzNmJhOWVjMzM3NjhkMmQyNyBNZXJn
ZSBicmFuY2ggJ25leHQnCj4gOTZkNzNiMzA5MTcwMTY1MTM3M2M1YjY2NTllNDM3ZTc0NDVhMDYy
YiBwYWNrYWdlL3BocDogc2VjdXJpdHkgYnVtcCB2ZXJzaW9uIHRvIDguMy4xNAo+IGIwNzYwZDQ0
ODVjOTg2Y2JkZGQ1ZGU3M2I3OTIyZGQ3MjBjOGQzZWIgcGFja2FnZS9waHA6IGJ1bXAgdmVyc2lv
biB0byA4LjMuMTMKPiBhMmRhODg1MTlmYzFmOTZlNTE3MTcxZGZiMDUzYWNhOGMwMGY3ZGFmIHBh
Y2thZ2UvcGhwOiBzZWN1cml0eSBidW1wIHZlcnNpb24gdG8gOC4zLjEyCj4gODMzMWZiMDU5MjVi
MzNmYmZmMWIwODM2NzQ3MDY1MmUzMTk5NmIzOSBwYWNrYWdlL3BocDogYnVtcCB2ZXJzaW9uIHRv
IDguMy4xMQo+IDRmMDI0MzU2N2Q3NDMyMzA4MmU1M2M0NmU3NzdiMzI2NDc2ZjVjMmQgcGFja2Fn
ZS9waHA6IGZpeCBidWlsZCBvbiBhcm0KPiBlYTMwMWVmODBjODEwNzkxYTZiNjczZDQ2YjRmMTZi
NmMyZjYyYTI5IHBhY2thZ2UvcGhwOiBidW1wIHZlcnNpb24gdG8gOC4zLjEwCj4gNjc3YzNmMjk5
NWI0ZTZhY2FlZGNlY2M2OTliNWY2ZGRmMjk0ZjUyNCBwYWNrYWdlL3BocDogYnVtcCB2ZXJzaW9u
IHRvIDguMy45Cj4gZWNmMDYwYTJmZjkzNjI2ZmI1ZmJlMWM1MmI4ZDQyYjZlZTBmYmI1YiBwYWNr
YWdlL3BocDogc2VjdXJpdHkgYnVtcCB2ZXJzaW9uIHRvIDguMy44Cj4gOTMyYjUyZmFkODdkNzlk
OWYyNmEzNDNlZGFmZTI5ODEwNzlkZTE2ZSBwYWNrYWdlL3BocDogYnVtcCB2ZXJzaW9uIHRvIDgu
My43Cj4gYjViOTI3ODgxZGFmMzAyM2FkMzhiNGU5MTBhYjc5YWQwODFmN2VlNCBwYWNrYWdlL3Bo
cDogc2VjdXJpdHkgYnVtcCB2ZXJzaW9uIHRvIDguMy42Cj4gNzAwMzFkZDdmYTA5MTkxNTY2ZjJk
MWU4OTUzOTlhZTU3OGM2MmQxYiBwYWNrYWdlL3BocDogZml4IGJ1aWxkIHdpdGhvdXQgdGhyZWFk
cwo+IGU1MDQ2MGY5ZjEyYThjNWY4MmYyMTY2NzMzYWZlOWNjYTNjOGNkMTkgcGFja2FnZS9waHA6
IGJ1bXAgdmVyc2lvbiB0byA4LjMuNAo+IDI4MjRhYThhMjNhNzY1YjY2MDIxOWMxMjlkNDk4MGYx
YjdjNzY5MWMgcGFja2FnZS9waHA6IGFkZCBsaWJ1Y29udGV4dCBvcHRpb25hbCBkZXBlbmRlbmN5
Cj4KPiBNb3N0IGxpa2VseToKPgo+IGU1MDQ2MGY5ZjEyYThjNWY4MmYyMTY2NzMzYWZlOWNjYTNj
OGNkMTkgcGFja2FnZS9waHA6IGJ1bXAgdmVyc2lvbiB0byA4LjMuNAo+Cj4gV2hpY2ggaXMgYSBi
dW1wIGZyb20gOC4yLnggdG8gOC4zLnguIFRoZSBvdGhlciBidW1wcyBhcmUgd2l0aGluIHRoZQo+
IDguMy54IGJyYW5jaCwgc28gSSBkb3VidCB0aGV5IGJyb2tlIEFQSXMgdGhlcmUuCj4KPiBUaG9t
YXMKCgoKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
