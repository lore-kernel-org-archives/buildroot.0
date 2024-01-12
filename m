Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42B3C4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 21:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60BD9704BC;
	Fri, 12 Jan 2024 21:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60BD9704BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QJD-0ONlWtH; Fri, 12 Jan 2024 21:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF44D7046A;
	Fri, 12 Jan 2024 21:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF44D7046A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 818051BF2C5
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 21:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6300D84F5C
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 21:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6300D84F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2zyRpiUvcSq for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 21:45:33 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 717E984F5B
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 21:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 717E984F5B
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cd1a1c5addso80206181fa.1
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 13:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705095931; x=1705700731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8ZuMhqPiyVd/H9hMZsRKd2kpNJAz2ogeOh872JoYj0=;
 b=NOHaNKJHEmmCj6LxltwgC/8ZDq5rNJuCqWcJFv7cAtkgMRyLRsw2/oyJVzDeX4VlYz
 4oSzCdbEZLwPD7itY7i62oOYFQL31JmJVIENwWqJnN5gyBcCv/eeuZe3vRTOhkI1EXqg
 54ww1Cd30I71vxpPv4VdAv4wAXshkCss9MUDFkb9R/uUkWM0whZJqqo+xOolbgZiArLx
 BP41ZoNbW8pSP/ZGB+SWIcGp7lcd4adJ9uWlesZLjmVyDZWrnshslMvtie2kK6G756gY
 d+zH35+Tcj5W3OMIO64/K3GLYoqyeTqdHKexWvqR9wQiVt9cfh3wFHUH6pxJY9nZwRvI
 E7bQ==
X-Gm-Message-State: AOJu0Yyf9OY3uMSvwdHepO8yYRqeKEl8pd5ilc4w6gf9xmBl5aJ/aMR1
 8iMD4uX5CRhV9IFHHyMZnuut7K+WxDo=
X-Google-Smtp-Source: AGHT+IGJf64J5C7BFULcdmDF9ObA2SszpuuaOQuSFHQV0eFnhs/UZdQLIbnlfxvn8NSs+LflmkFmIQ==
X-Received: by 2002:a05:6512:3da9:b0:50e:e680:cd4e with SMTP id
 k41-20020a0565123da900b0050ee680cd4emr1010940lfv.108.1705095931075; 
 Fri, 12 Jan 2024 13:45:31 -0800 (PST)
Received: from [192.168.10.7] ([188.191.245.106])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a056512340a00b0050e48ad03a1sm610087lfr.149.2024.01.12.13.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 13:45:30 -0800 (PST)
Message-ID: <d82459db-4d64-4b80-af92-d44962ca4245@gmail.com>
Date: Sat, 13 Jan 2024 00:45:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru-RU
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20240112194000.925982-1-m.niestroj@grinn-global.com>
 <20240112194000.925982-2-m.niestroj@grinn-global.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <20240112194000.925982-2-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705095931; x=1705700731; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W8ZuMhqPiyVd/H9hMZsRKd2kpNJAz2ogeOh872JoYj0=;
 b=IMrS30QZgUt57BGPhzX824axWlM/U3ny/sOz+9jYN3tzn2GQud49xXseawxC47gh5D
 1r/fEZN+mbfXXE8smCiveiaeq4BjecOAzJrs7wtPEr8GSYw27VEq6nObgCjJitFXyCpb
 ECgCT7zzryy+KQuyXkEDlYOplAiFgTjl4ePGRM4GySd9fz7UUmzZXzmX0U81x1QLXcGo
 ZDlm2Y2VUUAcKOB6iOzj6bbeJRggSn9KXa9NAfyRc8tJMis4Wc6r0M6hVCZNQfpFPrIy
 8T2qT1uW0P5paCavxVDlvTT90X1l2cs4ZurP5mxdTPVGBLJ/9V2wE5ow0iPHbdi1pR7W
 WgeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IMrS30QZ
Subject: Re: [Buildroot] [PATCH 2/2] configs/orangepi_zero3: use upstream
 U-Boot and Linux
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIE1hcmNpbiBOaWVzdHJvaiwKVGhhbmtzIGZvciB0aGUgdXBkYXRlIQpUZXN0ZWQtYnk6IFNl
cmdleSBLdXptaW5vdiA8a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPgoKMTIuMDEuMjAyNCAy
MjozOSwgTWFyY2luIE5pZXN0cm9qINC/0LjRiNC10YI6Cj4gVGhlcmUgaXMgbm93IHN1cHBvcnQg
aW4gYm90aCB1cHN0cmVhbSBVLUJvb3QgYW5kIHVwc3RyZWFtIExpbnV4Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgo+IC0t
LQo+ICAgYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVybzMvbGludXguY29uZmlnIHwgIDEgLQo+
ICAgY29uZmlncy9vcmFuZ2VwaV96ZXJvM19kZWZjb25maWcgICAgICAgICAgIHwgMTcgKysrKysr
KystLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS16
ZXJvMy9saW51eC5jb25maWcKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvb3JhbmdlcGkvb3Jhbmdl
cGktemVybzMvbGludXguY29uZmlnIGIvYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVybzMvbGlu
dXguY29uZmlnCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDliN2E5M2E1YS4u
MDAwMDAwMDAwMAo+IC0tLSBhL2JvYXJkL29yYW5nZXBpL29yYW5nZXBpLXplcm8zL2xpbnV4LmNv
bmZpZwo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSArMCwwIEBACj4gLUNPTkZJR19NRkRfQUMyMDA9
eQo+IGRpZmYgLS1naXQgYS9jb25maWdzL29yYW5nZXBpX3plcm8zX2RlZmNvbmZpZyBiL2NvbmZp
Z3Mvb3JhbmdlcGlfemVybzNfZGVmY29uZmlnCj4gaW5kZXggZjRmYmY4NjgxMi4uOTNkNTNkYzMw
MSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL29yYW5nZXBpX3plcm8zX2RlZmNvbmZpZwo+ICsrKyBi
L2NvbmZpZ3Mvb3JhbmdlcGlfemVybzNfZGVmY29uZmlnCj4gQEAgLTIsNyArMiw3IEBAIEJSMl9h
YXJjaDY0PXkKPiAgIEJSMl9jb3J0ZXhfYTUzPXkKPiAgIEJSMl9BUk1fRlBVX1ZGUFY0PXkKPiAg
IAo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15Cj4gK0JSMl9Q
QUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl83PXkKPiAgIEJSMl9ST09URlNfREVW
SUNFX0NSRUFUSU9OX0RZTkFNSUNfTURFVj15Cj4gICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4g
ICAKPiBAQCAtMTYsOCArMTYsOCBAQCBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JM
MzE9eQo+ICAgIyBCb290bG9hZGVyCj4gICBCUjJfVEFSR0VUX1VCT09UPXkKPiAgIEJSMl9UQVJH
RVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQo+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RP
TV9UQVJCQUxMPXkKPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0i
JChjYWxsIGdpdGh1YixvcmFuZ2VwaS14dW5sb25nLHUtYm9vdC1vcmFuZ2VwaSw2ZmUxN2ZhYzM4
OGFhZDE3NDkwY2YzODY1NzhiNzUzMjk3NWU1NjdmKS91LWJvb3Qtb3JhbmdlcGktNmZlMTdmYWMz
ODhhYWQxNzQ5MGNmMzg2NTc4Yjc1MzI5NzVlNTY3Zi50YXIuZ3oiCj4gK0JSMl9UQVJHRVRfVUJP
T1RfQ1VTVE9NX1ZFUlNJT049eQo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSIyMDI0LjAxIgo+ICAgQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9Im9yYW5n
ZXBpX3plcm8zIgo+ICAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+ICAgQlIyX1RBUkdF
VF9VQk9PVF9ORUVEU19PUEVOU1NMPXkKPiBAQCAtMzAsMjEgKzMwLDIwIEBAIEJSMl9UQVJHRVRf
VUJPT1RfQ1VTVE9NX01BS0VPUFRTPSJTQ1A9L2Rldi9udWxsIgo+ICAgCj4gICAjIEtlcm5lbAo+
ICAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTEw9
eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0
aHViLG9yYW5nZXBpLXh1bmxvbmcsbGludXgtb3JhbmdlcGksMzQ5NWI1ZWUwNTk0NTY2YzlmZWQ5
MzBiOTZiMWNhZTkwNjAwNDEyZSkvbGludXgtb3JhbmdlcGktMzQ5NWI1ZWUwNTk0NTY2YzlmZWQ5
MzBiOTZiMWNhZTkwNjAwNDEyZS50YXIuZ3oiCj4gLUJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklH
PSJsaW51eF9zdW54aTY0Igo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAr
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi43Igo+ICtCUjJfTElOVVhf
S0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKPiAgIEJSMl9MSU5VWF9LRVJORUxfRFRT
X1NVUFBPUlQ9eQo+IC1CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYWxsd2lubmVy
L3N1bjUwaS1oNjE2LW9yYW5nZXBpLXplcm8zIgo+ICtCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9E
VFNfTkFNRT0iYWxsd2lubmVyL3N1bjUwaS1oNjE4LW9yYW5nZXBpLXplcm8zIgo+ICAgQlIyX0xJ
TlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+ICAgQlIyX0xJTlVYX0tFUk5FTF9JTlNU
QUxMX1RBUkdFVD15Cj4gICBCUjJfTElOVVhfS0VSTkVMX0RUQl9LRUVQX0RJUk5BTUU9eQo+IC1C
UjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvb3JhbmdlcGkvb3Jh
bmdlcGktemVybzMvbGludXguY29uZmlnIgo+ICAgCj4gICAjIEZpbGVzeXN0ZW0KPiAgIEJSMl9U
QVJHRVRfR0VORVJJQ19JU1NVRT0iV2VsY29tZSB0byBPcmFuZ2VwaSBaZXJvMyIKPiAgIEJSMl9U
QVJHRVRfUk9PVEZTX0VYVDI9eQo+ICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKPiAtQlIy
X1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxODBNIgo+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQy
X1NJWkU9IjEyME0iCj4gICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gICAK
PiAgICMgaG9zdCB0b29scwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
