Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46897C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 11:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063CF60DFF;
	Wed, 14 Feb 2024 11:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEvX7W7ZlF1v; Wed, 14 Feb 2024 11:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E0F260E36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E0F260E36;
	Wed, 14 Feb 2024 11:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15B261BF3C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 029AE81B9A
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDz40n_WrN-W for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 11:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1783081B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1783081B7B
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1783081B7B
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 11:05:04 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d0c7e6b240so72788371fa.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 03:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707908703; x=1708513503;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=32xShyyCA5E/wNa1AewChlWaS2jXPTihgOx+dmRfu9Q=;
 b=bi2JL3wTV3g3uGRQhgs8d43Fq5xrV4faRE0VrlQzd3Fs0ahqyVFGRyL8nRMo0hfgUb
 8+KN7P49Y0LwiOYnjjkprCbI37s7ejFtYN2n/POe0FW5+f/2wMpgHnXBgLe2SyMoDJGd
 Nla8p1PmPPdgqjBkg5K4L3jt/2wFQWWBgmA1LSVOBkIM2dIYacMPC4t5j1XEg8RyFfPE
 iumhbDC0AdsD7ZzJVyUgKVDQGrJvztOp6XPX9EjRZLIvLpdFqIgmJ1OqWwWa59GIIyyr
 9F64Ox+hDfSEsJrutRe6TQ2lPR9gJXAiTAPtxZpxpswO/Ruo7aZIy5nNrCcieEi/goM2
 7xUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvRHnI7k/vm0UjvvdOCSLZL9ky0ROdXYj3B0c6rzVfPQJ16+Raknv9K4PMmz9adTUwwmUb0X9sj3wENehb5nISxpFKhgzHkg==
X-Gm-Message-State: AOJu0YyDIhEq0uQ8fQZps3HaN31+7v0rXWkynulfJ5Vztmeogrs7eVgb
 2J/bRg02x7QO49wmVKc9D/XteZWpbMpi2MaZ0LVHe0BsNefdH3JLSiOGZf9ZN0o=
X-Google-Smtp-Source: AGHT+IHvmyeKI4cedMRyPVkWnTOKK4kKE+7jPC1f+Y6PYqej27gMt+IiMzhQ5cWCv6EgHD5bw2Eoyw==
X-Received: by 2002:a2e:8715:0:b0:2d0:ab90:adbc with SMTP id
 m21-20020a2e8715000000b002d0ab90adbcmr1421056lji.28.1707908702428; 
 Wed, 14 Feb 2024 03:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCURsOw56GYcz+ClRFHMJPWgIMbPZde2BxmYtjPmC5Dc4O+63c580y9+0bRoiAEeiRB9AxNIZ1ISINj/Hzzgxr6Ooj20Oews9g==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 dv5-20020a0560000d8500b0033b483d1abcsm12072823wrb.53.2024.02.14.03.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:05:02 -0800 (PST)
Message-ID: <ad16252df6fdd2da6531edc6e4a0504fc0daf910.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 12:05:01 +0100
In-Reply-To: <20240213172817.2872849-21-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-21-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707908703; x=1708513503; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=32xShyyCA5E/wNa1AewChlWaS2jXPTihgOx+dmRfu9Q=;
 b=FMpJa3M5K99A5c85ffVlI3a/lwbo1Mx6uI7PXcyyYinkCeez32wZG826uPJaFqoxOC
 T8omhVm41OPdOKHQJclcoIwtMyJr/iVJBDe0/zfT3EGc8+gX+CN9DxuX8dcpKjs32Oa1
 lppOr6pTJLvnNNQpdqvx5Dm363lO+5YySTJdgLpJsInH1oUNQBUNYul7Nrj0/E9Gu1BX
 mDK7hXYjTnoQmWxcH7rRaDUdGziOZYEq+Tf9yXQ2I6+g2F20EegdjBtNznZAxzo8GvZv
 XSap2Y93cSgqQ+ndtlKU8P0SRaql9lfImttSLqNw3d5e1PN5i0+V8dQigCx2v/I9Coy+
 b5dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FMpJa3M5
Subject: Re: [Buildroot] [PATCH 20/21] configs/ti_am64x_sk_defconfig: update
 to uboot 2024.01 to use binman tool
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKbG9va3MgZ29vZCB0byBtZSwgbWF5YmUgQVRGIHVwZGF0ZSBpcyB3b3J0aCBh
IHdvcmQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlCmluIGNhc2UgeW91J2xsIHJlLXNwaW4uCgpPbiBU
dWUsIDIwMjQtMDItMTMgYXQgMTg6MjggKzAxMDAsIFJvbWFpbiBOYW91ciB3cm90ZToKPiBVcGRh
dGUgdS1ib290IGZvciBhNTMgYW5kIHI1IGNvcmUgdG8gMjAyNC4wMSBhbmQgZW5hYmxlIGJpbm1h
biBzdXBwb3J0Cj4gaW4gb3JkZXIgdG8gcmVtb3ZlIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VO
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZy
PgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdt
YWlsLmNvbT4KCj4gLS0tCj4gwqBjb25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZyB8IDEyICsr
KysrKysrLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWcgYi9j
b25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZwo+IGluZGV4IDA5NzE3NWJkOGYuLmJjZWYxNjc3
N2UgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWcKPiArKysgYi9j
b25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZwo+IEBAIC0xNiwyNCArMTYsMjggQEAgQlIyX1RB
UkdFVF9ST09URlNfRVhUMl80PXkKPiDCoEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIw
TSIKPiDCoEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkU9eQo+IMKgQlIyX1RBUkdFVF9B
Uk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjciCj4gK0JSMl9UQVJHRVRf
QVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjEwIgo+IMKgQlIy
X1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iazMiCj4gwqBCUjJfVEFSR0VU
X0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1RBUkdFVF9CT0FSRD0ibGl0ZSIKPiDCoEJSMl9UQVJHRVRf
QVJNX1RSVVNURURfRklSTVdBUkVfQkwzMl9PUFRFRT15Cj4gwqBCUjJfVEFSR0VUX09QVEVFX09T
PXkKPiDCoEJSMl9UQVJHRVRfT1BURUVfT1NfUExBVEZPUk09ImszLWFtNjR4Igo+IC1CUjJfVEFS
R0VUX1RJX0szX0lNQUdFX0dFTj15Cj4gLUJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19B
TTY0WD15Cj4gK0JSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRT15Cj4gK0JSMl9UQVJHRVRf
VElfSzNfQk9PVF9GSVJNV0FSRV9TT0NfQU02NFg9eQo+IMKgQlIyX1RBUkdFVF9USV9LM19SNV9M
T0FERVI9eQo+ICtCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fVkVSU0lPTj15Cj4g
K0JSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI0LjAx
Igo+IMKgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQk9BUkRfREVGQ09ORklHPSJhbTY0eF9l
dm1fcjUiCj4gK0JSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU49eQo+IMKgQlIy
X1RBUkdFVF9VQk9PVD15Cj4gwqBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklH
PXkKPiDCoEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjEwIgo+ICtCUjJfVEFSR0VUX1VCT09UX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI0LjAxIgo+IMKgQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9E
RUZDT05GSUc9ImFtNjR4X2V2bV9hNTMiCj4gwqBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15
Cj4gwqBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQo+IMKgQlIyX1RBUkdFVF9VQk9P
VF9ORUVEU19BVEZfQkwzMT15Cj4gK0JSMl9UQVJHRVRfVUJPT1RfVVNFX0JJTk1BTj15Cj4gwqAj
IEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0JJTiBpcyBub3Qgc2V0Cj4gwqBCUjJfVEFSR0VUX1VC
T09UX0ZPUk1BVF9JTUc9eQo+IMKgQlIyX1RBUkdFVF9VQk9PVF9TUEw9eQoKLS0gCkFsZXhhbmRl
ciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
