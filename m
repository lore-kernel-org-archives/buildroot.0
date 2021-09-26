Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B311C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 13:12:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3ED61019
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 13:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC3ED61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85EA5605CA;
	Sun, 26 Sep 2021 13:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ip1TmjULQ_Nh; Sun, 26 Sep 2021 13:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 162C9606C5;
	Sun, 26 Sep 2021 13:12:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6A2C1BF30A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 13:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1E4740298
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 13:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guXUsD0zYhDE for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 13:12:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 907B7400A8
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:12:01 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ee50so56979973edb.13
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x94L0yyHFZ8huXRyIgymXfGlS120ly1OlGl6tRwshhU=;
 b=XFibR2aahrstZPfnC3+NZc0jfJvBQdE+mWx1dmHCfLN3ZJsUHIT6VtvWNgM0CfCPUX
 S8wxzhu61XC3AqgmlHRCob/Ir6rVFGkhzv99Uxf5lsMm9r3sdU2K4+0ABJKj0xVWktfl
 Fvt6XbNJfxOZigzMWtqEogaBVh73yvNF84hdbCHIsyhMwluXk/0b0L/Uy+bbmzdPAtP1
 UCvlw7J1aX/lz8ubHddvpAKchXlSvWOf7gTq84/hI99Qailsgx8hl4Az7+sX7GeUEb+J
 OVa03Skrz6ErxYZvCzlbKlLgnpDcTm9KfJipGAZIHKVOLJzPRZFf7wTWbxRo2hAaehdt
 MJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x94L0yyHFZ8huXRyIgymXfGlS120ly1OlGl6tRwshhU=;
 b=o/pVrdyLAYKLe3n8nxUC6Rpj9SCfMe8wrAyaTXNLT77jrkD4TFLsmA3fNXIA1EaN9m
 rfq/b/1ofK+P8T7bMejhdi7FN2NpEMNtMCZUcJS91cXYEbkGANvmGeY/m36B8KCtTdbp
 tj1KvEfqEYQ7usPwlVDAP9BGboWKzZ9z2/wxXxl2ZbAlepJdAo7Hgfon3IJk9pcZZ1ta
 nmNbZYcXxiC2Lcg3hOJtLMkbhsR57UiJmyG0UfgEB0yAGAPc79nziu8pgBy5pCU/Djh6
 SRLvA2nuY/LJIlsczZDRATP1iXb7TDwnRKUw6kMOKJxiYHDqj9GdZtyUCvUn8FN8isHr
 IIDg==
X-Gm-Message-State: AOAM531gws0b3sfcea/cjAaV2t5+vJjq9eNIqrfuZf8itvnjfC8NkBDd
 hMtet51db6ZInawX1KS4badPt7ryMCT1L4eFZHI=
X-Google-Smtp-Source: ABdhPJxAiQOIdEVtqejIsgkaNFJQt8K7EV0KIK66oHqPce/Ims9IKLqk9ie1wCQ6oYghJYpSRI1wBzGuIcTZoZYlV5A=
X-Received: by 2002:a05:6402:14c3:: with SMTP id
 f3mr17416279edx.312.1632661919753; 
 Sun, 26 Sep 2021 06:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210924170014.111889-1-asafka7@gmail.com>
 <20210925163308.GQ3176@scaer>
 <4cb6b204-b005-02dc-f2c3-e0c09dc37ed1@gmail.com>
In-Reply-To: <4cb6b204-b005-02dc-f2c3-e0c09dc37ed1@gmail.com>
From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 26 Sep 2021 16:11:48 +0300
Message-ID: <CALFsTFVnNei7-VHFhy0p66qNeDy6O4r4Q0=HVpFNe-HvQupVMQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-attrs: depends on python3
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFtYWluLAoKT24gU3VuLCBTZXAgMjYsIDIwMjEgYXQgMzo1NSBQTSBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQXNhZiwgQWxsLAo+Cj4gTGUgMjUvMDkv
MjAyMSDDoCAxODozMywgWWFubiBFLiBNT1JJTiBhIMOpY3JpdCA6Cj4gPiBBc2FmLCBBbGwsCj4g
Pgo+ID4gT24gMjAyMS0wOS0yNCAyMDowMCArMDMwMCwgQXNhZiBLYWhsb24gc3Bha2UgdGh1c2x5
Ogo+ID4+IHB5dGhvbi1hdHRycyBjb250YWlucyBhIGZpbGUgd2l0aCBBUEkgZm9yIHB5dGhvbiAz
LjYrLgo+ID4+IEFsdGhvdWdoIHdlIGNhbiBtYWtlIGEgInR3ZWFrIiBhbmQgcmVtb3ZlIHRoaXMg
c3BlY2lmaWMgZmlsZQo+ID4+IGZvciBweXRob24yLCB3ZSBwcmVmZXIgdG8gbWFrZSB0aGlzIHBh
Y2thZ2UgYXZhaWxhYmxlIG9ubHkgZm9yCj4gPj4gcHl0aG9uMywgYmVjYXVzZSB0aGUgZGF5IHRo
aXMgcGFja2FnZSAoYW5kIG1hbnkgb3RoZXJzKSB3aWxsIGRyb3AKPiA+PiBzdXBwb3J0IGZvciBw
eXRob24yIGlzIHByb2JhYmx5IHZlcnkgY2xvc2UuCj4gPj4KPiA+PiBJbiBhZGRpdGlvbiwgdXBk
YXRlIHB5dGhvbi1hdHRycyByZWN1cnNpdmUgZGVwZW5kZW5jaWVzIHRvCj4gPj4gZGVwZW5kIG9u
IHB5dGhvbjMgdG9vIChweXRob24tYXV0b21hdCBpcyB0aGUgb25seSBvbmUgbGVmdCkuCj4KPiBQ
bGVhc2UgQXNhZiwgdGFrZSBjYXJlIG9mIHB5dGhvbiB0ZXN0cyBpbiB0aGUgQnVpbGRyb290IHRl
c3RzdWl0ZS4KPgo+IFNpbmNlIHB5dGhvbi1hdHRycyBpcyBub3cgcHl0aG9uMyBvbmx5IHdlIGNh
biByZW1vdmUgKGF0IGxlYXN0KSB0d28gdGVzdHM6Cj4KPiBUZXN0UHl0aG9uUHkyQXR0cnMKPiBU
ZXN0UHl0aG9uUHkyQXV0b21hdApZb3UncmUgcmlnaHQsIHRoYW5rcy4KSSdsbCB0YWtlIGEgbG9v
ayBhbmQgc2VuZCBhIHByb3BlciBwYXRjaC4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4K
Pgo+ID4+Cj4gPj4gRml4ZXM6Cj4gPj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvYWE2L2FhNjg4OWJjMjU0ZWFhOTNhZGI0ZmMxYTcxYmNlZTlmMmYyM2NiMzMvCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBc2FmIEthaGxvbiA8YXNhZmthN0BnbWFpbC5jb20+Cj4g
Pj4gLS0tCj4gPj4gIHBhY2thZ2UvcHl0aG9uLWF0dHJzL0NvbmZpZy5pbiAgIHwgMSArCj4gPj4g
IHBhY2thZ2UvcHl0aG9uLWF1dG9tYXQvQ29uZmlnLmluIHwgMSArCj4gPj4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tYXR0cnMvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tYXR0cnMvQ29uZmlnLmluCj4gPj4g
aW5kZXggZmIwYWIyNDhmYS4uYjY1OGQyMGVjOSAxMDA2NDQKPiA+PiAtLS0gYS9wYWNrYWdlL3B5
dGhvbi1hdHRycy9Db25maWcuaW4KPiA+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1hdHRycy9Db25m
aWcuaW4KPiA+PiBAQCAtMSw0ICsxLDUgQEAKPiA+PiAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhP
Tl9BVFRSUwo+ID4+ICsgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QWVRIT04zCj4gPgo+ID4g
ICAgICQgbWFrZSBjaGVjay1wYWNrYWdlCj4gPiAgICAgcGFja2FnZS9weXRob24tYXR0cnMvQ29u
ZmlnLmluOjM6IGF0dHJpYnV0ZXMgb3JkZXI6IHR5cGUsIGRlZmF1bHQsCj4gPiAgICAgZGVwZW5k
cyBvbiwgc2VsZWN0LCBoZWxwIChodHRwOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmln
X2ZpbGVzKQo+ID4KPiA+IEFwcGxpZWQgdG8gbWFzdGVyIHdpdGggdGhlIGFib3ZlIGZpeGVkLCB0
aGFua3MuCj4gPgo+ID4gUmVnYXJkcywKPiA+IFlhbm4gRS4gTU9SSU4uCj4gPgo+ID4+ICAgICAg
Ym9vbCAicHl0aG9uLWF0dHJzIgo+ID4+ICAgICAgaGVscAo+ID4+ICAgICAgICBhdHRycyBpcyB0
aGUgUHl0aG9uIHBhY2thZ2UgdGhhdCB3aWxsIGJyaW5nIGJhY2sgdGhlIGpveSBvZgo+ID4+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1hdXRvbWF0L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0
aG9uLWF1dG9tYXQvQ29uZmlnLmluCj4gPj4gaW5kZXggZWUwMmQyMmI1Yi4uOWQyMjI3NmMyYyAx
MDA2NDQKPiA+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1hdXRvbWF0L0NvbmZpZy5pbgo+ID4+ICsr
KyBiL3BhY2thZ2UvcHl0aG9uLWF1dG9tYXQvQ29uZmlnLmluCj4gPj4gQEAgLTEsNSArMSw2IEBA
Cj4gPj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fQVVUT01BVAo+ID4+ICAgICAgYm9vbCAi
cHl0aG9uLWF1dG9tYXQiCj4gPj4gKyAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1BZVEhPTjMg
IyBweXRob24tYXR0cnMKPiA+PiAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fQVRUUlMg
IyBydW50aW1lCj4gPj4gICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NJWCAjIHJ1bnRp
bWUKPiA+PiAgICAgIGhlbHAKPiA+PiAtLQo+ID4+IDIuMzAuMgo+ID4+Cj4gPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+PiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gPj4gYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKPiA+PiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+Cj4KClRo
YW5rcywKQXNhZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
