Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EC3CCF2C2
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A3D740328;
	Mon,  5 Jan 2026 20:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3IQzk7wlbhd; Mon,  5 Jan 2026 20:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FA440337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767644486;
	bh=Dhy/+n7zCAdvPco1c5zCJ7VVxgiJjTlAOiXIwuXTAb8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V5bsOBJYOsL2+2dn9U/za59tYvie8hANs3vpZPhPWvN66fQpycMk5ZY5J1Hz8lLzo
	 ZVEHAR+mNxQLa7l+/8uWvWqax8dMLilM+/Kc22HBkrPw+43MIqvG7h9/i/oT5kBjxd
	 5QCX1MLKU5x/FIknRSlf6bcqyOx0DgkZNlYvPJWa+Y7LBfN/XRRoCAAvHUrgPLOVdt
	 cjzIE35ocmn+tqz5b/u6IoXT/h/0cvSVsmdc5mpw6HBC7p7UvV21JlI9zsMKFC/7Z6
	 fppmnCamDF8fADIo7vfmmhAYiGR11CCuHtOv27VrMVUe8pBcBxiDXYtn8SoBaZvNbS
	 5IayURZAZKaqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37FA440337;
	Mon,  5 Jan 2026 20:21:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 570BEE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 543ED40209
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6MwIaCTgUd0 for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64EFC4005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64EFC4005C
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64EFC4005C
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:21:24 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-3ec3cdcda4eso244115fac.1
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 12:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767644483; x=1768249283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=etHxsSPChf7IMxfMUUVxj6uJ+P5DH37/Aks7UV76xOE=;
 b=RY6w7Q0ci+YMQAUGmXABh1DjgQHIBK6wcQhyKffmk1GQzmKtRKxFn8prxD9jEj9NiJ
 /dnYNQPDIJqXtKkYmOp4OKtVkTEx+kZQ1Q8itBJFwoP1CMXY1D6wspZuPdwyPF6CbMeZ
 SUCAm7KxuqOlwR/Y4w7KQeWf9Q5jdcTiyYmLJhhX6iZT0L2GS7Oe82gHDD6McTegHP2C
 +QFnzqzvdQSE/BLfmMWyaBSJaL9/ZtVfxzuYY3eRs94w53VD9g39+eAwbwYBYcxU49hG
 hTAEg/u4j14U3W+4cTpWVZcZotPXWugwetEoDVqAqOeoIKqJtbSLwVarvrozu/CDwgVq
 tJdQ==
X-Gm-Message-State: AOJu0Ywz4v7i+jysZSHBuK/k3wBDnNyorero9gW950CJBFKHdvU4Cbbr
 nyJ9O6Xs75Jq661wx0TP3/Azqe/I+JlxSuB8jZdEoSTyMN7RbTaCBcgEf3PqHfOtt7ZrGJFBy8s
 R4kydCiD6X4vnQaRJ7/HzlQjYRUUvfqo=
X-Gm-Gg: AY/fxX7WB/IsLevb7WL1KMJtlP9oocQuBul60/jTivlfnmwARP6H2vOozghQH+QgRiT
 bwssw4xMQIDlc3iiAi1rJj/pDKew6nLqhkxnjpSqjtSJxx9/ug+ye6VarQ6eP7EeIAaz3sp44HX
 Fci1MAFSPtYiotk55bSZMsgbGSfu1KVWTMv9egGpaM2/Pm2W/Hjw2XFxz63PEhNFUMch7CTdmTB
 6fSAj5arPoL/VR6W1I3dvrG0q7O0pe5mUqm6oHU8xG4nHRZNdNzTWfSS+wIVQQb/TLTog==
X-Google-Smtp-Source: AGHT+IHKZFnJlnYJIUqvtXPSWAzMRBc1urVrgrcbQEhje3KU8THzngXUG4gkS7CbAXq58THkN1CfyYJdhTF3RiodNb4=
X-Received: by 2002:a05:6820:1c91:b0:65d:1c:f3b1 with SMTP id
 006d021491bc7-65f47a70203mr345719eaf.49.1767644482698; Mon, 05 Jan 2026
 12:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20260105194813.2157401-1-bernd@kuhls.net>
 <20260105194813.2157401-4-bernd@kuhls.net>
In-Reply-To: <20260105194813.2157401-4-bernd@kuhls.net>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 5 Jan 2026 12:20:46 -0800
X-Gm-Features: AQt7F2pCfOZ3rlEIC8cl62L7AyeXcjtg_XBolGhr_yGojrABIyBR3VDxdQJwAnc
Message-ID: <CAMWSM7hXaOtkFuT+WSTXv2bVdGBA5ZjatZx6bzxrzkJfxgVeZw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767644483; x=1768249283; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etHxsSPChf7IMxfMUUVxj6uJ+P5DH37/Aks7UV76xOE=;
 b=dTjOVyWKpPzUEDeUzH+rT4K/kTNibTMM0Uxa8jLjWexCpFiMRKdnratWp00lHtg4Ub
 kAHGJVxajQF50CF5dfJCjkiZWqWxf2B4rpKiWelwNTd0pTj/MTayjyLPaac7RoB44/7w
 YsfdggQ1o2Ei40FvHGO4PBkV3MaaLdbb8u+Pn0JwkpzsY6EZrvJyVTIsgcPqyMucHlkK
 pOYE/2/UonCvz2ZC9N+vi7VDBV6BnXpHcdkX1iuBJokov1j7qxUH4k0bFzzP348Xm+Zo
 3Qev6PFuh1LCJ3NNyQa/JdyiX6SwTmIlwK1uCTUW1phvkWmHxJFX/dtHAkbEYL5gtZFf
 tMbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dTjOVyWK
Subject: Re: [Buildroot] [PATCH 3/6] package/gconf: remove package, broken
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TG9va3MgZ29vZCB0byBtZS4KCk9uIE1vbiwgSmFuIDUsIDIwMjYgYXQgMTE6NDjigK9BTSBCZXJu
ZCBLdWhscyA8YmVybmRAa3VobHMubmV0PiB3cm90ZToKPgo+IEZyb206IFRob21hcyBQZXRhenpv
bmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4KPiBnY29uZiBoYXMgbm90IHNlZW4g
YW55IHJlbGVhc2Ugc2luY2UgMjAxMywgYW5kIHRoZSBsYXN0IGNvbW1pdCBpbgo+IGh0dHBzOi8v
Z2l0bGFiLmdub21lLm9yZy9BcmNoaXZlL2djb25mIGlzIGZyb20gMjAxNS4KPgo+IFRoZSBwYWNr
YWdlIGV4YW1wbGUgYXBwbGljYXRpb24gYmFzaWMtZ2NvbmYtYXBwIGZhaWxzIHRvIGJ1aWxkIHdp
dGggYQo+IHJlY2VudCBjb21waWxlciBzdWNoIGFzIEdDQyAxNC54Ogo+Cj4gYmFzaWMtZ2NvbmYt
YXBwLmM6NDU4OjYwOiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAxIG9mIOKAmGd0a19kaWFsb2df
Z2V0X2NvbnRlbnRfYXJlYeKAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5j
b21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCj4KPiBJdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgc2lu
Y2Ugd2hlbiB0aGlzIGJyZWFrYWdlIHRha2VzIHBsYWNlLCBidXQKPiBtb3N0IGxpa2VseSBzaW5j
ZSBHQ0MgMTQueCB3YXMgaW50cm9kdWNlZC4gVGhpcyBpc3N1ZSBjYW4gYmUKPiByZXByb2R1Y2Vk
IGluY2x1ZGluZyBvbiAyMDI1LjAyLnggd2l0aCB0aGUgZm9sbG93aW5nIGRlZmNvbmZpZzoKPgo+
IEJSMl9hYXJjaDY0PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENIQUlO
X0VYVEVSTkFMX0JPT1RMSU49eQo+IEJSMl9QQUNLQUdFX01FU0EzRD15Cj4gQlIyX1BBQ0tBR0Vf
TUVTQTNEX0dBTExJVU1fRFJJVkVSX1NXUkFTVD15Cj4gQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5H
TF9FR0w9eQo+IEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRVM9eQo+IEJSMl9QQUNLQUdFX0xJ
QkdUSzM9eQo+IEJSMl9QQUNLQUdFX0dDT05GPXkKPgo+IEhvd2V2ZXIsIGZvciB0aGUgYnVpbGQg
aXNzdWUgdG8gaGFwcGVuIHlvdSBuZWVkIHRvIHJ1bjoKPgo+ICQgbWFrZSBsaWJndGszCj4gJCBt
YWtlCj4KPiBTbyB0aGF0IGxpYmd0azMgZ2V0cyBidWlsdCBiZWZvcmUgZ2NvbmYuIEluZGVlZCwg
dGhlcmUncyBhIGhpZGRlbgo+IGRlcGVuZGVuY3kgYmV0d2VlbiB0aGUgdHdvLCBhbmQgdGhlIGV4
YW1wbGUgcHJvZ3JhbXMgb2YgZ2NvbmYgb25seSBnZXQKPiBidWlsZCBpZiBsaWJndGszIGlzIGJ1
aWx0IGJlZm9yZS4gV2UndmUgaG93ZXZlciBlbmNvdW50ZXJlZCB0aGUKPiBwcm9ibGVtIGluIGEg
KHJlYWwpIGJpZ2dlciBidWlsZCB3aGVyZSB0aGUgZGVwZW5kZW5jeSByZWxhdGlvbnNoaXAgb2YK
PiBwYWNrYWdlcyBoYXZlIGNhdXNlZCBsaWJndGszIHRvIGdldCBidWlsdCBiZWZvcmUgZ2NvbmYu
Cj4KPiBOb3RlIHRoYXQgd2UgY291bGQgcGVyaGFwcyBoYXZlIGZpeGVkIHRoZSBwcm9ibGVtIGJ5
IGRpc2FibGluZyB0aGUKPiBleGFtcGxlcywgYnV0IGdjb25mIGlzIGFueXdheSBzbyBvbGQgYW5k
IGRlcHJlY2F0ZWQgdGhhdCBpdCBpc24ndAo+IHdvcnRoIHRoZSBlZmZvcnQuCj4KPiBUaGVyZSBh
cmUgbm8ga25vd24gYXV0b2J1aWxkZXIgaXNzdWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+IENjOiBKb3NlcGggS29ndXQgPGpvc2Vw
aC5rb2d1dEBnbWFpbC5jb20+Cj4gLS0tCj4gIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICB8ICA3
ICsrKysrKysKPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgIHwgIDEgLQo+ICBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgfCAgMSAtCj4gIHBhY2thZ2UvZ2NvbmYvQ29uZmlnLmluICB8IDIxIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBwYWNrYWdlL2djb25mL2djb25mLmhhc2ggfCAgNCAtLS0t
Cj4gIHBhY2thZ2UvZ2NvbmYvZ2NvbmYubWsgICB8IDIzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDYgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkKPiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2NvbmYvQ29uZmlnLmluCj4gIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2djb25mL2djb25mLmhhc2gKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvZ2NvbmYvZ2NvbmYubWsKClJldmlld2VkLWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaC5r
b2d1dEBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
