Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38602C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 13:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B69844F3;
	Thu,  4 Jul 2024 13:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6u_msg50UCv; Thu,  4 Jul 2024 13:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E4F844FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E4F844FA;
	Thu,  4 Jul 2024 13:30:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 572D31BF2AB
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 13:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51F6F844EB
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 13:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1lQL7THuGt3 for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 13:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2720C844E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2720C844E5
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2720C844E5
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 13:30:19 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ec5fad1984so8303471fa.0
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 06:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720099818; x=1720704618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmATh2zwXTLpv4gLlfwEfzH5Vu3Ka54GHC8RsHdBn6I=;
 b=L3pnPERuEFjO9qS6AiblfoPxrzdPElWfLwiAXSas43BYejK4bz1qfN2jw6UlZUkwQo
 wHD/xNHJ4lyllAt12CLxf68yw9y/Tz/hyq1Ne9d6Dly93ggOvoRaRdV4GNkfMkq2CRYb
 6mScehAMsC/8GKDcKm0eCszMye4+MqaQVXnTLwuB1x6yEOlr+wWmFGm6vnouyL+O7X54
 zYpjOy27pUPQAbh7H1pNNQnpz568jBXEjGIypSWCit1JOaWl7s52OHlD0FCxkQc9uvz1
 Mkwqs2txUUGK5P1R+51OPnLJstMELJV/VPOP6WVRoj7zYaIRkPzpeLwzHJhGg7pN4H3F
 E89A==
X-Gm-Message-State: AOJu0Yx/5np8nBDx+tU6djL5q1KQQpVWKmVrTmG5ogRs8r+IXtQqu7h5
 /anWh4A/3sPiBKPIeh1FM/L6qymc5bgZn/yQgzo44PVNx6hgX77oy0iWTPtsAZZ4nkX4LssxQqS
 bVS8jwF966n4yTJ9S/HYr9pILRgs=
X-Google-Smtp-Source: AGHT+IFndt6loamNQYv0tYL98yGifrDNCluK7SObrrpgXgSySY7fUVSeoNvycyyhVeVImoD2B5Ozt1HdGLn7t2sRxjc=
X-Received: by 2002:a2e:9006:0:b0:2e9:768a:12b0 with SMTP id
 38308e7fff4ca-2ee8ee13b14mr11450491fa.50.1720099817388; Thu, 04 Jul 2024
 06:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <5e6129b8-9672-efd0-32c7-18d0defcad21@gmail.com>
 <CAEyMn7bdo1UPCxy5pRi-SXsTgjy_o9wYkPZ+CgYrh7CPDgUd0w@mail.gmail.com>
 <179f54c1-ed3c-4cdb-8110-71116525a6ac@gmail.com>
 <CAEyMn7apYeyK=YuAUUSA9ANTh2nwER3x01Q89x8Op9aRxLuNQQ@mail.gmail.com>
 <CABwKrPD7uN+CDd_yYmtn58zzfCccaPz_oTCwd=8jM4n+erVRfQ@mail.gmail.com>
In-Reply-To: <CABwKrPD7uN+CDd_yYmtn58zzfCccaPz_oTCwd=8jM4n+erVRfQ@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 4 Jul 2024 15:30:05 +0200
Message-ID: <CAEyMn7ajOkPxm8pfPS5YP8jisYSfz43yfat_8asrwsgOKjsAmA@mail.gmail.com>
To: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720099818; x=1720704618; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmATh2zwXTLpv4gLlfwEfzH5Vu3Ka54GHC8RsHdBn6I=;
 b=Nw7tVKk2mnzQXcqUxPnVDIgmN7bJ+vCNTzE5tIXzw2o/PE/u5cPI0MZzoUUZMqflEl
 m8e3tNFLL2RBHGXE7zu2kSueIbeoQPDJQXK5ZP+MmrI2CVfzuTOqP0GyhW08Akj0+Sle
 RKZ3cDWeLN69bnxnfxngj8R8a+eui3enwwxyhvXRpbnytgjoJqipoHUEjHVkZIjfRl43
 osv4HTmSKfossn6bdWiVCm5m3zhaJWwEbkvueVVj0oKx27n5M+PMRLBODrsWK99WQTHA
 AGY0hIOWu+Z/3n1ij/LTIkxoI+aHEOdiWa2oqM4rL6ReXy0EKhFgjrz8gg6R4SCBhOHh
 WhEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nw7tVKk2
Subject: Re: [Buildroot] 2023.05 host ccache detects avx512 and fails to buld
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
Cc: james.hilliard1@gmail.com, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpBbSBEby4sIDQuIEp1bGkgMjAyNCB1bSAxNToyMyBVaHIgc2NocmllYiBMYW5jZSBGcmVk
cmlja3Nvbgo8bGFuY2V0aGVwYW50c0BnbWFpbC5jb20+Ogo+Cj4gR3JlYXQhIExvb2tpbmcgZm9y
d2FyZCB0byBpdCBpbiB0aGUgbmV4dCByZWxlYXNlLgoKeW91IGNvdWxkIHRlc3QgdGhlIHBhdGNo
ZXMgYW5kIGluIGNhc2UgaXQgaXMgb2sgZm9yIHlvdSBjYW4gYWRkIHRoZQoiVGVzdGVkLWJ5IiB0
YWcuCgo+Cj4gTGFuY2UKPgo+Cj4gT24gVGh1LCBKdWwgNCwgMjAyNCwgMTI6NTLigK9BTSBIZWlr
byBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIaSBMYW5jZSwK
Pj4KPj4gQW0gTWkuLCAzLiBKdWxpIDIwMjQgdW0gMTc6MDMgVWhyIHNjaHJpZWIgTGFuY2UgRnJl
ZHJpY2tzb24KPj4gPGxhbmNldGhlcGFudHNAZ21haWwuY29tPjoKPj4gPgo+PiA+IEkndmUganVz
dCBiZWVuIGNhcnJ5aW5nIHRoaXMgcGF0Y2ggdGhhdCBkaXNhYmxlZCBBVlg1MTIuICBTZWVtZWQg
bGlrZQo+PiA+IG5vdCBhIGxvdCBvZiBwZW9wbGUgd2VyZSB1c2luZyBjY2FjaGUuCj4+ID4KPj4g
PiBodHRwczovL2dpdGh1Yi5jb20vdG9tYXRvNjQvdG9tYXRvNjQvYmxvYi9tYXN0ZXIvc3JjL3Bh
dGNoZXMvMDAwMS1kaXNhYmxlLWNjYWNoZS1hdjUxMi5wYXRjaAo+Pgo+PiBHb29kIHRvIGtub3cg
dGhhdCB0aGlzIGlzIGFsc28gcG9zc2libGUuIEJ1dCBhcyB5b3UgY2FuIHNlZSBJIGJ1bXBlZAo+
PiBjY2FjaGUgYW5kIGFkZGVkIG5ldyAgc3lzdGVtIGRlcGVuZGVuY2llcyB0byBmaXggdGhpcyBp
c3N1ZS4KPj4KPj4gLS0KPj4gSGVpa28KPj4KPj4gW3NuaXBdCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
