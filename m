Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32161C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 03:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3FCA610F1;
	Thu, 13 Feb 2025 03:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxUVpP17oERu; Thu, 13 Feb 2025 03:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB3D610F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB3D610F6;
	Thu, 13 Feb 2025 03:59:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2171C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 03:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F8E0610F1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 03:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkSlMBaoNFNs for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 03:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 286DA610F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286DA610F6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 286DA610F6
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 03:59:14 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5451d1d56a7so460655e87.0
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 19:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739419153; x=1740023953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bfg5B3/y9AgrtT1czVO1ej/bJJa3gOATd6vANm17odo=;
 b=gAE8Ds8zFU+fh6oru0Q/ilKp44emOEo1qllSVVH6yCcr5Q0agNCfkN+PCbrqPIsaa6
 XnbenKZYpkuzHJ8Yn+VSOUdRJrgkIzvdR/Y/mqVSzjxKIGw1KGQX6wqCtLgpeLfizIeS
 /M44h5YRzLjzRREHTc001bGMZZz0HPcUcLCM018vJhYKSkDPPv01QfjI+ALjHfNK7+qp
 1L37qHqP07cNIrFesBreO5FU164QTgkdXdTfd3rs/dT3cCrFfzeJKpGDfFFVAkgGKGtG
 oojwD/+oQ8+jR30LcIrmacquRRX38fZBJPPBbxoS7HVloWlKPdqfg5k31jtYr6QdFp9H
 V/bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5UMOPqhnGdNeCqXlWJj91/Lr91ahBJolxcmYc7r2ElwDVvKy6bIZUddCGadWl/f+VgFVflwNOuTw=@buildroot.org
X-Gm-Message-State: AOJu0YypqL2evTYwb01eIh8x82SPa6Oh4emEscxMAFe2sLLQUiSuGlTb
 mNMzJYb07WFQzgBfJPnXvBihu30wXMWdSL/er2k4Hm/vJeyVn9ER3/+0KeVzwy85d6B3v1w9l2s
 5ryWME7akFxlN2UlCzoheLn0Fo00DC3fP
X-Gm-Gg: ASbGncvaYAvWozlEVGFruHJfS7G7Ae5/FFMqr6lpb39Hf3cSx3kNFUiK+nuoJOGeiwH
 rX3ShFmZvhWICe00oREowbubFtxzHyz9IyRdfIIZTfAzsWlFbqvcjlSi0Rc3mDdqKBHyTfBXpyw
 ==
X-Google-Smtp-Source: AGHT+IFY88s/6gYVCFbTkjbojrbmpet5R51nCVageNpTC0CLuw1PE+BcEfK6zO/mZh9BwdDxXWr/QMJYYSbtUYDEIbU=
X-Received: by 2002:a05:6512:a8c:b0:545:56f:385e with SMTP id
 2adb3069b0e04-5451dfdc467mr359113e87.14.1739419152346; Wed, 12 Feb 2025
 19:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <87tt8znsuq.fsf@tarshish>
 <30ddb8d5-72c7-475c-a02e-6b9160cbaae9@gmx.de>
In-Reply-To: <30ddb8d5-72c7-475c-a02e-6b9160cbaae9@gmx.de>
From: Scott Fan <fancp2007@gmail.com>
Date: Thu, 13 Feb 2025 11:59:00 +0800
X-Gm-Features: AWEUYZkYT5-9anl8VokxExCzPfqA3ag3_zVE3L9O3SfRjCpJavziCvfrQ-U1JW4
Message-ID: <CAFkzVZYXo0EALs-dV=VgnSYhOh28YT9wip99UVutHcuesEfw2g@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739419153; x=1740023953; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bfg5B3/y9AgrtT1czVO1ej/bJJa3gOATd6vANm17odo=;
 b=Flq/WOq/9L4BLCYJGTcBc7+QSE1Gv0fItIUr5ysWKsHJEUTbt1l8axve/Oseb3clVs
 ouWxNX9R0U3TrCHSfDIf9TJhYpVKypcSpiIX7ewakhV6rNUO36sSnMZvB8DL8q1VDjwn
 cPHm0JjxE9XFxrRv0UGxh7yGGyY017w3nlVRstODPmtR7ECfn7YoJc1RFKArpg66Cu4t
 FHvA3DiKHpt3YBE4AAPbTSIl9cOXVW9LFLDEb8FqqmLDUCAeG+9z4he+JkzjeWFv3C3W
 uxNXzDTKOG/ytOrcbGTQMt5PchHZ4hPimw58UeHYzljy4T8nApkL6heXohnFxiSz2E6b
 a7IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Flq/WOq/
Subject: Re: [Buildroot] [PATCH] package/sqlite: fix build issue since bump
 to 3.49.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIFdlZCwgRmViIDEyLCAyMDI1IGF0IDExOjQ34oCvUE0gRmlvbmEgS2x1dGUgdmlhIGJ1
aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gSGkgU2NvdHQsIEJh
cnVjaCEKPgo+IEFtIDEyLjAyLjI1IHVtIDE1OjI0IHNjaHJpZWIgQmFydWNoIFNpYWNoIHZpYSBi
dWlsZHJvb3Q6Cj4gPiBIaSBTY290dCwKPiA+Cj4gPiBPbiBXZWQsIEZlYiAxMiAyMDI1LCBTY290
dCBGYW4gd3JvdGU6Cj4gPj4gQXMgb2YgcmVsZWFzZSAzLjQ5LjAsIHRoZSBhdXRob3IgaGFzIHJl
cGxhY2VkIHRoZSBjb25maWd1cmUgc2NyaXB0IHVzZWQgaW4KPiA+PiB0aGUgcHJlY29tcGlsZWQg
YW1hbGdhbWF0aW9uIHRhcmJhbGwgd2l0aCBBdXRvc2V0dXAgaW5zdGVhZCBvZiBBdXRvdG9vbHMu
Cj4gPj4KPiA+PiBGaXhlczoKPiA+PiAgICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
Lz9yZWFzb249c3FsaXRlLTMuNDkuMAo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogU2NvdHQgRmFu
IDxmYW5jcDIwMDdAZ21haWwuY29tPgo+Cj4gVG9nZXRoZXIgd2l0aCB0aGUgImhvc3QtZ2VuZXJp
Yy1wYWNrYWdlIiBCYXJ1Y2ggcG9pbnRlZCBvdXQgdGhpcyBmaXhlZAo+IG15IGJ1aWxkLCB0aGFu
a3MhIE9uZSB0aGluZyBsb29rcyBvZGQgdGhvdWdoLCBzZWUgYmVsb3cuCgpJIHdpbGwgYWRkIHRo
ZSBtaXNzaW5nIGNvbmZpZ3VyYXRpb25zIGZvciB0aGUgImhvc3QtZ2VuZXJpYy1wYWNrYWdlIi4K
Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPgo+ID4+IC0tLQo+ID4+ICAgcGFja2FnZS9zcWxp
dGUvc3FsaXRlLm1rIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tayBiL3BhY2th
Z2Uvc3FsaXRlL3NxbGl0ZS5tawo+ID4+IGluZGV4IGEyM2Y2ZTFkNjYuLjMwMzg1Zjk4MjEgMTAw
NjQ0Cj4gPj4gLS0tIGEvcGFja2FnZS9zcWxpdGUvc3FsaXRlLm1rCj4gPj4gKysrIGIvcGFja2Fn
ZS9zcWxpdGUvc3FsaXRlLm1rCj4gPj4gQEAgLTIxLDE0ICsyMSw2IEBAIGlmZXEgKCQoQlIyX1BB
Q0tBR0VfU1FMSVRFX0VOQUJMRV9DT0xVTU5fTUVUQURBVEEpLHkpCj4gPj4gICBTUUxJVEVfQ0ZM
QUdTICs9IC1EU1FMSVRFX0VOQUJMRV9DT0xVTU5fTUVUQURBVEEKPiA+PiAgIGVuZGlmCj4gPj4K
PiA+PiAtaWZlcSAoJChCUjJfUEFDS0FHRV9TUUxJVEVfRU5BQkxFX0ZUUzMpLHkpCj4gPj4gLVNR
TElURV9DRkxBR1MgKz0gLURTUUxJVEVfRU5BQkxFX0ZUUzMKPiA+PiAtZW5kaWYKPiA+PiAtCj4g
Pj4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfU1FMSVRFX0VOQUJMRV9KU09OMSkseSkKPiA+PiAtU1FM
SVRFX0NGTEFHUyArPSAtRFNRTElURV9FTkFCTEVfSlNPTjEKPiA+PiAtZW5kaWYKPiA+PiAtCj4g
Pj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX1NRTElURV9FTkFCTEVfVU5MT0NLX05PVElGWSkseSkK
PiA+PiAgIFNRTElURV9DRkxBR1MgKz0gLURTUUxJVEVfRU5BQkxFX1VOTE9DS19OT1RJRlkKPiA+
PiAgIGVuZGlmCj4gPj4gQEAgLTUwLDMwICs0Miw1MSBAQCBlbHNlCj4gPj4gICBTUUxJVEVfQ0ZM
QUdTICs9ICQoc3Vic3QgLU9mYXN0LC1PMywkKFRBUkdFVF9DRkxBR1MpKQo+ID4+ICAgZW5kaWYK
PiA+Pgo+ID4+IC1TUUxJVEVfQ09ORl9FTlYgPSBDRkxBR1M9IiQoU1FMSVRFX0NGTEFHUykiCj4g
Pj4gLQo+ID4+IC1pZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiA+PiAtU1FMSVRFX0NPTkZf
T1BUUyArPSAtLWVuYWJsZS1keW5hbWljLWV4dGVuc2lvbnM9bm8KPiA+PiAtZWxzZQo+ID4+IC1T
UUxJVEVfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1zdGF0aWMtc2hlbGwKPiA+PiAtZW5kaWYKPiA+
PiAtCj4gPj4gICBpZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMpLHkpCj4gPj4gLVNR
TElURV9DT05GX09QVFMgKz0gLS1lbmFibGUtdGhyZWFkc2FmZQo+ID4+ICtTUUxJVEVfQ0ZMQUdT
ICs9IC1EU1FMSVRFX1RIUkVBRFNBRkU9MQo+ID4+ICAgZWxzZQo+ID4+ICAgU1FMSVRFX0NPTkZf
T1BUUyArPSAtLWRpc2FibGUtdGhyZWFkc2FmZQo+ID4+IC1TUUxJVEVfQ0ZMQUdTICs9IC1EU1FM
SVRFX1RIUkVBRFNBRkU9MAo+ID4+ICAgZW5kaWYKPgo+IFdoeSBkb2VzIC0tZGlzYWJsZS10aHJl
YWRzYWZlIHJlbWFpbiwgd2hpbGUgLS1lbmFibGUtdGhyZWFkc2FmZSBpcwo+IHJlbW92ZWQgaW4g
dGhlIG90aGVyIGJyYW5jaCwgYW5kIC1EU1FMSVRFX1RIUkVBRFNBRkU9MCByZW1vdmVkIHdoaWxl
Cj4gLURTUUxJVEVfVEhSRUFEU0FGRT0xIGlzIGFkZGVkIGluIHRoZSBvdGhlciBicmFuY2g/IFRo
YXQgc2VlbXMKPiBpbmNvbnNpc3RlbnQuIE15IHNldHVwIGhhcyBCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTPXksIHNvIEkgY2FuIG9ubHkKPiBjb25maXJtIHRoZSBicmFuY2ggd2l0aCB0aHJlYWRz
IHdvcmtzLgoKV2hlbiB1c2luZyB0aGUgLi9jb25maWd1cmUgLS1oZWxwIGNvbW1hbmQgaW4gdGhl
IHJlbGVhc2UgMy40OS4wIHRvCnZpZXcgdGhlIHVzYWdlLCB5b3UgY2FuIG9ubHkgc2VlIHRoZSAt
LWRpc2FibGUtdGhyZWFkc2FmZSBvcHRpb24sIGJ1dApub3QgdGhlIC0tZW5hYmxlLXRocmVhZHNh
ZmUgb3B0aW9uLiBBdXRvc2V0dXAgd2lsbCBhdXRvbWF0aWNhbGx5CmRldGVjdCB3aGV0aGVyIHRo
cmVhZHMgYXJlIHN1cHBvcnRlZCBhbmQgc2V0IFNRTElURV9USFJFQURTQUZFIHRvIDEgb3IKMC4g
SWYgdGhyZWFkcyBhcmUgc3VwcG9ydGVkLCBTUUxJVEVfVEhSRUFEU0FGRT0xIGlzIGF1dG9tYXRp
Y2FsbHkgc2V0CmJ5IGRlZmF1bHQsIGJ1dCB5b3UgY2FuIGZvcmNlIFNRTElURV9USFJFQURTQUZF
PTAgd2l0aCB0aGUKLS1kaXNhYmxlLXRocmVhZHNhZmUgb3B0aW9uLgoKSW4gbXkgb3Bpbmlvbiwg
QXV0b3NldHVwIGhhcyBhbHJlYWR5IGRvbmUgd2hhdCBpdCBzaG91bGQgZG8uIEkgd2lsbApkZWxl
dGUgdGhlIGxpbmVzIHJlbGF0ZWQgdG8gdGhyZWFkIHNhZmV0eSBvcHRpb25zIGluIHRoZSBzcWxp
dGUubWsKZmlsZS4KCgo+Cj4gPj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX05DVVJTRVMpJChCUjJf
UEFDS0FHRV9SRUFETElORSkseXkpCj4gPj4gICBTUUxJVEVfREVQRU5ERU5DSUVTICs9IG5jdXJz
ZXMgcmVhZGxpbmUKPiA+PiAtU1FMSVRFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZWRpdGxpbmUg
LS1lbmFibGUtcmVhZGxpbmUKPiA+PiAgIGVsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJFRElU
KSx5KQo+ID4+ICAgU1FMSVRFX0RFUEVOREVOQ0lFUyArPSBsaWJlZGl0Cj4gPj4gLVNRTElURV9D
T05GX09QVFMgKz0gLS1lbmFibGUtZWRpdGxpbmUgLS1kaXNhYmxlLXJlYWRsaW5lCj4gPj4gK1NR
TElURV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXJlYWRsaW5lIC0tZWRpdGxpbmUKPiA+PiAgIGVs
c2UKPiA+PiAtU1FMSVRFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZWRpdGxpbmUgLS1kaXNhYmxl
LXJlYWRsaW5lCj4gPj4gK1NRTElURV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXJlYWRsaW5lCj4g
Pj4gICBlbmRpZgo+ID4+Cj4gPj4gLSQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKPiA+PiAt
JChldmFsICQoaG9zdC1hdXRvdG9vbHMtcGFja2FnZSkpCj4gPj4gK2lmZXEgKCQoQlIyX1BBQ0tB
R0VfU1FMSVRFX0VOQUJMRV9GVFMzKSx5KQo+ID4+ICtTUUxJVEVfQ09ORl9PUFRTICs9IC0tZnRz
Mwo+ID4+ICtlbmRpZgo+ID4+ICsKPiA+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9TUUxJVEVfRU5B
QkxFX0pTT04xKSwpCj4gPj4gK1NRTElURV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWpzb24KPiA+
PiArZW5kaWYKPiA+PiArCj4gPj4gK1NRTElURV9DT05GX0VOViA9IENGTEFHUz0iJChTUUxJVEVf
Q0ZMQUdTKSIKPiA+PiArCj4gPj4gK2RlZmluZSBTUUxJVEVfQ09ORklHVVJFX0NNRFMKPiA+PiAr
ICAgIChjZCAkKEBEKTsgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoU1FMSVRFX0NPTkZfRU5W
KSAuL2NvbmZpZ3VyZSBcCj4gPj4gKyAgICAgICAgICAgIC0tcHJlZml4PS91c3IgXAo+ID4+ICsg
ICAgICAgICAgICAtLWhvc3Q9IiQoR05VX1RBUkdFVF9OQU1FKSIgXAo+ID4+ICsgICAgICAgICAg
ICAtLWJ1aWxkPSIkKEdOVV9IT1NUX05BTUUpIiBcCj4gPj4gKyAgICAgICAgICAgIC0tc3lzcm9v
dD0iJChTVEFHSU5HX0RJUikiIFwKPiA+PiArICAgICAgICAgICAgJChTUUxJVEVfQ09ORl9PUFRT
KSBcCj4gPj4gKyAgICApCj4gPj4gK2VuZGVmCj4gPj4gKwo+ID4+ICtkZWZpbmUgU1FMSVRFX0JV
SUxEX0NNRFMKPiA+PiArICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpCj4g
Pj4gK2VuZGVmCj4gPj4gKwo+ID4+ICtkZWZpbmUgU1FMSVRFX0lOU1RBTExfU1RBR0lOR19DTURT
Cj4gPj4gKyAgICAkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSBERVNURElSPSIkKFNUQUdJTkdf
RElSKSIgLUMgJChARCkgaW5zdGFsbAo+ID4+ICtlbmRlZgo+ID4+ICsKPiA+PiArZGVmaW5lIFNR
TElURV9JTlNUQUxMX1RBUkdFVF9DTURTCj4gPj4gKyAgICAkKFRBUkdFVF9NQUtFX0VOVikgJChN
QUtFKSBERVNURElSPSIkKFRBUkdFVF9ESVIpIiAtQyAkKEBEKSBpbnN0YWxsCj4gPj4gK2VuZGVm
Cj4gPj4gKwo+ID4+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+ID4KPiA+IFdlIGFsc28g
bmVlZCBob3N0LWdlbmVyaWMtcGFja2FnZSB0byByZXBsYWNlIHRoZSBob3N0LWF1dG90b29scy1w
YWNrYWdlCj4gPiByZW1vdmVkIGFib3ZlLgo+ID4KPiA+IGJhcnVjaAo+ID4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
