Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C44DCF394B
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 16:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC30941084;
	Wed, 19 Nov 2025 16:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjhJaO4TzS5u; Wed, 19 Nov 2025 16:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4624741063
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4624741063;
	Wed, 19 Nov 2025 16:32:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBE13158
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD4AE607E2
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEr_VitLDgLC for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 16:32:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A446607DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A446607DA
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A446607DA
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:32:22 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-37b9728a353so70447281fa.0
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 08:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763569940; x=1764174740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Y92fnlTPjdDqtc9ey5lX/w69vz34y2fSxmLKzoffAc=;
 b=w7ivi59Tgnu3XEuT+Ki/s+Lc6S0Od758RwW+zAABjOvYU5fuEW4QBMq9D2ugf8XAFv
 ZkLHI2J2HfqOmzUK0mS0HCRyPoH5/mh9umrxjkSvO3Tuo1WybrsAz1oZZ8GNn5nu3sJV
 79TrkoK1viUAn364w9nS3msE6c6Y+6wRgXTvRj1ewcdZeQSJjOFCUIdy0SDuc8RaVf/P
 wy0z0wywD1lb9DJx3yKb4eScgdhwdL8NYhu0ZhOtwEs60CXOl+HotIORDY9YuPPwkCKG
 fS9TkO4mzonb6nDgu+XZQkzlodoKT0THisTNrZcGTBrhqHp0k1oNjBDlJRt73VzbouVx
 f3nA==
X-Gm-Message-State: AOJu0YyUVQgSDRiVUTLdYt6mtFfvAZDI+PpTDKwKkiwKRQYZwOCH/tnd
 44TEdjGeRWUcejiInVkc6gxorTGHXJWTND9UC50eSHWu4LMHIL22uh2IgD2T4gPnHU0imCq8deW
 XtxRe2Mh2jdUr0YBTvougom5Wpp5QOvc=
X-Gm-Gg: ASbGncuEPh499qByMXHqTJ2utsqaofilCGV2dVUYc23VnefsG6qPK70/2Vq+IW6ERBa
 62yF7bKJDHu7VUVaHL3lYfwHj1adlWe3SKS8KtMAS/Ai+CtW5MEe0udliaSKhudi+yyDxWgEOkO
 5o6FUAVoUhLfBDxCvgdGrsN4Q3DnuUJPssNTcTqFz4XCNrq2T7vDP9iBtOOmmAY2/mnp0urE+A+
 59eQ9vTgfyKkWcqCBaKM4meR1NSnZXGCRfuhA6z3cBxAg1lKbBtV4y5kH8QJrPdSyUONP8omcUM
 XEmFIJTMaX5IE10pc2nJbFU1FEE7j6/9fRrq0A==
X-Google-Smtp-Source: AGHT+IGSKs/VkSyxcEYlQ1j8yf0kvv+SMHECJ3bZqfmWz/VJYYkhUGT4oJrKSmHmXqswWxdSsh52TW20GZCYAy/w3c8=
X-Received: by 2002:a05:651c:a049:b0:37b:9a1d:deee with SMTP id
 38308e7fff4ca-37cc67c2639mr79721fa.22.1763569939800; Wed, 19 Nov 2025
 08:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <CADvTj4qKBNEobk78FM1Zxj8n1irVV+LaApwWR=rDcbwf8+2mmg@mail.gmail.com>
In-Reply-To: <CADvTj4qKBNEobk78FM1Zxj8n1irVV+LaApwWR=rDcbwf8+2mmg@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 19 Nov 2025 17:32:08 +0100
X-Gm-Features: AWmQ_bl9GOAE-6rFoTzAI9pLVSMjNAJ3ZpYUspVV3UnLdc0Uc7-yalUcLYJ9FBA
Message-ID: <CADYdroNVCmUqTZB6cZ6r3=pnvARiGrnd6V+FeY3cO4tLFFUCEQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763569940; x=1764174740; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Y92fnlTPjdDqtc9ey5lX/w69vz34y2fSxmLKzoffAc=;
 b=j6BazmPkdzYWV9rs0MpJzPba3eMqCzPOemvGoB6CgS/kjAmMiiGpRjn6R1UeoEp/aJ
 UO96sRG4M4IS7mo/Loj89aUNWIKn3FWB1uecQdV3EVpvASFh7/UawhyZ0CL5drOHO8yg
 0FM0Md7clsmW281yOCLY+/IpkleM5QL9v2dEdKVJMn/wDz9rA++BNfllaKCHDctVMN9h
 7THtGjuKob7Ghm872nTfhnKx1wRWUZbKm+YlHz/PXQeGqA6cE2lPyo4C7qbeWS/Layzi
 QJJn+C9hokYyFRGXEmvYCdt/p7Y1WVoCDLhYR8yiTQI5FQK7InRVyQfi57KTi0sz9PRq
 7/NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j6BazmPk
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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

QW0gTWkuLCAxOS4gTm92LiAyMDI1IHVtIDE3OjE2IFVociBzY2hyaWViIEphbWVzIEhpbGxpYXJk
CjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPjoKPgo+IE9uIFdlZCwgTm92IDE5LCAyMDI1IGF0
IDg6NTfigK9BTSBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPiB3cm90ZToKPiA+
Cj4gPiBBbGwgdGhvc2UgZmVhdHVyZXMgYXJlIG9wdGlvbmFsIGFuZCBwcmV2ZW50IGN1c3RvbWl6
YXRpb24gb2YgdGhlIGtlcm5lbC4KPiA+IEZvcmNpbmcgSVB2NiBpcyBwYXJ0aWN1bGFybHkgbmFz
dHkuCj4KPiBXaGF0IGlzc3VlIGFyZSB5b3Ugc2VlaW5nIGZyb20gZm9yY2luZyBJUFY2PwoKQWRk
aXRpb25hbCBpbnRlcmZhY2VzIGFuZCBmdW5jdGlvbmFsaXR5IEkgZG9uJ3Qgd2FudCB0byBzZWUg
aW4gYW4KZW1iZWRkZWQgZGV2aWNlCmlmIEkgZGlzYWJsZSBJUFY2IGluIHRoZSBrZXJuZWwgY29u
ZmlnLgoKPgo+ID4KPiA+IFRoaXMgcmV2ZXJ0cyBwYXJ0cyBvZiAicGFja2FnZS9zeXN0ZW1kOiBi
dW1wIHRvIHZlcnNpb24gMjU2LjQiCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBMYW5n
ZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2Uvc3lzdGVtZC9zeXN0
ZW1kLm1rIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQu
bWsgYi9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+ID4gaW5kZXggMTI2Y2U3NzE2Zi4uMGVl
NjgwZTU1ZSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gPiAr
KysgYi9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+ID4gQEAgLTg2MywzNSArODYzLDE2IEBA
IGRlZmluZSBTWVNURU1EX0xJTlVYX0NPTkZJR19GSVhVUFMKPiA+Cj4gPiAgICAgICAgICQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0RNSUlEKQo+ID4KPiA+IC0gICAgICAgJChjYWxs
IEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQkxLX0RFVl9CU0cpCj4gPiAtCj4KPiBUaGlzIGlz
IGxpc3RlZCBhcyByZXF1aXJlZCBmb3IgIlN1cHBvcnQgZm9yIHNvbWUgU0NTSSBkZXZpY2VzIHNl
cmlhbAo+IG51bWJlciByZXRyaWV2YWwiOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5
c3RlbWQvYmxvYi92MjU4LjIvUkVBRE1FI0wxMDYtTDEwOAoKSSBkb250IGhhdmUgU0NTSQoKPgo+
ID4gICAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORVRfTlMpCj4gPgo+
ID4gICAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19VU0VSX05TKQo+ID4K
PiA+ICAgICAgICAgJChjYWxsIEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX1NZU0ZTX0RFUFJF
Q0FURUQpCj4gPgo+ID4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19J
UFY2KQo+ID4gICAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19BVVRPRlNf
RlMpCj4gPiAgICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0FVVE9GUzRf
RlMpCj4gPiAgICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1RNUEZTX1BP
U0lYX0FDTCkKPiA+ICAgICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfVE1Q
RlNfWEFUVFIpCj4gPiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1NF
Q0NPTVApCj4gPiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1NFQ0NP
TVBfRklMVEVSKQo+ID4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19L
Q01QKQo+ID4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORVRfU0NI
RUQpCj4gPiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX05FVF9TQ0hf
RlFfQ09ERUwpCj4KPiBUaGVzZSBvcHRpb25zIGFyZSAiT3B0aW9uYWwgYnV0IHN0cm9uZ2x5IHJl
Y29tbWVuZGVkIjoKPiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2Jsb2IvdjI1
OC4yL1JFQURNRSNMMTE4LUwxMjgKClllcywgc28gbGV0IHRoZSB1c2VyIGVuYWJsZSB0aGVtIGlm
IHRoZXkgbmVlZCBpdC4gQnVpbGRyb290IGlzIG5vdCB0aGUgY29tbW9uCmRlc2t0b3Agc3lzdGVt
LgoKPgo+ID4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19DR1JPVVBf
U0NIRUQpCj4gPiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0ZBSVJf
R1JPVVBfU0NIRUQpCj4KPiBUaGVzZSBhcmUgIlJlcXVpcmVkIGZvciBDUFVTaGFyZXM9IGluIHJl
c291cmNlIGNvbnRyb2wgdW5pdCBzZXR0aW5ncyI6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3N5c3Rl
bWQvc3lzdGVtZC9ibG9iL3YyNTguMi9SRUFETUUjTDEzMC1MMTMyCgpZZXMsIGlmIHlvdSB1c2Ug
dGhlbT8KCj4KPiA+IC0gICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQ0ZT
X0JBTkRXSURUSCkKPgo+IFRoaXMgaXMgIlJlcXVpcmVkIGZvciBDUFVRdW90YT0gaW4gcmVzb3Vy
Y2UgY29udHJvbCB1bml0IHNldHRpbmdzIjoKPiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9z
eXN0ZW1kL2Jsb2IvdjI1OC4yL1JFQURNRSNMMTM0LUwxMzUKClllcywgaWYgeW91IHVzZSB0aGVt
PwoKPgo+ID4gLQo+ID4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19F
RklWQVJfRlMpCj4gPiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0VG
SV9QQVJUSVRJT04pCj4KPiBUaGVzZSBhcmUgcmVxdWlyZWQgIkZvciBVRUZJIHN5c3RlbXMiIDoK
PiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2Jsb2IvdjI1OC4yL1JFQURNRSNM
MTUzLUwxNTUKCk9ubHkgaWYgeW91IHdhbnQgdG8gbWFuYWdlIHRoZSBib290bG9hZGVyIHdpdGgg
c3lzdGVtZCBhbmQgZnJvbSB3aXRoaW4KdGhlIHN5c3RlbS4gTm90IHJlYWxseSBpbnRlcmVzdGlu
ZyBmb3IgYSBzZXR1cCB0aGF0IGJhcmVseSB3aWxsIGJlIHR1cm5lZCBvZmYuCgo+ID4gLQo+ID4g
LSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ETUkpCj4gPiAtICAgICAg
ICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0RNSV9TWVNGUykKPgo+IFRoZXNlIGFy
ZSAiUmVxdWlyZWQgZm9yIHJlYWRpbmcgY3JlZGVudGlhbHMgZnJvbSBTTUJJT1MiOgo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvYmxvYi92MjU4LjIvUkVBRE1FI0wxNjZDOS1M
MTY4CgpXaGF0IHNob3VsZCBJIGRvIHdpdGggdGhvc2U/CgpJIGNhbiByZWFkIHRoZSBSZWFkbWUg
YnR3LgoKSSB1c2VkIEJSIDIwMjQuMDIgYmVmb3JlLCB0aGUgc3lzdGVtIGRvZXMgd2hhdCBpdCBz
aG91bGQsIGl0cyBub3QgYQp1c2VyIGZhY2luZyBkZXNrdG9wIHN5c3RlbSwKYW5kIEkgd291bGQg
d2FudCB0aGUga2VybmVsIGNvbXBpbGVkIGFzIEkgc3BlY2lmeSBpdC4gU2V2ZXJhbCBvZiB0aG9z
ZQpvcHRpb25zIGNvbXBsaWNhdGUKc2V0dXAgb3IgY2FuIGltcGVkZSByZWFsdGltZSBjaGFyYWN0
ZXJpc3RpY3MuCgpOb3cgIEJSIDIwMjUuMDIgc2lsZW50bHkgbW9kaWZpZXMgdGhlIGF1ZGl0ZWQg
a2VybmVsIGNvbmZpZyB3aXRoIHN0dWZmIHRoYXQncwoKLSBub3QgbmVlZGVkIHRvIHN0YXJ0Ci0g
bm90IHVzZWQgYnkgdGhlIHNlcnZpY2UgZmlsZXMgc2hpcHBpbmcgd2l0aCBzeXN0ZW1kCi0gY2Fu
dCBiZSBwcmV2ZW50ZWQgdG8gYmUgZW5hYmxlZAoKSXRzIGEgdmFsaWQgc2NoZW1lIGZvciBEZXNr
dG9wIHN5c3RlbXMgdG8gZW5hYmxlIGV2ZXJ5dGhpbmcsCmluIGF1dG9tYXRpb24gaXRzIGEgbGlh
YmlsaXR5LgoKCnJlZ2FyZHMsIE5vcmJlcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
