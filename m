Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317B2C0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 22:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E49C42028;
	Thu, 13 Jul 2023 22:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E49C42028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIEuOGSwxYMd; Thu, 13 Jul 2023 22:33:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94CCB41DBD;
	Thu, 13 Jul 2023 22:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94CCB41DBD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B77201BF37E
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 22:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90CF960BDA
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 22:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90CF960BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWt3utirzc78 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 22:33:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33BDE60B0D
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33BDE60B0D
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 22:33:18 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1b00b0ab0daso989661fac.0
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 15:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689287597; x=1691879597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJV9OdmN/62BOYexIZnkIgnJ98bVzZF2uIH9pKoNDgs=;
 b=KHW406uZUH3z2C8ERHWhNdzJga6vtM07byjr0gWmMMavXdwlm+FEu7nPCj9eXk0T8N
 fqwAu5m5Vot49QDmbLlR3+3vL3PqUNesmRfeKlbedpSXggpFSAegCHUSTDDYlODlrR05
 GF0emBFSxtkqsWheCmxYuzx1jOqAxcuY/MINiBgZ8cGLjdYi44Gu2SxRlHREugTrzFXT
 xeAI1OjbbNRb/SWNgu5sb8aiO4C7juSH6DLk+8gHrdq6sydaMSwP4HIb60K4qLRKx7nY
 xv/CUThg+mc/yIfTfX8Y80cu7N4Ap2jlIXTw72/SkXRGeboh8B4K6FqSC96Hre5K8/jt
 1xew==
X-Gm-Message-State: ABy/qLbFTnp79vNCO1YNhvHbfUFRsJxgIoxw3ma5D9Ns965PE6RM1M+A
 W3BqYBlhKBrknPM4CTR6s3dp2SL/J+3zoNb22BU=
X-Google-Smtp-Source: APBJJlHzoq/w6zpGGG0hWTEQ0Q0w1Eh1da8Dp1z3zgpshPOxY7fxnvoJGNzngsirIXrKnd6AqAe9zJyKCfWwEk44tD4=
X-Received: by 2002:a05:6870:1487:b0:1b0:2d17:9a80 with SMTP id
 k7-20020a056870148700b001b02d179a80mr3429137oab.0.1689287597114; Thu, 13 Jul
 2023 15:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <20230212094205.GK2796@scaer> <7d630b5f-69b3-6129-2426-7e9b7499f6d3@mind.be>
 <e5f2f930-d17f-a2e7-6c8b-0d59d2379ecf@mind.be>
In-Reply-To: <e5f2f930-d17f-a2e7-6c8b-0d59d2379ecf@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Jul 2023 16:33:05 -0600
Message-ID: <CADvTj4rbJTvFmh3kh1LZh2pTF4_=TE8q+xhELyKzyPHQM63aKg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689287597; x=1691879597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJV9OdmN/62BOYexIZnkIgnJ98bVzZF2uIH9pKoNDgs=;
 b=amEDU/oGByr9MmOJ+t/sQ2i9uxJffrcc14Vzk7DX3zSU1p0BhH3ab4qWMnAxT8mpXV
 p1gIMMf4spjzXEdM8mgyG0AW6q3ArIqXZMy+PDXKQ8t/pFp1SJcol3yjQagKDSbRMB1S
 7oj+dfOPFr0FhqhFfhdei7cCi3hFD+8rIEwoOeRM2y/FIHpbI5mlpJncgl8CBfNhh4nA
 VN3WUZHFq2lOh3aE7q1IfA0Yy4sDVzNf/IdvW1/lWe/tZ2pnLIfDmNHmz6XgMhAVq10P
 OyGaL42K7AH6F4SoCKGEFgcSNEsEo6gbF6HTpJbs406vkYi/7JUTgXZ57ylGvBjCMNYh
 1YBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=amEDU/oG
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBGZWIgMTQsIDIwMjMgYXQgMjoyNeKAr1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxh
cm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+IE9uIDE0LzAyLzIwMjMgMjI6MjIsIEFybm91dCBW
YW5kZWNhcHBlbGxlIHdyb3RlOgo+IFsxXQo+ID4gIEkgbWF5IGJlIHN0dXBpZCwgYnV0IHdoYXQg
d2Ugd2FudCBpcyB0byBoYXZlIGFuIG9yZGVyaW5nIGJldHdlZW4KPiA+IGNsZWFuLWZvci1yZWlu
c3RhbGwgYW5kICQoMSksIHJpZ2h0PyBTbywgbGV0J3MgdXNlIGFuIG9yZGVyaW5nIGRlcGVuZGVu
Y3k/Cj4gPgo+ID4gJCgxKS1yZWluc3RhbGw6ICAgICAgICAkKDEpLWNsZWFuLWZvci1yZWluc3Rh
bGwgJCgxKQo+ID4gJCgxKTogICAgICAgICAgICAgJCgxKS1jbGVhbi1mb3ItcmVpbnN0YWxsCj4K
Pgo+ICAgR2FoLCBJIGZvcmdvdCB0aGUgYWN0dWFsIG9yZGVyLW9ubHkgYml0Li4uCj4KPiAkKDEp
LXJlaW5zdGFsbDogICAkKDEpLWNsZWFuLWZvci1yZWluc3RhbGwgJCgxKQo+ICQoMSk6ICAgICAg
ICAgICB8ICQoMSktY2xlYW4tZm9yLXJlaW5zdGFsbAoKVGhpcyBkb2Vzbid0IHNlZW0gdG8gd29y
aywgaXQgZW5kcyB1cCBjbGVhbmluZyBhIGJ1bmNoIG9mIGFkZGl0aW9uYWwgdGFyZ2V0cwpsaWtl
IHRoZSBza2VsZXRvbiBhbmQgdG9vbGNoYWluIHRoYXQgc2hvdWxkbid0IGJlIGNsZWFuZWQgd2hl
biBkb2luZyBhIHJlaW5zdGFsbApmb3Igc2F5IGEgbm9ybWFsIHB5dGhvbiBwYWNrYWdlLgoKPgo+
Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPgo+ID4KPiA+Cj4gPiAgUmVnYXJkcywKPiA+ICBB
cm5vdXQKPiA+Cj4gPj4+ICAgICAkKDEpLWNsZWFuLWZvci1yZWJ1aWxkOiAkKDEpLWNsZWFuLWZv
ci1yZWluc3RhbGwKPiA+Pj4gICAgICAgICAgICAgICBybSAtZiAkJCgkKDIpX1RBUkdFVF9CVUlM
RCkKPiA+Pj4gICAtJCgxKS1yZWJ1aWxkOiAgICAgICAgJCgxKS1jbGVhbi1mb3ItcmVidWlsZCAk
KDEpCj4gPj4+ICskKDEpLXJlYnVpbGQ6OiAgICAgICAgJCgxKS1jbGVhbi1mb3ItcmVidWlsZAo+
ID4+PiArJCgxKS1yZWJ1aWxkOjogICAgICAgICQoMSkKPiA+Pj4gICAgICQoMSktY2xlYW4tZm9y
LXJlY29uZmlndXJlOiAkKDEpLWNsZWFuLWZvci1yZWJ1aWxkCj4gPj4+ICAgICAgICAgICAgICAg
cm0gLWYgJCQoJCgyKV9UQVJHRVRfQ09ORklHVVJFKQo+ID4+PiAgIC0kKDEpLXJlY29uZmlndXJl
OiAgICAkKDEpLWNsZWFuLWZvci1yZWNvbmZpZ3VyZSAkKDEpCj4gPj4+ICskKDEpLXJlY29uZmln
dXJlOjogICAgJCgxKS1jbGVhbi1mb3ItcmVjb25maWd1cmUKPiA+Pj4gKyQoMSktcmVjb25maWd1
cmU6OiAgICAkKDEpCj4gPj4+ICAgICAjIGRlZmluZSB0aGUgUEtHIHZhcmlhYmxlIGZvciBhbGwg
dGFyZ2V0cywgY29udGFpbmluZyB0aGUKPiA+Pj4gICAjIHVwcGVyY2FzZSBwYWNrYWdlIHZhcmlh
YmxlIHByZWZpeAo+ID4+PiAtLQo+ID4+PiAyLjM0LjEKPiA+Pj4KPiA+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+ID4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4+PiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+PgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
