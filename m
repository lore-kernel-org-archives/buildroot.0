Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26769C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 12:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF196089A;
	Mon, 22 Apr 2024 12:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wFPZvDJwduy; Mon, 22 Apr 2024 12:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E9D60854
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E9D60854;
	Mon, 22 Apr 2024 12:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3384B1BF322
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 12:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CA2F405D4
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 12:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUkCq2zm8vqP for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 12:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F471405A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F471405A5
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F471405A5
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 12:29:57 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5176f217b7bso7155624e87.0
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 05:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713788995; x=1714393795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3758HYqvLW7XHmmk+TMyP7moirzCYiekxSu9j1KSa8M=;
 b=qTwbSMej4kCBYaWsYGO2o7IWdxb25jZRlyg+Sv+JPxKF/LeC1zESLUdYwDKDcRSZr0
 JZTc5u6zYi4Xfu3ZbbrjqrMCRQPkbwAPjKg0P03JjbMF1ndoXMQdaoHe59Gb3pQ5QjsJ
 kCL1A8ytp2pl7dzGBOfqXC0Y4w4tvAy2ps4Tg+/xmrFXp+0YjsAYCES58Fe7s5rFw/yZ
 7FhOypaefaJiviRLmrgzLpkPU9b7/2BfaSkVzKy/jpOerRgcmM+ACj6mmROh1eRcOB9G
 +vuDDN7MNaa03s7kVWeq1C7pIqi55Fvw2ms96FEyK6r7t1Pc3sA6weRG1qj48MRlVwr4
 mIYA==
X-Gm-Message-State: AOJu0Yxz15/rCDSeH0lhbF0Y8LqdAswXa9DtFOmmfnukIg969EqKwzwe
 meqPisAKNM7wXqo6EMV1nPzseyg6VBl7YCoes1VrBysbP1xBtcXVpdgrVNPQexTy245qmeJ5vYT
 7MjRQKqAgyKu2QZw3D5xaL05Fu2I=
X-Google-Smtp-Source: AGHT+IH84HKkQHYFyNNufgOnv7SMfczCZpMux9KZzo+pqjrChm8F8IsPyE/SaUzY0Uk/kV57f+r2e8vTNvLj7+leGw8=
X-Received: by 2002:ac2:4e4f:0:b0:519:7041:d18a with SMTP id
 f15-20020ac24e4f000000b005197041d18amr6938381lfr.4.1713788995012; Mon, 22 Apr
 2024 05:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kv4F+h1KZOiYTJ2ZActM6FMekfUc-OSQYt+ABEjdCsncA@mail.gmail.com>
 <20240422141405.10ed2e21@gmx.net>
 <CAGm1_ks=J-wT0QrPxMFO+DrXsRXYCLGnUdGJhaHUwOLaqPER+Q@mail.gmail.com>
In-Reply-To: <CAGm1_ks=J-wT0QrPxMFO+DrXsRXYCLGnUdGJhaHUwOLaqPER+Q@mail.gmail.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Apr 2024 14:29:42 +0200
Message-ID: <CAGm1_kudsdPfm+++_ZTXz2D23ezUJSxGaKaGpxC_ac45eK8sgQ@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1713788995; x=1714393795; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3758HYqvLW7XHmmk+TMyP7moirzCYiekxSu9j1KSa8M=;
 b=hNK9X7/SqQ9P502CtxNmXm2IcMOBWcCAhTlV0sHtILASRxphAe0N5hF1U9D5+dp8Ja
 I+QR76mx+sdzGlxntqjQiAhO3xtvWSyA2aqwo81Yz93V/6Zbql8m1JGrCUqj5qlwI1U2
 VcWsWnk18QUUF1f2WUzI0THFMb1iN86mJpYsO/HY7mcq8qJyhsqQEUkKw1Nxo7k6opsc
 Ns111gBxvWdW73FmE7wVMbuMarBEvSySkPRDNu47Id6iCSAPpVyUcf0n3DuN1a6fiCyM
 mFEsuuAe1n5RjUA2j80SZC1ElxfYcSaRjyCgQty+UlcM3BKeBHQxusNn6Z01qHs8ks6C
 dbBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hNK9X7/S
Subject: Re: [Buildroot] pkg-meson.mk: support for the host python packages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMjoyOOKAr1BNIFllZ29yIFllZnJlbW92Cjx5ZWdvcnNs
aXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAyMiwgMjAyNCBhdCAy
OjE54oCvUE0gUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PiB3cm90ZToKPiA+Cj4g
PiBPbiBNb24sIDIyIEFwciAyMDI0IDEyOjQ2OjA0ICswMjAwLCBZZWdvciBZZWZyZW1vdiA8eWVn
b3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gbGliZ2xpYjIgMi44MC4w
IHJlcXVpcmVzIGhvc3QtcHl0aG9uLXBhY2thZ2luZyB0byBidWlsZCB0aGUgbGlicmFyeSBbMV0u
Cj4gPiA+Cj4gPiA+IFdoYXQgaXMgdGhlIGJlc3Qgd2F5IHRvIHRlbGwgbWVzb24vbmluamEgd2hl
cmUgdG8gbG9vayBmb3Igb3VyIGhvc3QKPiA+ID4gcHl0aG9uIHBhY2thZ2VzPwo+ID4gPgo+ID4g
PiBbMV0gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9jb21taXQvZmM2ZjA2
MTI3Y2ZmOWZlM2U0NjRiNWJlOGM5MmVhMDhhNjc5YjYyMAo+ID4KPiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rIGIvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5t
awo+ID4gaW5kZXggYzA2ZGVkMmE1Yi4uODE5MjgyOTEwYSAxMDA2NDQKPiA+IC0tLSBhL3BhY2th
Z2UvbGliZ2xpYjIvbGliZ2xpYjIubWsKPiA+ICsrKyBiL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xp
YjIubWsKPiA+IEBAIC0zNCw5ICszNCwxMSBAQCBIT1NUX0xJQkdMSUIyX0NPTkZfT1BUUyA9IFwK
PiA+Cj4gPiAgTElCR0xJQjJfREVQRU5ERU5DSUVTID0gXAo+ID4gICAgICAgICBob3N0LXBrZ2Nv
bmYgaG9zdC1saWJnbGliMiBcCj4gPiArICAgICAgIGhvc3QtcHl0aG9uMyBob3N0LXB5dGhvbi1w
YWNrYWdpbmcgXAo+ID4gICAgICAgICBsaWJmZmkgcGNyZTIgemxpYiAkKFRBUkdFVF9OTFNfREVQ
RU5ERU5DSUVTKQo+ID4KPiA+ICBIT1NUX0xJQkdMSUIyX0RFUEVOREVOQ0lFUyA9IFwKPiA+ICsg
ICAgICAgaG9zdC1weXRob24zIGhvc3QtcHl0aG9uLXBhY2thZ2luZyBcCj4gPiAgICAgICAgIGhv
c3QtZ2V0dGV4dCBcCj4gPiAgICAgICAgIGhvc3QtbGliZmZpIFwKPiA+ICAgICAgICAgaG9zdC1w
Y3JlMiBcCj4KPiBUaGlzIGp1c3QgYnVpbGRzIHRoZSBwYWNrYWdlIGJ1dCBtZXNvbiB3b24ndCBs
b29rIGluCj4gaG9zdC9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzLyBmb3IgcmVnZXguCgpz
L3JlZ2V4L3BhY2thZ2UKCj4KPiBTaG91bGQgb25lIGp1c3QgYWRkIGEgUFlUSE9OUEFUSCBwb2lu
dGluZyB0bwo+IGhvc3QvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcyBiZWZvcmUgaW52b2tp
bmcgbWVzb24vbmluamEgYXMgd2UgZG8KPiB3aXRoIFBZVEhPTk5PVVNFUlNJVEU/Cj4KPiBZZWdv
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
