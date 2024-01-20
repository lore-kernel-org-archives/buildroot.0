Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4B7C47DAF
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 03:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C43EC401E1;
	Sat, 20 Jan 2024 03:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C43EC401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XC6JYxJoB08I; Sat, 20 Jan 2024 03:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 803D84026A;
	Sat, 20 Jan 2024 03:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 803D84026A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6BD41BF40B
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 03:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BA7C42E32
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 03:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA7C42E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fg2AWLIeucim for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 03:11:31 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70E5842E2E
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 03:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E5842E2E
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so1185602a12.1
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 19:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705720289; x=1706325089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEvbRMbTzCN5crbj4iGBZq6QkOkjDYi29nXp8E4EWhM=;
 b=pifjcqK+t133iL5ElRHWeOMXtQEEpfMNonkOXry/oAXt3dAldaWpNx2HJ1zZwJr2+6
 d9qozuzHQrN8+fg7Ow0IeTffPnVcL082b/gwYxh+sjK93fT4qDrVpw2tk1s4AD7fYdYR
 XyT40qD8tXux4I0mZc3KIXgyksYX2+59/xqmbGPxRH7xsFm0MJ7gbLZcIsTcSqQgnSLJ
 8b3nXO5dr85WXgZUi7UgifGOCRbbCEImi7cZqngMh1CeZAZ/aMotS+nj9a722Q/4khCk
 KFUVuJaKa7qSo7lhqhUiPIoXW1A9VGMEMSK2N0cZbjTYxJ3X4qb5gx1h5zt/IMmag22p
 Mg9w==
X-Gm-Message-State: AOJu0YziMS7nh/1Ye1P6S5PzxCL/8Qym45qdl3SEDbHFVE8dex6AdHag
 Ejo92Mz9icuiQWrKkjA0WwnKzr+I0IMGZe3b+bbmsQAD4C7qVrwlEGwUgJa50hPNLgQI6Yyo2FY
 zmdfvV2DEGH+dfS+iibivBdPW9nfz5F9R9O03cBB+JmPvOh9B3DQ=
X-Google-Smtp-Source: AGHT+IHWFMIYNUrIKfc45Tcjc+9EhGrELLBMpAsJBG8Jv8LY62f6JQwWJDZG4Se0pRYJFKlV/aOCa7lSlByAlWPlt10=
X-Received: by 2002:a17:906:c9d5:b0:a27:be67:1743 with SMTP id
 hk21-20020a170906c9d500b00a27be671743mr337358ejb.40.1705720289141; Fri, 19
 Jan 2024 19:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
 <20231211155951.4079886-3-gael.portay@rtone.fr> <ZardHEVqvVLucJQM@landeda>
In-Reply-To: <ZardHEVqvVLucJQM@landeda>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 19 Jan 2024 20:11:17 -0700
Message-ID: <CAHDQB6NrRc3YPpTvRUw52FVZjY28=RaNWEmEXt2YVKvB6ZwtyA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705720289; x=1706325089;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEvbRMbTzCN5crbj4iGBZq6QkOkjDYi29nXp8E4EWhM=;
 b=GPLmQl/QRUdUQhP1r53O5CW9YR6t6R/Qtxu15Mjn2CPaGex1bZO4oUiOy85ZgTQ0+3
 pLoG4n9ZU0KXxRPr1Xe1btd8BiK+AtT0+1zQiyixFDK/xtRzMCfV/C7kRqfJ6MFmS7xe
 0dbNn6wAa+pA4yvDEsunXckPfMzG90HEaDuug=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GPLmQl/Q
Subject: Re: [Buildroot] [PATCH v2 2/2] configs: add raspberrypi 5 defconfig
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG87CgoKT24gRnJpLCBKYW4gMTksIDIwMjQgYXQgMTozNuKAr1BNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEdhw6tsLCBBbGwsCj4KPiBPbiAy
MDIzLTEyLTExIDE2OjU5ICswMTAwLCBHYcOrbCBQT1JUQVkgc3Bha2UgdGh1c2x5Ogo+ID4gVGhp
cyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeVBpIDUuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4K
PiBbLS1TTklQLS1dCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9jb25maWdzL3Jhc3BiZXJy
eXBpNV9kZWZjb25maWcKPiA+IEBAIC0wLDAgKzEsNDAgQEAKPiA+ICtCUjJfYWFyY2g2ND15Cj4g
PiArQlIyX2NvcnRleF9hNzZfYTU1PXkKPiA+ICtCUjJfQVJNX0ZQVV9WRlBWND15Cj4gPiArQlIy
X0FSTTY0X1BBR0VfU0laRV8xNks9eQo+Cj4gU28sIHdlIGNob29zZSAxNksgZm9yIHRoZSB1c2Vy
bGFuZCBwYWdlIGFsaWdubWVudCwgYmVjYXVzZS4uLgo+Cj4gWy0tU05JUC0tXQo+ID4gK0JSMl9M
SU5VWF9LRVJORUw9eQo+ID4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTEw9eQo+ID4g
K0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIs
cmFzcGJlcnJ5cGksbGludXgsMTdmMTM1Yjc0MmM0ZWRiMzQwYWZiMzY1ODczYzNhNTc0ZjdlMTZj
YikvbGludXgtMTdmMTM1Yjc0MmM0ZWRiMzQwYWZiMzY1ODczYzNhNTc0ZjdlMTZjYi50YXIuZ3oi
Cj4gPiArQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MTIiCj4KPiAuLi4gdGhlIGJj
bTI3MTJfZGVmY29uZmlnIGluIHRoZSBrZXJuZWwgdHJlZSBkZWZhdWx0IHRvIHVzZSAxNksgcGFn
ZXM6Cj4gICAgIENPTkZJR19BUk02NF8xNktfUEFHRVM9eQo+Cj4gVGhpcyBpcyBhbGwgYSBsaXR0
bGUgYml0IG11cmt5IGZvciBtZSwgYnV0IHRoZSBrZXJuZWwgaGVscCBmb3IKPiBDT05GSUdfQVJN
NjRfMTZLX1BBR0VTIHN0YXRlczoKPgo+ICAgVGhlIHN5c3RlbSB3aWxsIHVzZSAxNktCIHBhZ2Vz
IHN1cHBvcnQuIEFBcmNoMzIgZW11bGF0aW9uCj4gICByZXF1aXJlcyBhcHBsaWNhdGlvbnMgY29t
cGlsZWQgd2l0aCAxNksgKG9yIGEgbXVsdGlwbGUgb2YgMTZLKQo+ICAgYWxpZ25lZCBzZWdtZW50
cy4KPgo+IEJ1dCB3ZSBhcmUgbm90IGRvaW5nIDMyLW9uLTY0IGluIEJ1aWxkcm9vdCwgd2UncmUg
b25seSBkb2luZyBwdXJlCj4gNjQtYml0Lgo+Cj4gSWYgSSBpbnRlcnByZXQgdGhlIGtlcm5lbCBo
ZWxwIHRleHQgY29ycmVjdGx5LCBhYXJjaDY0IHVzZXJsYW5kIGlzIG5vdAo+IGltcGFjdGVkIGJ5
IHRoZSBwYWdlIHNpemUgdGhlIGtlcm5lbCB1c2VzLCBzbyB3ZSBjYW4gc3RpbGwgdXNlIDRLIHBh
Z2VzCj4gaW4gdXNlcmxhbmQuCj4KPiBPciBkbyB3ZSBqdXN0IHdhbnQgdG8gYXZvaWQgYW55IGNv
bmZ1c2lvbiBhdCBhbGwsIGFuZCBhbHdheXMgY29uc2lkZXIKPiB0aGF0IHRoZSB1c2VybGFuZCBh
bmQga2VybmVsIHBhZ2Ugc2l6ZSBtdXN0IG1hdGNoPyBPciBkaWQgSSBqdXN0Cj4gbWlzaW50ZXJw
cmV0IHRoZSBrZXJuZWwgaGVscCB0ZXh0LCBhbmQgdGhlIHR3byAqbXVzdCogbWF0Y2g/Cj4KPiBJ
ZiBJIG1pc3NlZCBzb21ldGhpbmcgb3IgYW0gd3Jvbmcgc29tZXdoZXJlLCBqdXN0IHllbGwhIDst
KQo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+CgpZZXMsIHlvdSBhcmUgY29ycmVjdC4g
SSBjcmVhdGVkIGJvYXJkL3Jhc3BiZXJyeXBpL3JwaTUtbGludXguZnJhZ21lbnQgd2l0aCB0aGUK
Zm9sbG93aW5nIGxpbmU6CkNPTkZJR19BUk02NF80S19QQUdFUz15CgpJIGJ1aWx0IHRoaXMgY29u
ZmlnIHVzaW5nIGEgQm9vdGxpbiB0b29sY2hhaW4sIGFuZCBldmVyeXRoaW5nIHdvcmtzIHByb3Bl
cmx5Cm9uIG15IHBlcnNvbmFsIFJQSTUhCgpBZGFtCgo+ID4gKyMgQnVpbGQgdGhlIERUQiBmcm9t
IHRoZSBrZXJuZWwgc291cmNlcwo+ID4gK0JSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+
ID4gK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzEyLXJw
aS01LWIiCj4gPiArCj4gPiArQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+
ID4gKwo+ID4gK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRT15Cj4gPiArQlIyX1BBQ0tBR0VfUlBJ
X0ZJUk1XQVJFX0NPTkZJR19GSUxFPSJib2FyZC9yYXNwYmVycnlwaTUvY29uZmlnXzUudHh0Igo+
ID4gK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DTURMSU5FX0ZJTEU9ImJvYXJkL3Jhc3BiZXJy
eXBpNS9jbWRsaW5lXzUudHh0Igo+ID4gKyMgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RB
TExfRFRCX09WRVJMQVlTIGlzIG5vdCBzZXQKPiA+ICsKPiA+ICsjIFJlcXVpcmVkIHRvb2xzIHRv
IGNyZWF0ZSB0aGUgU0QgaW1hZ2UKPiA+ICtCUjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQo+
ID4gK0JSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQo+ID4gK0JSMl9QQUNLQUdFX0hPU1RfTVRP
T0xTPXkKPiA+ICsKPiA+ICsjIEZpbGVzeXN0ZW0gLyBpbWFnZQo+ID4gK0JSMl9UQVJHRVRfUk9P
VEZTX0VYVDI9eQo+ID4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4gPiArQlIyX1RBUkdF
VF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIgo+ID4gKyMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlz
IG5vdCBzZXQKPiA+ICtCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9yYXNwYmVy
cnlwaTUvcG9zdC1idWlsZC5zaCIKPiA+ICtCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJi
b2FyZC9yYXNwYmVycnlwaTUvcG9zdC1pbWFnZS5zaCIKPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0K
PiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1l
IEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0t
LS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDov
L3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAg
IGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
