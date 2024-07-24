Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46835C3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC783401C2;
	Wed, 24 Jul 2024 16:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wTYssHpE1nv; Wed, 24 Jul 2024 16:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78E7E40DCD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78E7E40DCD;
	Wed, 24 Jul 2024 16:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 940B61BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80CFC40299
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJ__jmeqoa1r for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E305040265
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E305040265
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E305040265
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:21:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D98BE20004;
 Wed, 24 Jul 2024 16:21:22 +0000 (UTC)
Date: Wed, 24 Jul 2024 18:21:22 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240724182122.6a1f75ee@windsurf>
In-Reply-To: <20240723212011.23048-2-gael.portay@rtone.fr>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-2-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721838083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJ2ZHBG0M2iLh7O2pTTYnNz2fA2GEd+gJ6oib6oWmcM=;
 b=Eo+tptEFgNVordBSZlKoChSS/GR6u16ymAYQdwVuMJJLX/slHRzuIZYDfSwXW/nLuewpjx
 s6RXdhSHGHaFK6dkA+pkU8Ygi24g/HpvZXDQHwTtwqQL+fR65Qsca/8GV3GKDqac7sLuYO
 UUOH8NrYpukn8Ci8/zVQxjQNe4DWzyTJRDqpNtHC7RD86m6Ms/04yTpQGl18uxhyQkIcNM
 x7hnZdHaxLfmCpiVWUfYd9UcJfvYT8DksnOQvJg7NBzIkhvNsV+HH0PktxIL/sy1IajPm1
 jBo3qSVjLh6uOGlChUgLp0ml9uVMksAwC9IcTJZ/PUEQKRHVd/S7evCZWhraWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eo+tptEF
Subject: Re: [Buildroot] [PATCH 1/2] package/rpi-utils: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2HDq2wsCgpPbiBUdWUsIDIzIEp1bCAyMDI0IDIzOjIwOjEwICswMjAwCiJHYcOrbCBQ
T1JUQVkiIDxnYWVsLnBvcnRheUBnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgcGFja2FnZSBycGkt
dXNlcmxhbmQgaGFzIGJlZW4gbWFya2VkIGFzIGFuY2llbnQgYW5kIGRlcHJlY2F0ZWRbMV0uCj4g
Cj4gVGhlIHVzZWZ1bCB0b29scyAoZHRvdmVybGF5LCBkdG1lcmdlLCB2Y21haWxib3gsIHZjZ2Vu
Y21kKSB3ZXJlIG1vdmVkIHRvCj4gdGhlIHJlcG9zaXRvcnkgcnBpLXV0aWxzIHNpbmNlIHRoZW4u
Cj4gCj4gVGhpcyBhZGRzIHRoZSBuZXcgcGFja2FnZSBycGktdXRpbHMgYXQgbGF0ZXN0IGNvbW1p
dCBhcyB0aGVyZSBpcyBubwo+IHRhZ2dlZCBjb21taXQuCj4gCj4gWzFdOiBodHRwczovL2dpdGh1
Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0Lzk2YTczMzRhZTlkNWZjOWRiN2FjOTJl
NTk4NTIzNzdkZjYzZjE4NDgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwu
cG9ydGF5QHJ0b25lLmZyPgoKVGhhbmtzIGZvciB0aGUgcGF0Y2guIFNlZSBzb21lIGNvbW1lbnRz
IGJlbG93LgoKPiAtLS0KPiAgcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluICAgICAgfCAgOSAr
KysrKysrKysKPiAgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhhc2ggfCAgMyArKysKPiAg
cGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rICAgfCAxNiArKysrKysrKysrKysrKysrCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKUGxlYXNlIGFkZCBhbiBlbnRyeSBp
biB0aGUgREVWRUxPUEVSUyBmaWxlIGZvciB0aGlzIG5ldyBwYWNrYWdlLgoKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5tawo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3JwaS11dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL3JwaS11dGlscy9Db25maWcuaW4KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjRhZTgyMjU3YTAKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCj4gQEAgLTAsMCArMSw5
IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9SUElfVVRJTFMKPiArCWJvb2wgInJwaS11dGlscyIK
PiArCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGR0Ywo+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX0RUQwo+ICsJaGVscAo+ICsJICBBIGNvbGxlY3Rpb24gb2Ygc2NyaXB0cyBhbmQgc2ltcGxl
IGFwcGxpY2F0aW9ucyBmb3IgdGhlCj4gKwkgIFJhc3BiZXJyeSBQaS4KPiArCj4gKwkgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS91dGlscy8KClBsZWFzZSBhZGQgYSBDb25maWcuaW4g
Y29tbWVudDoKCmNvbW1lbnQgInJwaS11dGlscyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5hbWlj
IGxpYnJhcnkiCglkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUwoKYWxzbywgdGhpcyBDb25maWcu
aW4gZmlsZSBpcyBub3QgaW5jbHVkZWQgYW55d2hlcmUsIHNvIHRoaW5ncyBjYW5ub3QKd29yay4K
Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsgYi9wYWNrYWdl
L3JwaS11dGlscy9ycGktdXRpbHMubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjFjNzQ5NTFlNGEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ycGkt
dXRpbHMvcnBpLXV0aWxzLm1rCj4gQEAgLTAsMCArMSwxNiBAQAo+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICsjCj4gKyMgcnBpLXV0aWxzCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiArCj4gK1JQSV9VVElMU19WRVJTSU9OID0gYTFkNTIyZjBmMWI1MDg1OGE0NGZhYzgwNTIz
YTJiZDgwMDk4ZTc4OQo+ICtSUElfVVRJTFNfU0lURSA9ICQoY2FsbCBnaXRodWIscmFzcGJlcnJ5
cGksdXRpbHMsJChSUElfVVRJTFNfVkVSU0lPTikpCj4gK1JQSV9VVElMU19MSUNFTlNFID0gQlNE
LTMtQ2xhdXNlCj4gK1JQSV9VVElMU19MSUNFTlNFX0ZJTEVTID0gTElDRU5DRQo+ICtSUElfVVRJ
TFNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gK1JQSV9VVElMU19ERVBFTkRFTkNJRVMgPSBkdGMK
PiArCj4gK1JQSV9VVElMU19DT05GX09QVFMgPSAtRFNUQVRJQz1TVEFUSUMKCldoYXQgaXMgdGhp
cyB0aGluZyBkb2luZz8gSXQgc2VlbXMgYSBiaXQgb2RkLgoKQWxzbywgY291bGQgeW91IGdpdmUg
YSB0ZXN0IHRvIHRoaXMgcGFja2FnZSB1c2luZyB0aGUgLi91dGlscy90ZXN0LXBrZwp1dGlsaXR5
PwoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
