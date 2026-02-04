Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67068E8B39B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 05:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39C1740C72;
	Wed,  4 Feb 2026 05:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1JX4lAvruVb; Wed,  4 Feb 2026 05:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C7440C4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770181814;
	bh=B/7Ys4aKmyRD7th6DyGtnlBfVijge2ihnl+N24LU6bo=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j6Cwaq7klbgneJYhISgAynkyysv4c3mv9kCTcEyyjm1FW+ZrM1nQS1Cb8Xj4CSa0i
	 i46O0HMpQ746hlAFOvjo1Zz+jiiuEhRgwJ1abH9cbxkr9StdqA4Y3FDwUwy/tVYuE/
	 ZAlqXR1J7qhbUPDIQMAXi9O9z+kSiD9efFkzMtrV9Jve0r/VOAwToMSRd1C8d4klEp
	 a2nEnkWPYPMGqbY/WzFhByKm5rvOGVaEyVIESkC4u1SqWeWXk9Oe5Ui2Ernq4FZ/X+
	 RpOLsngUYBns27LhP38v9BaiXW/3yzmFljTmHymvooEfMHnjqq6p0vS0gZ3/P5xo4G
	 I5Zp/ECpw7uSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C7440C4C;
	Wed,  4 Feb 2026 05:10:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B5A4173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 05:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1AF360A61
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 05:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3A5i8V65fy0P for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 05:10:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3C6660A5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3C6660A5E
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3C6660A5E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 05:10:10 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-59e17afd2d5so6060604e87.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 21:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770181808; x=1770786608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c6+ThTa92Ft5d9fhqd3NdLTse76bjRYzsRBzDTcL5lM=;
 b=hLm2WMs+rZJTfYLTJsrReSO65cM0EoIhUbZ11ied8ZZLuu6uqs+vxkX/4dbB11mRVB
 7vPfY+94OIXQIa8uB+NvQKWSp+Q5zBtyH/1PTR8wp4zQv/xO0tP2tzxCw1duZBqjNeAE
 RTbW+mivFMoQCpKonbI/Yk1T2npCUlv1+i20q/gJ+kW41B01ZMwTvy7PzMmNSvzRl2QE
 ZJnNYn8HBg3iSOGaPzrWBUdKdM/murm1dQ4v/6EGVqNfb0aKXQe/+rZOtUJJKBE5hhqm
 HmcC6Psfh2KvIijuoDt2D+5hyAyGoR3KPxbPyJ09IjXqpeEZZqeQEIUuZvqYIMnq2Xf8
 rRow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7IyOsC92Puy18Xue5pFHUI6Erv7inXbPXI2zPcCs68h8nidks/q8/t19aD0nja0r4aFL7Slk+usw=@buildroot.org
X-Gm-Message-State: AOJu0Yx7IvFh4zOJ8q2gRFrpniafM9UtKyU4F40/R3ZPYVyJ6rEVghhs
 oIeNUV2i03Lp5GxnOafZQp8ENaZn1l9Q0gDbRgV0Q2acivqC83IavRCifELZBb6Sa0u+0YC9Rqe
 A7kUHeqN1OQ==
X-Gm-Gg: AZuq6aLq/9JQlUkxkQAmQ4VrlRLtHVjYoeOrC1YFNk+JdLNKCP8MPejZ2gTeCMT5Izk
 hYbAZxtMpmfx0hxG0ReIrSn7FVo5kPFKkWEpkqQJO/kBdoOJ+yb+twSFJXUmg0yI8jQ2JTGYCq5
 NI6DKGeGGzig5eTLb7O2CqqDsKhB4coFAfZnzgw6Y+JrfU4NLR2XtRSM8D3YY3DNs2SsiddVWe1
 /fw/5mMC5yX3l5uk+FM5Y+48LV6IBGbGBCkDkDzyooX6HYz4xErmW7nYWjM4ndkACAu0Pe1tnFU
 gmL4vD/l3D69bwkZfFTJvhiYVAbBcGhtYqafZsvG9m/uvkFZZV29VhFy3TSbYYVKhdyIuGicBnr
 N5eFzGHEYEXxy+VYN8zkjVG75bAbSOqEYCFENng/2l0i/cZSj9QImGo2WwSfOWN6KK0+PEu4BP7
 R1b1a94NZ86wF0vujkD4h5iRjGIYsTOyK6Ry3xRS+YbTx3x9Wz3w==
X-Received: by 2002:a05:6512:10c3:b0:59e:37fc:fb56 with SMTP id
 2adb3069b0e04-59e38c279d1mr561351e87.25.1770181808037; 
 Tue, 03 Feb 2026 21:10:08 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e38702460sm366407e87.22.2026.02.03.21.10.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 21:10:07 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-59dea72099eso7465865e87.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 21:10:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUYxCrg54MWvJxGR6sId6OC/H+ymfGiHAFzUIBKNBUnce5teQm39Ce86sUDDA2oR6xqVIpfeX9DS4E=@buildroot.org
X-Received: by 2002:a05:6512:3991:b0:59d:fe49:7f6d with SMTP id
 2adb3069b0e04-59e38c023cbmr748751e87.5.1770181806362; Tue, 03 Feb 2026
 21:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
 <20251228213710.2591716-2-james.hilliard1@gmail.com>
 <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
 <c8defb4d-4f5f-4bdf-8ff9-4adad5891fcd@mind.be>
 <CADvTj4rGb6KO0BUFyss9TRy9Ctk7oLdJ1PJLg-F3Y59e73XYbA@mail.gmail.com>
In-Reply-To: <CADvTj4rGb6KO0BUFyss9TRy9Ctk7oLdJ1PJLg-F3Y59e73XYbA@mail.gmail.com>
Date: Tue, 3 Feb 2026 21:09:55 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oQ71c5rtXO-GB+Bbr2QAyYNczJhZVxAxY0OgXs0zkEUg@mail.gmail.com>
X-Gm-Features: AZwV_QhB_uk_CPg9UuRsPIKqWXynFznwfLlU3ZLl50DKMqOsIwmMKlMHFeYFLvs
Message-ID: <CA+h8R2oQ71c5rtXO-GB+Bbr2QAyYNczJhZVxAxY0OgXs0zkEUg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1770181808; x=1770786608; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6+ThTa92Ft5d9fhqd3NdLTse76bjRYzsRBzDTcL5lM=;
 b=mm8+2gknznsrOdB2wqs2DWFcKB7xBQaedBtJvHqtJZ3S1iEThIwaHrKnwkk442iKQl
 DGvKue+2kkTWP+hYyWiHZZJjeAQ/r5QGGY2L3WArCkzuYMnXVYfjcyqD2HWXFjhrL2eh
 Q2rnxT7XF7mgjiC+UN6xciPioJWBvTTtg76oHZY+Vn474kbR2duQ5ZR0gAlhRzR8/RDH
 8R3NQ6Rurzos4ycdfKtYOKG3Yy2FjLtstt3mcL2E613VBuE4nVBsEp4XDlh1RoSZrgpU
 vTfD+O1tSermnUhihVH/D4diAlE/WQ2eWIHbjcWLPRZ77jrqZqsBYQbW2FUOt77qkp6Q
 IhUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=mm8+2gkn
Subject: Re: [Buildroot] [PATCH v6 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVHVlLCBGZWIgMywgMjAyNiBhdCA5OjEy4oCvQU0gSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDMsIDIwMjYg
YXQgMjoyOOKAr0FNIFRpdG91YW4gQ2hyaXN0b3BoZQoKPiA+ID4+Cj4gPiA+PiArY29uZmlnIEJS
Ml9HT1BST1hZCj4gPiA+PiArICAgICAgIHN0cmluZyAiR28gbW9kdWxlIHByb3h5Igo+ID4gPj4g
KyAgICAgICBkZWZhdWx0ICJodHRwczovL3Byb3h5LmdvbGFuZy5vcmcsZGlyZWN0Igo+ID4gSW4g
bXkgb3BpbmlvbiAod2l0aCBteSBMVFMgc3Rld2FyZCBoYXQpLCB3ZSBzaG91bGRuJ3QgY2hhbmdl
IHRoZSBkZWZhdWx0Cj4gPiBpbiBCdWlsZHJvb3QgdG8gZ28gdGhyb3VnaCB0aGUgcHJveHkgZmly
c3QsIGFzIGl0IG1heSBpbnRyb2R1Y2UKPiA+IHN1cHBseS1jaGFpbiByZWxhdGVkIHZ1bG5lcmFi
aWxpdGllcy4KCkZvciB0aGUgTFRTIGJyYW5jaGVzLCBsZWF2ZSBpdCBhcy1pcywgZm9yIHRoZSBs
YXRlc3QgYnJhbmNoLCBjaGFuZ2UgaXQ/CgpUaGlzIHdvbid0IGludHJvZHVjZSBzdXBwbHktY2hh
aW4gdnVsbmVyYWJpbGl0aWVzIC0gYXMgSmFtZXMgc2FpZCwKcHJvamVjdHMgc2hpcCBnby5zdW0g
d2hpY2ggY2hlY2tzdW1zIGRlcGVuZGVuY2llcyBhbmQgZW5zdXJlcyB0aGVyZSBpcwpubyB0YW1w
ZXJpbmcuCgo+IEl0IGRvZXNuJ3QgYmVjYXVzZSBhbGwgZGVwZW5kZW5jaWVzIGFyZSBoYXNoZWQg
YW55d2F5IGluIGdvLnN1bSwKPiBJIGRvbid0IHNlZSB3aHkgYnVpbGRyb290IGRlZmF1bHRzIHNo
b3VsZCBkaWZmZXIgZnJvbSBub3JtYWwgZ29sYW5nCj4gZGVmYXVsdHMgaGVyZSwgZXNwZWNpYWxs
eSB3aGVuIGdvbGFuZyBoYXNoZXMgYWxsIGRlcGVuZGVuY2llcy4KPgo+IEN1cnJlbnRseSB3ZSBo
YXZlIGdvbGFuZyBwYWNrYWdlcyB3aXRoIGtub3duIHZ1bG5lcmFiaWxpdGllcyBkdWUKPiB0byB1
cyBiZWluZyB1bmFibGUgdG8gdXBncmFkZSB0aG9zZSBwYWNrYWdlcyBhdCBhbGwgZHVlIHRvIHRo
ZW0KPiBub3QgYmVpbmcgYWJsZSB0byBidWlsZCB3aXRoIHRoZSBub24tc3RhbmRhcmQgR09QUk9Y
WT1kaXJlY3QKPiBzZXR0aW5nLgoKSWYgdGhleSBoYXZlIGtub3duIHZ1bG5lcmFiaWxpdGllcywg
b24gdGhlIG90aGVyIGhhbmQsIGRpZCB3ZSBmaWxlCnVwc3RyZWFtIGlzc3VlcyBhYm91dCB0aGUg
R09QUk9YWT1kaXJlY3Qgbm90IHdvcmtpbmc/Cgo+ID4gV291bGQgeW91IGNvbnNpZGVyIHNldHRp
bmcgdGhlIGRlZmF1bHQgdG8gYGRpcmVjdGAgKGFzIGl0IGlzIGN1cnJlbnRseSksCj4gPiBhbmQg
dGhlbiBpbiB0aGUgaGVscCB0ZXh0IGJlbG93IChvciB0aGUgQnVpbGRyb290IHVzZXIgbWFudWFs
KSwgaW5kaWNhdGUKPiA+IHRoYXQgc29tZSBwYWNrYWdlcyBtYXkgYWN0dWFsbHkgcmVxdWlyZSB0
byB1c2UKPiA+ICJodHRwczovL3Byb3h5LmdvbGFuZy5vcmcsZGlyZWN0IiwgYXQgdGhlIHVzZXIn
cyBvd24gcmlzayA/CgpJIHRoaW5rIGNoYW5naW5nIGl0IHBlci1wYWNrYWdlIGlzIGFjdHVhbGx5
IG1lc3NpZXIgdGhhbiBqdXN0IGNoYW5naW5nCnRoZSBkZWZhdWx0LgoKPiBGb3IgYXV0b2J1aWxk
ZXJzIHRvIGZ1bmN0aW9uIHRoZSBkZWZhdWx0IEdPUFJPWFkgbXVzdCBhbHNvIGJlCj4gZnVuY3Rp
b25hbCBmb3IgcGFja2FnZXMsIGluIHRoZSBnb2xhbmcgZWNvc3lzdGVtIGl0J3MgZXNzZW50aWFs
bHkKPiBhbHdheXMgYXNzdW1lZCBkZXBlbmRlbmNpZXMgYXJlIGRvd25sb2FkZWQgdmlhIHRoZSBw
cm94eSwgYXMKPiBlc3NlbnRpYWxseSBub2JvZHkgdGVzdHMgaWYgR09QUk9YWT1kaXJlY3Qgd29y
a3MuCgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
