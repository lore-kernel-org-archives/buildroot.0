Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4718FEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 07:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C769F60C04;
	Tue, 11 Jul 2023 07:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C769F60C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zswD54Tqbgf; Tue, 11 Jul 2023 07:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02F1060E51;
	Tue, 11 Jul 2023 07:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F1060E51
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 615EE1BF2C4
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 07:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38B996112A
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 07:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38B996112A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3O9dYfll3QVd for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 07:36:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74B4B61195
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74B4B61195
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 07:36:07 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b5ef64bca6so4737647a34.3
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 00:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689060966; x=1691652966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GApBrcgJGIoGrgKSHDZ18WAdZcr8gQoW+lxu+++acY8=;
 b=YUnkaKTSQrBgst0DBgIMBOfYzP7e15eLjGT9gKF7FzzR6JLwW3cDM1mBEtonfO1BAt
 RNoGT/yV9GcqkJMfxfLqhfPJATdkQIh979a7OMCMY7SpoCr1631VLc18lUYnIx9BI0US
 BNyxo5AYLqLFJfqUqE2fdNYFce1qBqnvyMyeAi9jTX4bWJPffQYA3XOX1y9NGRFVthwm
 QIi05QxycimDtKmHBZ/CchjZndH2RBFiLaUJQ8PyzW+78GWXFNBWZKWUELGDGYnABWlS
 kEn/oWNUQNZwy1R3oL3GEjHFjNKF6nVmsPT91gvRQfdZn2HjVJhNWE6EnhA3h2OxF0Bm
 HWiw==
X-Gm-Message-State: ABy/qLbvFlB5KwnSGLUET1jy5HjvR5CERNO6QlNUt4n8BVPEWVx1lzmM
 I9JEP+VTGYjruCz3E9gsKQB/qlnqGRP0iyG+VKU=
X-Google-Smtp-Source: APBJJlGvCDrSkJQIyr5iUnSM/ekVzovPpS+X8q5d22sMdDJ7XlGLW2MXnmyl4eXEFs+YX3WpgtQo+rIyIJuOQigJTqk=
X-Received: by 2002:a05:6870:1cc:b0:1b0:5b04:ebec with SMTP id
 n12-20020a05687001cc00b001b05b04ebecmr14699342oad.59.1689060966159; Tue, 11
 Jul 2023 00:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
 <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
 <20230711093249.73674060@windsurf>
In-Reply-To: <20230711093249.73674060@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Jul 2023 01:35:54 -0600
Message-ID: <CADvTj4r7QRpW3NaYQc+_iZ5Y1WnzBeMQsptvtrtTudDc47X12w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689060966; x=1691652966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GApBrcgJGIoGrgKSHDZ18WAdZcr8gQoW+lxu+++acY8=;
 b=aiUmggI8cs/WVRotPSWQaurb0bNDDN+Um+1r+7mXXxR4xcU99CpIuY2b0r9RYJDbDt
 9dnvyIu6Cvp8lzPv12UEv7h8obPuEKivdO1LmAT4HWNUbnewNX9O33hpJSYdO6wQ/WRV
 2/Qpu+P/MDhdHc/H2uKD6MNGLgRMfdLhKxjT+LTkNBwW61fdkMS3wRdCC2G/jHwLOHFQ
 IGukYkB01lK2MQauzu9DeNTjXjoLgdlJ6nFD6DMAHQOy0x4RfXGcN139f2TonjOHos8W
 TkCqDgzyNOyW9K8jqRANXUWujLnrBSwDaKbDJ9QYxQH56QQsAL/VMv7Fm571/3BLWxVI
 A7jA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aiUmggI8
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMTozMuKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAxMCBKdWwgMjAyMyAx
Mzo1ODozOCAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gPiA+IFdlIG5lZWQgdG8gbWlncmF0ZSBweXRob24tdGVybWluYWx0YWJs
ZXMgdG8gdGhlIHBlcDUxNyBwb2V0cnktY29yZQo+ID4gPiA+IGJhY2tlbmQgYXMgc2V0dXB0b29s
cyBpcyBub3Qgc3VwcG9ydGVkLgo+ID4gPiA+Cj4gPiA+ID4gVXBzdHJlYW0gaGFzIG1lcmdlZCBh
IHBhdGNoIHJlcGxhY2luZyBwb2V0cnkgd2l0aCBwb2V0cnktY29yZSwgaG93ZXZlcgo+ID4gPiA+
IHdlIGNhbiBub3QgYmFja3BvcnQgdGhpcyB1c2luZyBhIHBhdGNoIGZpbGUgZHVlIHRvIENSTEYg
bGluZSBlbmRpbmcKPiA+ID4gPiBpc3N1ZXMgc28gd2Ugd2lsbCBoYXZlIHRvIGFwcGx5IHRoZSBj
aGFuZ2UgaW4gdGhlIHBhdGNoIHVzaW5nIHNlZAo+ID4gPiA+IGluc3RlYWQuCj4gPiA+ID4KPiA+
ID4gPiBTZWUgdXBzdHJlYW0gY29tbWl0Ogo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9tYXR0
aGV3ZGVhbm1hcnRpbi90ZXJtaW5hbHRhYmxlcy9jb21taXQvOWUzZGRhMGVmYjU0ZmVlNjkzNGM3
NDRhMTNhNzMzNmQyNGM2ZTllOQo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiA+Cj4gPiA+IFdoYXQgaXMg
dGhlIG1vdGl2YXRpb24gdG8gZG8gdGhpcywgaWYgdGhlIGN1cnJlbnQgdmVyc2lvbiBvZgo+ID4g
PiBweXRob24tdGVybWluYWx0YWJsZXMgYnVpbGRzIGZpbmUgd2l0aCBzZXR1cHRvb2xzPwo+ID4K
PiA+IEl0IGRvZXNuJ3QgYnVpbGQgaW4gY29tYmluYXRpb24gd2l0aCBwZXA1MTcgc2V0dXB0b29s
cyBzaW5jZSB0aGUgcHlwcm9qZWN0LnRvbWwKPiA+IHNwZWNpZmllcyBwb2V0cnkgYXMgdGhlIGJ1
aWxkIGJhY2tlbmQgYW5kIG5vdCBzZXR1cHRvb2xzLgo+Cj4gU28gaXMgdGhpcyBwYXRjaCBzZXJp
ZXMgbW9kaWZ5aW5nIHB5dGhvbi10ZXJtaW5hbHRhYmxlcyBhIHByZXJlcXVpc2l0ZQo+IHRvIGFw
cGx5aW5nIHRoZSBwYXRjaCBhdAo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA2MjYxODE1MzEuMjMxMjAwMi01LWphbWVzLmhpbGxpYXJk
MUBnbWFpbC5jb20vID8KClllcywgaXQgc2hvdWxkIGJlIGFwcGxpZWQgYmVmb3JlIHRoYXQgb25l
LgoKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWlu
aW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
