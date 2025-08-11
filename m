Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6552ECA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E8596143E;
	Mon, 11 Aug 2025 16:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Lr-LorXu3Ot; Mon, 11 Aug 2025 16:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3233A61442
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3233A61442;
	Mon, 11 Aug 2025 16:20:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A521B154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C1C840E0A
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKTUOy9Rw6Mi for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com;
 envelope-from=jesse@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 738D4414C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 738D4414C4
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 738D4414C4
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:20:46 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-4fce5941104so1928564137.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754929245; x=1755534045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQoFslTTD4DlZnGFQfw0W9LAzKjCmhWPogfk5/xTwl0=;
 b=adeWlyO6uGtPm/8OOBqlFZjc9WnKPD2AYBAqwnNiD7k+1k2eJmNZmz+fyCR+fyj21a
 kg+PX7BtarAICJMJH5VIvH2QqiHJzT70nFvIubW0ya5Ema30szpT67nyrRHxrXcZwyM0
 y287+Ff/R4ZKHgM1OR+QZLm+dY4dwGfE4gjJUQZwvPl8PJYDj+9gns7CXQvrnDcQoaWw
 aZc7QTMJuJ93tKsxm2XiTg6YApBgowxRLNzQccLrtTWwXBHcNcC1lbGprl43Xlf8RTE4
 hT9jbAdx04fhAJusgxjIuovuQCNHSTzoCyrRdEIXBfSRIys5I01vVBEgomK4+C86Ekrx
 FYig==
X-Gm-Message-State: AOJu0YyFM5u4/VAEkmd5NMn2erPtowpkPvLEEFonZZnd8gynbs1haQTI
 Ry99mupRWXQ+lDPpDCTrEntYS0Ps0/2+hFbc6+tO/qI6qMryuZrnxeLqeTpZYydb6GMHMcrUh3Z
 Ye7SNhNUCk3I+7heERXbQMH2v+AkQ3irWIvuZT8KaZg==
X-Gm-Gg: ASbGncugTSmIOX4CN4pGx2AnuG/rw/xj6pVkw+WZvU2yQjx2m4Kbgdj0TTFnIR8aclM
 9nenPCjzygb0Gr/TzFe8JL7CbFuFg6X4oOfM7gNHpBa2OjdoqBEUP4ZomzFt9wCrT71qkucHLcN
 Y09XbwfApGrTW3IjOCw5jl5TfoVDLBioD0HHAHa7HOPc7bAtJatOYA4dFbdW49c4EYsYll1l1d/
 GD74Hzq
X-Google-Smtp-Source: AGHT+IHoEpIrwz8cK/S7fIfp1mQ11O9jvfgJZxuD9E8Xs+69UdRb8WEN0Ru5CE/MhJ1MuZj9p3DA1SWn8tNblMhAdnc=
X-Received: by 2002:a05:6102:a53:b0:4e6:d7af:a7b1 with SMTP id
 ada2fe7eead31-5060d29f42amr5372743137.10.1754929245092; Mon, 11 Aug 2025
 09:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-9-alex.bennee@linaro.org>
In-Reply-To: <20250805151814.1114414-9-alex.bennee@linaro.org>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 11 Aug 2025 09:20:33 -0700
X-Gm-Features: Ac12FXxT4VkNLl-Fy-xxSn_cWojzh1JjCCf1CgRRHHclzLHix9Voqa_t-CR6L3c
Message-ID: <CALSpo=Ymd4eBmGCKxprXHpEYT3nLrBfxQzJDBPB7WskmpyxfPQ@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc.com; s=google; t=1754929245; x=1755534045; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQoFslTTD4DlZnGFQfw0W9LAzKjCmhWPogfk5/xTwl0=;
 b=d/mhwPJcMI9BvJT1Q4W6jm/drqftbPPzhZKJG6q3Llcr1w7QZCarVKboSRIuFYKP/m
 wXZcc728zQAzdCUar88SHtPgrJ1Pv/PpSVMJXTo064CaPDVTNJIN1boo9mlUJKAI7t0Z
 0oetG2EzvLjBc95FUREOzy+vXBUnCItCw3in3YJBrCWXG8Me+vUAcDDefcgWA20qgawa
 XLKLu9qvc2k3c6UXHEjOqbwIM4pd/cQLs1TnmXATuTQSnBrxKuo6ZLjgSJp88LOyrmUl
 d+ZZHvBc64aALiglx/ytx7gKZRfcOUwfhY+TKOn1UfwRaJtKgIFhLPF3daH2UQLn9EAN
 kdqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com
 header.a=rsa-sha256 header.s=google header.b=d/mhwPJc
Subject: Re: [Buildroot] [PATCH v4 8/9] package/kvmtool: bump to current HEAD
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

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCA4OjE44oCvQU0gQWxleCBCZW5uw6llIDxhbGV4LmJlbm5l
ZUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEJ5IGRvaW5nIHNvIHdlIGNhbiBhbHNvIGRyb3AgdGhl
IHBhdGNoZXMgZm9yIG11c2wgd2hpY2ggaGF2ZSBub3cgYmVlbgo+IG1lcmdlZCB1cHN0cmVhbS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4K
ClJldmlld2VkLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgoKVGhhbmtzLApK
ZXNzZSBUYXViZQoKPiAtLS0KPiAgLi4uZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmls
aXR5LnBhdGNoIHwgNTIgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBwYWNrYWdlL2t2bXRvb2wva3Zt
dG9vbC5oYXNoICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBwYWNrYWdlL2t2bXRvb2wva3Zt
dG9vbC5tayAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2t2bXRvb2wvMDAwMS1yZW1vdmUtd29yZHNpemUtaC1pbmNsdXNpb24tZm9yLW11c2wtY29t
cGF0aWJpbGl0eS5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtdG9vbC8wMDAxLXJl
bW92ZS13b3Jkc2l6ZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmlsaXR5LnBhdGNoIGIv
cGFja2FnZS9rdm10b29sLzAwMDEtcmVtb3ZlLXdvcmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNs
LWNvbXBhdGliaWxpdHkucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAz
MTI4YTIzNjg5Li4wMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9rdm10b29sLzAwMDEtcmVtb3Zl
LXdvcmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2gKPiArKysg
L2Rldi9udWxsCj4gQEAgLTEsNTIgKzAsMCBAQAo+IC1Gcm9tIDA1OTJmOGY4MjljODQzZmY1Y2Iy
ZDEwOGMzMDllMzJmNGY2ZjUzNzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gLUZyb206IEFu
ZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgo+IC1EYXRlOiBUaHUsIDEgQXVn
IDIwMjQgMTI6MTA6NTQgKzAxMDAKPiAtU3ViamVjdDogcmVtb3ZlIHdvcmRzaXplLmggaW5jbHVz
aW9uIChmb3IgbXVzbCBjb21wYXRpYmlsaXR5KQo+IC1NSU1FLVZlcnNpb246IDEuMAo+IC1Db250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiAtQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAo+IC0KPiAtVGhlIHdvcmRzaXplLmggaGVhZGVyIGZpbGUgYW5kIHRoZSBf
X1dPUkRTSVpFIGRlZmluaXRpb24gZG8gbm90IHNlZW0KPiAtdG8gYmUgdW5pdmVyc2FsLCB0aGUg
bXVzbCBsaWJjIGZvciBpbnN0YW5jZSBoYXMgdGhlIGRlZmluaXRpb24gaW4gYQo+IC1kaWZmZXJl
bnQgaGVhZGVyIGZpbGUuIFRoaXMgYnJlYWtzIGNvbXBpbGF0aW9uIG9mIGt2bXRvb2wgYWdhaW5z
dCBtdXNsLgo+IC0KPiAtVGhlIHR3byBsZWFkaW5nIHVuZGVyc2NvcmVzIHN1Z2dlc3QgYSBjb21w
aWxlci1pbnRlcm5hbCBzeW1ib2wgYW55d2F5LCBzbwo+IC1sZXQncyBqdXN0IHJlbW92ZSB0aGF0
IHBhcnRpY3VsYXIgbWFjcm8gdXNhZ2UgZW50aXJlbHksIGFuZCByZXBsYWNlIGl0Cj4gLXdpdGgg
dGhlIG51bWJlciB3ZSByZWFsbHkgd2FudDogdGhlIHNpemUgb2YgYSAibG9uZyIgdHlwZS4KPiAt
Cj4gLVJlcG9ydGVkLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+
IC1TaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4K
PiAtUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBFbGlzZWkgPGFsZXhhbmRydS5lbGlzZWlAYXJtLmNv
bT4KPiAtTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDgwMTExMTA1NC44MTg3
NjUtMS1hbmRyZS5wcnp5d2FyYUBhcm0uY29tCj4gLVNpZ25lZC1vZmYtYnk6IFdpbGwgRGVhY29u
IDx3aWxsQGtlcm5lbC5vcmc+Cj4gLVVwc3RyZWFtOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC93aWxsL2t2bXRvb2wuZ2l0L2NvbW1pdC8/aWQ9MDU5MmY4
ZjgyOWM4NDNmZjVjYjJkMTA4YzMwOWUzMmY0ZjZmNTM3OQo+IC1TaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4gLS0tLQo+IC0gaW5jbHVkZS9saW51
eC9iaXRvcHMuaCB8IDYgKystLS0tCj4gLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IC0KPiAtZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYml0b3Bz
LmggYi9pbmNsdWRlL2xpbnV4L2JpdG9wcy5oCj4gLWluZGV4IGFlMzM5MjJmLi5lZThmZDU2MCAx
MDA2NDQKPiAtLS0tIGEvaW5jbHVkZS9saW51eC9iaXRvcHMuaAo+IC0rKysgYi9pbmNsdWRlL2xp
bnV4L2JpdG9wcy5oCj4gLUBAIC0xLDE1ICsxLDEzIEBACj4gLSAjaWZuZGVmIF9LVk1fTElOVVhf
QklUT1BTX0hfCj4gLSAjZGVmaW5lIF9LVk1fTElOVVhfQklUT1BTX0hfCj4gLQo+IC0tI2luY2x1
ZGUgPGJpdHMvd29yZHNpemUuaD4KPiAtLQo+IC0gI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+
IC0gI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+Cj4gLSAjaW5jbHVkZSA8YXNtL2h3ZWlnaHQu
aD4KPiAtCj4gLS0jZGVmaW5lIEJJVFNfUEVSX0xPTkcgX19XT1JEU0laRQo+IC0gI2RlZmluZSBC
SVRTX1BFUl9CWVRFICAgICAgICAgICA4Cj4gLS0jZGVmaW5lIEJJVFNfVE9fTE9OR1MobnIpICAg
ICAgIERJVl9ST1VORF9VUChuciwgQklUU19QRVJfQllURSAqIHNpemVvZihsb25nKSkKPiAtKyNk
ZWZpbmUgQklUU19QRVJfTE9ORyAgICAgICAgICAgKEJJVFNfUEVSX0JZVEUgKiBzaXplb2YobG9u
ZykpCj4gLSsjZGVmaW5lIEJJVFNfVE9fTE9OR1MobnIpICAgICAgIERJVl9ST1VORF9VUChuciwg
QklUU19QRVJfTE9ORykKPiAtCj4gLSAjZGVmaW5lIEJJVF9XT1JEKG5yKSAgICAgICAgICAoKG5y
KSAvIEJJVFNfUEVSX0xPTkcpCj4gLQo+IC0tLQo+IC1jZ2l0IDEuMi4zLWtvcmcKPiAtCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLmhhc2ggYi9wYWNrYWdlL2t2bXRvb2wv
a3ZtdG9vbC5oYXNoCj4gaW5kZXggNjNiYmI3MTY3Yy4uOGRmNmY5MjlkZiAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5oYXNoCj4gKysrIGIvcGFja2FnZS9rdm10b29sL2t2
bXRvb2wuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiAtc2hh
MjU2ICBhODUwNGQ4YjE4NGNhZTRlNjVmZjU1NTVjYzg0YTQzNmYzZmJiYzgzMmE4MDE3ZTNjYTU5
ZDk5N2RkNTU4MWRiICBrdm10b29sLTRkMmMwMTdmNDE1MzNiMGU1MWUwMGY2ODkwNTBjMjYxOTBh
MTUzMTgtZ2l0NC50YXIuZ3oKPiArc2hhMjU2ICAxODg0MWM0MTRlODJiNDA1YTBiZDZmNWM1NDZi
YzA4OGJlY2QyOThjMTE0NWEyYmFjOTc1NjNlNjk5MjMxOTI1ICBrdm10b29sLTExMTdkYmM4Y2Vi
MjFhYmM2ZThjZDk4NjE0NTA2OTU5OTU4NTIyOTAtZ2l0NC50YXIuZ3oKPiAgc2hhMjU2ICAwZDVi
ZjM0NmRmOWU2MzVhMjlkY2RkZGY4MzJkYzViMDAyY2E2Y2RjMWM1YzljNmM1NjdkMmE2MWJiMGM1
YzE1ICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLm1rIGIv
cGFja2FnZS9rdm10b29sL2t2bXRvb2wubWsKPiBpbmRleCA3ZmVjNjY0M2Y4Li5mNTYzN2U1Mzg0
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLm1rCj4gKysrIGIvcGFja2Fn
ZS9rdm10b29sL2t2bXRvb2wubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+Cj4gLUtWTVRPT0xfVkVSU0lPTiA9IDRkMmMwMTdmNDE1MzNiMGU1MWUw
MGY2ODkwNTBjMjYxOTBhMTUzMTgKPiArS1ZNVE9PTF9WRVJTSU9OID0gMTExN2RiYzhjZWIyMWFi
YzZlOGNkOTg2MTQ1MDY5NTk5NTg1MjI5MAo+ICBLVk1UT09MX1NJVEUgPSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC93aWxsL2t2bXRvb2wuZ2l0Cj4gIEtW
TVRPT0xfU0lURV9NRVRIT0QgPSBnaXQKPiAgS1ZNVE9PTF9ERVBFTkRFTkNJRVMgPSBcCj4gLS0K
PiAyLjQ3LjIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
