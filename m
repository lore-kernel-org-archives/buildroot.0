Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEE1CD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABDBC61005;
	Thu, 14 May 2026 19:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7xz66DJZTF9; Thu, 14 May 2026 19:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD26C60FF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778787574;
	bh=Ee5LX9NBopUvt7vT60h6TmwsXUmYqs/HqVIqkGJyB8o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UIhz7w3wHiYNj/YGmDJJTiTuI6vJLszPtFgpTBBb1Z9uPQX3lwNmDMTjdYyrhyqYU
	 HE64c59H1mgWDZ6RXA57kiU8Nj8CEduS5zxRWQsVrSfLe9B/oeAOIQ8fOa573G25MI
	 EwWRZB26bHAxemi2/mlf/WUoNz1fa1DxUp5P1qZlyd6Fcbv1lmizxqamC6ZY4Wndlw
	 D0n+XuwpUPvOpr/8DCTfi2fgsVNvGldNmqga97MyEO9BJ70WhUSXSPGhIMfxaaHLBU
	 Xeb5I1vQ4gR4ahi/qlug285IDGBbmiSW/VNVSvnlaApVrAd5asqh1Qe8HJhIg1/Cza
	 lJrdlzUWELQIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD26C60FF5;
	Thu, 14 May 2026 19:39:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A4E37F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD0DD40FC6
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T15zX0xGoS6N for <buildroot@buildroot.org>;
 Thu, 14 May 2026 19:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16D5540620
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D5540620
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16D5540620
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:39:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-44e5624c053so4699048f8f.2
 for <buildroot@buildroot.org>; Thu, 14 May 2026 12:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778787565; cv=none;
 d=google.com; s=arc-20240605;
 b=KYakfMKiW8/mrMkwe2Zx+U4Cv1M4/fRiWP44yUKBWV3F1B7hlrnQp3X1nATpQ4jya1
 AFkK0tz1ohKXc8vSv9ZxRzJ2Bs4FU6gZBHCVBm+EDVuh8Y4Yh/TnO9pRRRZzoxJwvInZ
 2+5cYmkFeq/rWSaoZiGEl76re/dgIn8Z09o8NexcaMn2hLv6HbnW1DMiIrizzU8xzEmX
 XcjOTd44cvm2mopcOF6bj8NVwjRD0Isfuo9rOYqtrX59XKqJrt2lTc/xRQHnXcspaT7l
 MoZp5Xks0rfa24FbZTNf7vGzYzRaOFa+vUypCoqsIk7o1ecStfymarQVxuCNv5vA75GY
 0d7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ufJWtiZgTu8r43eXHwPyzzaQj3GhE4AIyYsjwI91TY8=;
 fh=vqI4HZAeDLA61/B+Lw/9MOP6+wMkwdbrtiLhDiBqY2w=;
 b=iqKcWrQWQK6hmhvkevmvZp/4wfo1oiIvTCKTisjoVUtiqThlDyUDFrA8z+VuWq990d
 PZ3JRTaHZ7V5GR91nIq+3S1ydoBLt9wCxE7XOtUf1q9O6i3uTP0zP6xz6V5yOveWBWeV
 2X2+jaIJ6EJ1lDGTgxSuoCxYs7BRyMlcgAlJ1oJZZBv3z33rxzpjIZBBgAJDUYRTlHrl
 +lMPQuvCsXaklHMMNgfyl7ItTWOAzQRscmUevQ0k7M090XfJ8Y+8B+z78NrFb75vu4tD
 cVTc0l0YSU1q7oXE9m68eljmuQiB2j5JqELXA5DhoaEWSMoRNcUyNpuhQVTKRPmJW0sM
 a4PA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778787565; x=1779392365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ufJWtiZgTu8r43eXHwPyzzaQj3GhE4AIyYsjwI91TY8=;
 b=TwG7Sz7mvGcpeZuo8E3JV517f3ek4grzAb8iw5QS4NaAwPV+ciCxMZpOjwCqkls6bv
 IQyoIjM/9yy8RpQB+JN+5/6BupRPlkySTSCY4BBLzVpt8MqYlZRkZqVwR8qAUE1tiCCb
 lgk33pMc+g97dTKVXDpJl8tL2azJx1P4xwUAVVYRBdHsneDHdQC7wZRxSBktsjXbjlWo
 g9ioVtwxgFPKSe9vt+rotupWnvQKdfQosTMSGE2cfdibUKY9+aOHy6ngO/GwLw+oLeiy
 w1L1TvEQCAW8qDmJ0h/lmXxeO0QWPglwErhxGdVEwJe0vRL9ZroUgFOLLQi8IapSoYQi
 kD+w==
X-Gm-Message-State: AOJu0Yzbeap0+q3TJKGcp08DwKPVdURXlhVmnGWPBlRXPciWHZAH7V0K
 d7iBWxFGi1ZFgdDo03G/EvYzcVo918UPuzr2Sjzc27JAKYDjaJt0oQ/tLCYfiDIsZEHvk183T+t
 GuGlSALwMIwzVJfqPEyUOysq6jOrR2wI=
X-Gm-Gg: Acq92OE9en2UbRS+Aia9D6SKC7q70YTm2JkuWrPixP21dPw/KDl9N4tQityIbzFCp6p
 wcTQrNh/wnEIF5eYGMA3V9M5jHTuYk8WfdYhyWOXRU28Dtj0yUerf4VcHFy2WkmtfCk0xEQ1IR3
 ZG0nL6LPZ2tThQm7Qii5yA1T9ucfrjYaX61jyuHKvNPCNqWPeNI4JWjiFq7FPOe1WIWPDhtHPth
 faMUlADOx9Yv2XIHJti4Le6p9K7xbZpSxpN5siT8FJPK30KZLNXzBMWUWLRqwAzrYPSl7oAxv/w
 ZP/9H6IIMH+peug=
X-Received: by 2002:a05:6000:4210:b0:43b:4f86:e985 with SMTP id
 ffacd0b85a97d-45e5c5dd47amr562950f8f.33.1778787564990; Thu, 14 May 2026
 12:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-5-1806e588eb59@gmail.com>
 <5bd5971c-17c5-4ebb-85d3-3944efb39a7c@smile.fr>
 <CAMWSM7gneUcaExHXk5=O0TwwUUXGpX=c_jdFNB_=TNS5UMJU+g@mail.gmail.com>
 <8635728b-ccae-4c74-ac6c-eda4f18ff78a@smile.fr>
 <CAMWSM7ihij6ZsYNv9j9tUyyfGS__MgdASGezGV+PPk==XxvTbQ@mail.gmail.com>
 <29a0b09d-7bd7-4251-9ec0-72b4e5f64114@smile.fr>
 <CAMWSM7gYXEMM7zdRT7FOGxofJKHAwKiV-U04Ehg+cUfh1mG0-w@mail.gmail.com>
 <165c3036-9adb-48c1-886f-47baba59a753@smile.fr>
In-Reply-To: <165c3036-9adb-48c1-886f-47baba59a753@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 14 May 2026 12:38:45 -0700
X-Gm-Features: AVHnY4KH__0WffqlAiRFXrsc6dCQk0QqjsnM0VcmQg5NyPZxhAZEpc5psXFZTxk
Message-ID: <CAMWSM7iPt5AHG10_Q9C4vSqYECw0q1PQkQYhMkS8uZ2qsaDFDA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778787565; x=1779392365; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufJWtiZgTu8r43eXHwPyzzaQj3GhE4AIyYsjwI91TY8=;
 b=MpVcsV8dpzpnlKmDnNaX7qTcUleD8SKc49qBJWx2YgPtwz25NysFMSV7W7/lm9Bgam
 k7eaxHKRrmY0FlnFzqNZ8iMEn6U9swGMcdRg4+y+K5Hb+prrNbVhdl+g/h1kgCpFfx2A
 7fDCt62Mtzqyk4QDs/gvXwhxG+BaqvhJEir9oGj5ugyn2721yUfMdKFqU3pkMKzqQmjM
 FrN9e13LDod1okZ51Ni0LiU4Jtpzp299CPz8ORFhR4Vsc7ppkAvcqX2Xo+BUck4Wt6ps
 wrlWhgTpxEdzDK0Su7p7LFPp81+3G+dSF+LyMlz8yQ0Oz232F5eD0BqUYphmI6ZxBhnG
 41KQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MpVcsV8d
Subject: Re: [Buildroot] [PATCH RESEND v5 5/5] package/qemu: add
 virglrenderer support
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

SGVsbG8gUm9tYWluLAoKT24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTE6MzjigK9BTSBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBMZSAxNC8wNS8yMDI2IMOg
IDIwOjA1LCBKb3NlcGggS29ndXQgYSDDqWNyaXQgOgo+ID4KPiA+IEkgdGhpbmsgYWRkaXRpb25h
bCBtZXNzYWdpbmcgaW4gdGhlIENvbmZpZy5pbiBoZWxwIGxpbmUgd291bGQgYmVuZWZpdAo+ID4g
dXNlcnMuIE1heWJlIGV2ZW4gYSBkZWZjb25maWcgb3IgdGVzdCBjYXNlIGRlbW9uc3RyYXRpbmcg
c2V0dXA/Cj4KPiBCdWlsZHJvb3QgZGVmY29uZmlncyBhcmUgdXNlZCBhcyBpbml0aWFsL21pbmlt
YWwgY29uZmlndXJhdGlvbiB0byBib290IGEgYm9hcmQsCj4gdGhleSBzaG91bGQgbm90IGNvbnRh
aW4gYW55IGFkZGl0aW9uYWwgcGFja2FnZXMuCj4KClllcywgdGhhdCBtYWtlcyBzZW5zZS4KCj4g
SGF2aW5nIGEgdGVzdCBjYXNlIHJ1bm5pbmcgaW4gZ2l0bGFiLWNpIGVudmlyb25tZW50IGRlbW9u
c3RyYXRpbmcgdGhpcyBzZXR1cCBpcwo+IGRlZmluaXRpdmVseSB3ZWxjb21lIChJZiBydW5uaW5n
IGluIGdpdGxhYi1jaSBlbnZpcm9ubWVudCBpcyBwb3NzaWJsZSkuCj4KCkkgZG9uJ3QgdGhpbmsg
d2UgY2FuIGNyZWF0ZSBhIHRlc3QgY2FzZSBmb3IgaG9zdCBuYXRpdmUgY29udGV4dAp3aXRob3V0
IGEgc3VwcG9ydGVkIEdQVSBpbiB0aGUgZ2l0bGFiLWNpIHJ1bm5lcnMsIGJ1dCBJIGJlbGlldmUg
d2UKY291bGQgYXQgbGVhc3QgY3JlYXRlIGEgVmlyR0wvVmVudXMgdGVzdCBjYXNlIHVzaW5nIGxs
dm1waXBlL2xhdmFwaXBlCmZvciBzb2Z0d2FyZSByZW5kZXJpbmcgb24gdGhlIGhvc3QuIFRoZSBn
dWVzdCB3b3VsZCBqdXN0IHVzZSBtZXNhCmJ1aWx0IHdpdGggdGhlIHZpcmdsL3ZlbnVzIFVNRHMs
IGFuZCB3ZSBjb3VsZCB2ZXJpZnkgdGhhdCB3ZSBzZWUgdGhlCmhvc3QgVU1EIHByZXNlbnRlZCB3
aXRoIHRoZSB2aXJ0aW8tZ3B1IHdyYXBwZXIsIGFzIHNob3duIGluIG15IGNvdmVyCmxldHRlci4K
CkJlc3QsCkpvc2VwaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
