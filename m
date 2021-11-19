Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4130C433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA8361A07
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FA8361A07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCBEA6061A;
	Fri, 19 Nov 2021 17:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o606RUKzkznL; Fri, 19 Nov 2021 17:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266B1605E5;
	Fri, 19 Nov 2021 17:33:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0774E1BF37C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E67FA828B5
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Js6b1WSJrvk for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 17:33:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95F12827AF
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:33:25 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id l22so46352124lfg.7
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 09:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VjsdTChNIaINyewAKHh1C4yWOvsNtzTKBMyXvZxTAyI=;
 b=MCxSs0JvSIAgEmftqws3eDfwXeh6WQcsbfmZnZlF1hZqe4Bh2iujjvG9TylL4CnDIU
 lrz0M3Qyu4WBqgoxv0DbSMAXbVDeX6Dc4XFHdc53klzPbi0bWp7YuQ8MeQu7XjKEQvhX
 0fzeEL2siQkw71uwbzonrEbSy+2oflE8i4yzs7jzO8XQr5qKaSrbOnQw+hJXBiHabG2z
 x1XZEjqldDNu1yf8X8YXKpqZPJXUBPqsAVKdU71LGgi764jffO1hZ8XyiFfcBAdiUCKs
 eTa+CBE1zasDiz0gzLLf2iR+osQ0wup5L1r4vFDadgObWR8HKDTAcd4E3XBlbNE1lkUV
 IajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VjsdTChNIaINyewAKHh1C4yWOvsNtzTKBMyXvZxTAyI=;
 b=wR3d/kBupC8fnrbdCBIdPGEVPtmnmPD5sbEkt4c9OUTMquZ8b3FQTX4RGWnJYfKp4R
 xL/l4i+V/gP3VVevNUY3pYVtpP1Vg5+MQGKOhnUA43j5jVQ87OJ3JbgFxPyElftelupi
 zyKWu8clNsCzCOU2zUiTQrkV0y+6E+2DXvx8FjryYki+dYwhQS8V3DsBR/7OiOJ1899w
 6+zj+7hG4lb8bgZiNGZ6gwo8hNwR4LmochWQGlxPImgFTi15p0pIGXbc7srwlZcytdqz
 qZCGiC7DPidqvG9B53KzjrnvG+PAADewAY3g5YNlMr7q6oKxOSEP2or9ZDh4kCm5jfDZ
 OEZQ==
X-Gm-Message-State: AOAM531Ojjbk00rbn/XWQDQXo2w6Z6CyXnmkyMWKJ90tFJSsB3aRdpsH
 5cIzNTcnbt8ocrs4Xv8TlB3rKdyLoRlf7XpGDs8qLhwXs/0=
X-Google-Smtp-Source: ABdhPJy1ZOY6rQbls20WQNXzmemJcDb83KhGwwDuDj6fq92eU/PE2Xv8p3qzqXgeDG/KGVrUoQSp2wwBVq5C9J7vnzU=
X-Received: by 2002:a05:651c:10a5:: with SMTP id
 k5mr27734048ljn.8.1637343203019; 
 Fri, 19 Nov 2021 09:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20211119165458.2410686-1-fontaine.fabrice@gmail.com>
 <20211119171046.GQ247986@scaer>
In-Reply-To: <20211119171046.GQ247986@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Nov 2021 18:31:00 +0100
Message-ID: <CAPi7W81VusJ3puVf8epMCvuHC+sWg-2YbCHcjrpLMoKY9oxkQw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/log4cxx: select boost
 chrono and date-time with gcc < 7"
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCkxlIHZlbi4gMTkgbm92LiAyMDIxIMOgIDE4OjEwLCBZYW5uIEUuIE1PUklOIDx5
YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4g
T24gMjAyMS0xMS0xOSAxNzo1NCArMDEwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6
Cj4gPiBUaGlzIHJldmVydHMgY29tbWl0IDNjMjI0NWNiNjU3NDFjOTY1ZjRiYjg3ZDM1YWMzYzY0
ZjI1MGExYWUgdG8gbW92ZQo+ID4gdGhlc2Ugc2VsZWN0cyBvbiBib29zdCBzaWRlIGFzIHRoZSBi
dWlsZCBmYWlsdXJlIHdhcyByYWlzZWQgd2l0aCBnY2MgPj0KPiA+IDcuCj4KPiBTbywgaWYgSSB1
bmRlcnN0YW5kIGNvcnJlY3RseSwgaWYgd2UganVzdCBhcHBseSB0aGlzIHJldmVydCwgYnV0IG5v
dCB0aGUKPiBmb2xsb3dpbmcgcGF0Y2gsIHdlIGJyZWFrIHRoZSBidWlsZCBhZ2FpbiwgcmlnaHQ/
IElmIHNvLCB0aGVuIGl0IG1ha2VzCj4gdGhlIGhpc3Rvcnkgbm90IGJpLXNlY3RhYmxlLgpObywg
YmFzaWNhbGx5IHRoZSBwYXRjaCB0aGF0IEknbSByZXZlcnRpbmcgaXMgYSAibm8tb3AiLgpJdCBk
b2VzIG5vdCBmaXggYW55dGhpbmcgYXMgdGhlIGJ1aWxkIGZhaWx1cmUgaXMgcmFpc2VkIHdpdGgg
Z2NjID49NywKbm90IGdjYyA8IDcuCkkgbWFkZSB0aGlzIG1pc3Rha2UsIGJlY2F1c2UgdGhlIGJ1
aWxkIGZhaWx1cmUgaXMgb25seSByYWlzZWQgc2luY2UKY21ha2UgPj0gMy4yMS4zIGFuZApodHRw
czovL2dpdGh1Yi5jb20vS2l0d2FyZS9DTWFrZS9jb21taXQvMWFkMGM1YWU1M2ZjMGM0Zjc3NDE2
NjMzN2YwZTljOTNjNTc4Y2Y5Yi4KCmNtYWtlIGhhcyB0aGUgZm9sbG93aW5nIGJlaGF2aW9yOgog
LSBpZiBpdCAicmVjb2duaXplcyIgdGhlIGJvb3N0IHZlcnNpb24sIGl0IHdpbGwgc2V0IHRoZSBi
b29zdCB0aHJlYWQKZGVwZW5kZW5jaWVzIHRvIGNocm9ubyBkYXRlX3RpbWUgYXRvbWljLgogLSBI
b3dldmVyLCBpZiBpdCBkb2VzIG5vdCByZWNvZ25pemUgaXQgKGkuZS4gd2l0aCBjbWFrZSA8IDMu
MjEuMyBhbmQKYm9vc3QgMS43Ny4wKSwgaXQgd2lsbCBzZXQgdGhlIGJvb3N0IHRocmVhZCBkZXBl
bmRlbmNpZXMgdG8gY2hyb25vCmF0b21pYy4KPgo+IEluc3RlYWQsIHRoZSBib29zdCBwYXRjaCBt
dXN0IGJlIGFwcGxpZWQgZmlyc3QsIGFuZCBvbmNlIHRoYXQgaXMgZG9uZSwKPiB0aGVuIHdlIGNh
biBhcHBseSB0aGlzIHJldmVydC4KPgo+IElmIHRoZSBhYm92ZSBpcyBjb3JyZWN0LCBqdXN0IHNh
eSBzbywgd2UgY2FuIHJlLW9yZGVyIHRoZSBwYXRjaGVzIHdoZW4KPiBhcHBseWluZy4uLgo+Cj4g
UmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZv
bnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2Uv
bG9nNGN4eC9Db25maWcuaW4gfCAyIC0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbG9nNGN4eC9Db25maWcuaW4gYi9wYWNr
YWdlL2xvZzRjeHgvQ29uZmlnLmluCj4gPiBpbmRleCAyN2E1ZjA2OTg4Li42ZjE5NTZmODI5IDEw
MDY0NAo+ID4gLS0tIGEvcGFja2FnZS9sb2c0Y3h4L0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2Fn
ZS9sb2c0Y3h4L0NvbmZpZy5pbgo+ID4gQEAgLTEyLDggKzEyLDYgQEAgY29uZmlnIEJSMl9QQUNL
QUdFX0xPRzRDWFgKPiA+ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9BUFJfVVRJTAo+ID4gICAg
ICAgc2VsZWN0IEJSMl9QQUNLQUdFX0JPT1NUIGlmICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF83Cj4gPiAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfQk9PU1RfQVRPTUlDIGlmICFCUjJfVE9P
TENIQUlOX0dDQ19BVF9MRUFTVF83Cj4gPiAtICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfQk9PU1Rf
Q0hST05PIGlmICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83Cj4gPiAtICAgICBzZWxlY3Qg
QlIyX1BBQ0tBR0VfQk9PU1RfREFURV9USU1FIGlmICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF83Cj4gPiAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfQk9PU1RfVEhSRUFEIGlmICFCUjJfVE9P
TENIQUlOX0dDQ19BVF9MRUFTVF83Cj4gPiAgICAgICBoZWxwCj4gPiAgICAgICAgIEFwYWNoZSBs
b2c0Y3h4IGlzIGEgbG9nZ2luZyBmcmFtZXdvcmsgZm9yIEMrKyBwYXR0ZXJuZWQKPiA+IC0tCj4g
PiAyLjMzLjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
QmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
