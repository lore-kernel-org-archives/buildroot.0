Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A027C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 06:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8262409F6;
	Sun,  1 Sep 2024 06:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcxWAJreu8Z1; Sun,  1 Sep 2024 06:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 590BA412F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 590BA412F8;
	Sun,  1 Sep 2024 06:25:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C60F1BF5A9
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08B5880CDD
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjDIZ10KqKPR for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 06:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA87280CD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA87280CD5
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA87280CD5
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 06:25:22 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-6d3c10af2efso21023317b3.0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 23:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725171921; x=1725776721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAtIi8Wmvtk+SnBBN87uYvoqiTXu/Fdo0fJE1jAchtg=;
 b=K9C2Z9JPuaqufC0bvRm/5xQfpCsSTg3S4Q9bFXDnI+KrCtMp1tEoVjYGIi+IeLXQgX
 EHDqGuyM3evFFgeCN7WSMOGDoyZIPaKLNPQId0jCHhnkiN776hgYVqOP6IxzKFQAnidK
 AaMz32HbsZJbjboGXYFvixoEWY4nQWDyzbPMYjncLwRzj0YcrG/qF+GcH3uEk/GUyOlR
 0tp/VrodeqCtQiubm1Qdow9Du8KgUPBYJZ+RRLTmxNQ8Qd7L+Fc6ph+C9hPwUrde3qoO
 MlJ0b+5Mu81SzfpmnmWgoHeycep/iAoz8DaIpJDRd9l6I/P6My8vJiZEpyUvx3eqswHZ
 Ab3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyJVlUiASfdFHGOI7P2byufSGEYHGE+J7I2ityB62vwahacds2hVKki+qf3VIrqh0BdezCZh+SD5I=@buildroot.org
X-Gm-Message-State: AOJu0YxAnn87P/LVICLm3cw/zEbIPM4r0r1oGzOFSl9B0gxRYwweuzGJ
 cPLt+CTg3lA9Q1xpPipsJ51OqOrr5xYoCVMxCSCFyUq8ZHZHhT80CYuCbU3SLc1KECNdkHtRqLj
 mj+wIgjSopb+oIPayXuYVymahptFdamWJI4XGSw==
X-Google-Smtp-Source: AGHT+IEDbdPH/O+zlTr8J9EHs1QYEyeQ+L7Hb9hN/QUhJ8UuVwm/cunrbGnZcvpmTnmzUrPJmxNTl3ob2h2TKh259ko=
X-Received: by 2002:a05:690c:386:b0:6b5:aba7:8f47 with SMTP id
 00721157ae682-6d40f81e1d9mr61515587b3.33.1725171921369; Sat, 31 Aug 2024
 23:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240831145450.3162934-1-dario.binacchi@amarulasolutions.com>
 <20240831182545.6d9897ab@windsurf>
 <CABGWkvrX6uycmERpb4RaQuUYz0vRaFzLDNxrW95DTadaKJHCVg@mail.gmail.com>
 <ZtNsSCX-cYqK5A6q@landeda>
In-Reply-To: <ZtNsSCX-cYqK5A6q@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 1 Sep 2024 08:25:10 +0200
Message-ID: <CABGWkvoJAaqbB+PTrJa_D85P14WESXHwD4yn7F8wbSY7W9J3ug@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725171921; x=1725776721;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAtIi8Wmvtk+SnBBN87uYvoqiTXu/Fdo0fJE1jAchtg=;
 b=PYMxnX6snTek4E1Pxm1yg2sKbZB4wVx288CPRa+GXgFrvoLOwY8nHtIpQWqcF8vOOT
 RSWe9IeN6vV4SitBPaAX434FCtxQ/nZN58/xL1bJv2/d/PqzE7f716bDVHS/a6xf2ecc
 RNokU6bDgq9VnQauFWB2k/sG4nMUt0nc/Hmng=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PYMxnX6s
Subject: Re: [Buildroot] [PATCH v2 1/2] package/babeld: update URL site
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCk9uIFNhdCwgQXVnIDMxLCAyMDI0IGF0IDk6MTfigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBEYXJpbywgQWxsLAo+Cj4g
T24gMjAyNC0wOC0zMSAyMDozNiArMDIwMCwgRGFyaW8gQmluYWNjaGkgc3Bha2UgdGh1c2x5Ogo+
ID4gT24gU2F0LCBBdWcgMzEsIDIwMjQgYXQgNjoyNeKAr1BNIFRob21hcyBQZXRhenpvbmkKPiA+
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4gT24gU2F0LCAzMSBB
dWcgMjAyNCAxNjo1NDo0OSArMDIwMAo+ID4gPiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNj
aGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+IFstLVNOSVAtLV0KPiA+ID4gPiAtQkFC
RUxEX1NJVEUgPSBodHRwOi8vd3d3LnBwcy51bml2LXBhcmlzLWRpZGVyb3QuZnIvfmpjaC9zb2Z0
d2FyZS9maWxlcwo+ID4gPiA+ICtCQUJFTERfU0lURSA9ICQoY2FsbCBnaXRodWIsamVjaCxiYWJl
bGQscmVmcy90YWdzKQo+ID4gPiBUaGlzIGxvb2tzIG9kZC4gSXNuJ3QgdGhlIHZlcnNpb24gbmVl
ZGVkIHNvbWV3aGVyZT8KPiA+IEl0IHNlZW1lZCBzdHJhbmdlIHRvIG1lIGFzIHdlbGwuIEluZGVl
ZCwgSSBkb24ndCBzZWUgb3RoZXIgc2ltaWxhcgo+ID4gX1NJVEUgc2V0dGluZ3MgaW4gQnVpbGRy
b290Lgo+ID4gQnV0IGlmIEkgZ28gdG8gdGhlIEdpdEh1YiBVUkwsIHRoZXNlIGFyZSB0aGUgdGFy
YmFsbCBhZGRyZXNzZXM6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vamVjaC9iYWJlbGQvYXJjaGl2
ZS9yZWZzL3RhZ3MvYmFiZWxkLTEuOS4yLnRhci5nego+ID4gLi4uCj4gPiBodHRwczovL2dpdGh1
Yi5jb20vamVjaC9iYWJlbGQvYXJjaGl2ZS9yZWZzL3RhZ3MvYmFiZWxkLTEuMTMuMS50YXIuZ3oK
PiA+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4KPiBUaGUgZ2l0aHViIG1hY3JvIGlzIHRvIGJl
IGNhbGxlZCB0aGF0IHdheToKPiAgICAgJChjYWxsIGdpdGh1Yix1c2VyLHBhY2thZ2UsdmVyc2lv
bikKPgo+IFNlZSB0aGUgbWFudWFsLCBzZWN0aW9uIDE4LjI1LjQgSG93IHRvIGFkZCBhIHBhY2th
Z2UgZnJvbSBHaXRIdWI7Cj4gICAgIGh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnL21hbnVh
bC5odG1sI2dpdGh1Yi1kb3dubG9hZC11cmwKPgo+IHNvIGZvciBiYWJlbGQ6Cj4gICAgICQoY2Fs
bCBnaXRodWIsamVjaCxiYWJlbGQsYmFiZWxkLSQoQkFCRUxEX1ZFUlNJT04pKQo+Cj4gU2VlIGFs
c28gdGhlIG15cmlhZHMgb2YgZXhpc3RpbmcgY2FsbHMgaW4gdGhlIHRyZWU6Cj4gICAgIGdpdCBn
cmVwIGNhbGxcIGdpdGh1YiwKClRoYW5rIHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9ucy4KClJlZ2Fy
ZHMsCkRhcmlvCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiAtLQo+IC4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQg
fCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpT
ZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEg
U29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8s
IElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5h
bWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
