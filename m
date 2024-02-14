Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5239AC48BC1
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 10:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1760460EEE;
	Wed, 14 Feb 2024 10:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 220A9mEOTPB7; Wed, 14 Feb 2024 10:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39B960E36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39B960E36;
	Wed, 14 Feb 2024 10:59:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4F431BF86C
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1B254176D
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9VT9apZbWBM for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 10:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75F4441736
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75F4441736
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75F4441736
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 10:58:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-411d3c75026so8001095e9.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 02:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707908337; x=1708513137;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LnFfRrlAbt+eOtan9qEHS2yow9tNLKgsZZs+drE3/5E=;
 b=H+l67ZcFDDS1cp6AgWrRHrus5ICIDY+rk2b2+Hcxt/tsFPu1HZFOWxwmZ0ztPE7vSE
 fgqjT5GpNhK6scqUsEM2dOvCc8pwN4540x9zXBczbuYpAqRWlsEJPHl6eRJAdBoU1Ctr
 IaJ/UsDaGs5TPr3nLUe12JEuv2eWyOYkPoe7PAw2HjsueB5GVVre1TiGwcGI/SfPXBGw
 ZYSY1A9W1C6bKQl6y3ZeZWSk3e+cCE6+b0AByICHl8HMXn66TTuqlYP+bZAxzYULXct1
 /c6GjGWgIH4+2E3dnFL6JGDwqc5bjIfo2LP7rWF6pLta2eorCS1wO0Hrp5HSbXLpDRAU
 kGjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM4ARuLebDTVVnxwpL4o1zBfFDcazdO6GnArAUzD4oHegE3tSt7hkY6SJFw5Sz91NWbEsg6NI2m+JTChdc0R+WMtxO4jpJ+Q==
X-Gm-Message-State: AOJu0YwmUStnsK4zRSlCD2eBr3wxZgFUJ6AvEe2bwX1/uYBG+7LURVUn
 G/UN1hIFoRzG/IgNfSFf9G/GXt/RPeS6lfv5xP9YkGaESwTyf5s7
X-Google-Smtp-Source: AGHT+IFzeNtWNOnglZcFboMj4Rc8UCYUlYlxE+4sNwtcefX9KdiDnKf63dUJV1NLW0m9zktyDuXlRw==
X-Received: by 2002:a05:600c:4689:b0:411:a5f9:26f5 with SMTP id
 p9-20020a05600c468900b00411a5f926f5mr1892752wmo.38.1707908337283; 
 Wed, 14 Feb 2024 02:58:57 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a7bc848000000b00410794ddfc6sm1589688wml.35.2024.02.14.02.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:58:57 -0800 (PST)
Message-ID: <de33c9a40659b64e2d25e74091294578f3849519.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 11:58:56 +0100
In-Reply-To: <20240213172817.2872849-22-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707908337; x=1708513137; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LnFfRrlAbt+eOtan9qEHS2yow9tNLKgsZZs+drE3/5E=;
 b=Rx5wbZBGFiTmJGtGUW0Rk/4uuU6pLUiKZdgs8p+4BOxDTTvmkssXvk63cg/mhA1/tr
 hnAyMaR4uwF3Zx/ImGzidfYNuwUPB9YhQFL5vTdBjMYhkQn8NruIme5hMxSKd1SZRPWy
 WzFHpPkvGywFJg3AykPv+xI/xhwEYonJSz2g2vGCmAD9kdYBteczkpuGWdrf7lusByHc
 1tn5xcR+N1sFpeRg1P4z6kL9baT03yVeV4FMqSm/FwDXeBt8E/uVeRaKpK6nCqbPYo4f
 gDcY4UywXFRaQ4zg+1ZRRQIrUiSLTdov2OLN7rsrECUWxRng4PemVA8ZADLhAEpHmtNx
 tz5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Rx5wbZBG
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gdGktazMtaW1hZ2UtZ2VuIHRvb2wgaXMgZGVwcmVjYXRlZCBhbiByZXBsYWNl
ZCBieSBiaW5tYW4gWzFdLgo+IAo+IEFsbCBkZWZjb25maWcgdGhhdCB3YXMgdXNpbmcgaXQgaGF2
ZSBiZWVuIHVwZGF0ZWQgdG8gdXNlIFUtYm9vdAo+IGJpbm1hbiB0b29sIGluc3RlYWQuCj4gCj4g
U28sIHdlIGNhbiBzYWZlbHkgcmVtb3ZlIHRpLWszLWltYWdlLWdlbiBwYWNrYWdlLgo+IAo+IFsx
XSBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtdGkvY29tbWl0Lz9pZD04MzU4MTFj
Zjg1ODY5MjZjZjc4YTk2MWQwOTBmNGU2MTUwNDMyMjM1Cj4gCj4gQ2M6IEFuYW5kIEdhZGl5YXIg
PGdhZGl5YXJAdGkuY29tPgo+IENjOiBYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KClJl
dmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5j
b20+Cgo+IC0tLQo+IMKgQ29uZmlnLmluLmxlZ2FjecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3ICsrCj4gwqBERVZFTE9QRVJTwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgLQo+IMKgYm9vdC9Db25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgLQo+IMKgYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29u
ZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDgxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gwqBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaCB8wqAgMyAtCj4g
wqBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWvCoMKgIHwgNTQgLS0tLS0t
LS0tLS0tLS0tCj4gwqA2IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTQxIGRlbGV0
aW9ucygtKQo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZp
Zy5pbgo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWlt
YWdlLWdlbi5oYXNoCj4gwqBkZWxldGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1nZW4v
dGktazMtaW1hZ2UtZ2VuLm1rCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
