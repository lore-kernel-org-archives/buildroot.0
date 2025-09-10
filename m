Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C20CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 22:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C866484407;
	Wed, 10 Sep 2025 22:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpkuPV4tbnef; Wed, 10 Sep 2025 22:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D321B84400
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D321B84400;
	Wed, 10 Sep 2025 22:23:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 876812BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 791C8411C2
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvqL7qpqWWjm for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 22:23:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A58EB411C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A58EB411C1
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A58EB411C1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:23:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-56afe77bc1eso49433e87.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 15:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757542984; x=1758147784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9s0GuPfbba88a9CfivvwSpPIenwvakQZWnebVZHl7U=;
 b=vnkxkV5Z5RyGJKRJx/l7826xMXBhln6yhbGp6ocVm+W/Giq4S7O8ighW0DhNKA/7D9
 +rvh+7m3XLVtTWuEJcDa3/ULPMlIw2h2XppCFT5kotsyRAL/LKEY9k4v9yz3U/e6k8O3
 0j4HrZX4Y+5sv2576uX1Bvr6TBDdvw92HQ0tJbcrXm4RVk9TYC/KktEESmmb8wm4KRC2
 5Q+Kzqhl6fJj8kJb6daXcJJWVN3kxtC01ilrJ2YNdY291tyydYlbqtFdGKm95Pl7DFCD
 JReq8ojJZ614+rghF2b9P3VoxDLbhR+IltXJEvKb9mF1iR39CNPHU4DpcJC83wLba08l
 hvuw==
X-Gm-Message-State: AOJu0YybJ1K2zkFxUWBa3s6cN3/Pk4S4+avrjVtoFFPdTuJmp9WMUwUB
 RzAN9c3JHtETnKrfk3krmeDwzcSSpQCP2Lv2x+tNBvYZrhLcpi8WcpTDirLpTEYvZFP59wIZvKz
 0ZZ/fIavNyyGf
X-Gm-Gg: ASbGnct6rJH8+MJpXogW+bN2DIA/ZO2r0fTQgpP1zbiIfL4cA88FUhQLI6N5hnZtcBb
 N4UKvugzJ92ldfxg3EIOroPBmC3NEAkxG9ztR5qBQkjoNsUpywumlP/vg4T+gjqBG7wO/Irb1Vj
 A0J9URhNjESRzIvzXyersTBh9iGqdNhpNySKRSPplR+cH3FRQDYijhZLhEZ5vcGpeRfLDkemb3C
 DGq3L88R9PVekDF0KVQ4dXhfjJojxxk52XgYPZpmLIpD3ZNVcdcvylcIJS5EQYiqwmvgmehjRS6
 WMrRl9RC4copWumH6YWnrdClI+P0iKXOtO/rxTbC+xDtZr6V42JHBLANf74bYpSKgN2c77Pp47H
 ChZpHU1KP1wgBMOhG3IBwl+YTqYlx/qroXy8cw4SGi1pV0KMPzVl10dmtYUR8HW8waXCtU0gG
X-Google-Smtp-Source: AGHT+IHEzCPS35ICbBS2cceo5VAaawbX7G3aogzHZ5gupdq9Pgl1sMbzae9Ybdjowp3m1PqoL5t9hQ==
X-Received: by 2002:a05:6512:308b:b0:55f:3525:3e52 with SMTP id
 2adb3069b0e04-56260d46872mr5310510e87.14.1757542984001; 
 Wed, 10 Sep 2025 15:23:04 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34ee88b9d9dsm113761fa.1.2025.09.10.15.23.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 15:23:02 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-55f7039a9fdso41320e87.1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 15:23:01 -0700 (PDT)
X-Received: by 2002:a05:6512:3e03:b0:55f:4e18:c583 with SMTP id
 2adb3069b0e04-56263ba3fd2mr5700088e87.56.1757542981401; Wed, 10 Sep 2025
 15:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
 <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
 <CADvTj4pVPa=j0BrhiJMoiYBmzq_uXbUtUw-xEqdNoWUCkam+VQ@mail.gmail.com>
 <CA+h8R2rhgRvEegJ4a7MZX+iKqqdswN6xRxds0rPu12eh50jvSQ@mail.gmail.com>
 <CADvTj4pzNug8M53i6c2bMcZgKc0_LXrQG22cJ4NA=OSv-qHKJA@mail.gmail.com>
In-Reply-To: <CADvTj4pzNug8M53i6c2bMcZgKc0_LXrQG22cJ4NA=OSv-qHKJA@mail.gmail.com>
Date: Wed, 10 Sep 2025 15:22:50 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qh53rU4g6_m4EAc+4qPxZZTBXu_-osrojNLMf0HR_+vQ@mail.gmail.com>
X-Gm-Features: Ac12FXwBkBcP8TXKMUeORhR5CgOYrkbgtPOIuFXhGDEqj_3eH_s4VK6YE4-lmIs
Message-ID: <CA+h8R2qh53rU4g6_m4EAc+4qPxZZTBXu_-osrojNLMf0HR_+vQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757542984; x=1758147784; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9s0GuPfbba88a9CfivvwSpPIenwvakQZWnebVZHl7U=;
 b=AOITB68uV/g2xN1sNcmPW+0jpQrWaepnL6H0EUplmR46nzeou3QqdOEGfsZysF4ecE
 TzVhmUKLzcDd1zwS/2Kh6rrEL9PhBdZe23MeknMNxx8XJczLLbRmB5xsIzDtBlTbyhGa
 2ob+Suv/A8/IXMvKVPoU+2Z7ef5boA88pUrLXRddw+/Gn+l7VlnV5F9RRmMwHpV5Orjn
 NiUDV+j3QQAiVFY8ycddNUtyZJDVJ0Q97auMU3ZRz/6C2qae2tvraH/5HCwLk+305nWm
 lHyMxVmudf14p2/xP+a9ubfWGKhqOFKnqjNYEcjl5pDju3OHlxyz39L2ItXosScvw3j7
 aGBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=AOITB68u
Subject: Re: [Buildroot] [PATCH 1/2] package/go: bump to version 1.25.1
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

SGkgSmFtZXMsCgpPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAyOjU54oCvUE0gSmFtZXMgSGlsbGlh
cmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMTAs
IDIwMjUgYXQgMzo1M+KAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUu
dXM+IHdyb3RlOgo+ID4ganVzdCBiZWNhdXNlIHRoaXMgd2F5IGlmIHdlIG5lZWQgZ28xLjI0IGZv
ciBzb21lIHJlYXNvbiwgYSB1c2VyIGNhbgo+ID4gcmV2ZXJ0IHRoZSBnbzEuMjUgY29tbWl0Lgo+
Cj4gU2VlbXMga2luZGEgcG9pbnRsZXNzIHNpbmNlIHRoZXJlIHNob3VsZG4ndCBiZSBhbnkgcmVh
c29uIHRvIHVzZSBnbzEuMjQsCj4gYnV0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciB0byBtZS4KPgo+
ID4gSWYgcG9zc2libGUgbGV0IG1lIGtub3cgd2hhdCBjb25maWcgY2hhbmdlcyB0aGVyZSB3ZXJl
Li4uIEkgY291bGQKPiA+IHJlc3RydWN0dXJlIHlvdXIgY29tbWl0IHRoaXMgd2F5IGZvciB5b3Ug
aWYgeW91IGxpa2UgYXMgd2VsbC4KPgo+IElmIHlvdSBzcXVhc2ggeW91ciAzIGNvbW1pdHMgYW5k
IGNvbXBhcmUgdGhhdCBhZ2FpbnN0IG15IHBhdGNoLCBpdAo+IHNob3VsZCBiZSBtb3JlIG9idmlv
dXMgd2hhdCBhbGwgdGhvc2UgY2hhbmdlcyBhcmUuCgpJIHNob3VsZG4ndCBoYXZlIHRvIGRvIHRo
aXMgdG8ga25vdyB3aGF0IGhhcHBlbmVkIGluIHRoZSBjb21taXQsIGl0CnNob3VsZCBiZSBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UuCgpJIGRpZCBkbyB0aGUgZGlmZiBhcyB5b3Ugc2FpZCBhbmQgdGhl
cmUgYXJlIG5vIGNvbmZpZyBjaGFuZ2VzIC8KZGlmZmVyZW5jZXMgdG8gbm90ZSBvdGhlciB0aGFu
IHRoZSB2ZXJzaW9uICMgb24gc3RhZ2U0LgoKVGhhbmtzLApDaHJpc3RpYW4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
