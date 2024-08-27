Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABADDC5320E
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 06:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50C1880CBF;
	Tue, 27 Aug 2024 06:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIAOu17qYodd; Tue, 27 Aug 2024 06:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2844580CEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2844580CEE;
	Tue, 27 Aug 2024 06:20:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7B791BF2BB
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 06:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFF29403AA
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 06:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrM6375WEcbo for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 06:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 356DD40390
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 356DD40390
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 356DD40390
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 06:20:43 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6ca1d6f549eso23975497b3.0
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 23:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724739642; x=1725344442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozECgSh3vcsGA4xSVi9ddUrIyopRJmxyUS4+3AYgNdA=;
 b=In5ttQV/5uxejltXG1vXf8Uat8hRmA+3gPVTPh/bm7la4UivZwf5RSAHfuyLfNNaKN
 9hu/wlrF3kVI4QvCNRyQoj75AOscsdacdCtz5uZkb34eo8jUXDYa+DzZGKigoomJxeol
 h5WFAUh9RbQ6iu7us8SQUcS/bjnTOOlBLM6MTD1NFiPwN+2qFd5FO2sHABRJQDnjzfM3
 Ql2X9lE7EWQV9obl9BC9GnWhYqfWvhjbUjyFoN5LB+CSqF2MxJ3crB8bgefGXlSatun6
 gBS0qfx18MwaSOodhIWGG2zfG+xtk/NUEABPLSgRejdd6CTdZPaSyxL7GkkUoRgSuz7V
 ouBQ==
X-Gm-Message-State: AOJu0Yz8FOQUii0WCBV7RngNLz0epFq6ymHvxSUMb6L9tfNrp9ikuyq+
 jdXT8oXqjqK+gy/yDfdJQM57/mj1TBMKvQKACi55BCVJJt52hLkgtnM+KM/SFnAC6vzsja0FR+s
 rLNk2/6+5OQuGrdGh+pNI3kQvcw2KVjFhnCUH48bGnax/BXva+SBwzg==
X-Google-Smtp-Source: AGHT+IEj7zXQZ4Oxk8/ujU7JcXPaXKkAjfzkYvg+RmbjGAtTAJ6DmAB5vvHK+fpDldQJKL/Dl0snP05oibbkOUozLqM=
X-Received: by 2002:a05:690c:d82:b0:62f:4149:7604 with SMTP id
 00721157ae682-6cfb941590bmr24360057b3.4.1724739642391; Mon, 26 Aug 2024
 23:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240824151511.3178807-1-dario.binacchi@amarulasolutions.com>
 <20240826185741.7c68d235@windsurf>
In-Reply-To: <20240826185741.7c68d235@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Aug 2024 08:20:30 +0200
Message-ID: <CABGWkvrSzFdKqrZ1MWm76kEtd=GigJA5_FwYq3smQJW734S6xw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724739642; x=1725344442;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozECgSh3vcsGA4xSVi9ddUrIyopRJmxyUS4+3AYgNdA=;
 b=haBDuIAFinH4VDIfC+C2lrXWnRICRHWzKlPThMVLsOBV1AmDL5qb1U9Oou9/1gHyZY
 RfnKIsiy/csgKGFBy/mcQAY7FIVRu4ru9Zm0Ng8ukVTKfDUrfoxFU0L4Z4y7ZwCnyr6n
 vxgn+JhK2FdYQwmAb5tXnPYu0Ik8eGl7JjE/w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=haBDuIAF
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

SGVsbG8gVGhvbWFzLAoKU29ycnkgZm9yIHRoZSBwcmV2aW91cyBlbWFpbCwgSSBzZW50IGl0IHBy
ZW1hdHVyZWx5IGJlZm9yZSBjb21wbGV0aW5nIGl0LgoKT24gTW9uLCBBdWcgMjYsIDIwMjQgYXQg
Njo1N+KAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
IHdyb3RlOgo+Cj4gSGVsbG8gRGFyaW8sCj4KPiBPbiBTYXQsIDI0IEF1ZyAyMDI0IDE3OjE1OjEx
ICswMjAwCj4gRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPiB3cm90ZToKPgo+ID4gLSBDKysxMSBpcyBub3cgdGhlIG1pbmltdW0gcmVxdWlyZWQgQysr
IHN0YW5kYXJkCj4gPiAtIGZhc3RlciBoYW5kbGluZyBvZiBjb21wb3VuZCBleHByZXNzaW9ucyBi
eSB0cmltYXR1KCkgYW5kIHRyaW1hdGwoKQo+ID4gLSBmYXN0ZXIgc3BhcnNlIG1hdHJpeCBhZGRp
dGlvbiwgc3VidHJhY3Rpb24gYW5kIGVsZW1lbnQtd2lzZSBtdWx0aXBsaWNhdGlvbgo+ID4gLSBl
eHBhbmRlZCBzcGFyc2Ugc3VibWF0cml4IHZpZXdzIHRvIGhhbmRsZSB0aGUgbm9uLWNvbnRpZ3Vv
dXMgZm9ybSBvZiBYLmNvbHModmVjdG9yX29mX2NvbHVtbl9pbmRpY2VzKQo+ID4gLSBleHBhbmRl
ZCBlaWdzX3N5bSgpIGFuZCBlaWdzX2dlbigpIHdpdGggb3B0aW9uYWwgZmluZS1ncmFpbmVkIHBh
cmFtZXRlcnMKPiA+Cj4gPiBGaXhlczoKPiA+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvZDRlOWU3YjQ1Mzk2MGE0ZjYyYTE5OTM0NGIzMGI3MjlhNGYyMzViYwo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvYXJtYWRpbGxvL2FybWFkaWxsby5o
YXNoIHwgMiArLQo+ID4gIHBhY2thZ2UvYXJtYWRpbGxvL2FybWFkaWxsby5tayAgIHwgMiArLQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4g
U2FtZSBjb21tZW50IGFzIGZvciBiYWJlbGQ6IGJ1bXBpbmcgdG8gc29sdmUgYSBkb3dubG9hZCBp
c3N1ZSBpcyBub3QgYQo+IGdvb2Qgc29sdXRpb24uIEluZGVlZCwgaWYgd2UgaGF2ZSB0byBidW1w
IGJlY2F1c2UgdXBzdHJlYW0gZHJvcHBlZCB0aGUKPiB0YXJiYWxsLCB3aGF0IHRlbGxzIHVzIHRo
YXQgdGhleSB3b24ndCBkcm9wIHRoZSBuZXcgdGFyYmFsbCBhZ2FpbiBpbgo+IHRoZSBmdXR1cmU/
IFRoaXMgY2FuIG9ubHkgYmUgcmVzb2x2ZWQgZWl0aGVyIGJ5IGZpbmRpbmcgYW4gYWx0ZXJuYXRl
Cj4gdXBzdHJlYW0gbG9jYXRpb24gb3IgYnkgdGFsa2luZyB3aXRoIHVwc3RyZWFtIHNvIHRoYXQg
dGhleSByZXN0b3JlIHRoZQo+IHByZXZpb3VzIHRhcmJhbGwgYW5kIHVuZGVyc3RhbmQgdGhlIGlz
c3VlcyBjYXVzZWQgYnkgbW92aW5nL3JlbW92aW5nCj4gcHJldmlvdXMgdGFyYmFsbHMuCgpUaGlz
IGlzIHRoZSByZXNwb25zZSBmcm9tIENvbnJhZCBTYW5kLCBvbmUgb2YgdGhlIHR3byBtYWludGFp
bmVycyBvZgp0aGUgcHJvamVjdDoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpIaSBEYXJpbywKCkFybWFkaWxsbyA5LjkwMCBpcyB2ZXJ5IG9sZCwgaG9ycmlibHkg
b3V0ZGF0ZWQgYW5kIG5vIGxvbmdlciBzdXBwb3J0ZWQuCgpJIHJlY29tbWVuZCB1cGdyYWRpbmcg
dG8gdGhlIGxhdGVzdCB2ZXJzaW9uLCB3aGljaCBpcyBjdXJyZW50bHkgMTQuMC4yLgpodHRwczov
L3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9hcm1hL2ZpbGVzL2FybWFkaWxsby0xNC4wLjIudGFy
Lnh6CgpJZiB5b3UgcmVhbGx5IHdhbnQgYW5jaWVudCB2ZXJzaW9ucyBvZiBBcm1hZGlsbG8sIHRo
ZXkgY2FuIGJlCnRlbXBvcmFyaWx5IGZvdW5kIGhlcmU6CgpodHRwczovL3NvdXJjZWZvcmdlLm5l
dC9wcm9qZWN0cy9hcm1hL2ZpbGVzL3JldGlyZWQvCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQoKU28sIHNob3VsZCBJIHJlc3RvcmUgdGhlICA5LjkwMCB2ZXJzaW9u
PwpPciBhdCB0aGlzIHBvaW50LCB3b3VsZCBpdCBiZSBhY2NlcHRhYmxlIHRvIGJ1bXAgdG8gMTAu
MTA/Ck9yIHNob3VsZCBJIHJlc3RvcmUgOS45MDAgYW5kIHRoZW4gYnVtcCB0byAxMC4xMD8KT3Ig
c2hvdWxkIEkgcmVzdG9yZSA5LjkwMCBhbmQgdGhlbiBidW1wIHRvIDE0LjI/CklmIGJ1bXBpbmcg
dG8gMTAuMTAgaXMgYWNjZXB0YWJsZSByaWdodCBhd2F5LCBJIGNhbiB0aGVuIHRha2UgbXkgdGlt
ZQp0byBidW1wIHRvIDE0LjIgbGF0ZXIsIGJ1dCBpbiB0aGUgbWVhbnRpbWUsIHRoZSBidWcgZ2V0
cyBmaXhlZC4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiBBbHNvLCBpZiB0aGV5IG1h
ZGUgQysrMTEgcmVxdWlyZWQsIHRoZW4gSSdtIHByZXR0eSBzdXJlIHdlIHdpbGwgbmVlZCBhCj4g
QlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfeHl6IGRlcGVuZGVuY3kgYWRkZWQsIG5vPwo+Cj4g
VGhhbmtzIQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxv
cGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2
YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmlu
Zm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
