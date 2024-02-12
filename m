Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ACAC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 20:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7995E60904;
	Mon, 12 Feb 2024 20:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ACajg9Z-nEP; Mon, 12 Feb 2024 20:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB3960A3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB3960A3D;
	Mon, 12 Feb 2024 20:07:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D98B41BF284
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 20:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C682281FC2
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 20:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlRkNjOX6Pkx for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 20:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D579481FB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D579481FB5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D579481FB5
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 20:07:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F3BCA13F8C6;
 Mon, 12 Feb 2024 21:07:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 12 Feb 2024 21:07:12 +0100
Date: Mon, 12 Feb 2024 21:07:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <Zcp6cCeYLfRu95BC@landeda>
References: <20240206132051.2838897-1-yegorslists@googlemail.com>
 <ZcI0bZt04f3jRhPk@landeda>
 <67502ba4-3f73-428e-802e-6ee9cbc1fe6a@mind.be>
 <CAGm1_kthjzi2yHBeo9uBd_ojW2FjY-i4USEgUV0QHL5G0=8Z5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_kthjzi2yHBeo9uBd_ojW2FjY-i4USEgUV0QHL5G0=8Z5w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707768436;
 bh=S9c76pif9gGULdi0dlkjRd5BcHMDmxzwU+c1ASaK0fQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SH+IPGlhNnun+dT4M7/B9mvRTv5sCIQpjDCMUNkjDvpvkx+jUTgCgwDsPe5mSuoRU
 SPuXIlyyMJXzvShJltBBIAhCpTyc97fsS6UUBGTrzMpMSYd853ibiY6Yqjp//CeW9b
 6lU4XQY09HbWmr3mmjHfztD6FPCIPnq7m6Jx8tcK0OaWnHiF2xw6OcYhKoOX8qxuKW
 AK/ouYfdil9gJC3SYZJA370Uzlk2bMCLoQWWtsvJ4xf5TLXXjyOYROuFvSSD7tOSQ7
 aCVh5PvOVDP578xmJF2X0qzCwe//P5ssYRCFg/fn6qpUBCBoBhreKUTgEAaWING/6R
 oTLwMNywDJoog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SH+IPGlh
Subject: Re: [Buildroot] [PATCH] Create a .gitignore file in the CANONICAL_O
 directory
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWVnb3IsIEFsbCwKCk9uIDIwMjQtMDItMTIgMTA6MDAgKzAxMDAsIFllZ29yIFllZnJlbW92IHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IE9uIFR1ZSwgRmViIDYsIDIwMjQgYXQgMjozN+KA
r1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4gPiBPbiAw
Ni8wMi8yMDI0IDE0OjMwLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+ID4gPiBPbiAyMDI0LTAyLTA2
IDE0OjIwICswMTAwLCB5ZWdvcnNsaXN0cy0tLSB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToK
PiA+ID4+IEZyb206IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4K
PiA+ID4+IFRoaXMgLmdpdGlnbm9yZSBmaWxlIGlnbm9yZXMgYWxsIGZpbGVzIGluIGFuIG91dHB1
dCBkaXJlY3RvcnkgYW5kCj4gPiA+PiBoZW5jZSBkb2Vzbid0IGNoYW5nZSB0aGUgZ2l0IHN0YXR1
cy4KPiA+ID4gV2hhdCBhcmUgeW91IHRyeWluZyB0byBhY2hpZXZlIHdpdGggdGhpcyB0aGF0IGRv
ZXMgbm90IHdvcmsgY3VycmVudGx5Pwo+ID4gICBJIHlvdSBkbyBgbWFrZSBPPW91dHB1dC10ZXN0
LW15cGtnYCAod2hpY2ggSSBkbyBxdWl0ZSBhIGxvdCksIHRoYXQgb3V0cHV0Cj4gPiBkaXJlY3Rv
cnkgZG9lc24ndCBnZXQgaWdub3JlZCBieSBnaXQuIFdlIGNvdWxkIGlnbm9yZSBvdXRwdXQqIGJ1
dCBtYXliZSB5b3UgbmFtZQo+ID4gdGhlIG91dHB1dCBkaXJlY3Rvcnkgby1mb28gb3Igc29tZXRo
aW5nLgo+ID4KPiA+ICAgUHV0dGluZyBhIC5naXRpZ25vcmUgaW4gYSBnZW5lcmF0ZWQgZGlyZWN0
b3J5IGlzIGEgdmVyeSBlbGVnYW50IHNvbHV0aW9uIGZvcgo+ID4gdGhhdC4gSXQgaXMgdXNlZCBi
eSBlLmcuIHZpcnR1YWxlbnYsIHB5dGVzdCwgYW5kIGEgbG9hZCBvZiBvdGhlciBhcHBsaWNhdGlv
bnMKPiA+IHRoYXQgZ2VuZXJhdGUgb3V0cHV0IGluIGEgZGlyZWN0b3J5Lgo+ID4KPiA+ICAgU2lu
Y2UgdGhlIC5naXRpZ25vcmUgaXMgY3JlYXRlZCBpbiB0aGUgb3V0cHV0IGRpcmVjdG9yeSwgaXQg
aXMgbm8gbG9uZ2VyCj4gPiBuZWNlc3NhcnkgdG8gcHV0IG91dHB1dC8gaW4gdGhlIC5naXRpZ25v
cmUgZmlsZS4KPiA+ICAgQWxsIG9mIHRoZSBhYm92ZSBjb3VsZCBiZSBwdXQgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLCBvZiBjb3Vyc2UsIGJ1dCBmb3IgbWUKPiA+IFllZ29yJ3MgY29tbWl0IG1lc3Nh
Z2Ugd2FzIHN1ZmZpY2llbnRseSBjbGVhciA6LSkKPiBXZXJlIHdlIGFibGUgdG8gY29udmluY2Ug
eW91PwoKSSBub3cgdW5kZXJzdGFuZCB0aGUgcHVycG9zZS4gU2F5aW5nIEknbSBjb252aW5jZWQg
aXMgYW5vdGhlciBzdHJpZGUuCgpJbiBteSBjYXNlLCBJIGhhdmUgYWxsIG15IG91dHB1dCBkaXJl
Y3RvcmllcyBvdXRzaWRlIG9mIHRoZSBidWlsZHJvb3QKdHJlZS4gSGF2aW5nIGEgLmdpdGlnbm9y
ZSBpbiB0aGVyZSB3b3VsZCBiZSB0b3RhbGx5IHVzZWxlc3MgYW5kCnNwdXJpb3VzLCBhbmQgd291
bGQgZ2V0IGNhdWdodCBieSBteSAoc3VwZXJmaWNpYWwpIHRlc3RzIHRoYXQgbm8gdW5rbm93bgpm
aWxlcyBnZXRzIGNyZWF0ZWQgb3V0c2lkZSB0aGUgYnVpbGQvIHRhcmdldC8gYW5kIHN1Y2ggZGly
cyBmb3IgZXhhbXBsZS4KClNvIHRoZXJlIGFyZSBwcm9zIGFuZCBjb25zIGVpdGhlciB3YXlzLi4u
CgpNYXliZSBqdXN0IGNyZWF0ZSAuZ2l0aWdub3JlIG9ubHkgaWYgJChPKSBhIHN1Yi1kaXIgb2Yg
JChUT1BESVIpID8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0t
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
