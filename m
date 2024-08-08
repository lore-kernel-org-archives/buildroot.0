Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E48C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 16:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0B860B04;
	Thu,  8 Aug 2024 16:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMTJSg0JTxNH; Thu,  8 Aug 2024 16:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25BDF60ABB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25BDF60ABB;
	Thu,  8 Aug 2024 16:42:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DEE71BF29F
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B1484016B
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoSqr0xLZC8J for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 16:42:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C240C40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C240C40130
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C240C40130
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 16:42:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9C2B240002;
 Thu,  8 Aug 2024 16:42:34 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:42:33 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240808184233.39b3e326@windsurf>
In-Reply-To: <20240808123938.898039-1-gael.portay@rtone.fr>
References: <20240808123938.898039-1-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723135355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTj4YpOIHhbeA0/BxAOcJeRkPpiSayiqLo2+tHff5XM=;
 b=MbUuFKN6VwcWyqExrd994oCWrMjWUewmD5XZJEZLHfq1Q+wBXRrrkiOs0wi0QOlDOocV8L
 miTms0MOAFtnG9/JbwPu00+v0pV7s1AaL2Xj+kwZ8KdoJij2d3bMszBu5tybyNmoJ9AB1u
 Jtpthk7vQKOSlPwyfPf4uzfNvNZCzNTA3zRtxUQYzsfjrhRoFgsoykf56EZM1BV0q0wKV8
 uiV7hPMkHGnW+oKk86xaYHMDV2E2RV1dzDtPhQv7dWHvPF5a7gjEoOBC29OxxOOMOTt80M
 AUXpKh4xnvl4kj6xeAdzXbBWbm8vlungXxh5xdvkPkgL0og2Osm9Bi+OTFxxUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MbUuFKN6
Subject: Re: [Buildroot] [PATCH 1/2] configs: add Raspberry Pi Zero 2 W
 64-bit defconfig
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
Cc: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2HDq2wsCgpPbiBUaHUsICA4IEF1ZyAyMDI0IDE0OjM5OjM3ICswMjAwCiJHYcOrbCBQ
T1JUQVkiIDxnYWVsLnBvcnRheUBnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGlzIGNvbmZpZ3VyYXRp
b24gYnVpbGRzIGFuIGltYWdlIGZvciB0aGUgUmFzcGJlcnJ5IFBpIFplcm8gMiBXCj4gKDY0LWJp
dCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5m
cj4KClRoYW5rcyBmb3IgdGhpcyBwYXRjaC4gVGhlIGNvbW1pdCB0aXRsZSBzaG91bGQgYmU6CgoJ
Y29uZmlncy9yYXNwYmVycnlwaXplcm8yd182NDogbmV3IGRlZmNvbmZpZwoKPiAtLS0KPiAgYm9h
cmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8yd182NGJpdC50eHQgfCAzMiArKysrKysrKysrKysr
KysKPiAgYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQgICAgICAgICAgICAgICAgfCAgMSArCj4g
IGNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnICAgIHwgNDggKysrKysrKysr
KysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3XzY0Yml0LnR4
dAo+ICBjcmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnCgpQ
bGVhc2UgYWRkIGFuIGVudHJ5IGluIHRoZSBERVZFTE9QRVJTIGZpbGUgZm9yIHRoaXMgbmV3IGRl
ZmNvbmZpZy4KUGVyaGFwcyB5b3UgYWxzbyB3YW50IHRvIGFkZCB5b3Vyc2VsZiBmb3IgYWxsIFJh
c3BiZXJyeSBwbGF0Zm9ybXM/CgoKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGl6ZXJv
MnctNjQgYi9ib2FyZC9yYXNwYmVycnlwaXplcm8ydy02NAo+IG5ldyBmaWxlIG1vZGUgMTIwMDAw
Cj4gaW5kZXggMDAwMDAwMDAwMC4uZmNkYWZjODFlZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9i
b2FyZC9yYXNwYmVycnlwaXplcm8ydy02NAo+IEBAIC0wLDAgKzEgQEAKPiArcmFzcGJlcnJ5cGkK
CkkgcmVhbGx5IGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIGhhdmUgYWxsIHRob3NlIHN5bWxpbmtz
LCBpdCBtYWtlcyBubwpzZW5zZS4gSWYgYWxsIGRlZmNvbmZpZ3MgYXJlIHVzaW5nIHRoZSBzYW1l
IGZpbGVzIGZyb20KYm9hcmQvcmFzcGJlcnJ5cGkvLCB3aHkgYXJlIHRoZSBkZWZjb25maWdzIG5v
dCBhbGwgdXNpbmcKYm9hcmQvcmFzcGJlcnJ5cGkvIGluc3RlYWQgb2YgdGhvc2Ugc2lsbHkgc3lt
bGlua3M/Cgo+IGRpZmYgLS1naXQgYS9jb25maWdzL3Jhc3BiZXJyeXBpemVybzJ3XzY0X2RlZmNv
bmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43YzM2MTgzYTlmCj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnCj4gQEAgLTAs
MCArMSw0OCBAQAo+ICtCUjJfYWFyY2g2ND15Cj4gK0JSMl9jb3J0ZXhfYTUzPXkKPiArQlIyX0FS
TV9GUFVfVkZQVjQ9eQo+ICsKPiArIyBwYXRjaGVzCj4gK0JSMl9HTE9CQUxfUEFUQ0hfRElSPSJi
b2FyZC9yYXNwYmVycnlwaS9wYXRjaGVzIgoKSGVyZSB5b3UncmUgbm90IGV2ZW4gdXNpbmcgdGhh
dCBuZXcgc3ltbGluay4KCj4gK0JSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eQo+ICsK
PiArIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDYuNiBzZXJpZXMKPiArQlIyX1BB
Q0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzY9eQo+ICsKPiArQlIyX1RPT0xDSEFJ
Tl9CVUlMRFJPT1RfQ1hYPXkKPiArCj4gK0JSMl9MSU5VWF9LRVJORUw9eQo+ICtCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9UQVJCQUxMPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFM
TF9MT0NBVElPTj0iJChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSxsaW51eCw1NzZjYzEwZTFlZDUw
YTllYWNmZmM3YTA1Yzc5NjA1MWQ3MzQzZWE0KS9saW51eC01NzZjYzEwZTFlZDUwYTllYWNmZmM3
YTA1Yzc5NjA1MWQ3MzQzZWE0LnRhci5neiIKPiArQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9
ImJjbXJwaTMiCj4gKwo+ICsjIEJ1aWxkIHRoZSBEVEIgZnJvbSB0aGUga2VybmVsIHNvdXJjZXMK
PiArQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gK0JSMl9MSU5VWF9LRVJORUxfSU5U
UkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzEwLXJwaS16ZXJvLTItdyIKPiArCj4gK0JSMl9M
SU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiArCj4gK0JSMl9QQUNLQUdFX1JQSV9G
SVJNV0FSRT15Cj4gK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9CT09UQ09ERV9CSU49eQo+ICtC
UjJfUEFDS0FHRV9SUElfRklSTVdBUkVfVkFSSUFOVF9QST15Cj4gK0JSMl9QQUNLQUdFX1JQSV9G
SVJNV0FSRV9DT05GSUdfRklMRT0iYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQvY29uZmlnX3pl
cm8yd182NGJpdC50eHQiCgpCdXQgaGVyZSB5b3UncmUgdXNpbmcgaXQuCgpDb3VsZCB5b3UgZml4
IHRoYXQgdXAgYW5kIHNlbmQgYSBuZXcgaXRlcmF0aW9uPwoKVGhhbmtzIQoKVGhvbWFzCi0tIApU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
