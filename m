Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED1DC54E5D
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 18:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FC881400;
	Tue, 12 Mar 2024 18:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNhiEpXcnGPr; Tue, 12 Mar 2024 18:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7621D813F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7621D813F8;
	Tue, 12 Mar 2024 18:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B588C1BF82C
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 18:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1B0281404
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 18:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1rYLMnT_-pu for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 18:40:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DD8181400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD8181400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DD8181400
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 18:40:26 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a45606c8444so720689766b.3
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 11:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710268824; x=1710873624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UrA7vHgbnEJLYVZr+Kvfa7MHv1XVF+jjbK0FHyIZW0A=;
 b=TvmHRqjtqpywm0NNpFk7PtnKmUo7z9gQ2U6wHpdOGatyrqGaLjVcHo9tcj+TaKW1Dh
 9WILVxU6GknoVyophF50Jb5EvxEzNkCSfQlvFA2vAnKu9ynkos9nnmo3QS8ms/h/EAGv
 cJBYp5OdwpsU20Z1+omgeJCxg0cn+mfp+DXcxGQvH0od9XhID3QPSDfJPZ0BC6nqjTBN
 ITgnjj0yOo8+7kzQijLmaEju3pCu/W4GnHVbaurFrnQBu2Bf65+W21yCusWWcCrtWzu1
 K/YHrQgII5gpiSQMJdFriC+sLL/GxIaWObeG6uRpWjpt1JC2///h94c0GySTc8Asyb/y
 6Udg==
X-Gm-Message-State: AOJu0YzxK7VZJdnVLH4TNr2UZ5GoXiXP6x70KMid8bs7KSbJHL769YNl
 4hr0pgl9LKy7pxDLqB8pQJNDLrmv0kLoU7SXbqGqHsUdBlfV49DgoHHOCudWfo3tkA7eVlh/DOG
 NM3MUQ+jHxDZ3oTQIZsADCrrTHdoBnz/yn+MqWZEzX+LXpuz3
X-Google-Smtp-Source: AGHT+IElnV16Q8/c984sky1KBF8f2+oQr/hUjSC+NhE/V0zkugL8fXKKWL1t0RHMRLeRvt+w2VQIPiShlnTE29TCmOU=
X-Received: by 2002:a17:907:c086:b0:a46:2349:7650 with SMTP id
 st6-20020a170907c08600b00a4623497650mr5368448ejc.17.1710268824469; Tue, 12
 Mar 2024 11:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240312011317.1956535-1-jeremy@jeremypeper.com>
In-Reply-To: <20240312011317.1956535-1-jeremy@jeremypeper.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 12 Mar 2024 11:40:13 -0700
Message-ID: <CAHDQB6MD1xBXdgBMUfsEsFyt8Y3eUwU_hvVVp8P61-u7y=T-SQ@mail.gmail.com>
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1710268824; x=1710873624;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UrA7vHgbnEJLYVZr+Kvfa7MHv1XVF+jjbK0FHyIZW0A=;
 b=bu9bWSdKoFh8OtO6Le40kg9DYUwjL5RuVHlch9cgNRZC1+mnqRzBRskNvH+07/Mqye
 +EHFvTUhsg3FWFIMYPkt02sIlE74DzBMfg/ef99KNSxtF0E0uOS7ADIUXqanSCgZZ/q/
 fDcJaVkiczNMBnoiFHQnDbeAxzn2sdiYDnQ5g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bu9bWSdK
Subject: Re: [Buildroot] [PATCH] package/targetcli-fb: needs python-gobject
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpUaGFuayB5b3Ugc28gbXVjaCBmb3IgdGhlIHBhdGNoISBJdCdzIHJlYWxseSBhcHBy
ZWNpYXRlZCEgVGhlcmUgaXMgb25lCmlzc3VlIHRvIGJyaW5nCnVwIHRoYXQgd2lsbCByZXF1aXJl
IHlvdSB0byBzZW5kIGEgdjIgb2YgdGhpcyBwYXRjaC4gTm90aGluZyB0b28gYmFkLApqdXN0IGFu
IG92ZXJzaWdodApJIGFtIHN1cmUhIFNlZSBiZWxvdzoKCgpPbiBNb24sIE1hciAxMSwgMjAyNCBh
dCA2OjEz4oCvUE0gSmVyZW15IEouIFBlcGVyIDxqZXJlbXlAamVyZW15cGVwZXIuY29tPiB3cm90
ZToKPgo+IGFkZCBweXRob24tZ29iamVjdCB0byByZXNvbHZlICJNb2R1bGVOb3RGb3VuZEVycm9y
OiBObyBtb2R1bGUgbmFtZWQgJ2dpJyIgZXJyb3IgZW5jb3VudGVyZWQgaWYgYnVpbHQgd2l0aG91
dCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEplcmVteSBKLiBQZXBlciA8amVyZW15QGplcmVteXBl
cGVyLmNvbT4KPiAtLS0KPiAgcGFja2FnZS90YXJnZXRjbGktZmIvQ29uZmlnLmluICAgICAgIHwg
MSArCj4gIHBhY2thZ2UvdGFyZ2V0Y2xpLWZiL3RhcmdldGNsaS1mYi5tayB8IDIgKy0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3RhcmdldGNsaS1mYi9Db25maWcuaW4gYi9wYWNrYWdlL3RhcmdldGNsaS1m
Yi9Db25maWcuaW4KPiBpbmRleCAwNGM2YTFhYy4uNzIyYjk0MDAgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS90YXJnZXRjbGktZmIvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS90YXJnZXRjbGktZmIv
Q29uZmlnLmluCj4gQEAgLTcsNiArNyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9UQVJHRVRDTElf
RkIKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fQ09ORklHU0hFTExfRkIKPiAg
ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUlRTTElCX0ZCCj4gICAgICAgICBzZWxl
Y3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NJWAo+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZ
VEhPTl9HT0JKRUNUClNlbGVjdGluZyBhbmQgZGVwZW5kaW5nIG9uIHB5dGhvbi1nb2JqZWN0IGlz
IGdyZWF0ISBCdXQgeW91IGFsc28gbmVlZCB0byBhZGQKcHl0aG9uLWdvYmplY3RzIGRlcGVuZGVu
Y2llcyB0byB0YXJnZXRjbGktZmIuIEx1Y2tpbHksIHRoZXJlIGFyZSBubyBwYWNrYWdlcwp0aGF0
IGN1cnJlbnRseSBkZXBlbmQgb24gb3Igc2VsZWN0IHRhcmdldGNsaS1mYiwgc28gbm8gZGVwZW5k
ZW5jaWVzIG5lZWQgdG8gYmUKcHJvcGFnYXRlZCBmdXJ0aGVyIHRoYW4gdGhpcyBwYWNrYWdlIQoK
VGhhbmtzIHNvIG11Y2ghCkFkYW0KCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIHRhcmdldGNs
aS1mYiBpcyBhIGNvbW1hbmQtbGluZSBpbnRlcmZhY2UgZm9yIGNvbmZpZ3VyaW5nIHRoZQo+ICAg
ICAgICAgICBMSU8gZ2VuZXJpYyBTQ1NJIHRhcmdldCwgcHJlc2VudCBpbiAzLnggTGludXgga2Vy
bmVsCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGFyZ2V0Y2xpLWZiL3RhcmdldGNsaS1mYi5tayBi
L3BhY2thZ2UvdGFyZ2V0Y2xpLWZiL3RhcmdldGNsaS1mYi5tawo+IGluZGV4IGQyY2JmNzllLi5k
YmUzNmU1OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RhcmdldGNsaS1mYi90YXJnZXRjbGktZmIu
bWsKPiArKysgYi9wYWNrYWdlL3RhcmdldGNsaS1mYi90YXJnZXRjbGktZmIubWsKPiBAQCAtMTIs
NyArMTIsNyBAQCBUQVJHRVRDTElfRkJfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiAgVEFSR0VUQ0xJ
X0ZCX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gIFRBUkdFVENMSV9GQl9DUEVfSURfVkFMSUQg
PSBZRVMKPiAgVEFSR0VUQ0xJX0ZCX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gLVRBUkdFVENM
SV9GQl9ERVBFTkRFTkNJRVMgPSBweXRob24tY29uZmlnc2hlbGwtZmIgcHl0aG9uLXJ0c2xpYi1m
YiBweXRob24tc2l4Cj4gK1RBUkdFVENMSV9GQl9ERVBFTkRFTkNJRVMgPSBweXRob24tY29uZmln
c2hlbGwtZmIgcHl0aG9uLXJ0c2xpYi1mYiBweXRob24tc2l4IHB5dGhvbi1nb2JqZWN0Cj4KPiAg
ZGVmaW5lIFRBUkdFVENMSV9GQl9JTlNUQUxMX0lOSVRfU1lTVgo+ICAgICAgICAgJChJTlNUQUxM
KSAtbSAwNzU1IC1EIHBhY2thZ2UvdGFyZ2V0Y2xpLWZiL1M1MHRhcmdldCBcCj4gLS0KPiAyLjM5
LjIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
