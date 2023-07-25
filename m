Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43718C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 08:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E9BC405B9;
	Tue, 25 Jul 2023 08:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E9BC405B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLQ2OS7PczAX; Tue, 25 Jul 2023 08:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D69B2402F6;
	Tue, 25 Jul 2023 08:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D69B2402F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1891BF295
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 08:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2556F81980
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 08:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2556F81980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ff_5CX_NQUg8 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 08:21:53 +0000 (UTC)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B28AF818EC
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 08:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B28AF818EC
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6378cec43ddso32848646d6.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 01:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690273312; x=1690878112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6PPVwMMPPCW3CW3dVIFuyaDUBlHp/AB+r9l02QHDXok=;
 b=KfzIHTi23cM/gihIfxpbEtPo+6m5E1RE3H45mfDyCszA+mbEjCI+x0rql8YDx7b/EV
 Qx815cAZJOAxvdxFguGRztdO+LASAI5M4M4RFBXCUiIJKKI7/Aj+Cdjg2+Z5Fu6pOMaf
 PebbZnkyfchpTfGylTcudSnQqvor8MK/hezSGi2DjQBB9UEv2qWR/b2U6NLAnLeRhvLI
 l7jaOwfEMoyhj2edNCc2Q92fSppY9LYhjiKi5tf+ZFeIXfOxyAn/YxtFo/eP95dJ5OwL
 0mwvuVO9a0aVR4PMk++Fy3VUMtH5exMYfxMntVu0NHpVX0mUVTIa9DUz6Yto590RFXXJ
 q9Mw==
X-Gm-Message-State: ABy/qLaYdxDKxrvlciCcNm7HMZVVBaRt51Q7UMCWoYyrZMxd41s8A7s3
 /97zjRZhFwW5oasTh0hKSG1g9rjiyuBHM6zadJ8vMw==
X-Google-Smtp-Source: APBJJlHz/pXjg+jdSaFg/NDD2W9AKzgTj07BzQAL7DjXpdi49HnbjkzGrZAf8AMn4B2uOO4BRJYz7jLT5s296xQzXYA=
X-Received: by 2002:a05:620a:2495:b0:767:35c1:fdae with SMTP id
 i21-20020a05620a249500b0076735c1fdaemr2635913qkn.49.1690273312489; Tue, 25
 Jul 2023 01:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230710212151.574040-1-robertoxmed@gmail.com>
 <20230710212151.574040-2-robertoxmed@gmail.com>
 <45660995.fMDQidcC6G@kilian-aisec>
 <f354a2cd-2a5c-c645-703f-30a8eb3458f7@gmail.com>
In-Reply-To: <f354a2cd-2a5c-c645-703f-30a8eb3458f7@gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 25 Jul 2023 04:21:40 -0400
Message-ID: <CACdvmAgtOZHNouxMSYVfoqZU2J9CQXvQFQ__yfzsSX+oMEweJQ@mail.gmail.com>
To: Roberto Medina <robertoxmed@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lessconfused.com; s=lessconfused; t=1690273312; x=1690878112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6PPVwMMPPCW3CW3dVIFuyaDUBlHp/AB+r9l02QHDXok=;
 b=aX5hfeq6Mo4jR19izcuQ+t6D6bYdOQ0k86bfLLEHOMguxhy3DPbd6dP8c2ZVXIhNmi
 HKCAO8TvgTxgntzCzYawKlLDpuQrwtUUgghrfXXclfpHYJk4oBQ8lYascEI73OzRuJPp
 F8gxovnczymkZOtW4DkXZdsu8+Q9kJwhXF+eo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com
 header.a=rsa-sha256 header.s=lessconfused header.b=aX5hfeq6
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgNzowMuKAr0FNIFJvYmVydG8gTWVkaW5hIDxyb2JlcnRv
eG1lZEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgS2lsaWFuLCBhbGwsCj4KPiBPbiA3LzE0LzIz
IDIwOjA4LCBLaWxpYW4gWmlubmVja2VyIHdyb3RlOgo+ID4gUmV2aWV3ZWQtYnk6IEtpbGlhbiBa
aW5uZWNrZXIgPGtpbGlhbi56aW5uZWNrZXJAbWFpbC5kZT4gVGVzdGVkLWJ5Ogo+ID4gS2lsaWFu
IFppbm5lY2tlciA8a2lsaWFuLnppbm5lY2tlckBtYWlsLmRlPiBUZXN0ZWQgdjIsIGJ1dCBhZ2Fp
biBidWlsZAo+ID4gdGVzdCBvbmx5IChJIGRvbid0IGhhdmUgdGhhdCBib2FyZCkuIEkgYWxzbyBo
YWQgYSBsb29rIGF0IGl0IGFuZCBpdAo+ID4gbG9va3MgZ29vZCB0byBtZS4KPgo+Cj4gQW55IHN1
Z2dlc3Rpb24gb24gaG93IHRvIGdldCB0aGlzIG1lcmdlZCB0byB1cHN0cmVhbT8gT3IgYW55IGZ1
cnRoZXIKPiBjaGFuZ2VzIHJlcXVpcmVkPwoKVGhpcyBwYXJ0aWN1bGFyIG1vZGVsIGlzIGFjdHVh
bGx5IGEgTGlicmUgQ29tcHV0ZXIgcHJvZHVjdC4gRmlyZWZseSBubwpsb25nZXIgc2VsbHMgdGhp
cyBhbHRob3VnaCB0aGV5IGFyZSBzdGlsbCB0aGUgT0RNLiBCdXQgdGhpcyBpcyBuaXQgYW5kCmRv
ZXNuJ3QgcmVhbGx5IGFmZmVjdCB1cy4KCldlIHdpbGwgc3RhcnQgbWFpbnRhaW5pbmcgdGhpcyBi
b2FyZCBkaXJlY3RseSBpbiBidWlsZHJvb3QgaW4gdGhlIG5leHQKbW9udGggb3Igc28uCgo+Cj4g
VGhhbmsgeW91IGluIGFkdmFuY2UuCj4KPiBSb2JlcnRvCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
