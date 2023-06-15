Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC91EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 15:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACFF88340C;
	Thu, 15 Jun 2023 15:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACFF88340C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-zr3sslFBuX; Thu, 15 Jun 2023 15:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 002A681F50;
	Thu, 15 Jun 2023 15:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 002A681F50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0E31BF296
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 15:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1864A81E4B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 15:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1864A81E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9j86NgnnNbjv for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 15:42:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C20C8322E
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C20C8322E
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 15:42:42 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51878f8e541so4252130a12.3
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 08:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686843760; x=1689435760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+/ZHqJ7hB/GgBVSBVBlW8jwpZlGQ7GFZOUm4BvodEo=;
 b=Rz4pECUhgxn6UTL/uWeG8ag7S1/DKBeUV19BNi4+FSTkTH9g9PC9azEWLmHgZheWpA
 E2H8r+hmhEHKOGDWTMpL4T4ITbLGUt1KieZst7tpfeaXxDPYR6xKnwENBK/beW7SG5zR
 RUGqKhqRd/QGG+cxW7hQoQ9eKz96Pmkzs6/h5RFKhEmu0V4nAkTeQm5HN6kARfXuL6nO
 c63LTVPBMb22rubj8aemTmU1fmALD65d115iLD4aUYw3TbAxUBocVZ4+E1AfuAHzgKOg
 EetUx7Xl2tJutb6D1MVuxoHmxiwwysHxFhbBfVr+qSfyZhds1RWVnII4ZlbN3kDK+zlq
 bSug==
X-Gm-Message-State: AC+VfDzHj8kS2fBoQF87j389z601lpvnlMetodxXLcUi05gVD9IvzAA2
 THHqBCKfYGgOI38YYpRcvwXovVvPTsUh/T71CI3OMb5VvH3i6Q==
X-Google-Smtp-Source: ACHHUZ7QNQIoNZdCBEHqagcDa3i/SVg5JH9B6VdkmC8wg429dOFDYQTCOHEbVrAIn4EICEyZFwexRHmLTGRFDe2w3PQ=
X-Received: by 2002:a50:fe84:0:b0:518:4ac0:d975 with SMTP id
 d4-20020a50fe84000000b005184ac0d975mr6641705edt.3.1686843760620; Thu, 15 Jun
 2023 08:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230612165344.3829304-1-giulio.benetti@benettiengineering.com>
 <CA+fTLhis7aZyd5WyhAqvFGCYRNLw+HvSBXqU3X2JW2AccQ==2A@mail.gmail.com>
In-Reply-To: <CA+fTLhis7aZyd5WyhAqvFGCYRNLw+HvSBXqU3X2JW2AccQ==2A@mail.gmail.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Thu, 15 Jun 2023 18:42:29 +0300
Message-ID: <CA+fTLhj9KDPM8hfi50puztUKpXftEJT5K38EBavgTGaOuY0=+w@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686843760; x=1689435760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+/ZHqJ7hB/GgBVSBVBlW8jwpZlGQ7GFZOUm4BvodEo=;
 b=c0aIC8CyvcmyKkX2zs34aYvuomU9mBcerqiBTzZ26S5t582aAS0cDOMZqR943nX+lN
 GE7w20hdhWRHi+5+PYOgA/soaAx0wWdQMjcGxGUi/WprjEkXQBXDTQlJ6joRcdcFNdsD
 TdIxS/1yjOVltiXJ4rN/vtD/NKWajDy8GpG2vmuw0Gls6MaNEO/pjD4CgexmoF6KUEdX
 0Cs9O/SUu73tsnb+YuNIxyB9rpUO+rKMdg7NfGfun0IGcJRr/G8lvZvusQH1ziAlcJGT
 rttAFbLQMYKWU9il7LBdhj0WFXBkj03PRFtkFEsl5Hx6QpUCMaLoVM+hctjHcC7LEGux
 8ltw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=c0aIC8Cy
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: en/disable runtime debug
 according to BR2_ENABLE_RUNTIME_DEBUG
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S29udGFrdCBJbmRyZWsgS3J1dXNhICg8aW5kcmVrLmtydXVzYUBnbWFpbC5jb20+KSBraXJqdXRh
cyBrdXVww6RldmFsCk4sIDE1LiBqdXVuaSAyMDIzIGtlbGwgMTg6Mjg6Cj4KPiBLb250YWt0IEdp
dWxpbyBCZW5ldHRpICg8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4pCj4g
a2lyanV0YXMga3V1cMOkZXZhbCBFLCAxMi4ganV1bmkgMjAyMyBrZWxsIDE5OjUzOgo+ID4KPgo+
IFllcywgdGhpcyBwYXRjaCB0dXJucyBvZmYgdGhlIGRlYnVnIG1vZGUgZm9yIHJ0bDgxODlmcy4K
Pgo+ID4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20+Cj4KPiBUZXN0ZWQtYnk6IEluZHJlayBLcnV1c2EgPGluZHJlay5r
cnV1c2FAZ21haWwuY29tPgo+CgpPaCwgdGhlIHRlc3RpbmcgaXMgaW5jb21wbGV0ZSB3aXRob3V0
IHR1cm5pbmcgb24KQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVHIGFsc28uIFllcywgdHVybmluZyBp
dCBvbiB3b3JrcyBhcyBleHBlY3RlZAp0b28uCgpJbmRyZWsKCj4gVGhhbmtzLAo+IEluZHJlawo+
Cj4gPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9ydGw4MTg5ZnMvcnRsODE4OWZzLm1rIHwgNCArKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3J0bDgxODlmcy9ydGw4MTg5ZnMubWsgYi9wYWNrYWdlL3J0bDgxODlmcy9ydGw4
MTg5ZnMubWsKPiA+IGluZGV4IGRkMzVhMTY2ZTUuLjZiMDU4NTA3M2IgMTAwNjQ0Cj4gPiAtLS0g
YS9wYWNrYWdlL3J0bDgxODlmcy9ydGw4MTg5ZnMubWsKPiA+ICsrKyBiL3BhY2thZ2UvcnRsODE4
OWZzL3J0bDgxODlmcy5tawo+ID4gQEAgLTEzLDYgKzEzLDEwIEBAIFJUTDgxODlGU19NT0RVTEVf
TUFLRV9PUFRTID0gXAo+ID4gICAgICAgICBLVkVSPSQoTElOVVhfVkVSU0lPTl9QUk9CRUQpIFwK
PiA+ICAgICAgICAgS1NSQz0kKExJTlVYX0RJUikKPiA+Cj4gPiAraWZlcSAoJChCUjJfRU5BQkxF
X1JVTlRJTUVfREVCVUcpLCkKPiA+ICtSVEw4MTg5RlNfTU9EVUxFX01BS0VfT1BUUyArPSBDT05G
SUdfUlRXX0RFQlVHPW4KPiA+ICtlbmRpZgo+ID4gKwo+ID4gIGRlZmluZSBSVEw4MTg5RlNfTElO
VVhfQ09ORklHX0ZJWFVQUwo+ID4gICAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENP
TkZJR19XSVJFTEVTUykKPiA+ICAgICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05G
SUdfQ0ZHODAyMTEpCj4gPiAtLQo+ID4gMi4zNC4xCj4gPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
