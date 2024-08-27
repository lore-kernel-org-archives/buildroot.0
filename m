Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191A0C52D6F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 06:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC5780F3A;
	Tue, 27 Aug 2024 06:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS8jI-CXkLCb; Tue, 27 Aug 2024 06:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD2D680F3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2D680F3D;
	Tue, 27 Aug 2024 06:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 272241BF2BB
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 06:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A2780F3D
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 06:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwR40DGZuZLZ for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 06:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E57980F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E57980F3A
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E57980F3A
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 06:11:45 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e0b7efa1c1bso5096510276.3
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 23:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724739105; x=1725343905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9mqyfrZJwTzQ4bqlXkeKKWl/icIauq8Zp6fiQko08s=;
 b=AJ8GN7szzhE00FcEKAi1dUKadMHsBUKX5D92WM1W7mBwX6sAyUds3WygGI0P8EwVp1
 XBOej8UtnL8zjvLP98kE+hrfnIVZwJe8pAmCemJqScuHbRIhWaCkcjyPVMHMxy14JxV0
 U8lMRE7So/vMkJI2o/OWcttcZXn6esPauPQ1be7VKDcBraHC9tccsyR83TqJ/TqINnWs
 LtDA3d0XQGjtKDlvkq6tRG0fodQzqktqFWTIqSeRvpPYvv2FVKTqM7k4zRW6swSpwsLJ
 TPgsUSGRNW+Edmkqq90GQ+L+ksGl+FneNnOZQD3DCNhBEt4rLkKIFbQ33bjfSlY1VdUq
 hMlw==
X-Gm-Message-State: AOJu0YyRv4ugnwotGgirF2lpNLLlRlOJWiwpmdBTXRwmjNwYjNb167VE
 GN0C0GDqvNM+yI1cObZhHhUDP8m4boJt5G+6V8Haf2sZEe9IOOQQX+ughLvx+V7ZZ7t7//QOkOw
 2ZuQ1CBc/evNvKNhRv1jwRlGVcB629jucyMRSOw==
X-Google-Smtp-Source: AGHT+IFT0ARMOGaSmisYvP/Q+G/eI321gTwcDD2ae9t1kqDi3GNhyLYnKCuEz0qG30pvu+WPQQI1iBx6sDvw9vBw6Ic=
X-Received: by 2002:a05:6902:200e:b0:e0b:cac5:63bb with SMTP id
 3f1490d57ef6-e17a86665d6mr12767587276.46.1724739104777; Mon, 26 Aug 2024
 23:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240824151511.3178807-1-dario.binacchi@amarulasolutions.com>
 <20240826185741.7c68d235@windsurf>
In-Reply-To: <20240826185741.7c68d235@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Aug 2024 08:11:34 +0200
Message-ID: <CABGWkvpiGBMP7UioWZXwJrfj3hToz4_=06=TPFJ7Puz_O75sBQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724739105; x=1725343905;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A9mqyfrZJwTzQ4bqlXkeKKWl/icIauq8Zp6fiQko08s=;
 b=LsDcTKxbuFLibiIwitky6H5MOZ7aAtxIzbtAKR7m829JcRszaPngiDtsiEQ8jGhUmV
 PPswh0r5o5QSJ5+5wO83l6gFjwX0YfmDzgdhhMzzVBMbgqmyQHDSkxaeTRPvXHruIlu0
 FwYzi8exhckQLr8nZGZtiSIsDoKCewfiHoPuY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LsDcTKxb
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 10.1.0
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
Cc: Samuel Martin <s.martin49@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNjo1N+KAr1BNIFRob21hcyBQ
ZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8g
RGFyaW8sCj4KPiBPbiBTYXQsIDI0IEF1ZyAyMDI0IDE3OjE1OjExICswMjAwCj4gRGFyaW8gQmlu
YWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+ID4g
LSBDKysxMSBpcyBub3cgdGhlIG1pbmltdW0gcmVxdWlyZWQgQysrIHN0YW5kYXJkCj4gPiAtIGZh
c3RlciBoYW5kbGluZyBvZiBjb21wb3VuZCBleHByZXNzaW9ucyBieSB0cmltYXR1KCkgYW5kIHRy
aW1hdGwoKQo+ID4gLSBmYXN0ZXIgc3BhcnNlIG1hdHJpeCBhZGRpdGlvbiwgc3VidHJhY3Rpb24g
YW5kIGVsZW1lbnQtd2lzZSBtdWx0aXBsaWNhdGlvbgo+ID4gLSBleHBhbmRlZCBzcGFyc2Ugc3Vi
bWF0cml4IHZpZXdzIHRvIGhhbmRsZSB0aGUgbm9uLWNvbnRpZ3VvdXMgZm9ybSBvZiBYLmNvbHMo
dmVjdG9yX29mX2NvbHVtbl9pbmRpY2VzKQo+ID4gLSBleHBhbmRlZCBlaWdzX3N5bSgpIGFuZCBl
aWdzX2dlbigpIHdpdGggb3B0aW9uYWwgZmluZS1ncmFpbmVkIHBhcmFtZXRlcnMKPiA+Cj4gPiBG
aXhlczoKPiA+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZDRlOWU3
YjQ1Mzk2MGE0ZjYyYTE5OTM0NGIzMGI3MjlhNGYyMzViYwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+
IC0tLQo+ID4gIHBhY2thZ2UvYXJtYWRpbGxvL2FybWFkaWxsby5oYXNoIHwgMiArLQo+ID4gIHBh
Y2thZ2UvYXJtYWRpbGxvL2FybWFkaWxsby5tayAgIHwgMiArLQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gU2FtZSBjb21tZW50IGFzIGZv
ciBiYWJlbGQ6IGJ1bXBpbmcgdG8gc29sdmUgYSBkb3dubG9hZCBpc3N1ZSBpcyBub3QgYQo+IGdv
b2Qgc29sdXRpb24uIEluZGVlZCwgaWYgd2UgaGF2ZSB0byBidW1wIGJlY2F1c2UgdXBzdHJlYW0g
ZHJvcHBlZCB0aGUKPiB0YXJiYWxsLCB3aGF0IHRlbGxzIHVzIHRoYXQgdGhleSB3b24ndCBkcm9w
IHRoZSBuZXcgdGFyYmFsbCBhZ2FpbiBpbgo+IHRoZSBmdXR1cmU/IFRoaXMgY2FuIG9ubHkgYmUg
cmVzb2x2ZWQgZWl0aGVyIGJ5IGZpbmRpbmcgYW4gYWx0ZXJuYXRlCj4gdXBzdHJlYW0gbG9jYXRp
b24gb3IgYnkgdGFsa2luZyB3aXRoIHVwc3RyZWFtIHNvIHRoYXQgdGhleSByZXN0b3JlIHRoZQo+
IHByZXZpb3VzIHRhcmJhbGwgYW5kIHVuZGVyc3RhbmQgdGhlIGlzc3VlcyBjYXVzZWQgYnkgbW92
aW5nL3JlbW92aW5nCj4gcHJldmlvdXMgdGFyYmFsbHMuCgpUaGlzIGlzIHRoZSByZXNwb25zZSBm
cm9tIENvbnJhZCBTYW5kLCBvbmUgb2YgdGhlIHR3byBtYWludGFpbmVycyBvZgp0aGUgcHJvamVj
dDoKCkhpIERhcmlvLAoKQXJtYWRpbGxvIDkuOTAwIGlzIHZlcnkgb2xkLCBob3JyaWJseSBvdXRk
YXRlZCBhbmQgbm8gbG9uZ2VyIHN1cHBvcnRlZC4KCkkgcmVjb21tZW5kIHVwZ3JhZGluZyB0byB0
aGUgbGF0ZXN0IHZlcnNpb24sIHdoaWNoIGlzIGN1cnJlbnRseSAxNC4wLjIuCmh0dHBzOi8vc291
cmNlZm9yZ2UubmV0L3Byb2plY3RzL2FybWEvZmlsZXMvYXJtYWRpbGxvLTE0LjAuMi50YXIueHoK
CklmIHlvdSByZWFsbHkgd2FudCBhbmNpZW50IHZlcnNpb25zIG9mIEFybWFkaWxsbywgdGhleSBj
YW4gYmUKdGVtcG9yYXJpbHkgZm91bmQgaGVyZToKaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcHJv
amVjdHMvYXJtYS9maWxlcy9yZXRpcmVkLwoKPgo+IEFsc28sIGlmIHRoZXkgbWFkZSBDKysxMSBy
ZXF1aXJlZCwgdGhlbiBJJ20gcHJldHR5IHN1cmUgd2Ugd2lsbCBuZWVkIGEKPiBCUjJfVE9PTENI
QUlOX0dDQ19BVF9MRUFTVF94eXogZGVwZW5kZW5jeSBhZGRlZCwgbm8/Cj4KPiBUaGFua3MhCj4K
PiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgoKCi0t
IAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlv
LmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMx
MTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxh
c29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
