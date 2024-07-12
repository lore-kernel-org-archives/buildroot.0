Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4C7C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C8C64093B;
	Fri, 12 Jul 2024 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0Cs99mfOHvK; Fri, 12 Jul 2024 21:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C3540944
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C3540944;
	Fri, 12 Jul 2024 21:09:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F14B41BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB87840159
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Rs5dik9MzeD for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:09:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C3D44012E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C3D44012E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C3D44012E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:09:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42797289c8bso17631945e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720818564; x=1721423364;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HiS8Qmr5ge2vctOWE3zqoGxvnZSBy/YIdwCyIxMXZlk=;
 b=uIj8HoTzr8qX6mWxgHPjl10EAkC2CT3oJPjQ6coYGTSgQuyc9IJgxVjqE4YsBJMvM3
 pixJIxaBrqGTVCIZDD1Q7jROOn755zT2cTI1hhCaIXoQzJDeNFDCdTYXj7yKDF9MbrIu
 hCPiTaZXtQnFS2hSFAom62dOJ4xoECGtRpvUc+Zg9prOnS6cAbICvkVu0UnB4AqCO2DK
 VbpNma0unrkscsw8jUrz4U5xDad9sGG6HnkUPB0y/BbWD86hCD2C3Xx06uhcQ4qyQTs+
 2jZmNvtIzYb1Ihk+fSnX0OSofX4J70y2OFRFz3rYoGKQ6r91witymxzyPglz3FTpVVag
 MHUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeFPrPhe/MkJvy1qAu7f8Ns8piW6ofZ3FHLvoDcknSL4Pq3L1V7bZAelBOxZM/L6ldLSJVJLE992wvJDwMwPCN7e9a9hbBtQ==
X-Gm-Message-State: AOJu0YxRq8Ywv0mwRi7ZKL2SZcl4Yu237FJZ/3NBmHt5wefY88NZ9lwF
 GuqWeU/LtqXXpc2wF8aPY4yTbQ4n2JThDdqQVPxT5USPgTuFycgYl/Pjdgw0OKE=
X-Google-Smtp-Source: AGHT+IELXfYaxtb75z8VfD2Pu4CMXubH0HUVWZ51Tlsay2e76Fws+aqRcDeY3rc3wd4S9KnCr6kyRA==
X-Received: by 2002:a05:600c:4253:b0:426:6353:4b7c with SMTP id
 5b1f17b1804b1-426705ce98cmr94541975e9.8.1720818563983; 
 Fri, 12 Jul 2024 14:09:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4267255858asm106361065e9.0.2024.07.12.14.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 14:09:23 -0700 (PDT)
Message-ID: <f26b76b4-ddce-4a40-b53e-3c990f47f972@smile.fr>
Date: Fri, 12 Jul 2024 23:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 buildroot@buildroot.org
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
 <20240410171211.1633127-3-jeanmichel.hautbois@yoseli.org>
Content-Language: fr, en-US
In-Reply-To: <20240410171211.1633127-3-jeanmichel.hautbois@yoseli.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720818564; x=1721423364; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HiS8Qmr5ge2vctOWE3zqoGxvnZSBy/YIdwCyIxMXZlk=;
 b=2B95ZVsc7UiMjErKGPwsttyHPaopzHdEDjQuNMuRDui6sGp1RWU0aM0D45kmCJv9dN
 aOOLnayD+jPnzej00oyQNlruGIJwf+7nPmjjfrDFA19H6nHjcpThPj87oF0i1HLGy3iy
 LRUzjSrgP7royh6sgVLyMb79NltpYhlRpI7rw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=2B95ZVsc
Subject: Re: [Buildroot] [PATCH v2 2/3] board: add the qemu board support
 for mcf54418
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmVhbi1NaWNoZWwsIEFsbCwKCkxlIDEwLzA0LzIwMjQgw6AgMTk6MTIsIEplYW4tTWlj
aGVsIEhhdXRib2lzIGEgw6ljcml0wqA6Cj4gVGhlIENvbGRmaXJlIE1DRjU0NDE4IG5lZWRzIGEg
Ym9hcmQgdG8gZ2l2ZSB0aGUgcHJvcGVyIGxpbnV4IGRlZmNvbmZpZwo+IHRvIGJ1aWxkcm9vdC4g
QWRkIGl0IGJhc2VkIG9uIGEgc2ltcGxpZmllZCBMaW51eCBzdG1hcmsyX2RlZmNvbmZpZyBmaWxl
Lgo+IFdoaWxlIGF0IGl0LCBhZGQgYSB0aGUgbmVlZGVkIGNvbmZpZyB0byBydW4gcWVtdSwgdXNp
bmcgYSBjb3B5IG9mIHRoZQo+IHFlbXVfbTY4a19tY2Y1MjA4X2RlZmNvbmZpZyBhcyB0aGVyZSBp
cyBub3Qgc28gbXVjaCBkaWZmZXJlbmNlIHRvIGV4cGVjdAo+IGV4Y2VwdCB0aGUgQ1BVIHZhbHVl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWljaGVsLmhh
dXRib2lzQHlvc2VsaS5vcmc+Cj4gLS0tCj4gIGJvYXJkL3FlbXUvbTY4ay1tY2Y1NDQxOC9saW51
eC5jb25maWcgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ICBjb25maWdzL3FlbXVfbTY4
a19tY2Y1NDQxeF9kZWZjb25maWcgIHwgMTkgKysrKysrKysrKysrKysrKysrKwoKSW4gb3JkZXIg
dG8gdmVyaWZ5IHVzaW5nIEdpdGxhYi1DaSBpZiB0aGUgZ2VuZXJhdGVkIGltYWdlIGlzIHdvcmtp
bmcgdW5kZXIgUWVtdSwKd2UgbmVlZCBhIHJlYWRtZS50eHQgZmlsZSBpbiBib2FyZC9xZW11L202
OGstbWNmNTQ0MTggZGlyZWN0b3J5IHRvIHByb3ZpZGUgdGhlCnFlbXUgY29tbWFuZCBsaW5lIHRv
IHVzZS4KCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9hcmQvcWVtdS9tNjhrLW1jZjU0NDE4L2xpbnV4LmNvbmZpZwo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgY29uZmlncy9xZW11X202OGtfbWNmNTQ0MXhfZGVmY29uZmlnCj4gCj4gZGlm
ZiAtLWdpdCBhL2JvYXJkL3FlbXUvbTY4ay1tY2Y1NDQxOC9saW51eC5jb25maWcgYi9ib2FyZC9x
ZW11L202OGstbWNmNTQ0MTgvbGludXguY29uZmlnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi5lOTUwMDUyMDYxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2JvYXJk
L3FlbXUvbTY4ay1tY2Y1NDQxOC9saW51eC5jb25maWcKPiBAQCAtMCwwICsxLDIzIEBACj4gK0NP
TkZJR19DT0xERklSRT15Cj4gK0NPTkZJR19NNTQ0MXg9eQo+ICtDT05GSUdfQ0xPQ0tfRlJFUT0y
NDAwMDAwMDAKPiArQ09ORklHX1NUTUFSSzI9eQo+ICtDT05GSUdfVUJPT1Q9eQo+ICtDT05GSUdf
UkFNQkFTRT0weDQwMDAwMDAwCj4gK0NPTkZJR19SQU1TSVpFPTB4ODAwMDAwMAo+ICtDT05GSUdf
VkVDVE9SQkFTRT0weDQwMDAwMDAwCj4gK0NPTkZJR19LRVJORUxCQVNFPTB4NDAwMDEwMDAKPiAr
IyBDT05GSUdfQkxLX0RFVl9CU0cgaXMgbm90IHNldAo+ICtDT05GSUdfQklORk1UX0ZMQVQ9eQo+
ICtDT05GSUdfU0VSSUFMX01DRj15Cj4gK0NPTkZJR19TRVJJQUxfTUNGX0JBVURSQVRFPTExNTIw
MAo+ICtDT05GSUdfU0VSSUFMX01DRl9DT05TT0xFPXkKPiArQ09ORklHX0JPT1RQQVJBTT15Cj4g
K0NPTkZJR19CT09UUEFSQU1fU1RSSU5HPSJjb25zb2xlPXR0eVMwLDExNTIwMCIKPiArQ09ORklH
X05FVD15Cj4gK0NPTkZJR19QQUNLRVQ9eQo+ICtDT05GSUdfVU5JWD15Cj4gK0NPTkZJR19JTkVU
PXkKPiArQ09ORklHX05FVERFVklDRVM9eQo+ICtDT05GSUdfTkVUX1ZFTkRPUl9GUkVFU0NBTEU9
eQo+ICtDT05GSUdfRkVDPXkKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X202OGtfbWNmNTQ0
MXhfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X202OGtfbWNmNTQ0MXhfZGVmY29uZmlnCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi42YjU1MGZlYjhiCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL2NvbmZpZ3MvcWVtdV9tNjhrX21jZjU0NDF4X2RlZmNvbmZpZwo+IEBA
IC0wLDAgKzEsMTkgQEAKPiArQlIyX202OGs9eQo+ICtCUjJfbTY4a19jZjU0NDF4PXkKPiArQlIy
X1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE9eQo+ICtCUjJfUFRIUkVBRFM9
eQo+ICtCUjJfU1RBVElDX0xJQlM9eQoKV2l0aCBnbGliYyBlbmFibGVkIGluIHBhdGNoIDMvMywg
aXMgQlIyX1BUSFJFQURTIGFuZCBCUjJfU1RBVElDX0xJQlMgc3RpbGwKbmVlZGVkIGluIHRoaXMg
ZGVmY29uZmlnIGZpbGUgc2luY2UgZ2xpYmMgaXMgbm93YWRheXMgdGhlIGxpYmMgYnkgZGVmYXVs
dD8KCk5vdGU6IFdlIGFyZSBub3cgcmVxdWlyZXMgdG8gZW5hYmxlIEJSMl9ET1dOTE9BRF9GT1JD
RV9DSEVDS19IQVNIRVMgdG8gY2hlY2sKZG93bmxvYWRlZCBhcmNoaXZlcyBoYXNoIHdoZW4gYSBw
YWNrYWdlIHVzZSBhIGN1c3RvbSB2ZXJzaW9uLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICtC
UjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5UzAiCj4gK0JSMl9TWVNURU1fREhDUD0i
ZXRoMCIKPiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvcWVtdS9wb3N0LWlt
YWdlLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9IiQoQlIyX0RFRkNPTkZJRyki
Cj4gK0JSMl9MSU5VWF9LRVJORUw9eQo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
PXkKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjI2Igo+ICtC
UjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL3FlbXUvbTY4ay1tY2Y1NDQxOC9saW51eC5jb25maWci
Cj4gK0JSMl9QQUNLQUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1t
aW5pbWFsLmNvbmZpZyIKPiArQlIyX1RBUkdFVF9ST09URlNfSU5JVFJBTUZTPXkKPiArIyBCUjJf
VEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+ICtCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQo+
ICtCUjJfUEFDS0FHRV9IT1NUX1FFTVVfU1lTVEVNX01PREU9eQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
