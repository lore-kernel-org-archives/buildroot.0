Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACD1C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 08:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E6660606;
	Sun, 24 Mar 2024 08:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16WlYYP-gLAv; Sun, 24 Mar 2024 08:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF0506060E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF0506060E;
	Sun, 24 Mar 2024 08:20:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECD471BF5A4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 08:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6A14400BF
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 08:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtrVDu5IsQRb for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 08:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=tekieli.lukasz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E512E400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E512E400C4
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E512E400C4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:20:05 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3666affcb59so16058125ab.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 01:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711268404; x=1711873204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xi/lrmw0HGHdiMF/y/kuc4U1vMkzRoCXhsCIkFPFYi8=;
 b=rY8itY+Rf/OJWhgE+HKSKKrOmuxlUcCXORDVFz1zDzJstq5TfaWhpymfOMBfyGUUZH
 d9gnCFeF8e5RpprvjupsofMQSv5EMm5/9aFYx80t0vrKYNJPbLGXhuopEXyWYzsoyaju
 ynBYrQgvRYhd4Lzo/0el+4ThtapnaP7VI1y9WCkC+va67TN5gTOrNG+Hf2Lh0+iRzqzp
 ng26m2OQhvYlyHjzNt/DZONlDC0vk1Ds58bDm+7oEhQK1g6KI8HoM7SF3XAgTjLdo9kh
 sqKpWk+DUUaaEmzw9Q6MDQoub9lk5w9okJI6nz2VGylL0IwLTM+7rs5YLYt6QYj3U1uL
 FIBg==
X-Gm-Message-State: AOJu0YwSowfMD6L8LT6R891KzDwtejLQpH13qvTN8yZQPhZdGQg3KKUU
 4IPct3llF4cUa+iA1h5npcNad6K0sNXAQkZRVj3/stSrOMuldil5pcf/G0OWg/qBZTUoae7LPL4
 dASNE6o+pertyjOPx2ls3oYC08Gr9lV/s9DE=
X-Google-Smtp-Source: AGHT+IFBQpVkNBKuUOkt25KUl/74Hh9OJQ84cEFFjaGrAAJhThjx8OL9ea1EGcfwA19V3ry7KGI/GGw6h2vAQv4vRB4=
X-Received: by 2002:a92:c7c3:0:b0:366:ab6f:f6a with SMTP id
 g3-20020a92c7c3000000b00366ab6f0f6amr3995412ilk.24.1711268404419; Sun, 24 Mar
 2024 01:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
 <20240208211517.9234-3-tekieli.lukasz@gmail.com> <874jcwitlk.fsf@48ers.dk>
 <CAFfxiozPcc5QisMEsKadCX2wb0F-oQ1GqQ2fXmJDK_+7xk=qXA@mail.gmail.com>
 <87zfuogixm.fsf@48ers.dk>
In-Reply-To: <87zfuogixm.fsf@48ers.dk>
From: =?UTF-8?Q?=C5=81ukasz_Tekieli?= <tekieli.lukasz@gmail.com>
Date: Sun, 24 Mar 2024 09:19:53 +0100
Message-ID: <CAFfxioyCv1F6+_BkJ8pGAq-f+mqyQw+nWkXhkp0ZdVrB2LF5OA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711268404; x=1711873204; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xi/lrmw0HGHdiMF/y/kuc4U1vMkzRoCXhsCIkFPFYi8=;
 b=RSvWcoCCKNXXjw5omovBcS2rvWYyXXyMZNzwVQ5eg5DTzTE7KpS2w0acjr+nLd4Ir0
 rv7UY6ve3baCQ4L44Rmv2hGwcZ97Eexm9Pl9RLxm5UQD5CmCkghIPSiRqf3vDcoa49RV
 bPEmCts2TwGqyYUx45gEdRxMMNZn2aCk2sPiD0W0hdi1xTmEXWSs8y6fCWWafF6z6VQV
 iu4BlrEuN+PSDFXj8TFrpW68Kp2nWLx3Wg1l+8NUY/Hryj4EaqoxDxRKWbwEfSUDxMP2
 HLd4aFpQVdoNSBrIl9dXgUubLxXIDvCxyFo69Pe0mw4iTyNg94d9xMtFEwlevmfa/gxR
 cTMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RSvWcoCC
Subject: Re: [Buildroot] [PATCH v2 2/2] board/visionfive2: enable u-boot
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTdW4sIE1hciAyNCwgMjAyNCBhdCA4OjU44oCvQU0gUGV0ZXIgS29yc2dhYXJk
IDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKCj4gUG9zc2libHkgd2UgbmVlZCB0byBidW1w
IHRoZSBMaW51eCBrZXJuZWwuIEhvdyBpcyB0aGUgbWFpbmxpbmUgc3VwcG9ydAo+IHNpdHVhdGlv
biBieSBub3c/IElkZWFsbHkgd2Ugd291bGQgdXNlIG1haW5saW5lIExpbnV4IGFzIHdlbGwuCgpJ
IGhhZCBzb21lIHN1Y2Nlc3Mgd2l0aCB0aGUgbWFpbmxpbmUga2VybmVsLCBidXQgSSBoYWQgdG8g
YXBwbHkgdGhlCmRlZmNvbmZpZyBmcm9tIHRoZSBTdGFyRml2ZSBmb3JrLCBvdGhlcndpc2UgSSBo
YWQgdHJvdWJsZXMgd2l0aCB0aGUKYm9vdC4gSXQncyBzdGlsbCBXSVAuCgo+IEkgZmluYWxseSBl
bmRlZCB1cCBhcHBseWluZyB0aGlzIHBhdGNoIGFmdGVyIGFsbCwgYXMgaXQgbW92ZXMgdXMgaW4g
dGhlCj4gcmlnaHQgZGlyZWN0aW9uLiBJIGRpZCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6Cj4KPiAt
IEFkZGVkIG5vdGUgYWJvdXQgY2hhbmdpbmcgdGhlIGJvb3QgbW9kZSBwaW5zIGluIHRoZSBib2Fy
ZCByZWFkbWUgYW5kCj4gICBsaW5rZWQgdG8KPiAgIGh0dHBzOi8vZG9jLWVuLnJ2c3BhY2Uub3Jn
L1Zpc2lvbkZpdmUyL1F1aWNrX1N0YXJ0X0d1aWRlL1Zpc2lvbkZpdmUyX1NES19RU0cvYm9vdF9t
b2RlX3NldHRpbmdzLmh0bWwKPgo+IC0gQWRkZWQgYSBsaW5rIHRvIHRoZSBVLUJvb3QgZG9jdW1l
bnRhdGlvbiB3aGljaCBkZXNjcmliZXMgdGhlIGJvb3QKPiAgIGZsb3cgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlCgpUaGFuayB5b3UhCgoKCi0tIArFgXVrYXN6IFRla2llbGkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
