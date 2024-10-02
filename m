Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A71BCF8543
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 22:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDA9A400D7;
	Wed,  2 Oct 2024 22:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jneyytS_jTR0; Wed,  2 Oct 2024 22:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7286240190
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7286240190;
	Wed,  2 Oct 2024 22:02:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9329C1BF31B
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 22:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 810E9410C2
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 22:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThDH5mzXXAa4 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 22:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E968410C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E968410C1
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E968410C1
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 22:02:08 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5e5a0519d00so128867eaf.3
 for <buildroot@buildroot.org>; Wed, 02 Oct 2024 15:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727906527; x=1728511327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0KRUWlp5bE20e3c/5g7DqqiTrYra0yeJ0MxQ3Vyf34=;
 b=OfOKtICHO8OGdEtfd7BQepY8+eocs5aCHnicj2vR8kvXMf8nqmnUIcwUYFgSqMN/Pf
 atc4gF7R3nNY6p2bcTY3GWxpCJTFFRxRNWTBOUqOcncZWDemtSDV7vC3pteUNt8rMv9S
 OwVDjjaZmOK4TeUaIpt8JGbbBLFDqZy23dxuMJWCNDmlzD/IWyfOhoWF0NlkU3MipuY7
 u1nmJK5ql2UO7IIR1t368LlViQAzdS8/P84H0vz3z0Vf+TkQ0Fc8vxRV0NAVNtWK3lPv
 DpDic/f4qXYnLKmuOsiFCnA32i+ZBwv9IFBtTwpMzgSNsQEE6cvDziSE1MZ/JKFIjvsR
 iL/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV92ytkxA4A+y3/WGxqH6cHxIMQ8TcKjegTrxLTiexqhJuY3WljeH+Cc+ovpybt9PkqSBWr+Tqs8Ts=@buildroot.org
X-Gm-Message-State: AOJu0YyzPN0dyit1jNTRwdWPSSkdwwnTTGjEKZL221BaYfji6EbLYzQ5
 la7tIpsx9ETgJOOpD0/oom/qGpqrPwwV+0CupMZy2UBx/9lV1ly0nNIGWm+hpR3e/Neb0146dSp
 5
X-Google-Smtp-Source: AGHT+IHMx7kRVauX6zaz7n3AoKUWO6OO7a2+exY7kJ8JfH2w33JjVu1hZDy8Jn7O0UIsThiE6X4gQw==
X-Received: by 2002:a05:6870:82aa:b0:261:1aad:2c03 with SMTP id
 586e51a60fabf-28788f4cb53mr3084160fac.43.1727906527210; 
 Wed, 02 Oct 2024 15:02:07 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com.
 [209.85.161.51]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-287abc1bfecsm15415fac.50.2024.10.02.15.02.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 15:02:07 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5e5a0519d00so128856eaf.3
 for <buildroot@buildroot.org>; Wed, 02 Oct 2024 15:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhF6ZnDk4ksonoG925bgj6aCRKdu95IHr980N8iTAW8c4lEuNX8SfdrhOYjZfY77GmWMp6NjGUYDk=@buildroot.org
X-Received: by 2002:a05:6870:9a91:b0:270:64ed:c125 with SMTP id
 586e51a60fabf-28788aba983mr3197116fac.16.1727906526371; Wed, 02 Oct 2024
 15:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
 <20240904142509.3295502-4-adam.duskett@amarulasolutions.com>
 <a4ea9e57-79f3-4093-86b7-9e75e78646fc@mind.be>
In-Reply-To: <a4ea9e57-79f3-4093-86b7-9e75e78646fc@mind.be>
Date: Wed, 2 Oct 2024 15:01:55 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ok18A2m3i1UQOom9X=JDBbRess=CE3Nn1yv1d7EvTG7A@mail.gmail.com>
Message-ID: <CA+h8R2ok18A2m3i1UQOom9X=JDBbRess=CE3Nn1yv1d7EvTG7A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1727906527; x=1728511327; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0KRUWlp5bE20e3c/5g7DqqiTrYra0yeJ0MxQ3Vyf34=;
 b=d9VFQn/jMldvNQ9y2q/U1C0iDTtP3vuy2Bnh5KjRWWETCD7LrpesYAX/wgiZlUlUd+
 pMKJ6BJjW8sm/iZO4TdRxACI/4eagTdwwG+joPQ+eZkI7OtAMD6BWEErpAbKiy753IBX
 iDhEmUbBjC9ZUVlBDuUxQk3ECZ6JeIboHkXoZFTIjUQGvsH3UdWVNCXfyweAWuqAlRQM
 dTubBmsvLfrV6eluEjGMT69ETvwqe+a1puj5bxijTv0YQhdIYFv/+uCJLz9E08IZU8Sm
 s5W1khyOsNaIrwdOwY7XR0J5hdtrYqFIBttV4uP2CoouYZKT8yfg2RE+dhqywJURUczR
 2m0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=d9VFQn/j
Subject: Re: [Buildroot] [PATCH v2 4/5] package/mender-artifact: bump
 version to 3.11.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gV2VkLCBPY3QgMiwgMjAyNCBhdCAxOjU44oCvUE0gQXJub3V0IFZhbmRl
Y2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPiBPbiAwNC8wOS8yMDI0IDE2OjI1LCBB
ZGFtIER1c2tldHQgd3JvdGU6Cj4gPiBtZW5kZXItYXJ0aWZhY3Qgbm93IGV4cGxpY2l0bHkgZGVw
ZW5kcyBvbiBob3N0LW9wZW5zc2wgYW5kIHVzZXMgaG9zdC1wa2djb25mCj4gPiB0byBmaW5kIHRo
ZSBjb3JyZWN0IGxpYnJhcmllcy4KPiA+Cj4gPiBVc2UgdGhlIHNhbWUgdmFyaWFibGVzIGFzIGRl
ZmluZWQgaW4gSE9TVF9NQUtFX0VOViAoaW4gcGFja2FnZS9NYWtlZmlsZS5pbikgZm9yCj4gPiBI
T1NUX01FTkRFUl9BUlRJRkFDVF9HT19FTlYuCj4KPiBbc25pcF0KPgo+ID4gK0hPU1RfTUVOREVS
X0FSVElGQUNUX0dPX0VOViArPSBcCj4gPiArICAgICBQQVRIPSQoQlJfUEFUSCkgXAo+ID4gKyAg
ICAgUEtHX0NPTkZJRz0iJChQS0dfQ09ORklHX0hPU1RfQklOQVJZKSIgXAo+ID4gKyAgICAgUEtH
X0NPTkZJR19BTExPV19TWVNURU1fQ0ZMQUdTPTEgXAo+ID4gKyAgICAgUEtHX0NPTkZJR19BTExP
V19TWVNURU1fTElCUz0xIFwKPiA+ICsgICAgIFBLR19DT05GSUdfTElCRElSPSIkKEhPU1RfRElS
KS9saWIvcGtnY29uZmlnOiQoSE9TVF9ESVIpL3NoYXJlL3BrZ2NvbmZpZyIgXAo+ID4gKyAgICAg
UEtHX0NPTkZJR19QQVRIPSIkKEhPU1RfRElSKS9saWIvcGtnY29uZmlnIiBcCj4gPiArICAgICBQ
S0dfQ09ORklHX1NZU1JPT1RfRElSPSIvIgo+Cj4gICBQZXJoYXBzIHRoaXMgc2hvdWxkIGJlIGRv
bmUgaW4gdGhlIGluZnJhPyBUaGlzIGlzIHJlbGV2YW50IGZvciBhbGwgaG9zdCBnbwo+IHBhY2th
Z2VzLCByaWdodD8KClRoaXMgZG9lcyBpbmRlZWQgbG9vayBsaWtlIHNvbWV0aGluZyB3ZSBjb3Vs
ZCBhcHBseSB0byBhbGwgaG9zdCBHbyBwYWNrYWdlcy4KCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFu
IFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
