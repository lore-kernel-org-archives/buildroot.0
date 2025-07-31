Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51709C87FCA
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 13:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FFDF84674;
	Thu, 31 Jul 2025 13:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ7ohkT7pLGw; Thu, 31 Jul 2025 13:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B66CE8465A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B66CE8465A;
	Thu, 31 Jul 2025 13:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85184160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76B518465A
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODigHAsc0Nms for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 13:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E33683F0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E33683F0B
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E33683F0B
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:09:00 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-32b5931037eso6653671fa.2
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753967338; x=1754572138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lUK3n1JhTQlXETtduu3p97evHLMP8Wr79Jw9HHZYGiY=;
 b=Ye0EPGOlnDPqZVC7AarWsE7IoNAgrR81pWulcbNqIebEx430KEH2BNnBuC0diGOTcl
 blAQPA/dRBygiBHDB5tAo1TcA2ay0KFgTBIPZT8zouNZgBEWtNLCPtvAEMC9kPXvdOKN
 z0W4qy9EPqMjI7yEzSJLcJy3jn8CZbwSZ2FChQHBmISSPRwJ9HF19vm9LLZIt4389lP/
 R1VVnYsirUEraRBg9Q7qNiZt7lc4X3JoTyl3jYykVGYnJS6Pj6CyaWYVBBTfyb3phBi4
 gd9czimndBZhSoobSWGcY4QaN7dVgApTVAkdVlM91DkE4ggk/7Ll5opAtkvFtUyIYP8V
 nB7g==
X-Gm-Message-State: AOJu0YxDPGS9vYAPx/JQY36eAC0sgpRsQef8e8lq5Ak7HSt9BPDjVaDJ
 GSd353szHxXzvsLSA1s/TjPMBzQqnlfsbX15xFsYobgw7+fjn9gEf/niQ2GzeB/xioGOVdYnTdB
 DLO2mIRLW/7KaJqjlSg37gvibJJYltC4=
X-Gm-Gg: ASbGncvD6t2DxVcVScv5y7RHe2tn4IjHRpHLC9GjwjanYcbTvRAkjV5D4fmamvJvMUZ
 q9WrBX0qi0YCTxpiumb4S5ek5AG8t0URmwAfAghux7mC2Udg7XD6PS6o/QwP24ASJc05xWN8JBh
 6vDtVMO4cpBwBRC3TKmNt9MuP5BtV8Srd+WgTcmXkoXRe0pq7q5c1K+1UFZCwbV17zXosx28N2N
 5rpi/OO
X-Google-Smtp-Source: AGHT+IHQh6kcSFOMvULLuIhVTViVA0/A166nrC+APaB1xPEiUniTVp84tQO9ZrCx1NUyDxIhYMLzXZSPyZFnR/I6o6o=
X-Received: by 2002:a05:651c:4010:b0:332:133b:1513 with SMTP id
 38308e7fff4ca-33224bfee4fmr17655391fa.30.1753967337781; Thu, 31 Jul 2025
 06:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250725120743.3705187-1-yegorslists@googlemail.com>
 <20250728225622.13378e9f@windsurf>
In-Reply-To: <20250728225622.13378e9f@windsurf>
Date: Thu, 31 Jul 2025 15:08:43 +0200
X-Gm-Features: Ac12FXzpOaQUVl4yTXHYknK5VCpPDoBXMKA6VEiOHfdD_Y2zhfNI0f1woPbncU8
Message-ID: <CAGm1_kti-OGNxHoOHrG1swqAXxsBJSo=v5isY01jp_o_Wkt05Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: yegorslists--- via buildroot <buildroot@buildroot.org>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1753967338; x=1754572138; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lUK3n1JhTQlXETtduu3p97evHLMP8Wr79Jw9HHZYGiY=;
 b=N2aqFjfNbGdltPRqPCK0iJPt6m0SWcQwRDRTx2jGP/M8g4qjdGpjafwnp3pFwRg+Oy
 t3m9MFa7/t5P3CSXhMNLPwmfR/tyC7WxvbPRgP06BGHSZvOHdo4q/h/5NrLsud7jDaBq
 M/XY1SzE5/4qrrBIhQodlQB899AjbBKV8Mg+2+zBAa27BBpprf3c6XkQnIVVfGLnxec/
 DZlo8/gFcRNFTA80P9QruSPClLbYdlfNSeIuA+I108sSPGWHL5XLEuupUQL5KoJFF9Yr
 AV/bmi1NUKAVNZn6MoKWAApreS5HF2T7FzNh0pQoeZXje/TVIrBE5y0J5iYA0HuwGs91
 XIog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N2aqFjfN
Subject: Re: [Buildroot] [PATCH v2] package/libxmlrpc: fix boolean
 definitions
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

SGkgVGhvbWFzLAoKT24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgMTA6NTbigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+
Cj4gT24gRnJpLCAyNSBKdWwgMjAyNSAxNDowNzo0MyArMDIwMAo+IHllZ29yc2xpc3RzLS0tIHZp
YSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPgo+ID4gRnJvbTog
WWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+ID4KPiA+IERvbid0
IGRlZmluZSBib29sZWFuIG1hY3JvcyBmb3IgQzIzIHN0YW5kYXJkIGFzIHRoZXkgYXJlIGltcGxl
bWVudGVkCj4gPiBhcyBrZXl3b3Jkcy4KPiA+Cj4gPiBGaXhlcyB0aGUgZm9sbG93aW5nIGVycm9y
Ogo+ID4KPiA+IG1ha2VbMl06IEVudGVyaW5nIGRpcmVjdG9yeQo+ID4gJy9ob21lL3VzZXIvRG9j
dW1lbnRzL3ZlcnNpb25lZC9vc3MveG1scnBjLWMvbGliL3V0aWwnCj4gPiBnY2MgLWMgLUROREVC
VUcgLXB0aHJlYWQgLVdhbGwgLVcgLVduby11bmluaXRpYWxpemVkIC1XdW5kZWYKPiA+IC1Xbm8t
dW5rbm93bi1wcmFnbWFzIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgLVdzdHJpY3QtcHJvdG90eXBl
cwo+ID4gLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdpbXBsaWNpdCAtZm5vLWNvbW1vbiAtZyAtTzMK
PiA+IC1Jc3JjZGlyL2xpYi91dGlsL2luY2x1ZGUKPiA+IC1JL2hvbWUvdXNlci9Eb2N1bWVudHMv
dmVyc2lvbmVkL29zcy94bWxycGMtYyAgIGNhc3ByaW50Zi5jCj4gPiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gY2FzcHJpbnRmLmM6OToKPiA+IHNyY2Rpci9saWIvdXRpbC9pbmNsdWRlL2Jvb2wuaDox
Mzo1OiBlcnJvcjogY2Fubm90IHVzZSBrZXl3b3JkIOKAmGZhbHNl4oCZCj4gPiBhcyBlbnVtZXJh
dGlvbiBjb25zdGFudAo+ID4gICAgMTMgfCAgICAgZmFsc2UgPSAwLAo+ID4gICAgICAgfCAgICAg
Xn5+fn4KPiA+IHNyY2Rpci9saWIvdXRpbC9pbmNsdWRlL2Jvb2wuaDoxMzo1OiBub3RlOiDigJhm
YWxzZeKAmSBpcyBhIGtleXdvcmQgd2l0aAo+ID4g4oCYLXN0ZD1jMjPigJkgb253YXJkcwo+ID4g
c3JjZGlyL2xpYi91dGlsL2luY2x1ZGUvYm9vbC5oOjE1OjM6IGVycm9yOiBleHBlY3RlZCDigJg7
4oCZLCBpZGVudGlmaWVyCj4gPiBvciDigJgo4oCZIGJlZm9yZSDigJhib29s4oCZCj4gPiAgICAx
NSB8IH0gYm9vbDsKPiA+ICAgICAgIHwgICBefn5+Cj4gPiBzcmNkaXIvbGliL3V0aWwvaW5jbHVk
ZS9ib29sLmg6MTU6Mzogd2FybmluZzogdXNlbGVzcyB0eXBlIG5hbWUgaW4KPiA+IGVtcHR5IGRl
Y2xhcmF0aW9uCj4gPgo+ID4gVXBzdHJlYW06IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3AveG1s
cnBjLWMvY29kZS8zMzE4Lwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5
ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPgo+IFRoYW5rcywgbG9va3MgZ29vZC4KPgo+IFJl
dmlld2VkLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
Pgo+Cj4gU2hvdWxkbid0IHdlIHRyeSB0byB1cGRhdGUgKHNlcGFyYXRlbHkpPyBBcHBhcmVudGx5
IHdlJ3JlIHN0aWxsIHVzaW5nOgo+Cj4gIyAxLjYwLjAxIChjb2RlL2FkdmFuY2VkQHIzMTc2KQo+
IExJQlhNTFJQQ19WRVJTSU9OID0gcjMxNzYKPgo+IEJ1dCB0aGVyZSdzIGEgbmV3IDEuNjAuMDUg
YWNjb3JkaW5nIHRvCj4gaHR0cHM6Ly94bWxycGMtYy5zb3VyY2Vmb3JnZS5pby9jaGFuZ2Vfc3Vw
ZXJfc3RhYmxlLmh0bWw6Cj4KPiBSZWxlYXNlIDEuNjAuMDUKPgo+IFJlbGVhc2VkIDI1LjAzLjI4
Cj4KPiAgICAgRml4IGNyYXNoIHdoZW4gbWVtb3J5IGFsbG9jYXRpb24gZmFpbHMgaW4gWE1MIHBh
cnNpbmcsIHdoZW4gYnVpbHQgdG8gdXNlIGxpYnhtbDIgWE1MIHBhcnNlci4gQnJva2VuIGluIFht
bHJwYy1jIDEuNTcgKERlY2VtYmVyIDIwMTkpLgo+ICAgICBCdWlsZDogZml4IGZhaWx1cmUgdG8g
aW5zdGFsbCBpbnRlcmZhY2UgaGVhZGVyIGZpbGVzIHdoZW4gdXNpbmcgc2VwYXJhdGUgYnVpbGQg
ZGlyZWN0b3J5Lgo+Cj4gTWF5YmUgd2Ugc2hvdWxkIHVzZSBpdD8KCkkgYW0gd29ya2luZyBvbiB0
aGlzLiBUaG91Z2ggbGlieG1sMiBkb2Vzbid0IHBsYXkgYW55IHJvbGUgbm93IGJ1dCBpdAp3aWxs
IGFmdGVyIGFuIHVwZGF0ZS4KCkJlc3QgcmVnYXJkcywKWWVnb3IKCj4gQmVzdCByZWdhcmRzLAo+
Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
