Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083F5E67493
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 01:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CEC240251;
	Fri,  1 Nov 2024 01:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myPdHrnva_N5; Fri,  1 Nov 2024 01:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F65C402D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F65C402D5;
	Fri,  1 Nov 2024 01:31:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B76F5E46
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 01:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 732E080C0B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 01:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eucpanxwwNEC for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 01:31:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FF9F80BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF9F80BE9
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FF9F80BE9
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 01:31:23 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fb470a8b27so23413131fa.1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730424681; x=1731029481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVVfcwEJ1zuk9Ms19sicEEL/5C6r9LW7GsKCY6v0ZKM=;
 b=twg1/1P3P96+bI8ZW5MaY5r4lEWrOJGuuwET/FLAJ9yHbRemM304GnERYm9HxLFS1D
 eA5fiE2v4hklGRxsw3rVGaYamWSvl8nggLp0JX6p6paebaicBjzBZDUrZetfy3VFp3dB
 UTn2XKe6sDyO/e/mEUdO7J/p7069VIaUKKo/U1ZPj7WSmpfgUbk64Pfau4VxXQ6NUUg1
 /UbM/17RIv33RZzZgGB87qxFqVOF40372i9OlZoW+l0SqEnJavRUCgSzwAtZUJlgPcPq
 6CKhs1r51ExGgFJPPafvS4VLGGTjsXkmlYg3k2z3aa78e30OgBQ9ZcY56oBtto7g0gpu
 lWFA==
X-Gm-Message-State: AOJu0Yzn+IxQ1qnEaKWWBaOcgBCQrNylgdiDz2iryb5s4fAWLTHAWvNN
 dTsiTaA0kjY/Z7MZOL3FjIU9aDHgUA5/xKhBFRVjBmyuGMtZ6+eKKfRfhTgumOcNGEbhZ+Hf6R9
 EywqgT7C3XtZOHSdPDk2Eq7IwCGI=
X-Google-Smtp-Source: AGHT+IH9IYSh7Z5Jr/2QQWoEiJJf1kGxJCFiW0FtB3xHcWqnWuY9UyZpXBxJAXZ/swYusCanl9Ftznh2Z6A8QXrQt5g=
X-Received: by 2002:a05:651c:158d:b0:2fb:4b0d:9070 with SMTP id
 38308e7fff4ca-2fdef25741dmr15063541fa.10.1730424680459; Thu, 31 Oct 2024
 18:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241031191844.60ba9a59@windsurf>
In-Reply-To: <20241031191844.60ba9a59@windsurf>
From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 1 Nov 2024 09:31:08 +0800
Message-ID: <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730424681; x=1731029481; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVVfcwEJ1zuk9Ms19sicEEL/5C6r9LW7GsKCY6v0ZKM=;
 b=NkvTrdB9E+4wwbq3wr4G+vhGM4rw4uRoskJis14gIgTtYiYTbBHJagqnD9nELMutcN
 pfE99JVanR1RjbxThS/Iwhek6X5t0uQiaoBYGb3uwXnjlRhQKxGAg6qxw+DTYGAvLTgb
 RgVjBKZ3ZE4I4yx5gD6dYdmuO7dvEBOrhEyA3yGfabLyzQPyfEsthhBGRok94LfrMqPD
 EglD7meofKKbnMOWyt0NEW9lYXCOS4uY6QRTmMl/PwTKQRFgBtdW3jPfM+0gObrNpLui
 DCFi99FfF+Gjidts2GHFY6GxqfIt91N8v69UqofiZAOXwbthWEHcfIhLaBi0ghH7xcPb
 slxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NkvTrdB9
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

T24gRnJpLCBOb3YgMSwgMjAyNCBhdCAyOjE44oCvQU0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBTbyB5b3UncmUgbm8gbG9uZ2VyIHNl
dHRpbmcgLS1kaXNhYmxlLXBpZHdhaXQuLi4gYnV0IHRoYXQgd2lsbCBjYXVzZSBhCj4gZmFpbHVy
ZToKPgo+ID4gKytBU19JRihbW3Rlc3QgIngkZW5hYmxlX3BpZHdhaXQiID0geHllcyAtYSAieCRo
YXZlX3BpZGZkX29wZW4iID0geG5vXV0sCj4gPiArKyAgIEFDX01TR19DSEVDS0lORyhbZm9yIF9f
TlJfcGlkZmRfb3Blbl0pCj4gPiArKyAgIEFDX0NPTVBJTEVfSUZFTFNFKFtBQ19MQU5HX1NPVVJD
RShbCj4gPiArKyNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgo+ID4gKysjaWZuZGVmIF9fTlJfcGlk
ZmRfb3Blbgo+ID4gKysjZXJyb3IgX19OUl9waWRmZF9vcGVuIG5vdCBkZWZpbmVkCj4gPiArKyNl
bmRpZgo+ID4gKysgICAgICBdKV0sCj4gPiArKyAgICAgIEFDX01TR19SRVNVTFQoW3llc10pLAo+
ID4gKysgICAgICBBQ19NU0dfUkVTVUxUKFtub10pCj4gPiArKyAgICAgIEFDX01TR19FUlJPUihb
TmVpdGhlciBwaWRmZF9vcGVuIG9yIF9fTlJfcGlkZmRfb3BlbiBmb3VuZC4gRGlzYWJsZSBwaWR3
YWl0IHdpdGggY29uZmlndXJlIG9wdGlvbiAtLWRpc2FibGUtcGlkd2FpdF0pCj4KPgo+IC4uLiBo
ZXJlLgo+Cj4gU28gSSdtIG5vdCBzdXJlIG15IHByZXZpb3VzIHJldmlldyB3YXMgY2xlYXIgZW5v
dWdoOiB3aGF0IGlzIHdyb25nIGlzCj4gdGhlIHByb2Nwcy1uZyBwYXRjaCBpdHNlbGYsIGl0IHNo
b3VsZG4ndCBBQ19NU0dfRVJST1IoKSwgYnV0IGluc3RlYWQgaXQKPiBzaG91bGQgYXV0b21hdGlj
YWxseSBkaXNhYmxlIHBpZHdhaXQsIGFzIGlmIHRoZSB1c2VyIGhhZCBwYXNzZWQKPiAtLWRpc2Fi
bGUtcGlkd2FpdC4KPgoKSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4sIGJ1dCBJIG1heSBub3Qg
aGF2ZSBleHByZXNzZWQgbXkgdGhvdWdodHMgY2xlYXJseS4KCkJlZm9yZSB0aGlzIHBhdGNoIHdh
cyBhcHBsaWVkLCBJIGdvdCBhIGNvbXBpbGUgZXJyb3IgKG5vdCBjb25maWd1cmUKZXJyb3IpIHdo
ZW4gdGhlIHBhY2thZ2Ugd2FzIGJ1aWx0IHdpdGggbGludXgtaGVhZGVycy00LjE5LjMyMiwKVGhl
biBJIHRyaWVkIHRvIGZpZ3VyZSBvdXQgd2hhdCB3YXMgZ29pbmcgd3JvbmcgYW5kIEkgZXZlbnR1
YWxseSBmb3VuZAp0aGlzIHBhdGNoIGZyb20gdXBzdHJlYW0uCgpBZnRlciB0aGlzIHBhdGNoIHdh
cyBhcHBsaWVkLCBpdCB0aHJldyBhIGNvbmZpZ3VyZSBlcnJvciAobm90IGNvbXBpbGUKZXJyb3Ip
LCB3aGljaCBpcyB3aGF0IEkgZXhwZWN0ZWQuCgpBcyB0aGUgcGF0Y2ggc2FpZDoKVGhlIHByZXZp
b3VzIGJ1aWxkIHNldHVwIHdvdWxkIGNoZWNrIGZvciBwaWRmZF9vcGVuIHVzaW5nCkFDX0NIRUNL
X0ZVTkMgYW5kIHdvdWxkIGJlIGluY29ycmVjdGx5IHJlcG9ydGVkIGFzIHRydWUuCgpUaGVyZWZv
cmUsIEkgdGhpbmsgdGhlIGtleSB0byB0aGlzIHBhdGNoIGlzIHRoYXQgaXQgc3VjY2Vzc2Z1bGx5
IGZpeGVzCnRoZSBwaWRmZF9vcGVuIGNoZWNraW5nIGlzc3VlLgoKSWYgcGlkZmRfb3BlbigpIGFu
ZCBfX05SX3BpZGZkX29wZW4gd2VyZSBub3QgcHJlc2VudCwgaXQgd2lsbCByZXBvcnQKYW4gQUNf
TVNHX0VSUk9SIG1lc3NhZ2UsCmFuZCBnaXZlcyB1cyB0aGUgLS1kaXNhYmxlLXBpZHdhaXQgY29u
ZmlndXJlIG9wdGlvbiwgc28geW91IGFyZQpleHBsaWNpdCBpbiBub3Qgd2FudGluZyBhbmQga25v
d2luZyB5b3Ugd29udCBnZXQgcGlkd2FpdC4KCldoZXJlYXMgeW91IG1lYW4sIGluc3RlYWQgb2Yg
QUNfTVNHX0VSUk9SKCksIGl0IHNob3VsZCBhdXRvbWF0aWNhbGx5CmRpc2FibGUgcGlkd2FpdCwg
YXMgaWYgdGhlIHVzZXIgaGFkIHBhc3NlZCAtLWRpc2FibGUtcGlkd2FpdC4KSSdtIG5vdCBzdXJl
IGlmIHRoaXMgaXMgYWNjZXB0YWJsZSB0byB0aGUgdXBzdHJlYW0gbWFpbnRhaW5lcnMsIHdobwp3
YW50IHlvdSB0byBiZSBjbGVhciBhYm91dCB0aGUgcHVycG9zZSBvZiB0aGUgb3B0aW9uIHlvdSBw
YXNzZWQuCkV2ZW4gaWYgaXQgaXMgYXBwcm92ZWQgLCBpdCB3b3VsZCByZXF1aXJlIGEgbmV3IHBh
dGNoIHRvIGltcHJvdmUgdGhpcyBiZWhhdmlvci4KCgpUbyBzb2x2ZSBteSBjb21waWxhdGlvbiBw
cm9ibGVtICh3aXRoIGxpbnV4LWhlYWRlcnMtNC4xOS4zMjIpLCBpbiB0aGUKY3VycmVudCBjYXNl
LCBJIGhhZCB0byBwYXNzIHRoZSAtLWRpc2FibGUtcGlkd2FpdCBvcHRpb24uCklmIGF0IHNvbWUg
cG9pbnQgaW4gdGhlIGZ1dHVyZSwgd2hlbiB0aGUgcGF0Y2ggeW91IGV4cGVjdCBpcwpzdWNjZXNz
ZnVsbHkgYXBwbGllZCwgSSB3aWxsIHJlbW92ZSBpdC4KClNjb3R0IEZhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
