Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C09EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 18:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA1F822F5;
	Tue, 27 Jun 2023 18:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA1F822F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uj7p24zBr285; Tue, 27 Jun 2023 18:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE2CD822EE;
	Tue, 27 Jun 2023 18:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE2CD822EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 771501BF377
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 18:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CD7D40B46
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 18:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CD7D40B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qu5jZjuu_Hw5 for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 18:56:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6528840A95
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6528840A95
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 18:56:24 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b0605d4d11so849215fac.1
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 11:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687892183; x=1690484183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omiGFaNwxuPNMRabae3Xa+t/DCTYiWlNWMH9kot9rkY=;
 b=X4zvZeR/2jz1/CyI9NPPb74p82qgHeZBou6VRs4Fx+ylF7f96zIofENo06hY+2JP+a
 ehGWwzLyEJkWiqlJggeTnoQa5o9J44aTSWGCc7CHmsDJTEW8RAuYDhYjiDXPlLm43vXh
 OD6gS/epVsepFNrBKvs54nRV6qtCMGRx47WvnwCcQj1V6nt9CaNbrGhWy0/yOfBL879t
 qgNdBYmstj96FxeknI61l5CrtbkX+pNzadEfB6SMSYOy4bHGsvy3OsdRqO4+vvEApzd/
 mnrHsUwEw0rA+vny8h96BZ9HZLQ0icYyAti4MYzpoDj7IYyeoqCbxmm8PWTe+aMhNxfH
 P4AQ==
X-Gm-Message-State: AC+VfDy3R9rtOOONCFo6u71NVhZK4pmA+jN2vuL4YifMs+43JFCCoBOo
 KyFNsS/hSuLtvjODEP8x0ZXEyBgvurvgWoflM2c+2xdeXPaJrw==
X-Google-Smtp-Source: ACHHUZ48rqli7S0XEaJhIRS43XIL6ZCm4LraxYp+njyW1cNjpLZ9Q2dfF+swRX9pooPaChXKidmG7ED5dtwOVHpU3nM=
X-Received: by 2002:a05:6870:1729:b0:1b0:37a6:3dab with SMTP id
 h41-20020a056870172900b001b037a63dabmr7464336oae.40.1687892183332; Tue, 27
 Jun 2023 11:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230626202901.346078-1-romain.naour@gmail.com>
 <20230627055501.GI646621@scaer>
In-Reply-To: <20230627055501.GI646621@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Jun 2023 12:56:12 -0600
Message-ID: <CADvTj4rWi4-8YxxZgQtT2DO99OB9dCpaTjsH2s8R4+58e2Zogw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687892183; x=1690484183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omiGFaNwxuPNMRabae3Xa+t/DCTYiWlNWMH9kot9rkY=;
 b=ghgznRsAwOqz74nOHcZVAv6FlrlrZ3GavtDiyCdgZviXnu+qNniFNhfcH70oLl4Ayv
 jhkmi3QqL0mSPNZG45luQZpcakpAln4kWIuaIgie1oFwclSq8gZcuvYu7vYjezKmVenq
 P7URVYjuXwVik4K9BlDcx5BAUgA1W8Ix/UuNwkq47U1H6reMMMk3sqEg2jjfxetl2hli
 h+i4emIkg7SxTJVyFDNz/Uc5kP3s7Wd3YDRfZBoVic36zkMWLvmD9HjVW9JqT7EoHI5k
 FVtQJvnQMe1zrNDcfGJ9nxRYVm5bNMCuQuPC8wik56xtGo2D8NCGoqKDIsv2Aj3yLuY3
 p7AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ghgznRsA
Subject: Re: [Buildroot] [PATCH] package/python-setuptools: add missing
 dependency on host-python-wheel
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMTE6NTXigK9QTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1v
cmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBKYW1lcywgQWxsLAo+Cj4gT24gMjAyMy0wNi0y
NiAyMjoyOSArMDIwMCwgUm9tYWluIE5hb3VyIHNwYWtlIHRodXNseToKPiA+IFdoaWxlIG1pZ3Jh
dGluZyB0byBwZXA1MTcgYnVpbGQgYmFja2VuZCB0aGUgaG9zdC1weXRob24td2hlZWwKPiA+IGRl
cGVuZGVuY3kgaGFzIGJlZW4gYWRkZWQgdG8gaG9zdC1weXRob24tc2V0dXB0b29scyBidXQKPiA+
IG5vdCB0byBweXRob24tc2V0dXB0b29scy4KPiA+Cj4gPiBGaXhlczoKPiA+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDUzNzk1MTcxNQo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiA+
IENjOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gIHBhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsgfCAxICsK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5tayBiL3BhY2thZ2Uv
cHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPiA+IGluZGV4IGQ5NTc5MzA0
NTUuLjM5ZWFkMTBmNTUgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xz
L3B5dGhvbi1zZXR1cHRvb2xzLm1rCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xz
L3B5dGhvbi1zZXR1cHRvb2xzLm1rCj4gPiBAQCAtMTIsNiArMTIsNyBAQCBQWVRIT05fU0VUVVBU
T09MU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ID4gIFBZVEhPTl9TRVRVUFRPT0xTX0NQRV9J
RF9WRU5ET1IgPSBweXRob24KPiA+ICBQWVRIT05fU0VUVVBUT09MU19DUEVfSURfUFJPRFVDVCA9
IHNldHVwdG9vbHMKPiA+ICBQWVRIT05fU0VUVVBUT09MU19TRVRVUF9UWVBFID0gcGVwNTE3Cj4g
PiArUFlUSE9OX1NFVFVQVE9PTFNfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24td2hlZWwKPiA+
ICBIT1NUX1BZVEhPTl9TRVRVUFRPT0xTX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uLXdoZWVs
Cj4KPiBTaG91bGQgdGhpcyBub3QgYmUgZG9uZSBpbiB0aGUgcHl0aG9uIHBhY2thZ2UgaW5mcmEg
aW5zdGVhZD8KPgo+IEkuZS4gaWYgaG9zdC1weXRob24td2hlZWwgaXMgcmVxdWlyZWQgYnkgdGhl
IHBlcDUxNyBidWlsZCBiYWNrZW5kLCB0aGVuCj4gYWxsIHBhY2thZ2VzIHRoYXQgYXJlIHBlcDUx
NyB3aWxsIG5lZWQgd2hlZWwsIHNvIGl0IHNob3VsZCBiZSBkb25lIGJ5Cj4gdGhlIGluZnJhIHJh
dGhlciB0aGFuIGJ5IGVhY2ggaW5kaXZpZHVhbCBwYWNrYWdlLi4uCgpTbyBob3N0LXB5dGhvbi13
aGVlbCBpcyBub3QgcmVxdWlyZWQgYnkgdGhlIHBlcDUxNyBidWlsZCBmcm9udGVuZCwgb25seSB0
aGUKc2V0dXB0b29scyBwZXA1MTcgYnVpbGQgYmFja2VuZCwgaXQncyBub3QgbmVlZGVkIGZvciBm
bGl0IGFuZCBub24tc2V0dXB0b29scwpiYXNlZCBwZXA1MTcgYnVpbGQgYmFja2VuZHMuCgo+Cj4g
T2YgY291cnNlLCBieSB0aGUgdmlydHVlIG9mIGJlaW5nIGEgZGVwZW5kZW5jeSBvZiBweXRob24t
c2V0dXB0b29scywgaXQKPiBiZWNvbWVzIGEgZGVwZW5kZW5jeSBvZiBhbGwgcHl0aG9uLXBhY2th
Z2VzIHRoYXQgYWxyZWFkeSBkZXBlbmRzIG9uCj4ge2hvc3QtLH1weXRob24tc2V0dXB0b29scywg
c28gaXQgdGVjaG5pY2FsbHkgd29ya3MsIGV2ZW4gd2l0aCBQUEQuCj4gTm9uZXRoZWxlc3MsIGl0
IGlzIHNlbWFudGljYWxseSBpbmNvcnJlY3QuCgpTbyBzZXR1cHRvb2xzIGlzIG5vIGxvbmdlciBy
ZXF1aXJlZCBpbiB0aGUgZGVwZW5kZW5jeSB0cmVlIGZvciBhbnkKbm9uLXNldHVwdG9vbHMgYmFz
ZWQgcGFja2FnZXMuCgpTZWUgbXkgcGF0Y2ggc3dpdGNoaW5nIHNldHVwdG9vbHMgb3ZlciB0byB0
aGUgcGVwNTE3IGJ1aWxkIGZyb250ZW5kOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNjI2MTgxNTMxLjIzMTIwMDItNS1qYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tLwoKPgo+IE9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nPwo+Cj4gUmVnYXJk
cywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiAgJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+ID4g
LS0KPiA+IDIuNDEuMAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
