Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9358CC8303C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 22:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C858845A1;
	Wed,  2 Jul 2025 22:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-Ml03O6upwT; Wed,  2 Jul 2025 22:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72E2C845A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72E2C845A9;
	Wed,  2 Jul 2025 22:37:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 299B5128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 22:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B36241B85
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 22:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8-YESnjYaEs for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 22:37:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06DB041B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06DB041B83
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06DB041B83
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 22:37:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso4220502f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 15:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751495828; x=1752100628;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0O/vVltcD8Gv8DIPSc0JXjRwDLJRKjipfgghU7rjsr4=;
 b=WuA3/vcBPiAgPpRapqWaFXWqYb7ULYHZ8z9mRz/wZSj9kTCHNDZAuX5cRcl2UC95df
 dYgcBFHcRorxD7Bstd7zKE9lr9qxPCrF9Mv48nno7xEwO9lOfN0iDpVZaFRmZ2qgpPLy
 6UA4gx2PxB8SZbno6o2HPSgGMK8ZhfEQ3QYCNIubNvZ4g64y0rZtKbTDix3TgxG+YzUF
 egIGuq04O5Jew1hjTLG4su03m8Tb4gDWsCTHjTJ/DTk75VP/G5eaF5Fz2zffwsmWim6A
 5qSqimLL/YCE8OHxR5pGlieFIe7bjAIgpJFX875MUkjBMj0t1IoCck8fQMYRUXzScJRU
 frUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/VSZcf62GtkeV4yegGX9JDqaHy9YhE/yx7q4yUotS2P3MP6qz730XwV4SUtqHEyUU3Ocpd1uftbY=@buildroot.org
X-Gm-Message-State: AOJu0YzLwMJnGbI5det8uQAlKts41aDjaUi4j1kNTElg2AJ3V+xY3tBL
 9hfffzulAosuFvazIfIH03bdyRlVLaosfPXKIPDOJE25iUig5pzSLvB2HV79RDOac88=
X-Gm-Gg: ASbGncuU+35OgzVa5hFr7LgYuwJX+wndHX9C00KRidAooL11eM44PuFRB/BOim0fZBY
 MNfNYY/fH0NLfdAXASd08ZaZnYaRYNL/23q9lISrA2fjnBuvkFxnKebdO+t/Lh98RfXFeJHRK6q
 VU+KtdCrJFkwGgknsxQwlh8P9tqH4SEAFQuiqqMksdg8Sd5fkVnI4SbHTuDekVbblEyKiIMR/i7
 tlZ+HrxdGbctcqRjH0FdlVOdAcKd0pbGEuSXjnBcwSaRZhEuPgiyVXnYmZ6Cbe6O4SS0p2hQ1sD
 h5A+7GQTfooir+nn5AAsrKQhX9G2Wps8GkaScNNDzX/wCDW/aVoIsLLD1GfxxAZe5ujgjRafO+C
 qxSGyozJzfPxD0rpzMJnbdJ1IMClqlTLQPJ/MiwuFjgpfgfoSDT2oLdRGS41lXqxQcD4IT68nSU
 YIUEkSCSJXemiQB/CKBRYbkyNIC6g682r21y4=
X-Google-Smtp-Source: AGHT+IFp/ADF6PjkiXTXDVVgoixKNnXURGFI7qJQe0yyav+IDU8Gpvr2uL4vOZ7Xuz/qbhIl8WySgA==
X-Received: by 2002:a05:6000:238a:b0:3a5:27ba:479c with SMTP id
 ffacd0b85a97d-3b200f2104amr3822395f8f.43.1751495827877; 
 Wed, 02 Jul 2025 15:37:07 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fada5sm17329485f8f.32.2025.07.02.15.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 15:37:07 -0700 (PDT)
Message-ID: <7ee26828-4b3d-4942-8c30-8293455c59fc@smile.fr>
Date: Thu, 3 Jul 2025 00:37:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-4-alex.bennee@linaro.org>
Content-Language: en-US
In-Reply-To: <20250626111642.228223-4-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751495828; x=1752100628; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0O/vVltcD8Gv8DIPSc0JXjRwDLJRKjipfgghU7rjsr4=;
 b=HnpxCot86Oc2OzAX25IzSK35eIATb8liGhjE0ADCQ2/pIySqikfgLfDYcqGRIzQu4t
 nAmSzvOW1taBGH8/btdnTwC63bKKNUGaF8CfAxYUuSfHvVDIIGAiJ3IDMuuToewNLbu1
 MNRV1o7mm8NKX0aV1xbN6FiaPDe5tEZ/syKWw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=HnpxCot8
Subject: Re: [Buildroot] [RFC PATCH 3/3] package/llvm-project: reduce the
 build size of llvm
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleCwgQWxsLAoKTGUgMjYvMDYvMjAyNSDDoCAxMzoxNiwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gQWx0aG91Z2ggd2UgcmVxdWVzdCBhIFJlbGVhc2UgYnVpbGQgdGhlIGRlZmF1
bHQgQ01BS0UgZmxhZ3MgaW4KPiB0b29sY2hhaW4uY21ha2UgaW5jbHVkZSAtT2cgLWczIHdoaWNo
IGVuYWJsZXMgZGVidWcgc3ltYm9scyBmb3IgdGhlCj4gYnVpbGQgaW5mbGF0aW5nIHRoZSBvdmVy
YWxsIHNpemUgb2YgdGhpbmdzLgoKQnkgZGVmYXVsdCwgLU8yIC1nMCBpcyB1c2VkIGJ5IEJ1aWxk
cm9vdC4gSWYgeW91IGhhdmUgLU9nIC1nMyBpbiB0b29sY2hhaW4uY21ha2UKZ2VuZXJhdGVkIGJ5
IEJ1aWxkcm9vdCwgaXQgbWVhbnMgdGhhdCBCUjJfRU5BQkxFX0RFQlVHLCBCUjJfREVCVUdfMyBh
bmQKQlIyX09QVElNSVpFX0cgaGF2ZSBiZWVuIHNlbGVjdGVkIGluIHRoZSBCdWlsZHJvb3QgY29u
ZmlndXJhdGlvbiAoYnkgdGhlIHVzZXIpLgoKPiAKPiBGb3Igbm93IGp1c3QgY29weSB0aG9zZSBk
ZWZhdWx0cyBpbnRvIHRoZSBwcm9qZWN0IG1rIGZpbGUgYW5kIGRyb3AgdGhlCj4gLU9nIGFuZCAt
ZzMgbGluZXMuIFRoaXMgZHJvcHMgdGhlIHNpemUgb2YgdGhlIGxsdm0gYnVpbGQgZGlyZWN0b3J5
IG9uCj4gbXkgYXJtNjQgYnVpbGQgZnJvbSAxN0diIHRvIGEgbW9yZSByZWFzb25hYmxlIDQuNEdi
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4KPiAtLS0KPiAgcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rIHwgMTAgKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVj
dC9sbHZtL2xsdm0ubWsKPiBpbmRleCA3OGFhNmZlNDY3Li4wMzY4NDA4NGM0IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawo+ICsrKyBiL3BhY2thZ2UvbGx2
bS1wcm9qZWN0L2xsdm0vbGx2bS5tawo+IEBAIC0xNjcsNiArMTY3LDE2IEBAIExMVk1fQ09ORl9P
UFRTICs9IC1ETExWTV9IQVZFX1RGTElURT0iIgo+ICBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1E
Q01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4gIExMVk1fQ09ORl9PUFRTICs9IC1E
Q01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4gIAo+ICsjIFJlZHVjZSB0aGUgb3Bw
b3J0dW5pdHkgZm9yIGRlZmF1bHQgW0N8Q1hYXV9GTEFHUyB0byBmYXR0ZW4gdGhlIGJ1aWxkCj4g
K0hPU1RfTExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VOQUJMRV9BU1NFUlRJT05TPU9GRgo+ICtM
TFZNX0NPTkZfT1BUUyArPSAtRExMVk1fRU5BQkxFX0FTU0VSVElPTlM9T0ZGCj4gCkxMVk1fRU5B
QkxFX0FTU0VSVElPTlMgaXMgT0ZGIGJ5IGRlZmF1bHQgZXhlcHQgZm9yIGRlYnVnIGJ1aWxkcy4K
CisKPiArSE9TVF9MTFZNX0NPTkZfT1BUUyArPSAtRENNQUtFX0NfRkxBR1M9Ii1EX0xBUkdFRklM
RV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURf
Rk9SVElGWV9TT1VSQ0U9MSIKPiArTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9DX0ZMQUdTPSIt
RF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9C
SVRTPTY0IC1EX0ZPUlRJRllfU09VUkNFPTEiCj4gKwo+ICtIT1NUX0xMVk1fQ09ORl9PUFRTICs9
IC1EQ01BS0VfQ1hYX0ZMQUdTPSItRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NP
VVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0ZPUlRJRllfU09VUkNFPTEiCj4gK0xMVk1f
Q09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX0ZMQUdTPSItRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xB
UkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0ZPUlRJRllfU09VUkNF
PTEiCgpJJ20gbm90IHN1cmUgYWJvdXQgdGhpcyBjaGFuZ2UsIHNpbmNlIGl0IGFsc28gY2hhbmdl
IGZvciBvdGhlciBCUjJfT1BUSU1JWkVfeApvcHRpb25zIGFuZCB3aGVuIEJSMl9FTkFCTEVfREVC
VUcgaXMgZGlzYWJsZWQuIFdlIHdhbnQgdG8ga2VlcCB0aGUgb3B0aW1pemF0aW9uCmxldmVsIHNl
bGVjdGVkIGJ5IHRoZSB1c2VyLgoKV2hhdCBhYm91dCBzb21ldGhpbmcgbGlrZSBrZXhlYyBwYWNr
YWdlIFsxXSB0byBmb3JjZSB0aGUgb3B0aW1pemF0aW9uIGxldmVsIHRvIGEKbWluaW11bT8KCkkg
cmVtZW1iZXIgKGJhY2sgaW4gMjAxOCkgbGx2bSBjcmFzaGluZyB3aXRoIERlYnVnIGJ1aWxkIHR5
cGUsIHRoYXQncyB3aHkgaXQncwpmb3JjZWQgdG8gUmVsZWFzZSB0eXBlIGJ1dCB0aGUgZGVmYXVs
dCBidWlsZCBvcHRpb25zIHdlcmUgdXNlZCAoLU8yIC1nMCkuCgpbMV0KaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi9tYXN0ZXIvcGFja2FnZS9rZXhlYy9r
ZXhlYy5taz9yZWZfdHlwZT1oZWFkcyNMMjMKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArCj4g
ICMgQ29tcGlsZSBsbHZtIHdpdGggdGhlIEMrKzE0IChJU08gQysrIDIwMTQgc3RhbmRhcmQpLgo+
ICBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX1NUQU5EQVJEPTE0Cj4gIExMVk1f
Q09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX1NUQU5EQVJEPTE0CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
