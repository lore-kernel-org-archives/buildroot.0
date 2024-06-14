Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CC6C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 04:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A2A84367;
	Fri, 14 Jun 2024 04:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJVLdleQp7Nd; Fri, 14 Jun 2024 04:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E50984368
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E50984368;
	Fri, 14 Jun 2024 04:08:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FEBB1BF338
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 04:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AA9C84368
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 04:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RfmtzNdUcSb1 for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 04:08:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDF9184367
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDF9184367
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDF9184367
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 04:08:11 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52bc27cfb14so2256407e87.0
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 21:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718338089; x=1718942889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94fWPrCBpqejnXgsmUa5PCMH3eTwP/OrrF+8/FV8ud4=;
 b=fbUz8If7C514jM8eIAlB7VXwty3FNGgZFy0+IRwDhNuPP8Bznn2VZFrUfu8ByGAYpt
 ttuSCdi9ZnsfDbiVILSo8exM7t7gNnKT+yCU609NgUuIIztImx1mUwFg9nv6ENUrxy7a
 IlNDUu43eCCsjjVltbJ18Ssx6PoDdjNFkAPUa7qbIeyW4FYoAo0nQRAZHCthM2mMR9QZ
 rMA7gcYoPxGiu6qT4bemQZygHlm8bXsRJR5Fu4a/k5pN4+fc3xWzZ22hKavKAQlQDEHD
 coHybce8PT4DO0q3NcqZvNMnRuVi47roxytIevf9HSb3f/rFFp8ZMPWZnHNilMjEG2QD
 UH2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYY4drhiiwUngAtMenJHP7iQsTrRWPpgpgHa6Oa1kiczLO3FcrFAaFKoPjCBa+PjFUxQ/Qd8Y4NxUzpgR7sTQkcV3HpfYJdw==
X-Gm-Message-State: AOJu0Yzh+98/0y+rJPQR6ztHdyzYRqPqNmgo3Wb7spT+dsNruAkNNHKF
 zt08bwi/54SYqO1n5uufMAmjdnO63/oMD0NSQZtMmtW28KXyQEHe84NVBT9/RqKUebQIzmztmfs
 FdgI=
X-Google-Smtp-Source: AGHT+IEjPCsrsmiHNRMqvZ7VpHzb7/Okd8KfGcLAQH/FtekB/Kq4wvAjsphXcLMGqeRjE69hgoiGyQ==
X-Received: by 2002:a05:6512:3e25:b0:52c:8b03:99d1 with SMTP id
 2adb3069b0e04-52ca6e92adcmr1351722e87.48.1718338088967; 
 Thu, 13 Jun 2024 21:08:08 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca288858asm397805e87.289.2024.06.13.21.08.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 21:08:08 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so30281151fa.0
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 21:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWVnFhp6dOavRAlmDH3GTYusjO4QmJJhn25Lv7c0QRb8/f8/hQGOLJER8J39CS0dDfu3eMsv4WKH4bFW3UYwRwRabnYPLwqvw==
X-Received: by 2002:a2e:3615:0:b0:2ec:5cf:565e with SMTP id
 38308e7fff4ca-2ec0e481e95mr10856811fa.12.1718338087807; Thu, 13 Jun 2024
 21:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-6-thomas.perale@mind.be> <ZltDc6AXn_CC83Gy@landeda>
In-Reply-To: <ZltDc6AXn_CC83Gy@landeda>
Date: Thu, 13 Jun 2024 21:07:56 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r9ogzjdAjVon5UsU9TPp5wy+cYC+BUSGnRWF3bgnkMcg@mail.gmail.com>
Message-ID: <CA+h8R2r9ogzjdAjVon5UsU9TPp5wy+cYC+BUSGnRWF3bgnkMcg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1718338089; x=1718942889; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94fWPrCBpqejnXgsmUa5PCMH3eTwP/OrrF+8/FV8ud4=;
 b=1x0/+vMIld32iRU4TCgOZlDTot2Stf8tn6kdyOFK08ImLQmwhLZ5lR67JWcBhj9+3g
 tvcvC7zbA0x3LqTNK/XGnEsPjAeD6bKG2Zrw4YGp0/AQhcrXLylZp4QU1x92C47PZ4qO
 pmcJ3g9xNzDB3lejL7lNV0yzFoVNOlY7KxfwxeiCITW1mJoHrBzeZnrtj9IjMRoi9Ede
 4+hAo9Vw+AH7RECC6+asuimWsgiX7ZEn9EG2MCdQ261faV0oEHekDAzmgGOlxu5qwVDZ
 8igMfCVIL2MUeNSVgTKdd7WkUfWPVG9YnCQW8cD8yb488B4CCUsLCpz8gfSRyu/2Rm02
 +5wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=1x0/+vMI
Subject: Re: [Buildroot] [PATCH v2 5/6] package/go/go-bin: new host-go
 provider
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
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFNhdCwgSnVuIDEsIDIwMjQgYXQgODo1MeKAr0FNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IFstLVNOSVAtLV0KPgo+IE5vdGUg
dGhhdCB3ZSBkbyBub3QgYWx3YXlzIHVzZSB0aGUgc2FtZSBfU0lURSBmb3IgYWxsIHRoZSB2YXJp
b3VzIGdvCj4gcGFja2FnZXMsIGJ1dCBhcyBmYXIgYXMgSSBjb3VsZCBzZWUsIGh0dHBzOi8vZ28u
ZGV2L2RsIGhhcyBhbGwgdGhlCj4gc291cmNlIGFyY2hpdmVzLCBzbyBtYXliZSB3ZSBzaG91bGQg
dXNlIHRoYXQgZm9yIGFsbCB0aGUgZ28gcGFja2FnZXM/Cj4KPiA+ICtHT19CSU5fTElDRU5TRSA9
IEJTRC0zLUNsYXVzZQo+ID4gK0dPX0JJTl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+Cj4gSSBh
bHNvIGFkZGVkOgo+Cj4gICAgIEhPU1RfR09fQklOX0FDVFVBTF9TT1VSQ0VfVEFSCkJBTEwgPSBn
byQoR09fVkVSU0lPTikuc3JjLnRhci5nego+Cj4gYW5kIHRoZSBjb3JyZXNvbmRpbmcgaGFzaDoK
Pgo+ICAgICBzaGEyNTYgODA2NDhlZjM0ZjkwMzE5M2Q3MmE1OWMwZGZmMDE5ZjVmOThhZTBjOWFh
MTNhZGUwYjBlY2JmZjk5MWE3NmY2OCBnbzEuMjIuMy5zcmMudGFyLmd6Cj4KPiBOb3RlIHRoYXQs
IGFzIGh0dHBzOi8vZ28uZGV2L2RsIGRvZXMgaGF2ZSB0aGUgc291cmNlIHRhcmJhbGwsIEkgZGlk
IG5vdAo+IG5lZWQgdG8gc3BlY2lmeSBIT1NUX0dPX0JJTl9BQ1RVQUxfU09VUkNFX1NJVEUKCkRv
IHlvdSBoYXZlIHRoZSBtb2RpZmllZCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggcG9zdGVkIHNvbWV3
aGVyZSBzbyBJIGNhbiB0ZXN0PwoKVGhhbmtzLApDaHJpc3RpYW4gU3Rld2FydAoKUFM6IFNlbnQg
ZnJvbSB3cm9uZyBlbWFpbCBwcmV2aW91c2x5LCBidXQgY2hyaXN0aWFuQGNqcy56aXAgaXMgYWxz
byBtZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
