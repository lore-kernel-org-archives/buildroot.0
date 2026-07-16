Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CECDC44514
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 19:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9BE810B0;
	Thu, 16 Jul 2026 19:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdgC44sGU0lZ; Thu, 16 Jul 2026 19:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 784D4810D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784230238;
	bh=oYuVS21YKPKb+wQbsEPBocBA+P4Kmo0VCSiE2Y9jhLA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnnPuis9/zkH9Xd512js9IgEC0xO0oc3V0F3sCzhyZxZMwHjayZb4yLjZW8B6uqb9
	 pl+MtYXL4geN/vrDdDumzLaRScKykaAKjZ4oNW+20QBT3GuR34toz/kNjsuNwT8s8I
	 2hrXXnXEGDKnQ/MGdPgatBqDcx7VhlPSNR14rdpp3ThePFg0XEr+a1HxUL/LJPnFsQ
	 373AkBhazQZw1C0vpLc8io+4UNp8+C3ueksKB1Fl9FDz6bXP2Md3Bnj034kTajO3YN
	 ZSm4tp9PJXqQfMEKH88UsLtBljUbDW0JRWOJDgtlN5xwMpVy7Tz2nj7Hat1bvYzb/p
	 /r+0B0EMmvvgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 784D4810D5;
	Thu, 16 Jul 2026 19:30:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CB736E
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 19:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E03BF40A04
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 19:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0SbgGFsfkQ7 for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 19:30:35 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFBE840A02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFBE840A02
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFBE840A02
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 19:30:32 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2cace91f112so69625555ad.0
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 12:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784230232; cv=none;
 d=google.com; s=arc-20260327;
 b=TWVL7r1W8KGQoDr0JmsXxmglv2v0fjmFvX3mHgMSUq9vG9F1vmg85Jg67cSfQVS1Fa
 aJqGx88VC4Dv125prj3L77dPcgVbpp+ln4/2MWhxPrEQT2jwpGHQM59/Go3YPSEmGE/t
 rI4n/glAaHryTKtbB4HTujDyoWLzeGFXwIrY8wAdxG0IzTfmRhFWCqQLZU9gEsIT2aY7
 R2ZeMI1y0ab7aZqVcbPgW9m3lsNYGEDuIbvSwxekY9wUS81Ze2Ev2rTVKIJttHe6HsWa
 b4GN0XgczUKDD8M2Ck7Y9KUbtJP+ywmrE7Gs+vKr58622wynSQ2xeDaEDzHvxGF2ZqvL
 rajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DUfWxWsVokhPxJw0uz0x6ZG6kqAvXDy13beElA8e4Nk=;
 fh=GJIYKAxGu+j1ubKhbaDgs0nkVYK43SKlCYTnngGfoDs=;
 b=Sju0enMSe3795CXxcjZSgEKsO9iUBUSumziffxDhNSFjM/vTLT10K021bmn/wqv7dv
 nLyKE3R6/tHCZAig8qpFhNCr2HzDjdRVbgC5eDIVr1JDfta/fOTgoSZH1LDvuWh1jQ4e
 IVMRraR18tQRCYNp098uzy5vGCxdfJam62Xe9qzo6Wd8Ua3giGak8QKCIKv+UTsOv40t
 B2/Q/sUGft7mtLXUf13CFqQCrjCdWWJ/KOJcdFHszHpmDXp1JchKl0sSEpQ2TKoODKNc
 gzAsxMrgc87kNWuB0lZ7H3nGI3SbAZxZPEa9PcFjl5MGZLAoYg0CoOMs+ccod0wOMEUR
 JkmQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784230232; x=1784835032;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DUfWxWsVokhPxJw0uz0x6ZG6kqAvXDy13beElA8e4Nk=;
 b=TtFB9Ap7zdBGHCOuUpXP6cESPsw7YD8j3o35Qtwd3/exQFFwRuv/eOWWO2Fij339B6
 v8ciyZyp2esVemgip571H//ee6pp1o16ZqWnHNdNZ5OX0fYam96Jxi8tv3dP0WEE9O+Z
 uBmEtotQ+JdZkmsqa3Jxld0FGaYrNQ5VmTCBVeIrn3BvzERWFGNdfV/G9zuHfxeDQCoA
 MOcpx4kmmkUDxBrqrwrlyy3L0BNlZEhsINP1ba1XKtHMEtRyeLTR4ExXwQyzCfAHudXX
 7uN04CYNMD2suZsCmOJyTq0ICeGjF8RXaYkZ/Vh7L7FPKoFIYbVgKa0ikVVpBpMu/dUl
 qmMg==
X-Gm-Message-State: AOJu0Yx754xmP5gwptSk3qFxYtGnh4B+v8vm0hxe2pEhGWP/HQycl/aD
 Q7hTlazNtbt31V4cognZMqXitXlt9MktWPzsCetUY4yA3EGBmFI/6bWMmGDarRgXaHrLj8q2xPV
 jrcuOoT5xleIkdLL9GsXdCDyEKRJjL/c6N49QYHE/4A==
X-Gm-Gg: AfdE7cnVo3D6hX5K+gSTRiBI3uozDufIE6VCoHwD2oZQ9YVvcAQadCVdevm1yjvFdg4
 X8eyiMCOuLwHh/rVCGyX5YQae3u/I4qy8mpEuQgZ0SbHGJRzqaGB+fC2lMxaNfx0/t/+NmtEdAX
 pGu9QMECX4vR78EoDTY+HfpmkD0kVP8x1lXqDPfNwLpx/jbKOTLqJDoJWXRDYb4D4568uXqkE0K
 BcZDPavJhCAkbSNJgHlmfkcKN9cwa9gyBllHwkYwr7tRVlvkm3Ok9MFovoJLRcvJP15eSeiGbd3
 VStLIzRWWNE5UgfIsWEcAflmus5ui9kseBW75+NdI+Tgg8jqBa1Mvx7jo/o=
X-Received: by 2002:a05:6a21:d82:b0:3c0:9c19:659d with SMTP id
 adf61e73a8af0-3c36c42555amr8789916637.69.1784230232180; Thu, 16 Jul 2026
 12:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260716133041.2147516-1-aford173@gmail.com>
In-Reply-To: <20260716133041.2147516-1-aford173@gmail.com>
From: John Ernberg <j@j-ernberg.se>
Date: Thu, 16 Jul 2026 21:30:18 +0200
X-Gm-Features: AUfX_mzKZ7_Q8IrEwySbHmt3AKaOhzBViOaOsd-O2NbO-88ifU3Ec8xlS6PUpys
Message-ID: <CAAHg4ZhET0CSdHDtkmE-sYPcvGtnx2sxs2Bmtc6bmEchrzY4yA@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1784230232; x=1784835032;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DUfWxWsVokhPxJw0uz0x6ZG6kqAvXDy13beElA8e4Nk=;
 b=Vbei6xtR10ifborJuiIo17UOqd4ODRAdEI995VWMBZDaxeEwxdzNHg1sJvRR8N2OlV
 cvDnZtyduKg+x5qPHWIRb2lKoc7FftGze0oLUoueXsZab9fo00T4ZYqdoR7CvnfgIKBV
 vathL8r7Nwj4H+moco0tBfqrjSno0SQkKdPRlnbhDCkg5iIC1hkhaYhFswoYGY7u5qGG
 ZkZV6AO4x5AwYAeOd8MQlbRdVPeYotOYfnE2xa3PBSusbkcf59a3YM2yz9J8REj+yZDE
 J/bA8sRW6wuN9wbE7nYoQ9E6DpLcB0rfvF16dTuUdQOv2Y0/U/QhfXjJn5TODw7uha+a
 seZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=Vbei6xtR
Subject: Re: [Buildroot] [PATCH] package/x11r7/xwayland: add mesa3d ordering
 dependency
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

SGkgQWRhbSwKCk9uIFRodSwgSnVsIDE2LCAyMDI2IGF0IDM6MzDigK9QTSBBZGFtIEZvcmQgPGFm
b3JkMTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBYd2F5bGFuZCdzIGdsYW1vci9EUkkgY29uZmln
dXJlIGNoZWNrIGxvb2tzIGZvciBNZXNhJ3MgZHJpLnBjIGluIHN0YWdpbmcuCj4gV2l0aG91dCBh
biBleHBsaWNpdCBvcmRlcmluZyBkZXBlbmRlbmN5LCBhIGhpZ2hseSBwYXJhbGxlbCBidWlsZCBj
YW4gcnVuCj4gWHdheWxhbmQncyBjb25maWd1cmUgYmVmb3JlIG1lc2EzZCBpcyBpbnN0YWxsZWQs
IGZhaWxpbmcgd2l0aDoKPgo+ICAgICBFUlJPUjogRGVwZW5kZW5jeSAiZHJpIiBub3QgZm91bmQK
Pgo+IEFkZCBtZXNhM2QgdG8gWFdBWUxBTkRfREVQRU5ERU5DSUVTIHdoZW4gaXQgaXMgZW5hYmxl
ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgo+Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UveDExcjcveHdheWxhbmQveHdheWxhbmQubWsgYi9wYWNrYWdl
L3gxMXI3L3h3YXlsYW5kL3h3YXlsYW5kLm1rCj4gaW5kZXggMmI4NTEzNjAyYy4uYmNlOWE1NzJh
YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3gxMXI3L3h3YXlsYW5kL3h3YXlsYW5kLm1rCj4gKysr
IGIvcGFja2FnZS94MTFyNy94d2F5bGFuZC94d2F5bGFuZC5tawo+IEBAIC0zMCw2ICszMCwxNCBA
QCBYV0FZTEFORF9DT05GX09QVFMgPSBcCj4gICAgICAgICAtRGR0cmFjZT1mYWxzZSBcCj4gICAg
ICAgICAtRGRvY3M9ZmFsc2UKPgo+ICsjIFh3YXlsYW5kJ3MgZ2xhbW9yL0RSSSBjb25maWd1cmUg
Y2hlY2sgbmVlZHMgTWVzYSdzIGRyaS5wYyBpbiBzdGFnaW5nLgo+ICsjIFdpdGhvdXQgYW4gZXhw
bGljaXQgb3JkZXJpbmcgZGVwZW5kZW5jeSwgYSBoaWdobHkgcGFyYWxsZWwgYnVpbGQgY2FuIHJ1
bgo+ICsjIFh3YXlsYW5kJ3MgY29uZmlndXJlIGJlZm9yZSBtZXNhM2QgaXMgaW5zdGFsbGVkLCBm
YWlsaW5nIHdpdGg6Cj4gKyMgICBFUlJPUjogRGVwZW5kZW5jeSAiZHJpIiBub3QgZm91bmQKPiAr
aWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0QpLHkpCj4gK1hXQVlMQU5EX0RFUEVOREVOQ0lFUyAr
PSBtZXNhM2QKPiArZW5kaWYKCkkgZm91bmQgdGhpcyBwcm9ibGVtIGFzIHdlbGwgYnV0IGhhdmVu
J3Qgc3VjY2VlZGVkIG1ha2luZyBhIHZhbGlkCnBhdGNoIGZvciBpdCB5ZXQuCnh3YXlsYW5kIG9u
bHkgbmVlZHMgZHJpIHdoZW4gZ2x4PXRydWUuClNob3VsZCB0aGUgY2hlY2sgYmUgY2xvc2VyIHRv
IHRoZXJlIHRvIG1ha2UgaXQgY2xlYXJlciB0aGF0IHRoZXkgYXJlCmNvbm5lY3RlZD8gTWF5YmUg
ZXZlbiBpbnNpZGUgdGhlIEhBU19HTCBjaGVjaz8KCkhvd2V2ZXIsIEkgY2FuJ3Qgc2VlbSB0byBm
aW5kIGFueSBvdGhlciBvZiB0aGUgSEFTX0xJQkdMIHByb3ZpZGVycwp0aGF0IHByb2R1Y2UgYSBk
cmkucGMsIHN1Y2ggYXMgbGliZ2x2bmQsIHdoaWNoIGNvbmZsaWN0cyB3aXRoIG1lc2EzZApsaWJn
bCBwcm92aXNpb25zLiAoSSB3YXNuJ3QgYWJsZSB0byBidWlsZCBudmlkaWEtZHJpdmVyIGxhc3Qg
SSB0cmllZCwKc28gSSBkb24ndCBrbm93IGlmIHRoZXkgaGF2ZSBhIGRyaS5wYykKClNob3VsZCBt
ZXNhM2QgYWx3YXlzIGJlIHNlbGVjdGVkIGJ5IHh3YXlsYW5kPwoKVGhhbmtzISAvLyBKb2huIEVy
bmJlcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
