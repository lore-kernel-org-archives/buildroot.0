Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA17FC77B75
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 04:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C69616F1;
	Wed, 17 May 2023 04:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C69616F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QqFyrIt42H8; Wed, 17 May 2023 04:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7406560A74;
	Wed, 17 May 2023 04:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7406560A74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A384F1BF4D7
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 04:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 897F760A74
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 04:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 897F760A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjIoo75Muv7B for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 04:58:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8271D60A47
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8271D60A47
 for <buildroot@buildroot.org>; Wed, 17 May 2023 04:58:39 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-4360e117b7cso71033137.3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 21:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684299518; x=1686891518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xx4WAY+k2//YywCj+YOu00b2QgAhQhQkMkdcvjV8wtM=;
 b=iqDzlLwX/xXO7wFO/Dl33n0+FmYONZrkSJgEtuRkaxFFWWDHv650p9Px6XFBI89527
 ik4vNwOlPBKvLMlN2oVDgYSwaHxqAxalGQ7mrHtts1E6tUlO1ZePecc3SrA/yChI/MAP
 ThWfhrGlYTDbk1etBZ5D/BrhaLlX21n6Fz8UGnSjdbr4aUbRU1cy8PXPmFZEK8YFTPKz
 4rZVnh4zQQSdtUxF/glCGl+lpie2lEdOO1xLLRaEJyr4XyBffp+Yki/Rhnk4HD8oYEDd
 tzvEeufhT3SwB4qlGaOuGO/ux5dBLic5MZEELmCmN0328H8wgidjjpVLnr0Yx87FAk3c
 /wNA==
X-Gm-Message-State: AC+VfDwsm+C/rv8Mb867dNWfvjVw5MUnaI9mss7Kz1Us7iPXWH1hTwVi
 Y12RzDEHD5qH/tOg8Q7+McNn/oXaf6gpbGdDdZ8=
X-Google-Smtp-Source: ACHHUZ7GaDmsgl5B7VoXpU0LnFBpn7V5BFFcolILh/5WOCi0hXZl8es/u57eeT2odK+4rwL5OAUz8RvREem7gpvw7/8=
X-Received: by 2002:a67:d005:0:b0:42e:41d9:4ea8 with SMTP id
 r5-20020a67d005000000b0042e41d94ea8mr16122024vsi.9.1684299517716; Tue, 16 May
 2023 21:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230503023926.587412-1-alistair.francis@wdc.com>
 <20230513160934.GU2582048@scaer>
In-Reply-To: <20230513160934.GU2582048@scaer>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 14:58:11 +1000
Message-ID: <CAKmqyKMJyT2HKELoQ_EShPYLv=DJDJYAwhYJg+srEP7sFO1zoA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684299518; x=1686891518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xx4WAY+k2//YywCj+YOu00b2QgAhQhQkMkdcvjV8wtM=;
 b=XNbnWX6xuzx45uMWMasOUJF7Oyprp2kb3+xNwjYDiPC2UCUvOxKyULCrERHdLkucgw
 +VhQ5nhzBI5IeDXh3r/i4jMNMOiGBsFC06qdLljn2QiwNEWLspFFUjLCwhdm0mUee1HK
 6QgUjRscrz59Fh+5pnBj8YQZ26RwkLAt77JF+X7h9/Yws8CP/pPeCRVadfQmurdXKDbK
 S3fWMHgjvo+m0uSz/yr1dTqsa1a7zMvOB75UzvxdGdpkN7VqF1m8T1FBm64CxRp2rev2
 G8i0YG4m7HXZgFoowOMHYTiIHfSf7g6daUXzGiogQwtsHLfAPJkP81t0CSKfTLiJ6ry+
 EDtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XNbnWX6x
Subject: Re: [Buildroot] [PATCH] package/cmocka: Ensure we always build
 static libs
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
Cc: Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBNYXkgMTQsIDIwMjMgYXQgMjowOeKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEFsaXN0YWlyLCBBbGwsCj4KPiBPbiAyMDIzLTA1
LTAzIDEyOjM5ICsxMDAwLCBBbGlzdGFpciBGcmFuY2lzIHNwYWtlIHRodXNseToKPiA+IFNvbWUg
cGFja2FnZXMgdGhhdCB1c2UgY21vY2thIGFzIGEgZGVwZW5kZW5jeSB3aWxsIGxpbmsgYWdhaW5z
dCB0aGUKPiA+IHN0YXRpYyBsaWJzLCBzbyBsZXQncyBidWlsZCB0aGVtIGJ5IGRlZmF1bHQuCj4K
PiBXaGF0IHBhY2thZ2VzPyBBcmUgdGhleSBpbiBCdWlsZHJvb3Q/IFdoeSBjYW4ndCB0aGV5IGxp
bmsgdG8gdGhlIHNoYXJlZAo+IGxpYnJhcnk/CgpJIHNob3VsZCBoYXZlIGtlcHQgdGhpcyBwYXRj
aCBhcyBwYXJ0IG9mIGEgc2VyaWVzLCBidXQgaXQncyBmb3IKbGlic3BkbTogaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMy1NYXkvNjY3MDY0Lmh0bWwK
CkFsaXN0YWlyCgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+Cj4gPiAtLS0K
PiA+ICBwYWNrYWdlL2Ntb2NrYS9jbW9ja2EubWsgfCA0IC0tLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jbW9ja2EvY21v
Y2thLm1rIGIvcGFja2FnZS9jbW9ja2EvY21vY2thLm1rCj4gPiBpbmRleCBlYWZiNDg5OGUxLi5l
MjEyOTY5MjFkIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9jbW9ja2EvY21vY2thLm1rCj4gPiAr
KysgYi9wYWNrYWdlL2Ntb2NrYS9jbW9ja2EubWsKPiA+IEBAIC0xNSwxMCArMTUsNiBAQCBDTU9D
S0FfQ09ORl9PUFRTID0gLURXSVRIX0VYQU1QTEVTPU9GRgo+ID4gICMgY21vY2thIG9ubHkgc3Vw
cG9ydHMgb3V0IG9mIHNvdXJjZSBidWlsZHMKPiA+ICBDTU9DS0FfU1VQUE9SVFNfSU5fU09VUkNF
X0JVSUxEID0gTk8KPiA+Cj4gPiAtIyBjbW9ja2EgYWx3YXlzIGJ1aWxkcyBhIHNoYXJlZCBsaWJy
YXJ5LCBidXQgeW91IGNhbiBvcHRpb25hbGx5IGJ1aWxkIGEgc3RhdGljCj4gPiAtIyBsaWJyYXJ5
IGFzIHdlbGwKPiA+IC1pZmVxICgkKEJSMl9TSEFSRURfU1RBVElDX0xJQlMpLHkpCj4gPiAgQ01P
Q0tBX0NPTkZfT1BUUyArPSAtRFdJVEhfU1RBVElDX0xJQj1PTgo+ID4gLWVuZGlmCj4gPgo+ID4g
ICQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTog
IFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
