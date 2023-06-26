Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20405EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 23:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C88081AF5;
	Mon, 26 Jun 2023 23:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C88081AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2L495J2wWp7; Mon, 26 Jun 2023 23:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED81981B6D;
	Mon, 26 Jun 2023 23:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED81981B6D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8441BF375
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 23:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBCA860AD8
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 23:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBCA860AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrJMcVcyhHRX for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 23:07:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4EF960ACA
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4EF960ACA
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 23:07:14 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51d80c5c834so4712044a12.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687820832; x=1690412832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QbY5UTlnZTmel8CSuJ6Dt6nvMuIK/BQcYLv8jwaL4zg=;
 b=ijIWZdxQzq24iafNgAELOm7efcxwDZPjwgmxV9v2Wt1QNIBRPAaDO+1jK309B8sa1S
 csuPpZgHinwbUXZvkgvWGqr7oOebq2E/ajpGIJY6xqecKNYAryIfRYAD2kpAw6Zh0hv1
 SLwzIJtVleOBHCZqrz8mBIrWbsp7P6kP/FqZ7S8ZZKRR0FVUbNDpi33tZ1B8yGrRlhMO
 RC2MEJY1KTe8nJF6T2ZckRjXpmGAe96HTIor6ei+QAa+bMoTH6rXfdbIaQ/6upjsQLIr
 aD1FRru7MI/9SCZ09QqBDhQCxSMro5GQxWPYpEKTn7DA0E3XqaY0ZBKX4UoNRDIy0evH
 WPUg==
X-Gm-Message-State: AC+VfDwo00r42rK+GgtcVCaOGTKxHvozS7llcPnOUMN13dC6P4dpcKtz
 klMdzmzsw2ZqaUzN5CM1TUJKpNwefzplsGoAEZkmw7xD
X-Google-Smtp-Source: ACHHUZ4KRd/9nC9jKADEgO5ZoBguheBlOpN5L8V87g5x+xRa4i7qkUPoAXPDavNXBFSn1w8DjyDaEQ==
X-Received: by 2002:a05:6402:b04:b0:51d:7f9f:4b56 with SMTP id
 bm4-20020a0564020b0400b0051d7f9f4b56mr7758973edb.9.1687820832522; 
 Mon, 26 Jun 2023 16:07:12 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 h11-20020aa7c60b000000b0051bed60f333sm3253993edq.48.2023.06.26.16.07.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 16:07:12 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-313e1c27476so2220563f8f.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:07:11 -0700 (PDT)
X-Received: by 2002:a5d:56cf:0:b0:313:fc59:1167 with SMTP id
 m15-20020a5d56cf000000b00313fc591167mr413009wrw.30.1687820831258; Mon, 26 Jun
 2023 16:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230606214556.174086-1-christian@aperture.us>
 <CADXxVSJN_s=UkATganO9Bdghec=fPuAdoLZAx2-V3M33UKd_Dw@mail.gmail.com>
 <CA+h8R2pw8ZpZ43AeO3XVZ5ea4JhEN4TWbpErHYgCWL1Gv+JTqQ@mail.gmail.com>
In-Reply-To: <CA+h8R2pw8ZpZ43AeO3XVZ5ea4JhEN4TWbpErHYgCWL1Gv+JTqQ@mail.gmail.com>
Date: Mon, 26 Jun 2023 16:06:59 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qYHoiauviZ+g8g7y-k2FYpmFEZoE6M4kS_G_RW=GB+1A@mail.gmail.com>
Message-ID: <CA+h8R2qYHoiauviZ+g8g7y-k2FYpmFEZoE6M4kS_G_RW=GB+1A@mail.gmail.com>
To: Bryce Johnson <bryce@redpinelabs.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1687820832; x=1690412832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbY5UTlnZTmel8CSuJ6Dt6nvMuIK/BQcYLv8jwaL4zg=;
 b=sSB3RKV0p3ruxPGkFwRcjsBc398KV86f1tLQD+IGbLvEFZcSahiBa/1mif9bAmtQOu
 XRBzQZEKGRjAUCoBukVxYTa/LHXF8LMrl/ZxhhHmQGOmaU8Vo2HpXmjvv9UbuogeExMP
 d3+hocbsabCWZbCI8iid2LwLZSSqz6KSUO9XNGt8k3papxmyxdU8ATG7QbYHiW+TvtDc
 fO+yZv0Z6ho9zPAP8n5XFUGi9w7ET/sDa0+qrssiHfYmN5ex/OFdF08eca6cs561V0CO
 IGsY+COLVt9c8AEYx3hU30SSUsBEypk7gcPwdrW4FU1puooymPz7Lws8JHK2x1h00hz2
 CESg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=sSB3RKV0
Subject: Re: [Buildroot] [PATCH v6 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.10
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKVGhvbWFzOiB5b3Ugd2VyZSBjb3JyZWN0IChvZiBjb3Vyc2UpLCBIT1NUQ0NfTk9DQ0FD
SEUgZG9lcyBub3QgbmVlZAp0aGUgdG9vbGNoYWluIGFzIGl0J3MgcG9pbnRpbmcgdG8gdGhlIGhv
c3QgQyBjb21waWxlci4KCk9uIE1vbiwgSnVuIDI2LCAyMDIzIGF0IDExOjIy4oCvQU0gQ2hyaXN0
aWFuIFN0ZXdhcnQKPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4gT24gTW9uLCBKdW4g
MjYsIDIwMjMgYXQgMTE6MTjigK9BTSBCcnljZSBKb2huc29uIDxicnljZUByZWRwaW5lbGFicy5j
b20+IHdyb3RlOgo+ID4KPiA+IENocmlzdGlhbiwKPiA+IEkgbmVlZGVkIHRvIGFkZCBIT1NUX0dP
X0JPT1RTVFJBUF9TVEFHRTFfREVQRU5ERU5DSUVTPXRvb2xjaGFpbiAgIHdpdGgKPiA+IHBlciBw
YWNrYWdlIGJ1aWxkIG9wdGlvbiB0byBnZXQgdGhlIGJ1aWxkIHdvcmtpbmcuCj4gPgoKSSBzZWUg
aW4gdGhlIGxvZ3MgeW91IHNlbnQgdGhhdCBib290c3RyYXAtc3RhZ2UxIGFuZCBib290c3RyYXAt
c3RhZ2UyCmJ1aWx0IGNvcnJlY3RseS4KCkF0dGVtcHRpbmcgYSBidWlsZCB3aXRoIHRoZSBmb2xs
b3dpbmcgY29uZmlnIG9wdGlvbnM6CgpCUjJfUkVQUk9EVUNJQkxFPXkKQlIyX1BFUl9QQUNLQUdF
X0RJUkVDVE9SSUVTPXkKCmhvc3QtZ28tYm9vdHN0cmFwLXN0YWdlMSwgaG9zdC1nby1ib290c3Ry
YXAtc3RhZ2UyLCBhbmQgaG9zdC1nbyBidWlsZApjb3JyZWN0bHkgd2l0aCB0aGUgY3VycmVudCB2
ZXJzaW9uIG9mIHRoZSBwYXRjaCBzZXJpZXMuCgpUaGUgdG9vbGNoYWluIGRlcGVuZGVuY3kgaXMg
YWRkZWQgdG8gaG9zdC1nbyBhdXRvbWF0aWNhbGx5IHdoZW4gY2dvIGlzCmVuYWJsZWQsIHNvIHRo
ZSB0b29sY2hhaW4gYWxzbyBpcyBidWlsdCAob3IgZXh0cmFjdGVkKSBiZWZvcmUgaG9zdC1nbwpp
cyBjb21waWxlZC4KClNvOiBJIGFtIHVuYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlLiBQbGVh
c2UgcHJvdmlkZSBhIGRlZmNvbmZpZyBJCmNhbiB1c2UgdG8gYnVpbGQgJiByZXByb2R1Y2UgdGhl
IHByb2JsZW0gd2l0aCB0aGUgY3VycmVudCB2ZXJzaW9uIG9mCnRoZSBwYXRjaCBzZXJpZXMgZnJv
bSB0aGlzIGVtYWlsICh2ZXJzaW9uIDYpLgoKWW91IGNhbiBhbHNvIHRyeSBteSBicmFuY2ggaGVy
ZToKaHR0cHM6Ly9naXRodWIuY29tL3NraWZmb3MvYnVpbGRyb290L3RyZWUvc2tpZmYtNjE3CgpU
aGFua3MgJiBiZXN0LApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
