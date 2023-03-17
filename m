Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA891C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 10:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6D0417BD;
	Fri, 17 Mar 2023 10:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F6D0417BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e89zat3WzwQs; Fri, 17 Mar 2023 10:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A7041608;
	Fri, 17 Mar 2023 10:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A7041608
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68CC11BF2B0
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 10:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D61821BE
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 10:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D61821BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id giJjuqAs-kv9 for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 10:36:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 617EA82171
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 617EA82171
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 10:36:41 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 v2-20020a056830090200b0069c6952f4d3so2578686ott.7
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 03:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679049400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dc4mRjrWxWMWF9v+TfdBB9tv/miCBz0l0sqZtDjt9i0=;
 b=u/iZjX+he76rmz9o2He4r8WhNF4WvzLbiPQHA8BjSYBpTrp100rj/JUNhrK9CBwMeV
 aZmzGL3FqTE5r2dxHv0k5Q57kTLIu1UgMhiWpiJUSZVZFbAsohxO1v+aoL4ZeihsDMZ3
 6Y5p/gnr8jb3tuCYM96jvnwTiRRS7GhPJL02Pv+eHBdztI4ETpojVY7ObP1VOrD4QuVn
 B35jiVeRVuk1Z3ltnqJNNuswvRt3e0JNUsTOk2uvPEKCQqN01Pgvr4H9RkSV2Jv38EmV
 AezsLxPP5VCWmMyazWv6vB5ksnjNn+F2plHyU1MmxvHsOoxAgR6rkQEcARtjJV9QWnGJ
 ZGoA==
X-Gm-Message-State: AO0yUKXnP4ekpv22iGsQfuwKCa5bxR4nqa23w0AndX+bMlXr1DtvnEjc
 1xpISXANn7QmT4R/HJUp93LmJ/dSDMUx4cmfqVw=
X-Google-Smtp-Source: AK7set/qTl3UITav/B8Pa2bLqi6hY6TjhKBbRQu9HfPd96KJ5ipweShTH70Yt+THkxZT2iBMOqVeGd221LTAE/TJrmk=
X-Received: by 2002:a05:6830:344:b0:688:cfcc:ddb1 with SMTP id
 h4-20020a056830034400b00688cfccddb1mr15512586ote.5.1679049400436; Fri, 17 Mar
 2023 03:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230317101031.2357806-1-james.hilliard1@gmail.com>
 <20230317112431.4a3fea9e@windsurf>
In-Reply-To: <20230317112431.4a3fea9e@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Mar 2023 04:36:29 -0600
Message-ID: <CADvTj4oy_wp84tWdehM4oNb7exSJ+JnfF2iy5dLRa57ty6dqqQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679049400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dc4mRjrWxWMWF9v+TfdBB9tv/miCBz0l0sqZtDjt9i0=;
 b=jPEWZEYOqK32pTQ7+F405u6Vb+Mg0bJUyi6WapX4TR2yVPiHxff/TgqoQD6NNJwfz4
 cn0LdJXVfS4gPagERHcGSPYR30O4hI3yiiI/e1CEQQzbRV5xc3l55GgaU3CwGKOl6a79
 ws12nquYKy+uqTjX7RDq8cB1Le98+soeBO4u3IrayldROTDO3iJqoaHM69hLoactR2SE
 l1BMfhfLJBrOmW82fDg1q+ohu3a+YIkrTmVO1HUNuvnLGpJ1QrOM16Df0OGN/L7Mo/aM
 ir7xpnUOMS6mqdTBCxAhwo7DuYlESf/upO1OPXOVKIEJEJ7JrZAFyosQpWLAAkKzPfSd
 jXYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jPEWZEYO
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.68.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgNDoyNOKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBG
cmksIDE3IE1hciAyMDIzIDA0OjEwOjMxIC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBMaW5rIHRvIFJ1c3QgMS42OC4wIGFubm91
bmNlbWVudDogaHR0cHM6Ly9ibG9nLnJ1c3QtbGFuZy5vcmcvMjAyMy8wMy8wOS9SdXN0LTEuNjgu
MC5odG1sCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4KPiBUaGFua3MgZm9yIHRoZSBidW1wLiBEbyB5b3UgaGF2ZSBzb21l
IGhpbnRzIGFib3V0Cj4gaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0x
NTQwMSA/CgpJIGRvIGhhdmUgYSBwYXRjaCB0aGF0IGxvb2tzIGxpa2UgaXQgbWlnaHQgYmUgcmVs
YXRlZCwgbm90IHN1cmUgaWYgaXQKd2lsbCBmaXggdGhlIGlzc3VlOgpodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNzI0MjE0NzQzLjIzMjQ5
OTgtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFz
IFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
