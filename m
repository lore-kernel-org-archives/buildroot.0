Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C22CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FE4540298;
	Mon,  1 Apr 2024 13:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ibbaG_pGvps; Mon,  1 Apr 2024 13:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24E00402F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24E00402F3;
	Mon,  1 Apr 2024 13:18:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE9681BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E879D60885
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFx1dylpgDgq for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6DEC6087D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6DEC6087D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6DEC6087D
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 13:18:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D5BF713F88F;
 Mon,  1 Apr 2024 15:18:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 15:18:11 +0200
Date: Mon, 1 Apr 2024 15:18:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <Zgq0ExxSssr5xpQK@landeda>
References: <20240331080829.20331-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331080829.20331-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711977495;
 bh=G/GrtpDTzmTmhu1RH23z5cBPgzEvPBTYL9ezNO5F64E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f6RMmMe5kFHW7neZgAp7TnyoSz1gRYbnrGGhxp6bDIvp/ketlQdQ6Q6trqQDGaMWd
 E/d9QzMNUbaDnNjFfebxxDKd3uf8jpnS8keoshX2KYdOtTwn9w2Pf8Ze2Cn5pDCei8
 v8zAlvhvnVGYz6VBKcpFKC8hwsbEZ98uaucFz9NM5OIWLfa7ywf3k9T4HnoKloP+A1
 ig6t5l7CL0Sb3jt2GtX3KmF7/P5J+MxmYDD7/YgyZsmZOgUdjAkxiuAvjVMJ0j8Gp1
 zo+/K4MrInjmbzuzV09JFAu7t37AwjnSUSHNQ7ff/oHMQ8/qO5LUYP6PqkmmO6B+tY
 V5rf/c6w+TU0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f6RMmMe5
Subject: Re: [Buildroot] [PATCH v1 1/1] package/fuse-overlayfs: bump version
 to v1.13
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI0LTAzLTMxIDAxOjA4IC0wNzAwLCBDaHJpc3RpYW4gU3Rl
d2FydCB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBVcGRhdGVkIGhhc2ggZm9yIENPUFlJ
TkcuCj4gCj4gVGhlIGxpY2Vuc2UgY2hhbmdlZCB0byBHUEwtMi4wKyBpbiB2MS4xMgoKSW5kZWVk
LCB0aGFua3MgZm9yIG5vdGljaW5nLCBjaGVja2luZywgYW5kIGRvY3VtZW50aW5nIHRoYXQgY2hh
bmdlLiDwn5GNCgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2Z1c2Utb3ZlcmxheWZz
L3JlbGVhc2VzL3RhZy92MS4xMwo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0
IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvZnVzZS1vdmVybGF5ZnMvZnVz
ZS1vdmVybGF5ZnMuaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL2Z1c2Utb3ZlcmxheWZzL2Z1c2Ut
b3ZlcmxheWZzLm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnVzZS1vdmVybGF5
ZnMvZnVzZS1vdmVybGF5ZnMuaGFzaCBiL3BhY2thZ2UvZnVzZS1vdmVybGF5ZnMvZnVzZS1vdmVy
bGF5ZnMuaGFzaAo+IGluZGV4IGI4ZGY2Yzg4YTUuLmYxYTMyNmM4MmUgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9mdXNlLW92ZXJsYXlmcy9mdXNlLW92ZXJsYXlmcy5oYXNoCj4gKysrIGIvcGFja2Fn
ZS9mdXNlLW92ZXJsYXlmcy9mdXNlLW92ZXJsYXlmcy5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4g
ICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDMyMGE0MTE0MjU0MTQ2Nzk3MzZkY2I3ZjNi
MDUxNDY0MzBjYTRhZjIwZGVkMDA5NmM2OWFjM2M3NTQwZWJjYTIgIGZ1c2Utb3ZlcmxheWZzLTEu
MTEudGFyLmd6Cj4gK3NoYTI1NiAgOTZkMTAzNDQ5MjFkNTc5NmJjYmE3YTM4NTgwYWUxNGE1M2M0
ZTYwMzk5YmI5MGIyMzhhYzVhMTBiM2JiNjViMiAgZnVzZS1vdmVybGF5ZnMtMS4xMy50YXIuZ3oK
PiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiAgOGNlYjRiOWVlNWFkZWRkZTQ3YjMxZTk3
NWMxZDkwYzczYWQyN2I2YjE2NWExZGNkODBjN2M1NDVlYjY1YjkwMyAgQ09QWUlORwo+ICtzaGEy
NTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAx
MDUyMWI4ODA2NDMgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mdXNlLW92ZXJsYXlm
cy9mdXNlLW92ZXJsYXlmcy5tayBiL3BhY2thZ2UvZnVzZS1vdmVybGF5ZnMvZnVzZS1vdmVybGF5
ZnMubWsKPiBpbmRleCA0ZGIyY2NkN2Q1Li4yYWEyMDhkNTU0IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvZnVzZS1vdmVybGF5ZnMvZnVzZS1vdmVybGF5ZnMubWsKPiArKysgYi9wYWNrYWdlL2Z1c2Ut
b3ZlcmxheWZzL2Z1c2Utb3ZlcmxheWZzLm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUZVU0VfT1ZFUkxBWUZTX1ZFUlNJT04gPSAxLjEx
Cj4gK0ZVU0VfT1ZFUkxBWUZTX1ZFUlNJT04gPSAxLjEzCj4gIEZVU0VfT1ZFUkxBWUZTX1NJVEUg
PSAkKGNhbGwgZ2l0aHViLGNvbnRhaW5lcnMsZnVzZS1vdmVybGF5ZnMsdiQoRlVTRV9PVkVSTEFZ
RlNfVkVSU0lPTikpCj4gLUZVU0VfT1ZFUkxBWUZTX0xJQ0VOU0UgPSBHUEwtMy4wCj4gK0ZVU0Vf
T1ZFUkxBWUZTX0xJQ0VOU0UgPSBHUEwtMi4wKwo+ICBGVVNFX09WRVJMQVlGU19MSUNFTlNFX0ZJ
TEVTID0gQ09QWUlORwo+ICAKPiAgRlVTRV9PVkVSTEFZRlNfQVVUT1JFQ09ORiA9IFlFUwo+IC0t
IAo+IDIuNDMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
