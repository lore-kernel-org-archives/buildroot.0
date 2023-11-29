Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D942C07E97
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 08:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A8A440873;
	Wed, 29 Nov 2023 08:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A8A440873
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abSAJQQND4Ud; Wed, 29 Nov 2023 08:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7285E417FE;
	Wed, 29 Nov 2023 08:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7285E417FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA1CB1BF276
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 08:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6878B43534
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 08:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6878B43534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaQvsxgoK7jL for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 08:17:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B2E64059D
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 08:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B2E64059D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 207B71C0009;
 Wed, 29 Nov 2023 08:17:11 +0000 (UTC)
Date: Wed, 29 Nov 2023 09:17:10 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231129091710.61738710@bootlin.com>
In-Reply-To: <20231128210717.GA107928@scaer>
References: <20231127224139.35969-1-brandon.maier@collins.com>
 <20231128210717.GA107928@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1701245831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQz+sgoiRE3SXLtr3KkLHQPZ2V+HAmJQCBd4bpn8xpU=;
 b=Du4P897yZ/wsogbqbRsUkBNWoIcPj3/K7tvOYJPfbe/iej4yhV6J2Puv6qshGM95Fsz18j
 xd+K1Sv8rPPX3C13/0v7EDsqBWqLgi3z6L59AmVgCQzuM4b2/GNzlwUmuMw071mwSiEB4v
 b42Hd/GW+O3a/Tmu3A0wkzIjqIolct9dokpfBFmwq5saYF80pRaSqqYbd6Aoi+4Eo4Rm2h
 bUmAdKc0g7b99qvCOzJRTh3ZcEXiK1mVvTSFfL/Dv7SWs9zPYEVfWXlF0L8pd5xxrCzO1Q
 Mbtfiom4okbDUDW7Muncr5WraawYnKgvFsIxL7T5UF7ELRhepTmoQeDRE4r2sQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Du4P897y
Subject: Re: [Buildroot] [PATCH 1/1] ppd-merge: speed up per-package-rsync
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFR1ZSwgMjggTm92IDIwMjMgMjI6MDc6MTcgKzAxMDAKIllhbm4gRS4gTU9S
SU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IEJyYW5kb24sIEFsbCwKPiAK
PiArVGhvbWFzIGZvciB0aGUgaW50aWFsIHdvcmsgb24gdGhpcyB0b3BpYwo+IAo+IE9uIDIwMjMt
MTEtMjcgMjI6NDEgKzAwMDAsIEJyYW5kb24gTWFpZXIgc3Bha2UgdGh1c2x5Ogo+ID4gVGhlIHBl
ci1wYWNrYWdlLXJzeW5jIHN0YWdlIGNhbiBhZGQgYSBzaWduaWZpY2FudCBhbW91bnQgb2YgdGlt
ZSB0bwo+ID4gYnVpbGRzLiBUaGV5IGNhbiBhbHNvIGJlIGFubm95aW5nIGFzIHRoZSBzbG93ZXN0
IHJzeW5jcywgdGhlIGZpbmFsCj4gPiB0YXJnZXQtZmluYWxpemUgYW5kIGhvc3QtZmluYWxpemUg
c3RhZ2VzLCBydW4gb24gYG1ha2UgYWxsYCB3aGljaCB3ZSB1c2UKPiA+IGZyZXF1ZW50bHkgZHVy
aW5nIGRldmVsb3BtZW50Lgo+ID4gCj4gPiBUaGUgcGVyLXBhY2thZ2UtcnN5bmMgaXMgc2xvdyBi
ZWNhdXNlIGl0IGxhdW5jaGVzIGEgbmV3IHJzeW5jIGZvciBlYWNoCj4gPiBzb3VyY2UgdHJlZSwg
YW5kIGVhY2ggcnN5bmMgbXVzdCByZXNjYW4gdGhlIGRlc3RpbmF0aW9uIGRpcmVjdG9yeSBhbmQK
PiA+IHBvdGVudGlhbGx5IG92ZXJ3cml0ZSBmaWxlcyBtdWx0aXBsZSB0aW1lcy4gU28gaW5zdGVh
ZCB3ZSBtYW51YWxseSB3YWxrCj4gPiB0aGUgc291cmNlIHRyZWVzIHRvIGZpbmQgb25seSB0aGUg
ZmlsZXMgdGhhdCBzaG91bGQgYmUgd3JpdHRlbiB0byB0aGUKPiA+IGRlc3RpbmF0aW9uLCB0aGVu
IGZlZWQgdGhhdCB0byBhIHNpbmdsZSBpbnN0YW5jZSBvZiByc3luYy4gIAo+IAo+IFNvcnJ5LCBJ
IGhhdmVuJ3QgbG9va2VkIGludG8gdGhlIHNjcmlwdCBpbiBkZXRhaWxzLCBidXQgd2h5IGNhbid0
IHdlCj4ganVzdCBkbyBzb21ldGhpbmcgbGlrZToKPiAKPiAgICAgcnN5bmMgLWEgXAo+ICAgICAg
ICAgLS1oYXJkLWxpbmtzIFwKPiAgICAgICAgICQoaWYgJChmaWx0ZXIgaGFyZGxpbmssJCg0KSks
IFwKPiAgICAgICAgICAgICAtLWxpbmstZGVzdD0kKFBFUl9QQUNLQUdFX0RJUikvJChwa2cpLyQo
MikvLCBcCj4gICAgICAgICAgICAgJChpZiAkKGZpbHRlciBjb3B5LCQoNCkpLCBcCj4gICAgICAg
ICAgICAgICAgICQoZW1wdHkpLCBcCj4gICAgICAgICAgICAgICAgICQoZXJyb3IgcGVyLXBhY2th
Z2UtcnN5bmMgY2FuIG9ubHkgImNvcHkiIG9yICJoYXJkbGluayIsIG5vdCAiJCg0KSIpIFwKPiAg
ICAgICAgICAgICApIFwKPiAgICAgICAgICkgXAo+ICAgICAgICAgJChwYXRzdWJzdCAlLCAkKFBF
Ul9QQUNLQUdFX0RJUikvJS8kKDIpLywgJCgxKSkgXAo+ICAgICAgICAgJCgzKQo+IAo+IHJzeW5j
IGNhbiB0YWtlIG11bHRpcGxlIHNvdXJjZXMsIGFuZCBpcyB1c3VhbGx5IHByZXR0eSBmYXN0LCBz
byBJIHdvdWxkCj4gdmVyeSBtdWNoIHByZWZlciB0aGF0IHdlIGRvIG5vdCBpbnZlbnQgb3VyIG93
biB0b29saW5nIGlmIGEgc2luZ2xlIHJzeW5jCj4gY2FuIGRvIHRoZSBqb2IuCj4gCj4gQWxzbywg
dGhlIGNvcHkgc2l0dWF0aW9uIGlzIG5vdyBvbmx5IGV2ZXIgbmVlZGVkIHdoZW4gd2UgYWdncmVn
YXRlIHRoZQo+IGZpbmFsIHRhcmdldCBhbmQgaG9zdCBkaXJlY3Rvcmllcywgd2hpbGUgdGhlIGhh
cmQtbGlua2luZyBjYXNlIGlzIHVzZWQKPiB3aGVuIGFzc2VtYmxpbmcgZWFjaCBwZXItcGFja2Fn
ZTsgc28gdGhlcmUgaXMgbm8gcG9pbnQgaW4gYmVuY2htYXJraW5nCj4gdGhlIGNvcHkgbW9kZSBm
b3IgdGhlIHBlci1wYWNrYWdlIHByZXBhcmF0aW9uLCBvciB0aGUgaGFyZC1saW5raW5nIGZvcgo+
IHRoZSBmaW5hbCB0YXJnZXQgYW5kIGhvc3QgYXNzZW1ibGluZy4KPiAKPiBIZXJ2w6ksIFRob21h
cywgZG8geW91IHJlbWVtYmVyIGlmIHdlIGV2ZXIgYWRkcmVzc2VkIHVzaW5nIGEgc2luZ2xlIHJz
eW5jCj4gcmF0aGVyIHRoYW4gbXVsdGlwbGUgb25lcyBpbiB5b3VyIHByZXZpb3VzIHdvcmsgb24g
dGhlIHRvcGljLCBhbmQgaWYgc28sCj4gd2h5IHdlIGRpZCBub3QgdXNlIHRoYXQ/CgpJIHRoaW5r
IHdlIGRpZCBvbmx5IG11bHRpcGxlIHJzeW5jIGNhbGxzLgpXZSBoYWQgaW4gbWluZCB0aGUgZmls
ZSBvdmVyd3JpdGUgZGV0ZWN0aW9uIGFuZCBzbyB3ZSBkaWQgdGhlIG9wZXJhdGlvbgpwZXIgcGFj
a2FnZSBrZWVwaW5nIHRoZSAkKGZvcmVhY2ggcGtnLCQoMSksIC4uLikgbG9vcC4KCkFuZCB3aHkg
d2UgZGlkIG5vdCB1c2UgdGhhdCA/CkZpcnN0IGJlY2F1c2UgSSBkaWRuJ3QgdGhpbmsgYWJvdXQg
aXQuLi4KYW5kIHNlY29uZCBiZWNhdXNlIHdlIHdlcmUgaW4gdGhlIHN0cmF0ZWd5IHRvIGNoZWNr
IG92ZXJ3cml0ZXMgcGVyIHBhY2thZ2UuCgpCZXN0IHJlZ2FyZHMsCkhlcnbDqQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
