Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CD7C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 21:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DA194004A;
	Mon, 18 Dec 2023 21:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DA194004A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2BF74itJQji; Mon, 18 Dec 2023 21:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68C9640106;
	Mon, 18 Dec 2023 21:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C9640106
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4571C1BF344
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E7F9815CD
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7F9815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYaOlyDZvUeC for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 21:40:59 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F153E81518
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 21:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F153E81518
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a2356bb40e3so145925766b.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 13:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702935657; x=1703540457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMqbD8HPpCV+mKxDwA6zmeM4I/8pmH3gR21XaZ44H5A=;
 b=wDDwxRORKporspLvJoaXoe2qk8VIp2TeW6xDF+4LY7NshuxligZ9nwWGXnfEG7kVQk
 5cI/Pa4h3xWbNQS+h8GLVNFkEPUqTdUueKJEDAc2tV9I15Oy+mP37g3KNw8BMa/HnM0M
 kSL6qzkpguG9qOsjOEknLlwey1pBvYVxabpaYmuiYijVzM1ZDLRsYbPMbEgaObQYm/Q8
 RuSraEc7VlCxFUaQvsn/+mAuk9LdNxNzTcjXyacCyoB3/UF9OjIx9rmNM4Mvu25d+7H8
 BjME+saABuMaOopfoCv7wfrhyvuoVrj4Ack5fOp+CjdLOkTFXIbxWgvVpZdWoZd+OANi
 pxYA==
X-Gm-Message-State: AOJu0YyN/HCKoDi9Qh5Qy8FDXS0Z+cA95UYgEv9y0jwfCeVKgm815t7c
 PhoFpWARoe4yMOxhiBcGDSbJDVgNZOuyXiHMnRgoiUFi4E777HBS
X-Google-Smtp-Source: AGHT+IHt14sDF63C2iPiH/3gCaBqNlMByeaTwWeoX0IpYRXYy4TwB0Hp4RtVKT1pF07VLDXZzee67zR5d4VRxI/Nwkc=
X-Received: by 2002:a17:906:2a86:b0:a18:d66e:c62b with SMTP id
 l6-20020a1709062a8600b00a18d66ec62bmr8346685eje.29.1702935656997; Mon, 18 Dec
 2023 13:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
 <20231102184154.46185-2-adam.duskett@amarulasolutions.com>
 <ZYCB3EqymtRdzOzd@landeda>
 <CAFSsvmpgYLmbpY0ppv1kWG-P7yyE7G5EJC9UHjo1=inmcZYEsQ@mail.gmail.com>
 <ZYCvHTVVUdZBg8hD@landeda>
In-Reply-To: <ZYCvHTVVUdZBg8hD@landeda>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 18 Dec 2023 14:40:45 -0700
Message-ID: <CAHDQB6ObHMtJ=Zpq7cfm_U1YKdJ2nsqxmc4BZa68Gh33WRxxAQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702935657; x=1703540457;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMqbD8HPpCV+mKxDwA6zmeM4I/8pmH3gR21XaZ44H5A=;
 b=Gj82l4c545EdbPIrXO6j8FHVxZuj+pqbVL8Cn+SfhCqTgpUUpz8Vyej/IOEV2HBULC
 Kz56PlkC7MFybkvblyK+imCaCxEfPBK/76JWXQAIbV5+YzWc4x3T5sWKqqvDDCaA+CD0
 Ih2PAhRMEv9vW9H2Lh78pulmN1+OBbio5iyRw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Gj82l4c5
Subject: Re: [Buildroot] [PATCH v2 2/2]
 support/testing/tests/package/test_postgresql.py: new test
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
Cc: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubjsKCgpPbiBNb24sIERlYyAxOCwgMjAyMyBhdCAxOjQ04oCvUE0gWWFubiBFLiBNT1JJTiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gQWRhbSwgQWxsLAo+Cj4gT24gMjAy
My0xMi0xOCAxMDo0MSAtMDcwMCwgQWRhbSBEdXNrZXR0IHNwYWtlIHRodXNseToKPiA+IE9uIE1v
biwgRGVjIDE4LCAyMDIzIGF0IDEwOjMx4oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+IHdyb3RlOgo+IFstLVNOSVAtLV0KPiA+ID4gSSB0aGluayB0aGF0IHdlIGFs
cmVhZHkgY29uY2x1ZGVkIHRoYXQgdGVzdGluZyBpZiBhIHVuaXQgd2FzIGFjdGl2ZSBvcgo+ID4g
PiBub3Qgd2FzIG5vdCByZXByZXNlbnRpbmcgd2hldGhlciB0aGUgc2VydmljZSB3YXMgYWN0dWFs
bHkgcnVubmluZy4gSW4KPiA+ID4gdGhlIGZ1bHR0ZXIgdGVzdCBjYXNlIGZvciBleGFtcGxlLCB0
aGUgdW5pdCB3YXMgYWN0aXZlLCBidXQgdGhlIGZsdXR0ZXIKPiA+ID4gYXBwIHdhcyBqdXN0IGtl
ZXBpbmcgY3Jhc2hpbmcgYWdhaW4gYW5kIGFnYWluLCBzbyB0aGUgdGVzdCB3c2EgZmFpbGluZwo+
ID4gPiB0byBkZXRlY3QgZmFpbHVyZS4uLgo+ID4gdGVzdF9mbHV0dGVyLnB5Ogo+ID4gY21kID0g
InN5c3RlbWN0bCBpcy1hY3RpdmUgZmx1dHRlci1nYWxsZXJ5Igo+ID4gSSBhbSBmb2xsb3dpbmcg
d2hhdCBpcyBpbiB0ZXN0X2ZsdXR0ZXIucHkuLi4KPgo+IEV4YWN0bHksIGFuZCBhcyBJIGV4cGxh
aW5lZCBvbiBJUkMgKGFuZCBhbHJlYWR5IGV4cGxhaW5lZCwgYW5kIHJlcG9ydGVkCj4gd2l0aCBb
MF0pLCBpdCBkb2VzIG5vdCB3b3JrOiB0aGUgdW5pdCBpcyBhY3RpdmUsIGJ1dCB0aGUgYXBwbGlj
YXRpb24gdGhlCj4gc2VydmljZSBydW5zIGlzIGNvbnN0YW50bHkgY3Jhc2hpbmcuCj4KPiBTbyBu
bywgaGF2aW5nIGEgdW5pdCByZXBvcnRlZCBhcyBhY3RpdmUgaXMgbm90IGFuIGluZGljYXRpb24g
b2Ygc3VjY2Vzcy4KPiBJdCBpcyBtZXJlbHkgYW4gaW5kaWNhdGlvbiB0aGF0IHN5c3RlbWQgZGlk
IHNjaGVkdWxlIGFuZCBzdGFydCB0aGF0Cj4gdW5pdCwgbm90IHRoYXQgdGhlIHNlcnZpY2UgaXMg
cnVubmluZyBhcHByb3ByaWF0ZWx5Lgo+Cj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1
aWxkcm9vdC83Y2Y4NzRmMTI3ZjU2YzgxMzI4NjIxNjNhYTJjNGQ0NGY2ZjM5ZWZlLjE2OTYwOTEy
OTUuZ2l0Lnlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyLwo+Cj4gPiA+ID4gICAtIERyb3AgQlIyX1BF
Ul9QQUNLQUdFX0RJUkVDVE9SSUVTIChUaG9tYXMpCj4gPiA+IEFjdHVhbGx5LCBJIGRpc2FncmVl
IHdpdGggVGhvbWFzIGhlcmU6IHdlIGFkZGVkIHN1cHBvcnQgZm9yIFBQRCBpbiB0aGUKPiA+ID4g
aW5mcmEsIHNvIHRoYXQgaWYgUFBEIGlzIGVuYWJsZWQgaW4gYSB0ZXN0LCB0aGVuIFRMUEIgaXMg
ZG9uZSB0byBzcGVlZAo+ID4gPiB1cCB0aGUgdGVzdC4KPiA+IFdlIG5lZWQgYSBjb25zZW5zdXMg
b24gdGhpcy4gVGhpcyBzaG91bGRuJ3QgaGFwcGVuLiBFaXRoZXIgaXQgaXMgT0sgdG8KPiA+IGVu
YWJsZSBQUEQgaW4gdGVzdHMgb3IgaXQgaXNuJ3QuCj4KPiBJIHdvdWxkIHNheSB3ZSB1c3VhbGx5
IGRvIG5vdCB3YW50IGl0LCB1bmxlc3MgdGhlIHJ1bnRpbWUgdGVzdCAidGFrZSB0b28KPiBsb25n
IHRvIHJ1biIgYW5kIHRodXMgd2UgZW5hYmxlIFBQRC4gQnV0IGl0IGhhcyB0byBiZSBqdXN0aWZp
ZWQgKGV2ZW4KPiBicmllZmx5KSBpbiB0aGUgY29taXQgbG9nIChlLmcuICJlbmFibGVkIFBQRCB0
byBkaXZpZGUgdGhlIGJ1aWxkIHRpbWUgYnkKPiBOIjsgTj0zIHNlZW1zIHRoZSBtaW5pbXVtIHRv
IGp1c3RpZnkgUFBELCBJJ2Qgc2F5KQo+Cj4gWy0tU05JUC0tXQo+ID4gPiA+ICsgICAgICAgIHNl
bGYuYXNzZXJ0UnVuT2soInN1IHBvc3RncmVzIC1jIFwicHNxbCAtYyAnU0hPVyBzZXJ2ZXJfdmVy
c2lvbjsnXCIiKQo+ID4gPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIG5lZWQgdG8gdGVzdCBm
b3IgdGhlIFBJRCBmaWxlIGJlZm9yZSB3ZQo+ID4gPiBjb25uZWN0IHRvIHRoZSBkYWVtb24uIElm
IHRoZSBkYWVtb24gaXMgbm90IHJ1bm5pbmcsIHdlIHdvbid0IGJlIGFibGUgdG8KPiA+ID4gY29u
bmVjdCB0byBpdCwgc28gdGhlIHRlc3Qgd2lsbCBmYWlsLCBzbyB0aGUgUElEIGZpbGUgdGVzdCBp
cyByZWR1bmRhbnQsCj4gPiA+IG5vPwo+ID4gSSBhbSBiZWluZyB0aG9yb3VnaC4gSSBjYW4gcmVt
b3ZlIHRoZSBjaGVjayBmb3IgdGhlIFBJRCBmaWxlIGlmIHlvdSB3YW50Lgo+Cj4gSSBzZWUuIEhv
d2V2ZXIsIHdoYXQgSSB3b25kZXIgaXM6IHdoYXQgZG9lcyBpdCBicmluZywgZnJvbSB0aGUKPiBp
bnRlZ3JhdGlvbiBpbiBCdWlsZHJvb3QgcGVyc3BlY3RpdmU/IFdoYXQgSSBtZWFuIGlzOgo+Cj4g
ICAtIGEgcnVudGltZSB0ZXN0IGlzIG1lYW50IHRvIHZhbGlkYXRlIHRoYXQgdGhlIGludGVncmF0
aW9uIGluCj4gICAgIEJ1aWxkcm9vdCBpcyBkZWxpdmVyaW5nIGEgcGFja2FnZSB0aGF0IGlzIHdv
cmtpbmcsIGFuZCB3b3JraW5nIGFzCj4gICAgIGV4cGVjdGVkLCBhdCBsZWFzdCBpbiBpdHMgYmFz
aWMgZmVhdHVyZXM7Cj4KPiAgIC0gYSBydW50aW1lIHRlc3Qgc2hhbGwgZmFpbCB3aGVuIHRoZSBl
eHBlY3RhdGlvbnMgYXJlIG5vdCBtZXQsIHdpdGggYQo+ICAgICBwcm9wZXIgcmVwb3J0IG9mIHdo
YXQgaXMgYnJva2VuLgo+Cj4gU28sIGluIHRoaXMgY2FzZSwgcXVlcnlpbmcgdGhlIERCIHNob3Vs
ZCBiZSBlbm91Z2ggdG8gY2hlY2sgdGhhdCB0aGUKPiBkYWVtb24gaXMgcnVubmluZzogaWYgaXQg
aXMgbm90IHJ1bm5pbmcsIHRoZW4gdGhlIHF1ZXJ5IHdpbGwgZmFpbCB3aXRoCj4gdGhlIGFwcHJv
cHJpYXRlIG1lc3NhZ2UsIHdoaWNoIGlzIGdvaW5nIHRvIGJlIGRpZmZlcmVudCBmcm9tIHRoZSBj
YXNlCj4gd2hlcmUgdGhlIERCIGRvZXMgbm90IGV4aXN0LCBvciB3aGVyZSB0aGUgYWNjZXNzIHRv
IHRoZSBEQiBoYXMgYmVlbgo+IGRlbmllZCBieSBsYWNrIG9mIHByb3BlciBjcmVkZW50aWFscywg
b3IuLi4KPgo+IElmIGEgZmFpbHVyZSB0byBxdWVyeSB0aGUgREIgY2FuJ3QgaW5kZWVkIGRpZmZl
cmVudGlhdGUgdGhlIGRhZW1vbi1pcy0KPiBub3QtcnVubmluZyBjYXNlIGZyb20gdGhlIG90aGVy
cywgdGhlbiBpbmRlZWQgd2UgbmVlZCBhbm90aGVyIHdheS4gQnV0Cj4gdGhlbiB3ZSBuZWVkIGV4
cGxhbmF0aW9ucyBhYm91dCB0aGF0LCBob3dldmVyIGJyaWVmIHRoZXkgYmUuCj4KSSdtIGdvaW5n
IHRvIGJlIHJlYWwgd2l0aCB5b3UuIEkgZG9uJ3QgZXZlbiB1c2UgcGdzcWwgaW4gbXkgcHJvamVj
dHMuCkkgd2FzIHRyeWluZwp0byBoZWxwIGJlY2F1c2UgSSBub3RpY2VkIHRoYXQgaXQgd2FzIGJy
b2tlbiwgYnV0IHRoaXMgaXMgZmFyIHRvbyBtdWNoCmJpa2VzaGVkZGluZwphbmQgbml0cGlja2lu
ZyBhbmQgSSBkb24ndCBoYXZlIHRoZSBkZXNpcmUgbm9yIHRpbWUgdG8gcmVkbyB0aGUgdGVzdC4K
SSdsbCBkZWNsaW5lIHRoZQpwYXRjaCBhbmQgaWYgc29tZW9uZSBlbHNlIHdhbnRzIHRvIG1ha2Ug
YSB0ZXN0IHRoZXkgYXJlIGZyZWUgdG8gZG8gc28uCgpBZGFtCgo+IFJlZ2FyZHMsCj4gWWFubiBF
LiBNT1JJTi4KPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
