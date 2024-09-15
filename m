Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8738DC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282D584A99;
	Sun, 15 Sep 2024 21:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTPuCYuNEjGF; Sun, 15 Sep 2024 21:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC96F84AA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC96F84AA6;
	Sun, 15 Sep 2024 21:43:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 614221BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5043540A0B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6S2KYbsAEWqS for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:42:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23F2E400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F2E400A4
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23F2E400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:42:34 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-49be2ef28aaso1089962137.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726436554; x=1727041354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnNag5ZgrfOU3mGyMh8nf67JDOQQx7heoC8lb2gEvGE=;
 b=PHMIzyXrDREkLshfecOA30a1aVwgMpWpHJbs+d2wHUvaP6RuZrLozP+LQk6eZVSSD/
 Rt+zOZ4MHDRr3m2/w8LZSO2PgbPJ8Z0ixXAyKRletvZ4dRweoitnICKy7t7KJU1buHxD
 vsDcwJDN3yF+z5VpymaPIYJ9vSBBeiKcFAOCJIS3Zr/vwPPXIozJaPA1nitK27WsnvAB
 JHFjT2y3np7RWdm0cdUPjrFOzBIQoZlVJNAYw66q4WFD/t61lAgwxtQx29OtXP10VvxL
 2UMt2nEK78kEaC0tkFMIwTOzgK3TEgq7hDj2Xw77RkW3y2dakDXiKOhVH6fwAbdNKkbY
 tyXA==
X-Gm-Message-State: AOJu0YwbhnNl+hOmMYOdGayENCJ76Y1qp0+/T0Nwc9HRchilbQVIvtXv
 dlyXcAUxzyRNcspnj8HZufze8MQZMs+9yc82H2HR65ADT/FfVcVcyYCTlJIW6JdvuEjnHrZ8aLK
 z9Apghq0uYTmzIXSFxQ3JqkkV3VY=
X-Google-Smtp-Source: AGHT+IEiKSxi+8OHK6EwumpGKj1X+97Kgb4LuNw4xUBN4lplyRQHmh/jE/Gnm+yy7i9tsn5C/1s0is5BII5MD0MnHmE=
X-Received: by 2002:a05:6102:390b:b0:49c:179d:3567 with SMTP id
 ada2fe7eead31-49d4155c916mr8367944137.23.1726436553345; Sun, 15 Sep 2024
 14:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240915044131.1398816-1-james.hilliard1@gmail.com>
 <20240915100852.6cfe5116@windsurf>
In-Reply-To: <20240915100852.6cfe5116@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Sep 2024 15:42:22 -0600
Message-ID: <CADvTj4pXQTNFZ+95H6Hm4euGtKrs8GeJ+-fPCcg6o_9SP+vHuQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726436554; x=1727041354; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnNag5ZgrfOU3mGyMh8nf67JDOQQx7heoC8lb2gEvGE=;
 b=jLunazjjNGo0kxHzkqtuyFES19/GeFyBEgxX1yJMltSC6T+IUXMcAOlvq/LK1QKBz9
 do/YFK2gaD+a92I2QSzO29FGzoEs0ZAvVmMiWAHmkBO+U89YWN5QreOmUHM50m4h7ddT
 mjIuRhjC8UBnr7dTNA5wdKClNmZcVsweyKyH4dc3m2yZoJfzIUOb4JKxKIhWun7V5C5j
 1U3976jqsqr2DevRXGBkAjhGtu1yxNOKdZ934X7+kc/iNj/h+2LGG3M2eTepL+wswl8J
 Lr1f4+mbz0K4ZiOb/xTLArsTHijJeDvBWRsCtKL6bEw1V2+VWXerzKK2lj9pmGItJ7e6
 LPXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jLunazjj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-daphne: bump to version
 4.1.2
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

T24gU3VuLCBTZXAgMTUsIDIwMjQgYXQgMjowOOKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCAxNCBTZXAgMjAyNCAy
Mjo0MTozMSAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gRHJvcCByZW1vdmUgcHl0ZXN0IHJ1bm5lciBwYXRjaCBhbmQgaW5zdGVh
ZCBwYXNzCj4gPiAtLXNraXAtZGVwZW5kZW5jeS1jaGVjayBidWlsZCBvcHRpb24uCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
Cj4gPiAtLS0KPiA+ICAuLi4wMDEtcmVtb3ZlLXB5dGVzdC1ydW5uZXItcmVxdWlyZW1lbnQucGF0
Y2ggfCAyNyAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgcGFja2FnZS9weXRob24tZGFwaG5lL3B5
dGhvbi1kYXBobmUuaGFzaCAgICAgIHwgIDQgKy0tCj4gPiAgcGFja2FnZS9weXRob24tZGFwaG5l
L3B5dGhvbi1kYXBobmUubWsgICAgICAgIHwgIDUgKystLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9weXRob24tZGFwaG5lLzAwMDEtcmVtb3ZlLXB5dGVzdC1ydW5uZXItcmVxdWlyZW1l
bnQucGF0Y2gKPgo+IE9uIHRoaXMgb25lIHlvdSBoYWQgZm9yZ290dGVuIHRvIHVwZGF0ZSAuY2hl
Y2twYWNrYWdlaWdub3JlIHRvIGRyb3AgdGhlCj4gcmVmZXJlbmNlIHRvIHRoZSBwYXRjaCBiZWlu
ZyByZW1vdmVkLiBTdWdnZXN0aW9uOiB1c2UKPiBodHRwczovL3Bhc3RlLmFjay50Zi9iYmViZDIg
YXMgeW91ciAuZ2l0L2hvb2tzL3Bvc3QtY29tbWl0IHRvIGNhdGNoCj4gdGhpcyBraW5kIG9mIG1p
bm9yIHRoaW5nLgoKSSBkcm9wcGVkIHRoZSAuL3V0aWxzL2RvY2tlci1ydW4gcGFydCBmcm9tIHRo
aXMgaG9vayBhbmQgaXQgc2VlbXMgdG8gd29yayBvaywKd2FzIHRoZXJlIGEgcmVhc29uIHRoaXMg
d2FzIGJlaW5nIHJ1biBpbiBkb2NrZXI/Cgo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFzCj4gLS0KPiBU
aG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
