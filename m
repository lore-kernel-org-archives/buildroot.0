Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF84CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D62580C92;
	Tue, 13 Oct 2026 08:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvuqBrPLErXR; Tue, 13 Oct 2026 08:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A71B80AEF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879687;
	b=hPmawqB5SrgcYVgtHjEzmz4Et4HhoYHJVtq6+uK+zvScXOaYpMZlCmUcwGI8zClK5cxP
	 K2yPwVvhN4B6sJr87bPldqRFhNEhwwMUXvgfT8XDmzMV8TiqxsgRF9ZXnSLesOZSvr4Cs
	 QADj2smxY1tCsvMoDxI0p/v03FiFmpHlxJVW6z915mja5gBtRPgMv/Sg3+JzuaVcNvL5H
	 sPm30kg50KF+P7QNgTALHH75JrsSXvFFAzQAeZkesdM5tssBmjf3mU7/MrOOwUZ04y6eQ
	 Jtmyb5zpiFlXOpUQGv1hazGgn81/MwWnURjDFlx+vO9RbyuynVWKg5ick9Lb5R8UxJA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879687;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xdEl8hXm+OOBa2EN2IZlrtN39JWlsAWEaUo7dZle2JI=;
	b=FZYykcN65JVDBJaSE63qxgsWiijU2mCp4+OEf0vjuzugVYridjLK0eFFSA+loKJZwQ+f
	 4c++u3Si3hARKqIjM+KFZ6SdCUWBmc2+THB2tIfiMLqPEMUiGW0Tm9JJofGnU5EAsW1qH
	 Xnf4pZs7vorByn5jSg94Akcl6EnjRHDRpkz2jgrbzZsmp8FL/nAfRehLy7wkqGF7nCJfd
	 A58y4I75l+Qg3AKJREzA7HeOzbyq8ozxN/z8r60n0VEEt03P+itZbeQTwWV0tnE+8AfSa
	 VYxQidtm/j8wnoMBoAQhlV43eRUIuVd0jVYAWuXfDUIn0PTTKWEjDEa43JjwsSBfJNA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879687;
	bh=xdEl8hXm+OOBa2EN2IZlrtN39JWlsAWEaUo7dZle2JI=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LggPAeBOqBzwbBEtJRbtf54fheOipamUFNgB1JJzrAy+txD0iy3KQPEWkwmvskz0/
	 +BQvQuh93hPPbv/p6/XaWsXnnUCi9tS8gSQo/3JUTix3W0wXRLn2vO5cFrB1CXpxBO
	 sE6iZcY0zbm927wiJK2avPrAvndD8unoVArZYDv00z8MxcKiZiK9EPjpTk9quKFi2A
	 Qxq7SgWRPbGGpP8Ozmk4WQ62O71kVYIJ5tMBN/ymwqKrzQsff2y0xFY1Yv0PTeiVNZ
	 tEsju3c8c73QVWKDXynFaGvB0cYcuXUGvrpEzF5SdlaQvbXgUYSJCw7b9koDkmmU/X
	 zwiZYyFQWQXjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A71B80AEF;
	Tue, 13 Oct 2026 08:21:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C29DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC1D4051F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQ6hxA7pTCCB for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:21:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED6A4404E9
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791879684;
 b=RHTBz0NyNw2pB9jgmwMXD2NDBFS+FU2z+DjsY8kGG12W+AEZik26tNa4/HpZ9A2WlLuI
 Im8L38Oge8Cl2D7cPNRYbjEX91a49NZ8yv0CmvNsA2C9vtVPMUIh6MMnUzcC1dZSpx34t
 0MaTTiCFEFZnWd7d14RxB7tkD4I/hqcQxUUARuyhdpb3XdUpjn4GXetaqmJkZXOw3s+WS
 D9Jf1fJ7dO8M9Q8LTRw08CBNumNBkzKOSvXPVZlvvXhgx0srdbVjxxiNyWOZCUHMUNney
 EGBOPa01WW6ckQxl9FYru0waYKAkBnDgmWg/cEfLSqgViWo6tAP2ZyRDAkPusB1UZrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879684;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=9+sVwrF9TvjMi8gkSAqhKc/Fp1X93+cpni+PrHHX6JI=;
 b=gztRgz/QcSa7aRxz3E7wjhLO9gXbCv+DOCeCCFTLYrbmpfEauCi8Gdtbg0sr0iSh7RKc
 s7stRohe9LVye3CpVL1rJYThA0OgrnFzH5QHhMk4GZoGlXWQWBiWceT2qiNFgctO8YGN9
 JRao8NrQAzNJVoHJoLFd4zzFPdnEo0FltlCtkPXGQGP4QhrUfzePQAK5iVPqOGXcLZHAm
 RGJ92vtYksUa40G2Ay9o9xnLon65QlJgpzd0+QB6NTp0ooDOMQ/D6NtfVAN3m8OfA2Kqh
 IYyprOIuE7/btxjx5v5f68knRXPjR0geEEV9G0EyLt4QltZTYBD4dS1I7tdmGUriVPg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=kCnVxbM+; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::532"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED6A4404E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:23 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso3098329a12.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 01:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791879681; cv=none;
 d=google.com; s=arc-20260327;
 b=HQ1bCQC0jzq7MUpe/690H/3hOJRF0MWbivuq8Qoboz/E648A2FmcSPcmF0VA1Yz4W6
 nXulPLL8jTqVe8NhQEXCeYOAQdxOIFdvxA27aiIvA7a0dAZma3DsXLLISTygI7xOPiPH
 i+IFrH1lQWEME5EGHbYZBcrkIAKHEXKkhzFEzzWkhM9GIS5F+ss61PYDZUdH0sRIRAEm
 cdZ2R1tZFRZWnZ6oe8jMbZ7GHSvvyNsss3+2loWwaa25dVn9TA/hhFLQPXlzAB01fT7M
 4uS9SNR6AzZG3jyOmKtcWv2ZFLoutLPAH/myZRVLdneAZ6oKYW07Elbkj/Bn3tda11mr
 e2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9+sVwrF9TvjMi8gkSAqhKc/Fp1X93+cpni+PrHHX6JI=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=TRTXt6HjFb/BhW8h7Xjuj8NPe3CRY/j34lEGs324f5j8xVYHJPEkjpB5kTNW1t1jHp
 rrwTZgGODlx75t/8qp4yFd4jFd5PXvuknUaSdgs+hsrH7wzQ19CJVYegLm462GSYU0Q/
 579gdWJpwzdW1Mf1Qp7e95H9wWdrFE4/MUUNtEyanh3ikrW9KBS8aSw2YIUKrHSN80An
 ulgkj8N1a6wKGzKCG1DfohMd1y+vALUGBvA0LzpIThonl4aPywQwed1ymUcptL5eTwLB
 nQHZqsrKhMKW37QjgVAYAemGeDenyMrXTAt/+lw2Zn3jSutiWgdFsIxAjUbPN7V1Dr3K
 QP0A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791879681; x=1792484481;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9+sVwrF9TvjMi8gkSAqhKc/Fp1X93+cpni+PrHHX6JI=;
 b=dawQ0O7geZiAUEyYSj4X040JS2BGAggY4R1Byi5pC95FsykoQgNw9Y5g5du6NI9GsC
 BW003aWxBYc9AI1foUfMvalzgW5jAm+LZJmMtmTwPGMMNSYCrBgU+kpinVEIN2Hzcj4C
 V200LQdSAyKSrLVPGpgFUYcuHLlJA16fBlfKc602WP4Z4hwlzFCV9Oz5EmrgrMvFNlLF
 KrDiUK2FsDP9CuFVXyKlr/wHmU1VMaFu8CsL9M/YhwS8l9IoLQUDTSj9dZYm750y55vT
 YLiew7eUXRwVeAwbp14drWImEXDRPYh56ZrOldke98sPGBCd18xiMu421pUia7v/j/Ji
 Myyw==
X-Gm-Message-State: AFq9FYIupZH3lHZp9HhjH/8jgEcKHxYOp1lBeJjnaVRNwce+vUpu+dko
 EZ6VaYrv7MgiHH5vYHheIs5wXrzj4UzAPZE507NlUztZ8J/fSA6dPaaWXjaWLzl6ka4GsBv/eRN
 4QNTfF8OB7q2SOjtQNAWZGwXAqZYKG1nEFfCQ
X-Gm-Gg: AYBFou0Ht8drLf4zdztdaU1W5JhTzqcSXjVeIcXtcXkMn8o4bZycz29//jtydsNnsaX
 xMFJBWzmKUMOA7lDdnAEO6LEgDDZpmz5XW3gEhY8O3xpViMX8AUhd3uEu9hxg/4+PAxTpgxXyol
 w/mFLVsIoB7WOHhR9ua3507eHMxB83LJP2gZiBai1H31yUFO3AUPCxnAEN9FGS/nBEojkUXuLm3
 DPDaOhLAc4YmV6epRxD7oGevafj/AwrOnATOY0uO5mk7/HMOu1sAH3S68Wp/aT73fMtFUbgl8dj
 tW70v4ApWtxm4EeY80qtGVpex6lnA7BoD/HtDWklijloKRjp0zXbtBUl
X-Received: by 2002:a05:6402:1f85:b0:6aa:e589:87df with SMTP id
 4fb4d7f45d1cf-6b17c2d4df1mr9333764a12.30.1791879681120; Tue, 13 Oct 2026
 01:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261013081319.1ADCF95484@busybox.osuosl.org>
In-Reply-To: <20261013081319.1ADCF95484@busybox.osuosl.org>
Date: Tue, 13 Oct 2026 10:21:48 +0200
X-Gm-Features: AclHuK-uQYlm_ld6B9Ff2Q3NSWSwbPZrA6qIBoaO82YKB8qncul5JLYkLNu61Lg
Message-ID: <CAGm1_ksgTJ+hUFmb2QtM7zFT2ZTgCVjOfXf8FUiwmQHKtTTjoA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [git commit] package/uclibc: add missing sys/auxv.h
 for static builds
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2FsZGVtYXIsIFRob21hcywKCk9uIFR1ZSwgT2N0IDEzLCAyMDI2IGF0IDEwOjE04oCvQU0gVGhv
bWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3Jv
dGU6Cj4KPiBjb21taXQ6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2NvbW1pdC80NzFmZWFjYjJkOWMxMzE5MGQ2MzU3MjEyMDhiOWQzMWU5OTVkMDRlCj4gYnJh
bmNoOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS90cmVlL21h
c3Rlcgo+Cj4gZ2V0YXV4dmFsKCkgd29ya3MgZmluZSBmb3Igc3RhdGljIGJ1aWxkcy4gVGhpcyB3
YXMgYWxyZWFkeSBmaXhlZAo+IGEgd2hpbGUgYWdvLCBzZWUgdGhlIGNvbW1pdCBtZXNzYWdlIG9m
IHRoZSBwYXRjaCBmb3IgbW9yZSBkZXRhaWxzLgoKRG9lcyB0aGlzIG1lYW4gd2Ugbm8gbG9uZ2Vy
IG5lZWQgdGhpcyBmaXg/CgpodHRwczovL2dpdGh1Yi5jb20vTWJlZC1UTFMvVEYtUFNBLUNyeXB0
by9wdWxsLzkzOAoKUmVnYXJkcywKWWVnb3IKCj4gRml4ZXM6Cj4gIC0gaHR0cHM6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2YwMy9mMDMzODBlZjQ4Y2VhMjMyZTQ5NTgwODRlYWU0
MTlkNTUxNmY0ZWY0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9w
ZW5hZGsub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIC4uLm5zdGFsbC1zeXMtYXV4di5oLWZvci1zdGF0
aWMtYnVpbGRzLWFnYWluLnBhdGNoIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWNs
aWJjLzAwMDYtYnVpbGRzeXMtaW5zdGFsbC1zeXMtYXV4di5oLWZvci1zdGF0aWMtYnVpbGRzLWFn
YWluLnBhdGNoIGIvcGFja2FnZS91Y2xpYmMvMDAwNi1idWlsZHN5cy1pbnN0YWxsLXN5cy1hdXh2
LmgtZm9yLXN0YXRpYy1idWlsZHMtYWdhaW4ucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLjc0ZDE0YjU1MDEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFj
a2FnZS91Y2xpYmMvMDAwNi1idWlsZHN5cy1pbnN0YWxsLXN5cy1hdXh2LmgtZm9yLXN0YXRpYy1i
dWlsZHMtYWdhaW4ucGF0Y2gKPiBAQCAtMCwwICsxLDU3IEBACj4gK0Zyb20gNmRjOWYwNmEwMzMw
ZjExMTcxZjc2ZjRiODMxNzI0YzAyNjQyZjExZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAr
RnJvbTogcmFtaW4gPGxvcmRyYXNtdXNAZ21haWwuY29tPgo+ICtEYXRlOiBNb24sIDEyIE9jdCAy
MDI2IDE2OjMwOjU2ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gYnVpbGRzeXM6IGluc3RhbGwg
c3lzL2F1eHYuaCBmb3Igc3RhdGljIGJ1aWxkcyBhZ2Fpbgo+ICsKPiArZ2V0YXV4dmFsKCkgaGFz
IG5vdCBuZWVkZWQgbGQuc28gc2luY2UgMjI3YjdjODI1IGFuZCA3MzdhMGVkZjQgKCJNYWtlCj4g
K2dldGF1eHZhbCB3b3JrIHdpdGggc3RhdGljIGxpbmtpbmciLCAiU3VwcG9ydCBub24tY2FjaGVk
IGVudHJpZXMgaW4KPiArZ2V0YXV4dmFsIiwgdjEuMC41Mik6IF9kbF9hdXh2dCBhbmQgX2RsX2F1
eHZfc3RhcnQgYXJlIGRlZmluZWQgaW4KPiArbGliYy9taXNjL2VsZi9kbC1zdXBwb3J0LmMgZm9y
IHRoZSBzdGF0aWMgbGliYywgYW5kIF9fdUNsaWJjX21haW4gY2FsbHMKPiArX2RsX2F1eF9pbml0
KCkgb24gdGhhdCBwYXRoIHRvby4gIFRoZSBzdGF0aWMgbGliYy5hIGNhcnJpZXMgZ2V0YXV4dmFs
LAo+ICtfX2dldGF1eHZhbCwgX2RsX2F1eF9pbml0LCBfZGxfYXV4dnQgYW5kIF9kbF9hdXh2X3N0
YXJ0Lgo+ICsKPiArSXRzIGhlYWRlciBpcyBzdGlsbCB3aXRoaGVsZCwgdGhvdWdoLiAgZGY4MWJk
MWUyICgiZ2V0YXV4dmFsOiByZW1vdmUKPiAraGVhZGVyIGZvciBzdGF0aWMgYnVpbGRzIikgcHV0
IHN5cy9hdXh2LmggbmV4dCB0byBkbGZjbi5oIGluIHRoZQo+ICtIRUFERVJTX1JNIGxpbmUgdGhh
dCBhcHBsaWVzIHdoZW4gSEFWRV9TSEFSRUQgaXMgdW5zZXQsIGFzIGEgd2F5IGFyb3VuZAo+ICt0
aGUgbGluayBlcnJvciBvZiB0aGUgZGF5IC0tIGEgcGFja2FnZSB0aGF0IHByb2JlZCBmb3IgZ2V0
YXV4dmFsIHdvdWxkCj4gK25vdCBmaW5kIGEgZGVjbGFyYXRpb24gYW5kIHdvdWxkIHRha2UgaXRz
IGZhbGxiYWNrIHBhdGguICBUaGF0IGVycm9yIGlzCj4gK2dvbmUgYW5kIHRoZSB3b3JrYXJvdW5k
IG91dGxpdmVkIGl0OiBhIHN0YXRpYyBzeXNyb290IGluc3RhbGxzIDcwIG9mIHRoZQo+ICs3MSBo
ZWFkZXJzIGluIGluY2x1ZGUvc3lzLCBhbmQgdGhlIG9uZSBtaXNzaW5nIGlzIGF1eHYuaC4KPiAr
Cj4gK1NvIGEgc3RhdGljIGNvbmZpZ3VyYXRpb24gb2YsIHNheSwgb3BlbnNzbCBmYWlscyB3aXRo
ICJzeXMvYXV4di5oOiBObwo+ICtzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Iiwgd2hpY2ggcmVhZHMg
bGlrZSBhIG1pc3NpbmcgZmVhdHVyZSByYXRoZXIgdGhhbgo+ICthIHdpdGhoZWxkIGRlY2xhcmF0
aW9uLgo+ICsKPiArTWVhc3VyZWQgb24gcmlzY3Y2NCB3aXRoIGEgc3RhdGljIGNvbmZpZ3VyYXRp
b24gYW5kIGdjYyAxMC41LjA6IHdpdGggdGhlCj4gK2hlYWRlciBpbnN0YWxsZWQsIGEKPiArc3Rh
dGljYWxseSBsaW5rZWQgcHJvZ3JhbSBhbnN3ZXJzIEFUX1BBR0VTWiBhcyA0MDk2LCBtYXRjaGlu
Zwo+ICtzeXNjb25mKF9TQ19QQUdFU0laRSksIHJldHVybnMgZXZlcnkgZW50cnkgb2YgL3Byb2Mv
c2VsZi9hdXh2IHVuY2hhbmdlZCwKPiArYW5kIHJlcG9ydHMgRU5PRU5UIGZvciBhIHR5cGUgdGhh
dCB3YXMgbm90IHBhc3NlZCAtLSBib3RoIGZvciBhIHR5cGUKPiAraW5zaWRlIHRoZSBjYWNoZWQg
cmFuZ2UgYW5kIGZvciBvbmUgYWJvdmUgaXQsIHdoaWNoIHRha2VzIHRoZSBzZWFyY2gKPiArb3Zl
ciB0aGUgd2hvbGUgdmVjdG9yLgo+ICsKPiArZGxmY24uaCBhbmQgYml0cy9kbGZjbi5oIHN0YXkg
cmVtb3ZlZC4KPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dvZ3Mud2FsZGVtYXItYnJvZGtvcmIu
ZGUvb3NzL3VjbGliYy1uZy9jb21taXQvNmRjOWYwNmEwMzMwZjExMTcxZjc2ZjRiODMxNzI0YzAy
NjQyZjExZgo+ICtTaWduZWQtb2ZmLWJ5OiBSYW1pbiBNb3Vzc2F2aSA8bG9yZHJhc211c0BnbWFp
bC5jb20+Cj4gK1NpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5v
cmc+Cj4gKy0tLQo+ICsgTWFrZWZpbGUuaW4gfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4gK2RpZmYgLS1naXQgYS9NYWtlZmlsZS5p
biBiL01ha2VmaWxlLmluCj4gK2luZGV4IDNiMjhmYmY2MC4uNzI4NjU4NjNkIDEwMDY0NAo+ICst
LS0gYS9NYWtlZmlsZS5pbgo+ICsrKysgYi9NYWtlZmlsZS5pbgo+ICtAQCAtMjU3LDcgKzI1Nyw3
IEBAIEhFQURFUlNfUk0tIDo9IFwKPiArIGlmZXEgKCQoVUNMSUJDX1NUUklDVF9IRUFERVJTKSx5
KQo+ICsgSEVBREVSU19STS0gKz0gc2d0dHkuaAo+ICsgZW5kaWYKPiArLUhFQURFUlNfUk0tJChI
QVZFX1NIQVJFRCkgICAgICAgICAgICAgICAgICAgICs9IGRsZmNuLmggYml0cy9kbGZjbi5oIHN5
cy9hdXh2LmgKPiArK0hFQURFUlNfUk0tJChIQVZFX1NIQVJFRCkgICAgICAgICAgICAgICAgICAg
ICs9IGRsZmNuLmggYml0cy9kbGZjbi5oCj4gKyBIRUFERVJTX1JNLSQoUFRIUkVBRFNfREVCVUdf
U1VQUE9SVCkgICAgICAgICArPSB0aHJlYWRfZGIuaAo+ICsgSEVBREVSU19STS0kKFVDTElCQ19I
QVNfQVJHUCkgICAgICAgICAgICAgICAgKz0gYXJncC5oCj4gKyBIRUFERVJTX1JNLSQoVUNMSUJD
X0hBU19CU0RfRVJSKSAgICAgICAgICAgICArPSBlcnIuaAo+ICstLQo+ICsyLjQ3LjMKPiArCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
