Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5753C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 23:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E61F83709;
	Wed, 20 Dec 2023 23:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E61F83709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uccwL1dj9LKB; Wed, 20 Dec 2023 23:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BBE3836C3;
	Wed, 20 Dec 2023 23:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BBE3836C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E30751BF580
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 23:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B71E141DE8
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 23:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B71E141DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Eus0JwVulAR for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 23:31:43 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDBF7417B1
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 23:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDBF7417B1
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5cece20f006so2571517b3.3
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 15:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703115102; x=1703719902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWAqQxzlKAGgA5XP3vJHWf9KCDvVoR5g1IT/dutslaM=;
 b=LPFWkh8GUu0CRuTKLkaSGe72Gg3K2HGQ99ej0idIaT2dFX2JJFewIvTmSD731tNObg
 jORId9YMjRDohovXiIe3OWjA3trMhE/LJ73/KjMgS9JfIW+poAv6Xjla2kywFxid4qu4
 Aorhjf2IDrPdlrGZVYA4CjiE7emm4b4zemkwZ/TKsZ27QXYsbr2yo7QaytP0A5clEQwP
 OR772sTp/aSc4R1pbbdTv/m8LvPbB9KCneQz/Hpngwy6KCOMZ0eqWoiCgQ1evSYDVX1s
 XEeAPRxUR30LqV8AG8WKLWp/7tkoIX2Ap0sBbd3wb9mWlPVdok4ZK0KqwFv4pEo+48li
 tlug==
X-Gm-Message-State: AOJu0YwYg9TzWR5j9I9aQ/XAypbKYv6Q8J08frrUZCIBf2UjnJE4TRcu
 XR+BL2vW1bBhtkVBBziKCaMclKElgOYWrZpBtvMFoHVSq/HEUw==
X-Google-Smtp-Source: AGHT+IFXNkpPlmI8jLWyEJinBRGz//TKA+b9fNa0jNxIx4T/JKFWhAKU6fqKqC77HnxbSx12DuBoJ/aNIgDTZ0TAwlg=
X-Received: by 2002:a0d:d8c3:0:b0:5d4:8806:9885 with SMTP id
 a186-20020a0dd8c3000000b005d488069885mr561505ywe.42.1703115102344; Wed, 20
 Dec 2023 15:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20231218183230.1899-1-davikovs@gmail.com>
 <20231220212445.16494c0f@windsurf>
In-Reply-To: <20231220212445.16494c0f@windsurf>
From: Davis <davikovs@gmail.com>
Date: Thu, 21 Dec 2023 01:31:28 +0200
Message-ID: <CAHQn7pKn5-Ss+zVkEzGow6TNm8xc2kmfkWMEXe2zZbYmFOmQPw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703115102; x=1703719902; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWAqQxzlKAGgA5XP3vJHWf9KCDvVoR5g1IT/dutslaM=;
 b=Pa1eLOJ6SZ4KDaU4OT2TmpoUVId3g8DThuI6WeDlTgARlUaEkLB7gah+4HnuUAEGFL
 uPFtUDBYUzB4O5R74gvZGie0eVGpckXTkxdbCsSWVKvemfhZRJ/3N5bdOuH9RMo2xDWh
 MRhKqUvzCR+JWO8pcEU439o3zXrB6ibsyYU/lOhjdE7njDjlp71UljpANf3jWB6SVT/C
 GzU/rg9lbhXjO6I7i15qLyYPNBcCh+jAHr0X5bNtFIe6DnCRtAjXRl+IRPr6JCAhnEUY
 5+q2wZtGWZhcMwrVMZFFa4rEy4ufsDph1kWFW3LapSqbX1ksoPTqPjg6f+X3YKt5Bw73
 qung==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pa1eLOJ6
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.71
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpDYW4gc29tZWJvZHkgd2hvIHVuZGVyc3RhbmRzIHRoZSBsZWdhbCBzaWRlIGJldHRl
ciBzaWduIG9mZiB0aGlzIGNoYW5nZT8KSSBzZW50IHRoZSBwYXRjaCBhcyBkaXNjdXNzZWQgaGVy
ZQpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIzLURl
Y2VtYmVyLzY4MTExOC5odG1sClRoZSBwYXRjaCBpdHNlbGYgKHRoZSBmZXcgYnVpbGQgY29uZmln
dXJhdGlvbiBsaW5lcyBpdCBhZGRzKSB3YXMKY3JlYXRlZCBieSBtZSBpbiBteSBzcGFyZSB0aW1l
IGFuZCBJIHN1Ym1pdCBpdCB1bmRlciBCdWlsZHJvb3QncwpsaWNlbnNlIChHUEwgMiBvciBsYXRl
cikuCgpCciwKRGF2aXMKCgp0cmXFoWQuLCAyMDIzLiBnLiAyMC4gZGVjLiwgcGxrc3QuIDIyOjI0
IOKAlCBsaWV0b3TEgWpzIFRob21hcyBQZXRhenpvbmkKKDx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPikgcmFrc3TEq2phOgo+Cj4gSGVsbG8gRGF2aXMsCj4KPiBPbiBNb24sIDE4IERlYyAy
MDIzIDIwOjMyOjMwICswMjAwCj4gRGF2aXMgTW9zZW5rb3ZzIDxkYXZpa292c0BnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gPiBDaGFuZ2Vsb2c6Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vYmx1ZXRvb3RoL2JsdWV6LmdpdC90cmVlL0NoYW5nZUxvZwo+ID4KPiA+IFJlbW92ZWQgcGF0
Y2ggd2hpY2ggaXMgaW5jbHVkZWQgaW4gdGhpcyByZWxlYXNlLgo+Cj4gVGhhbmtzIGEgbG90IGZv
ciB0aGlzIHBhdGNoISBGcm9tIGEgcXVpY2sgbG9vaywgaXQgbG9va3MgZ29vZC4gSG93ZXZlciwK
PiB0aGVyZSBpcyBhIHNpbGx5LCBidXQgaW1wb3J0YW50IGlzc3VlIHRoYXQgcHJldmVudHMgYXBw
bHlpbmcgeW91cgo+IHBhdGNoOiBpdCBsYWNrcyB5b3VyIFNpZ25lZC1vZmYtYnkgbGluZS4gQ291
bGQgeW91IHJlc2VuZCB5b3VyIHBhdGNoCj4gd2l0aCB0aGlzIGFkZGVkIGF0IHRoZSBlbmQgb2Yg
eW91ciBjb21taXQgbWVzc2FnZT8KPgo+IFRoYW5rcyBhIGxvdCEKPgo+IFRob21hcwo+IC0tCj4g
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
