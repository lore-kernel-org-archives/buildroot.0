Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13606C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 23:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A24C96068B;
	Sun,  2 Jun 2024 23:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glI_8j0Ht0bQ; Sun,  2 Jun 2024 23:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99D4A6068F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D4A6068F;
	Sun,  2 Jun 2024 23:33:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86B7F1BF5DF
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 23:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 679DC6068F
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 23:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KakRXaRUh8uM for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 23:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=wilfred.opensource@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE28A6068B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE28A6068B
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE28A6068B
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 23:33:22 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1f44b4404dfso32799845ad.0
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 16:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717371202; x=1717976002;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VuZzTnhitexGTxiZPy+KMIR2yupaT1Ot+Oghb6zm2TA=;
 b=SkvV5LUe1doXeVVnFMHWbaZpEcH7sWAWt5rd8eXcG3IuWUDhWhOZ38AnGhcHy5mEgu
 /IZtzXOTvfWpMzKt1USLWquQxBPggZrcLy98W5c8oapbpXpLqFtRI3PjRGBurQaJO4LX
 2i45LIjc/+eleuvzwQfdW6kwpTGTXm5l+r13IrAT5+aKqLMHw4m4+sgJk/GhebxJJHOX
 NvwLBASrFICzSMlqqI4qIQWiigoGF9uJrTgqog2Cb8Y3/GMW9MfvrEhkGszbzO4hlWIf
 qzjcJDap6KyTtYGTOnQ/YhOsdojRvFZqp+A4qPsZDEmzjAOdweo3h+qOE6WXBrqpqw2z
 IY+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUywsDXsfydmDbwplztYCCAyIN0LIF0F7jaOTWrRILI6CUABuhAORXKu+UVYzA1V8sWixjg4Kj369vRPq86ZIXli1XKrIOkYg==
X-Gm-Message-State: AOJu0YzrRDc5Ldn5n6Lb3SlLlWYqoMFVx8bwulbikpyBJB+DyQP0EpcY
 vdldYSzGJIDWw0Bdz2Sm7r2iN/w/SoQ2YxZsQ71GV4KIArQF0/JD/PRBiA==
X-Google-Smtp-Source: AGHT+IFbnwrYd4fwB/S/N0smpVnCChOGcUI1789I0wAXqdZpxH/6F1GoZbgjWMBMS/FCHi7g4EdtOA==
X-Received: by 2002:a17:902:e54a:b0:1f4:b43f:9c18 with SMTP id
 d9443c01a7336-1f63704143cmr97496415ad.33.1717371201711; 
 Sun, 02 Jun 2024 16:33:21 -0700 (PDT)
Received: from [192.168.0.37] ([159.196.15.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f632416d7asm53329495ad.286.2024.06.02.16.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:33:20 -0700 (PDT)
Message-ID: <72ec38822daba77295f1c427846d06791ebc3010.camel@gmail.com>
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Wilfred Mallawa
 <wilfred.mallawa@wdc.com>
Date: Mon, 03 Jun 2024 09:33:17 +1000
In-Reply-To: <ZlnYnjOZ26-UO7xb@landeda>
References: <20240531031938.19992-2-wilfred.mallawa@wdc.com>
 <ZlnYnjOZ26-UO7xb@landeda>
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717371202; x=1717976002; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VuZzTnhitexGTxiZPy+KMIR2yupaT1Ot+Oghb6zm2TA=;
 b=mdkESeFepx0fMEGqjbh9k5Am45gvHxGXFdls4oE0IksdpkmdofSnrOj0gmLD/NkBI/
 IWDviKiHvRVOFMvp69mUU2V0JDd/faJS9qmmC0fofivg63Flgg6A/fvOBbUAo4AxipWm
 +oq5X2EMIqvqsjFXqAYmEwyWeydcaN+1PCw7F+60ApM3T88dNpBoihQZeT1DOFGhRpI0
 L/NRhZgXB3U4eIr0AibqbXduLUkzZFK6AGFK1h9O0AEeuaLiKe7ffdPJEnBnMqE6kYnD
 5OV3seMGcF3lsHvR7q23+iQ449voFkxo0Xufls+gmkwd4EORlHAS1Lfx0i2ExaYx/tD7
 eVTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mdkESeFe
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: bump version to 3.3.0
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMDI0LTA1LTMxIGF0IDE2OjAzICswMjAwLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+
IFdpbGZyZWQsIEFsbCwKPiAKPiBPbiAyMDI0LTA1LTMxIDEzOjE5ICsxMDAwLCBXaWxmcmVkIE1h
bGxhd2EgdmlhIGJ1aWxkcm9vdCBzcGFrZQo+IHRodXNseToKPiA+IEFkZCBwZW5kaW5nIHVwc3Ry
ZWFtIHBhdGNoIHRoYXQgZml4ZXMgdGhlIGluY29ycmVjdCBwYXJzaW5nIG9mCj4gPiBjZXJ0aWZp
Y2F0ZXMgd2l0aCBgaWQtRE1URi1oYXJkd2FyZS1pZGVudGl0eSBPSURgIHRhZ3MuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+
Cj4gWy0tU05JUC0tXQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlic3BkbS9saWJzcGRtLm1r
Cj4gPiBiL3BhY2thZ2UvbGlic3BkbS9saWJzcGRtLm1rCj4gPiBpbmRleCAyZWMzNWJlMGFjLi4z
NDFhOThlYmY1IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0ubWsKPiA+
ICsrKyBiL3BhY2thZ2UvbGlic3BkbS9saWJzcGRtLm1rCj4gPiBAQCAtNCw3ICs0LDcgQEAKPiA+
IMKgIwo+ID4gwqAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICMjIyMjIyMjIyMjIyMjCj4gPiDCoAo+ID4gLUxJQlNQ
RE1fVkVSU0lPTiA9IDMuMi4wCj4gPiArTElCU1BETV9WRVJTSU9OID0gMy4zLjAKPiA+IMKgTElC
U1BETV9TSVRFID0gJChjYWxsIGdpdGh1YixETVRGLGxpYnNwZG0sJChMSUJTUERNX1ZFUlNJT04p
KQo+ID4gwqBMSUJTUERNX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPiA+IMKgTElCU1BETV9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRS5tZAo+ID4gQEAgLTI3LDcgKzI3LDkgQEAgTElCU1BETV9DT05G
X09QVFMgPSBcCj4gPiDCoAktRENPTVBJTEVEX0xJQlNTTF9QQVRIPS91c3IvbGliLyBcCj4gPiDC
oAktRERJU0FCTEVfVEVTVFM9MSBcCj4gPiDCoAktRERJU0FCTEVfRUREU0E9MSBcCj4gPiAtCS1E
TElOS19GTEFHUz0kKFNUQUdJTkdfRElSKQo+ID4gKwktRERJU0FCTEVfTFRPPTEgXAo+ID4gKwkt
RExJTktfRkxBR1M9JChTVEFHSU5HX0RJUikgXAo+ID4gKwktRENNQUtFX0NfRkxBR1M9Ii1ETElC
U1BETV9FTkFCTEVfQ0FQQUJJTElUWV9FVkVOVF9DQVA9MCIKPiA+IC4uCj4gCj4gV2h5IGRvIHlv
dSBoYXZlIHRvIGV4cGxpY2l0bHkgZGlzYWJsZSBMVE8/CkFoIHRoaXMgaXMgYWN0dWFsbHkgbm90
IHJlcXVpcmVkISBJIHRoaW5rIHRoaXMgd2FzIGZyb20gZGVidWdnaW5nIGFuCmlzc3VlIGZvciBh
biBBUk0gYnVpbGQuIFdpbGwgcmVtb3ZlIGluIFYyLiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMK
b3V0Lgo+IAo+IENhbiB5b3UgYWxzbyBleHBsYWluIGluIGEgZmV3IHdvcmRzIHdoYXQgdGhhdCBu
ZXcgb3B0b2luCj4gTElCU1BETV9FTkFCTEVfQ0FQQUJJTElUWV9FVkVOVF9DQVA9MCBtZWFucz8K
VGhpcyBmbGFnIGRpc2FibGVzIGFuIFNQRE0gZmVhdHVyZSBjYWxsZWQgRVZFTlRTLCAiVGhlIFNQ
RE0gZXZlbnQKbWVjaGFuaXNtIHByb3ZpZGVzIGEgZnJhbWV3b3JrIGZvciB0aGUgYXN5bmNocm9u
b3VzIG5vdGlmaWNhdGlvbiBvZgpldmVudHMgb3ZlciBhIHNlY3VyZSBzZXNzaW9uIiAtIFNQRE0g
MS4zLCAxMC4yOC4KCkhvd2V2ZXIsIGl0IHJlcXVpcmVzIHNvbWUgYWRkaXRpb25hbCBmdW5jdGlv
bnMgdG8gYmUgaW1wbGVtZW50ZWQgYXQKbGluayB0aW1lLiBTbyBpdCBpcyBkaXNhYmxlZCBmb3Ig
dGhlIHRpbWUgYmVpbmcsIGFzIGl0IGlzIGFuIG9wdGlvbmFsCmZlYXR1cmUuCgo+IAo+IFJlZ2Fy
ZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPiA+IMKgZGVmaW5lIExJQlNQRE1fSU5TVEFMTF9TVEFH
SU5HX0NNRFMKPiA+IMKgCW1rZGlyIC1wICQoU1RBR0lOR19ESVIpL3Vzci9saWIKPiA+IC0tIAo+
ID4gMi40NS4xCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
