Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD28BFF8868
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 19:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85C8E810C6;
	Mon, 27 Apr 2026 19:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fqAnkRuPYn4; Mon, 27 Apr 2026 19:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AADD3812DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777316932;
	bh=zxS/pDToxvde4IrvKauAlWJ4sPdh4ltsC2X2OjcAjoI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKNeAn80s9UwDniaaEbUkBvlKRSuSwYGyLKVgMRDI4jSdWFRmcrGA8cAi6cJTBK8H
	 Ugak7eOdXW44EtpN/DzK6MKgxxpqpoRdKRgjtYWzqcH95ilZw0w/EQAHSaIAvT+aik
	 IHHzndFlbxmoYRF9KzcZ37DFL/V46AgY7/Lqdcl/U5tpBjqFGbVJyCczNABVMHH4VH
	 11Oxy6q/H7PmbV0Kv/PqyqQsJ6Pov/8TLUnbTOQ3N2DC9BCQoAywCW8eDg42OnSBSE
	 dpgXnQrGuMq7yZEk0HcPYB8zZJHhwe5Dqdvf9Z8SHIZkaAAxp40ySsxlykPKdOrZ3v
	 WbEnyqZKrYRjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AADD3812DD;
	Mon, 27 Apr 2026 19:08:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 669102DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 441A3812DD
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvCsLPGZn3tE for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 19:08:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D32A810C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D32A810C6
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D32A810C6
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:08:50 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-6221c7251d1so1460875137.2
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 12:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777316929; cv=none;
 d=google.com; s=arc-20240605;
 b=Tr8or0nIv7o1KhtBVNfl5jJV/cRsENA9J8UgthiZ9fCR4OA6Q1E6qghD6B4/OY69ey
 ZQzYCNU6v5+tZ/WwxzbMNOfN7bUBHtKpEft2XQ7ss9VgFvbyF9+cal+JbBYh6Xt4ZU4F
 ajNTQvtnenNyKmVavzO7Wzdyxn6Fo61697X5DPAZh+xzOiMow2C5adP3nRLEiC4M0RV7
 hNbOUknke1l3c2QNlX4B4Q1CIYZkqA9OWtjys4rd5uC7+B7pmtgugbQutT0ukd9qvPNI
 X5WtztYX5rUITXTzPmB9ymT3hV8yfk2LBqsLk8V8zAFw69tWt75BLAq5B45tU3gKqdqE
 VC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZNVKG+yLyfWmsjuD2N9H51vb9/sljC514RZArGkuVtQ=;
 fh=wNV1UCbQGYGCz0sC5IqfB8QPEFwbSWqpmmTuU0y8Ke4=;
 b=VPDR6TjMESIwKN+G0QKXr4t+MKwHrPTx0zKuBs9S9OoyBMc2G5LGM8Bca3nuPtEiRj
 K6nEDlcGF42R5PoWGsrl44sOlqDRhvWom4DWUxUo7WujFX8FlalN9ac2vdBinnpvEzdq
 VhUIoERxXyWDS6GT05tW6WHNqMH09+I0mIHFZaDOeyrvt4UDvCWGoGZzYYdOmBkWztHD
 wj3FLTobQTaFDQvfXSYm8wPacCm9pP/hMYnGRw6ovkCVuiz8JCbppGsnHWcSu84sOkyF
 oDgM4Hh29lTzV8KcW7UaQC7JU/1tdRXpxMmWU0OeyJhxm/go4lcMpQTUR6+XyrUtTETl
 Kx9A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777316929; x=1777921729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZNVKG+yLyfWmsjuD2N9H51vb9/sljC514RZArGkuVtQ=;
 b=Zx9S/TI1nyvHHofp9dCFQDv0jD3UmGLOgGaEO20gOIBZIg37aXGU50fompZAkOf8W0
 GcvD6+wMp5Hvo4rqXa2TSZZrcIGbvkDcxYzPant7YDn3j+17XcJeRZVoBb3POIpN+/vt
 REIY2LmhJz+cJbjYZpjFovvfckqfM6Mg/tB8Vo9P3BdRn5fq+svfekAhZ19X8j5/9GbP
 hLrHco6eKcW+fjNZzIkcppQo+FxjgFsQMbd9doTDy+aJZScr8Z6gRHpnJfPFlv39WhCp
 NOhZ3UQUbzpIPkIToe/SOsyLyputdjJBiSmMPXoZA5DzIlSLJJhU6uckJW7eOs5dQaTm
 uGGQ==
X-Gm-Message-State: AOJu0Yx6sPPmCpMwgbdN4GpeJYwRHKxphmU262J5OLsXVQYGGrDKt1uI
 0FJOuWsIxIqx9xwF6A7uHNQcu7sqshINAxXPygyejUuP33EsFg5dWxR0giGLEwW5Qsy4J7xjZwt
 Vke4Ov+grnmT5nryXhTL7otg+GEWlK1U=
X-Gm-Gg: AeBDietAqPysNFxKmoqy99gZT3Agyj8Hw6k3xDxEte0IrSRfTygRja/h/U44H+H3yAA
 u0SwYjBKPiZbAw+H8SQ3R+0WeTA4DItklOmzcwOVME9gxcDk6Bt4w4uyarbpspFY/xtPMmfFL71
 Wgel3cV4IPBN4OB/HQKQUo0VI6Qsa5iuOYJKtoTWRE06fcyA8OIsKU3iIfcNFal3aEHvV5Wduwv
 BCycu82ubWagcodvd4KRPjtPyYa4UTCqHmZzqMoDra3KxmW30OdaON+tYGNZcezmWsYSp0iGmw+
 szbT9JwH9g0Xr9tKm5lojISONHEjWok629OAMJMrjG6EC6M691E=
X-Received: by 2002:a05:6102:162c:b0:605:8143:cb67 with SMTP id
 ada2fe7eead31-627d54bc5d2mr427511137.20.1777316928709; Mon, 27 Apr 2026
 12:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260427074835.1452504-2-kanak.shilledar@axis.com>
 <20260427074835.1452504-4-kanak.shilledar@axis.com>
In-Reply-To: <20260427074835.1452504-4-kanak.shilledar@axis.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 27 Apr 2026 21:08:30 +0200
X-Gm-Features: AVHnY4Kk12kwFUknYaw889-tfpyCVK_CtzcmQypBQG-fim68qIwLkgqIhUwZwII
Message-ID: <CAB1t1CxiFCnxMOFU-6Ep5qSmwjRGjK=jsfVu9i1rnhYc9dPW-g@mail.gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777316929; x=1777921729; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNVKG+yLyfWmsjuD2N9H51vb9/sljC514RZArGkuVtQ=;
 b=celhNDq5RhV201u8pCUteZI0G+h32BMKjXNsgVJrTFJw9wpAVJOoJVYT0VumFqs3XK
 in6qwvmwPAQPH8H5K6Sv701OWLcSgej/yY9xB/vsIxKLNw0E/rwcfz88K/VsUQc1QWze
 FZCIP0e0/tnxwh7rJ8+ypU0VDN/8oVq+pPt64iOBmXR1g51bih/JfK81wPAOFs+iQ3LE
 3+7F2hhG1qcm1+CJcm1krotSLkY3HjrARCohZ8ASJJ2xH+Pmxi9tjQaJXffiMVKezZo7
 jKK9Xn3aoaYXAZkfLJCa8OFMfoUhmNEDYUKyp6G9YJrx8Vwaikglt6cHv+I3Qg8rSfAi
 bT5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=celhNDq5
Subject: Re: [Buildroot] [PATCH v2 1/1] support: kconfig: Fix compiler
 warnings
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

T24gTW9uLCAyNyBBcHIgMjAyNiBhdCAwOTo0OSwgS2FuYWsgU2hpbGxlZGFyIDxrYW5hay5zaGls
bGVkYXJAYXhpcy5jb20+IHdyb3RlOgo+Cj4gT24gVWJ1bnR1IDI0LjA0LjQsIHRoZSBjb21waWxl
ciBnaXZlcyB0aGUgd2FybmluZyBvZgo+IGAtV2Zvcm1hdC1vdmVyZmxvdz1gLgo+Cj4gYGBgCj4g
Li91dGlsLmM6IEluIGZ1bmN0aW9uIOKAmGZpbGVfd3JpdGVfZGVw4oCZOgo+IC4vdXRpbC5jOjg2
OjI2OiB3YXJuaW5nOiDigJglc+KAmSBkaXJlY3RpdmUgd3JpdGluZyAxMCBvciBtb3JlIGJ5dGVz
IGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJm
bG93PV0KPiAgICA4NiB8ICAgICAgICAgc3ByaW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7
Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KPiAuL3V0aWwuYzo4Njo5OiBu
b3RlOiDigJhzcHJpbnRm4oCZIG91dHB1dCAxMSBvciBtb3JlIGJ5dGVzIChhc3N1bWluZyA0MTA3
KSBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSA0MDk3Cj4gICAgODYgfCAgICAgICAgIHNwcmlu
dGYoYnVmMiwgIiVzJXMiLCBkaXIsIG5hbWUpOwo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGBgYAo+Cj4gVXBkYXRlIGBidWYyYCB0byBgUEFUSF9N
QVgrMjBgIHNpbWlsYXIgdG8gYGJ1ZmAsIHRodXMgZ2l2aW5nIGVub3VnaAo+IGhlYWRyb29tIGZv
ciB0aGUgZmlsZW5hbWUgc3VmZml4Lgo+Cj4gLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICogQ2hhbmdl
ZCBmcm9tIGRpcmVjdCBmaWxlIGZpeCB0byBwYXRjaCBiYXNlZCBmaXguCj4KPiBTaWduZWQtb2Zm
LWJ5OiBLYW5hayBTaGlsbGVkYXIgPGthbmFrLnNoaWxsZWRhckBheGlzLmNvbT4KPiAtLS0KPiAg
Li4uLzI0LXN1cHBvcnQta2NvbmZpZy1maXgtY29tcGlsZXItd2FybmluZ3MucGF0Y2ggfCAxNCAr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQpJdCByZXF1
aXJlcyB0byBhZGQgdGhpcyBwYXRjaCB0byBzdXBwb3J0L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMu
Cgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjQtc3VwcG9y
dC1rY29uZmlnLWZpeC1jb21waWxlci13YXJuaW5ncy5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3N1
cHBvcnQva2NvbmZpZy9wYXRjaGVzLzI0LXN1cHBvcnQta2NvbmZpZy1maXgtY29tcGlsZXItd2Fy
bmluZ3MucGF0Y2ggYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yNC1zdXBwb3J0LWtjb25maWct
Zml4LWNvbXBpbGVyLXdhcm5pbmdzLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwLi5kYWVmMTNiY2Y2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N1cHBvcnQv
a2NvbmZpZy9wYXRjaGVzLzI0LXN1cHBvcnQta2NvbmZpZy1maXgtY29tcGlsZXItd2FybmluZ3Mu
cGF0Y2gKPiBAQCAtMCwwICsxLDE0IEBACj4gK0luZGV4OiBrY29uZmlnL3V0aWwuYwo+ICs9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CgpNYXliZSB1c2UgZ2l0IHBhdGNoICh1c2VkIGluIDIyLWtjb25maWctbHhkaWFsb2ct
Zml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2gKb3IgMjMta2NvbmZpZy1tbi1jb25mLWhhbmRsZS1i
YWNrc3BhY2UtSC1rZXkucGF0Y2gpIHRvIGhhdmUgdGhlIHJlYXNvbgpkb2N1bWVudGVkIGluIHRo
ZSBwYXRjaCBpdHNlbGY/CgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gKy0tLSBrY29uZmlnLm9yaWcv
dXRpbC5jCj4gKysrKyBrY29uZmlnL3V0aWwuYwo+ICtAQCAtMzUsNyArMzUsNyBAQCBzdHJ1Y3Qg
ZmlsZSAqZmlsZV9sb29rdXAoY29uc3QgY2hhciAqbmFtZSkKPiArIGludCBmaWxlX3dyaXRlX2Rl
cChjb25zdCBjaGFyICpuYW1lKQo+ICsgewo+ICsgICAgICAgY2hhciAqc3RyOwo+ICstICAgICAg
Y2hhciBidWZbUEFUSF9NQVgrMjBdLCBidWYyW1BBVEhfTUFYKzFdLCBkaXJbUEFUSF9NQVgrMV07
Cj4gKysgICAgICBjaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9NQVgrMjBdLCBkaXJb
UEFUSF9NQVgrMV07Cj4gKyAgICAgICBzdHJ1Y3Qgc3ltYm9sICpzeW0sICplbnZfc3ltOwo+ICsg
ICAgICAgc3RydWN0IGV4cHIgKmU7Cj4gKyAgICAgICBzdHJ1Y3QgZmlsZSAqZmlsZTsKPiArCj4g
LS0KPiAyLjQzLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
