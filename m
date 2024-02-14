Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93698C48BC1
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 11:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7554033B;
	Wed, 14 Feb 2024 11:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsfwgsOn9LvX; Wed, 14 Feb 2024 11:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9EB40346
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9EB40346;
	Wed, 14 Feb 2024 11:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CCEF1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B35181D24
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guYBRVa1DoGV for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 11:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85B0A81D11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B0A81D11
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85B0A81D11
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 11:29:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-411f439fb93so2173925e9.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 03:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707910189; x=1708514989;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y5LItMaAKJL2oO6hMAwzvvFk57guJM+fn31xhfU1q6U=;
 b=bsN1bd+AUc51I9Sd9IGugvzv4oJ/FOboFKY7JvpJw+s5FaTQap1CWv2Lm9cCU3xNov
 oTc7RStjjAfJmfd6DBz/xpGdDylYDbWTCgyZvZ/Eii76HzVpxhZJhSkMAhWzRosJtSHO
 bDEuOFQE55bPRpguHrPo65Enbwm3U6NQa67sleNG/vq6UEUOnQNGy67kKfc26AOfdZMW
 3B9HAPB1YSE411TvEfb4OHzZH27/sTl6vZBiOoy9HpP5vZb40W9zNVBWDOwmSZRnKHj1
 nLAhizoFkPY9eUGFirSzFZZWnLonsYkoojmG+xyG6m4TmxvA5KtcWTkUM6DFDpI4/UFe
 Wegw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdW8/ZE08WgnV3owokVwXxkP/YnRvkSuK6Z4YSM8afwko1vAiBw/b35ArmxzhMDV++ZBLqcZmGagBk8MEijAiWHr8OPqBCqQ==
X-Gm-Message-State: AOJu0YzohY+kCcxpUGdZxsZ26YQv+BW9SY2qA9yO5h+5t9KRCdQjB53Q
 lamnZxG55FZ88eE7fMvNN5L87VLBdRIgko7giJlFULnuOH0BfmwV
X-Google-Smtp-Source: AGHT+IFQuGQtYTCJTZVNEb5tcHvrT21iNvCg1MXh0mK3iMZkDv2cEyFjt4EFkW998Z5lNsxso4bwFg==
X-Received: by 2002:a05:600c:45cb:b0:40e:f2d6:9dc with SMTP id
 s11-20020a05600c45cb00b0040ef2d609dcmr2172487wmo.33.1707910189448; 
 Wed, 14 Feb 2024 03:29:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyY+nVGgAc23Q888Gb5j6QQhkaRGoaKq4GB92fX82Y9H+XDGzjdL8QwUEJUEq/05qIwRhr5gKDqFr/V0clOqJtut/Z8dUBmQ==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 fm7-20020a05600c0c0700b00411062c123esm1696769wmb.26.2024.02.14.03.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:29:49 -0800 (PST)
Message-ID: <9be87fcdf09a2c130766d9b9e08d6af971e3b322.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 12:29:48 +0100
In-Reply-To: <20240213172817.2872849-14-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-14-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707910189; x=1708514989; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y5LItMaAKJL2oO6hMAwzvvFk57guJM+fn31xhfU1q6U=;
 b=CQo0MhYrVTGo83irXWHhDwamZ1v4lPV+2CJY/lvPknWI+wRBHQ6+KuU+NFKJdbsbsD
 kbdk5Scxsi7wqxgC41QmNYIVEdq3AG5ughFE3rSsIUs3EHohbiImeoUfpJEmPXvWGXhk
 mHo4FNSvANAp/b5NbIluDW4g6GmwMXzpAnMDZJUyc8/snX+WgQyBwMBPXX+97xmdrH0a
 /dvkR8EU8Z8UhggpePPEy6KCW8gCf8vH5208O0RqAaaQZtIlZ6ffe1UNYyqekaHtg+63
 z3Kr+5dI1vJgXYpxmCug1+J5HGCi0zSkaOuBNK2XOWhi3+kf2MVVqlqJVApAxz9/3cRL
 5tXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CQo0MhYr
Subject: Re: [Buildroot] [PATCH 13/21] boot/uboot: use DM firmware name
 defined by ti-k3-boot-firmware package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gVGhlIERNIGZpcm13YXJlIG5hbWUgaXMgbm93IGRlZmluZWQgYnkgdGktazMt
Ym9vdC1mcmltd2FyZSBwYWNrYWdlIGJ5Cj4gQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJF
X0RNLCBzbyBCUjJfVEFSR0VUX1VCT09UX1RJX0szX0RNX1NPQ05BTUUKPiBjYW4gYmUgcmVtb3Zl
ZCB0byBhdm9pZCBkdXBsaWNhdGlvbiBpbiBLY29uZmlnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRl
ciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KCj4gLS0tCj4gwqBib290
L3Vib290L0NvbmZpZy5pbiB8IDkgLS0tLS0tLS0tCj4gwqBib290L3Vib290L3Vib290Lm1rwqAg
fCAyICstCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC91Ym9vdC9Db25maWcuaW4gYi9ib290L3Vib290L0Nv
bmZpZy5pbgo+IGluZGV4IGU2ZTc5NTZhZGMuLjYzMzU5MjY2YzYgMTAwNjQ0Cj4gLS0tIGEvYm9v
dC91Ym9vdC9Db25maWcuaW4KPiArKysgYi9ib290L3Vib290L0NvbmZpZy5pbgo+IEBAIC0yNTAs
MTUgKzI1MCw2IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX05FRURTX1RJX0szX0RNCj4gwqAJ
wqAgU29tZSBUSSBLMyBkZXZpY2VzIG5lZWQgdGhlIERldmljZSBNYW5hZ2VyIChETSkgZmlybXdh
cmUgdG8KPiDCoAnCoCBiZSBhdmFpbGFibGUgZm9yIHRoZSBVLUJvb3QgYnVpbGQuCj4gwqAKPiAt
aWYgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETQo+IC0KPiAtY29uZmlnIEJSMl9UQVJH
RVRfVUJPT1RfVElfSzNfRE1fU09DTkFNRQo+IC0Jc3RyaW5nCj4gLQlkZWZhdWx0ICJhbTYyYXh4
IiBpZiBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0NfQU02MkFYCj4gLQlkZWZhdWx0ICJh
bTYyeHgiwqAgaWYgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU09DX0FNNjJYCj4gLQo+IC1l
bmRpZgo+IC0KPiDCoGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TQkkKPiDCoAli
b29sICJVLUJvb3QgbmVlZHMgT3BlblNCSSIKPiDCoAlkZXBlbmRzIG9uIEJSMl9UQVJHRVRfT1BF
TlNCSQo+IGRpZmYgLS1naXQgYS9ib290L3Vib290L3Vib290Lm1rIGIvYm9vdC91Ym9vdC91Ym9v
dC5tawo+IGluZGV4IDA3MTQ1MjI1NTAuLmFhMmNhOTliZGQgMTAwNjQ0Cj4gLS0tIGEvYm9vdC91
Ym9vdC91Ym9vdC5tawo+ICsrKyBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiBAQCAtMTg3LDcgKzE4
Nyw3IEBAIFVCT09UX01BS0VfT1BUUyArPSBURUU9JChCSU5BUklFU19ESVIpL3RlZS5lbGYKPiDC
oGVuZGlmCj4gwqAKPiDCoGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETSks
eSkKPiAtVUJPT1RfVElfSzNfRE1fU09DTkFNRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VU
X1VCT09UX1RJX0szX0RNX1NPQ05BTUUpKQo+ICtVQk9PVF9USV9LM19ETV9TT0NOQU1FID0gJChj
YWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9ETSkpCj4gwqBVQk9P
VF9ERVBFTkRFTkNJRVMgKz0gdGktazMtYm9vdC1maXJtd2FyZQo+IMKgVUJPT1RfTUFLRV9PUFRT
ICs9IERNPSQoQklOQVJJRVNfRElSKS90aS1kbS8kKFVCT09UX1RJX0szX0RNX1NPQ05BTUUpL2lw
Y19lY2hvX3Rlc3RiX21jdTFfMF9yZWxlYXNlX3N0cmlwLnhlcjVmCj4gwqBlbmRpZgoKLS0gCkFs
ZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
