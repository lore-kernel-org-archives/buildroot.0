Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E41CD11C2
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 16:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5751A60609;
	Fri,  5 Apr 2024 16:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOIBcnE4R2ao; Fri,  5 Apr 2024 16:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6027860622
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6027860622;
	Fri,  5 Apr 2024 16:28:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCC441BF346
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 16:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0BB680BB2
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 16:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rV978KP2t-_j for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 16:28:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEA8F80B4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEA8F80B4B
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEA8F80B4B
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 16:28:40 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3c4e99e7f78so445281b6e.2
 for <buildroot@buildroot.org>; Fri, 05 Apr 2024 09:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712334519; x=1712939319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lBOMAVGuE9aKp0hcSRHDaO5r2wY3hnZxTSMWxMn6ds=;
 b=AJIDCUvtb76Bpm37h5IbTFyXldYI0Ixs097L8KH1gVMYG1d3xrP8yiEPug0+bM0Vrp
 vyNo8IllfwpWmzq3PcfAt83qWGOkw8BlxIFtrW5oVGUYdKPTKMag6EAd++AiurB6PAed
 7iiN4EsyotseCO7XQxd1CsCSpggtALA76ShE41BDkdfr4pASsbK3VfG5VjRRQ/op2bzg
 WADHFZp87CxcT6Q8on3vWLFfB8rxtKkn6M++xS3EJ/YAM5AC6FCrAT4DMdf4JDomuU7A
 EkDynDr+cbqLh0vBW1iUh/Kcgx01vkH17/3iHwSZRFwjllgVd4+v6AZqSZJpXL41PlSf
 z0+Q==
X-Gm-Message-State: AOJu0YwPZ5ib1w2DgpiRUwRQ+oeov3/dUwArf9xVSqsZHfbLJRQ1Zd3s
 kHhKRmqJuvtaILrGNj0gRDlTrpKyFYXy8Svxa+OxZvinst05VoXjabVpWp0c7RTKQSOYYezYdAp
 hJ/5a4AU2cHM08O6iDYxcDgJDCg0k1eUdFBs=
X-Google-Smtp-Source: AGHT+IHs4f56aLArvNuGUo3H7TAxWE+GXibNsncFTAFIBV0FbFJzhNDHJFfJJR6X6leF8Dco9QchxASVdl60DMoA+4w=
X-Received: by 2002:a05:6808:208f:b0:3c5:dfbe:e0cd with SMTP id
 s15-20020a056808208f00b003c5dfbee0cdmr940420oiw.8.1712334518948; Fri, 05 Apr
 2024 09:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240405153622.3348696-1-bernd@kuhls.net>
In-Reply-To: <20240405153622.3348696-1-bernd@kuhls.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 5 Apr 2024 10:28:26 -0600
Message-ID: <CADvTj4pxnTzftL6m1VJ57_zgbqHY4wXiQmutBEYeBK3K0DoNUw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712334519; x=1712939319; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lBOMAVGuE9aKp0hcSRHDaO5r2wY3hnZxTSMWxMn6ds=;
 b=X5B/FM0Gcm4HPPdBkXf1lgoX56aOZBBLDwgEdUvX4QKBlDmhGhtvbfYJbmI64X0fSr
 UY05lpB7yQoJIAj//228H3sDze80N5jaGgbJlwVJy4WjioXBNRvfPtOb9kQwE54gP2KI
 CERpxnNTuD2JzdDCML+3HZDtDOuWINujYSnkZ/M2R8NRpbaz2Jl6urYBaEQuHFTKA7UN
 TPhu2Dk/BJDf8nz/F0xjgLsem0ur+Wq8d7FnaI4LwUscvZdrIKFVT5YR6f6DzVQ5lyV8
 xVzc2auIrbaVo/AU7EF0vmUMx7FyEFzxOTOi4ECSUFqcCda4cxLcAP1MZNDMVxUWVsbS
 5Eqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X5B/FM0G
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: add optional
 dependency to libxcrypt
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBcHIgNSwgMjAyNCBhdCA5OjM24oCvQU0gQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4gd3JvdGU6Cj4KPiBXaGVuIGdsaWJjIHdhcyBidW1wZWQgdG8gdmVyc2lvbiAyLjM5IGlu
IGNvbW1pdAo+IGI1NjgwZjUzZDYwYWNmOGZmNjAxMDA4MmY4NzM0MzhhMzliZDVkOTcgaXQgcmVt
b3ZlZCB0aGUgZGVwcmVjYXRlZAo+IGxpYmNyeXB0IHN1cHBvcnQuCj4KPiBEdWUgdG8gdGhpcyBy
ZW1vdmFsIGRyb3BiZWFyIHdhcyB1bmFibGUgdG8gYWNjZXB0IGNvbm5lY3Rpb25zIHVzaW5nCj4g
cGFzc3dvcmQgYXV0aGVudGljYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8
YmVybmRAa3VobHMubmV0PgpUZXN0ZWQtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPgo+IC0tLQo+IE15IGtub3dsZWRnZSBhYm91dCB0aGUgaW50ZXJuYWxzIG9m
IGRyb3BiZWFyIGlzIG5vbi1leGlzdGVudCBidXQgYWRkaW5nCj4gbGlieGNyeXB0IGZpeGVkIHRo
ZSBjb25uZWN0aW9uIHByb2JsZW0gd2hpY2ggb2NjdXJlZCByaWdodCBhZnRlciB0aGUKPiBnbGli
YyBidW1wLgo+Cj4gIHBhY2thZ2UvZHJvcGJlYXIvQ29uZmlnLmluICAgfCAxICsKPiAgcGFja2Fn
ZS9kcm9wYmVhci9kcm9wYmVhci5tayB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHJvcGJlYXIvQ29uZmlnLmluIGIv
cGFja2FnZS9kcm9wYmVhci9Db25maWcuaW4KPiBpbmRleCBlMTRhNjcwYzE5Li42YTkxNjFkNjU5
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZHJvcGJlYXIvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9kcm9wYmVhci9Db25maWcuaW4KPiBAQCAtMiw2ICsyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdF
X0RST1BCRUFSCj4gICAgICAgICBib29sICJkcm9wYmVhciIKPiAgICAgICAgIHNlbGVjdCBCUjJf
UEFDS0FHRV9aTElCIGlmICFCUjJfUEFDS0FHRV9EUk9QQkVBUl9TTUFMTAo+ICAgICAgICAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX0xJQlRPTUNSWVBUIGlmICFCUjJfUEFDS0FHRV9EUk9QQkVBUl9TTUFM
TAo+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhDUllQVCBpZiBCUjJfVE9PTENIQUlO
X1VTRVNfR0xJQkMKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgQSBzbWFsbCBTU0ggMiBzZXJ2
ZXIgZGVzaWduZWQgZm9yIHNtYWxsIG1lbW9yeSBlbnZpcm9ubWVudHMuCj4KPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9kcm9wYmVhci9kcm9wYmVhci5tayBiL3BhY2thZ2UvZHJvcGJlYXIvZHJvcGJl
YXIubWsKPiBpbmRleCA3YWM4YTM4NTU5Li41NmY1NjVlMDE2IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvZHJvcGJlYXIvZHJvcGJlYXIubWsKPiArKysgYi9wYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFy
Lm1rCj4gQEAgLTM5LDYgKzM5LDEwIEBAIGlmZXEgKCQoQlIyX1NIQVJFRF9TVEFUSUNfTElCUyks
eSkKPiAgRFJPUEJFQVJfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1zdGF0aWMKPiAgZW5kaWYKPgo+
ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJQlhDUllQVCkseSkKPiArRFJPUEJFQVJfREVQRU5ERU5D
SUVTICs9IGxpYnhjcnlwdAo+ICtlbmRpZgo+ICsKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSU5V
WF9QQU0pLHkpCj4gIGRlZmluZSBEUk9QQkVBUl9TVlJfUEFNX0FVVEgKPiAgICAgICAgIGVjaG8g
JyNkZWZpbmUgRFJPUEJFQVJfU1ZSX1BBU1NXT1JEX0FVVEggMCcgICAgID4+ICQoQEQpL2xvY2Fs
b3B0aW9ucy5oCj4gLS0KPiAyLjM5LjIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
