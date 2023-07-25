Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A0AC001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 08:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394A24095C;
	Tue, 25 Jul 2023 08:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394A24095C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OPUEzwvUX7U; Tue, 25 Jul 2023 08:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCD1E410E1;
	Tue, 25 Jul 2023 08:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD1E410E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD8F11BF295
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 08:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B70D8817A6
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 08:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B70D8817A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HWxuDOu2y_p for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 08:54:48 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB3CE817A1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 08:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB3CE817A1
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so8244119e87.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 01:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690275285; x=1690880085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gN0GBt2O+Bh7xoXiZRTLcifYGYrYudFoTLUOpBhvwYs=;
 b=K3fMfsaMMfX7U7spFBXpq5qx8II4+V/wqCS2OI6q4t4XsotznrHkOZ9GYECMkdcGHo
 0t4X3A2nvppV4V3xIWAU6cs3za8mBMusuDP4W6YbLnbglwG0l2xxjXVjzPJWgDx/pH6z
 UNy3l3xaAGArp9X5YKx7igwpWYeS5Cq/clI9mFg+Lop1Uvf5JDvmoVUM3+S6pz41/MLv
 axRPrDrDzAAiARvL7yjVaojfmHmV2RAeoo+KMTaJqbtXrSBvLNQU8NQwohsCeXuyt3PP
 TMLvqfi055Xq/sass0Z5qQ98v1KYT/LcfwqK/s9qU+qRV1qUFvDTKAkg0YcQSArqzwUa
 ar4Q==
X-Gm-Message-State: ABy/qLZKayPUZi/KhpxbIZKkBMUUSTKhZzRDB7ExbpNCUL03m5Em8pRz
 gAwUZJeVnqIQmmDd+iguHP5XFZHwppEsNqNwsHFCZA==
X-Google-Smtp-Source: APBJJlH9Vp/bv08h8DcbYNur/HP0JEVYakXGNdF2UEv4Zu0qIQmCxXEnckrVpYwIXcYAhCSiI3+SdJpt8zsPX3b8xeY=
X-Received: by 2002:a19:6707:0:b0:4f8:770f:1b01 with SMTP id
 b7-20020a196707000000b004f8770f1b01mr6821243lfc.19.1690275285553; Tue, 25 Jul
 2023 01:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230716145003.339645-1-bernd@kuhls.net>
In-Reply-To: <20230716145003.339645-1-bernd@kuhls.net>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Tue, 25 Jul 2023 10:54:34 +0200
Message-ID: <CADSVbUtYOeP2Fj3XppauCnPnMjgy-qGg32HaR+frta+hYF6+Qw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690275285; x=1690880085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gN0GBt2O+Bh7xoXiZRTLcifYGYrYudFoTLUOpBhvwYs=;
 b=jN5Su0//YCI/pL53RjUt92yI5dptCtLWW8vbS1qLTOCC1NYM9/21+P4Y5S7B0Qrb3e
 ljl1YzPEA6mr4TUFN33CideCwUJaIuZGZNebXVO/i9I28GHK95f74HnDzeGMrkheDuxT
 ogr9nWqGr+B5+dZtyWHiSwlOH4E6ODz2mBf+ru0WAHdbqpTd2+YbES0Fhx8y3lf+6DtB
 kJ2kRd2h3BM0bZ3HruN5UNB4/46RHdG40rjnIAtiLh4kCuF/FOQvKaagQJxup7NcWqal
 IU+cT4eMS/5NJ3okRIycOYrDnftBl6C7KXoR8f/SIGCakgEk1vq9VparWoEvM/fGAvZu
 I9Nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=jN5Su0//
Subject: Re: [Buildroot] [PATCH 1/2] package/libdecor: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsIGhlbGxvIGFsbCwKCgpPbiBTdW4sIEp1bCAxNiwgMjAyMyBhdCA0OjUw4oCv
UE0gQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JvdGU6Cj4KPiBOZWVkZWQgZm9yIHdh
eWxhbmQgc3VwcG9ydCBpbiBtZXNhM2QtZGVtb3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBL
dWhscyA8YmVybmRAa3VobHMubmV0PgoKSXQgc2VlbXMgbGlrZSB0aGlzIGRlcGVuZGVuY3kgaXMg
b25seSByZXF1aXJlZCBmb3Igd2F5bGFuZCBzdXBwb3J0CndpdGggdGhlIG1lc2EzZC1kZW1vcyB1
cGdyYWRlIHRvIHZlcnNpb24gOS4wLjAgaW4gY29tbWl0CjgwMzA0ZDk5MTFmMzRmOGEwMTczYTRm
MzdkNTJmOTMxNzc0NzhjYzcuCgpWZXJzaW9uIDkuMC4wIG9mIG1lc2EzZC1kZW1vcyBhbHNvIGlu
Y2x1ZGVzIGNvbW1pdAplZjI0YWFlMjI5NzhkNGQzNTczNDAwNzRjYTlhMWMwNGQ5Y2Y4MWU2IHdo
aWNoIHNlZW1zIHRvIGhhdmUgYWRkZWQgYQpkZXBlbmRlbmN5IG9uIGdsdSBmb3IgdGhlIGRlbW9z
IHdoaWNoIGlzIG5vdCB5ZXQgcmVmbGVjdGVkIGluCkJ1aWxkcm9vdC4gRG9lcyB0aGlzIG1lYW4g
d2UgaGF2ZSB0byBoYXZlIGxpYmdsdSBhbmQgdGhlcmVmb3JlIHhvcmc3CmFuZCBnbHggYXMgYSBm
aXhlZCBkZXBlbmRlbmN5IGZvciBtZXNhM2QtZGVtb3M/Cgp0ZXN0L3Rlc3QvYnVpbGQvbWVzYTNk
LWRlbW9zLTkuMC4wL3NyYy9kZW1vcy9tZXNvbi5idWlsZDo4MjoxNDogRVJST1I6ClVua25vd24g
dmFyaWFibGUgImRlcF9nbHUiLgoKVGhpcyBwYXRjaCBsb29rcyBmaW5lIHRvIG1lIGhvd2V2ZXIs
IGFsbCBkZXBlbmRlbmNpZXMgc3BlY2lmaWVkIGluIHRoZQpkb2N1bWVudGF0aW9uIGFyZSB0aGVy
ZSBhbmQgSSBzdWNjZXNzZnVsbHkgYnVpbHQgdGhlIGRlbW9zIHdpdGgKd2F5bGFuZCBzdXBwb3J0
IGFjdGl2YXRlZCBvbmNlIEkgYnVpbHQgbGliZ2x1LgoKUmV2aWV3ZWQtYnk6IFNlYmFzdGlhbiBX
ZXllciA8c2ViYXN0aWFuLndleWVyQHNtaWxlLmZyPgpUZXN0ZWQtYnk6IFNlYmFzdGlhbiBXZXll
ciA8c2ViYXN0aWFuLndleWVyQHNtaWxlLmZyPgoKPiAtLS0KPiAgcGFja2FnZS9Db25maWcuaW4g
ICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2xpYmRlY29yL0NvbmZpZy5pbiAgICAgfCAy
NSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvbGliZGVjb3IvbGliZGVjb3Iu
aGFzaCB8ICAzICsrKwo+ICBwYWNrYWdlL2xpYmRlY29yL2xpYmRlY29yLm1rICAgfCAyMiArKysr
KysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJkZWNvci9Db25maWcuaW4KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZGVjb3IvbGliZGVjb3IuaGFzaAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9saWJkZWNvci9saWJkZWNvci5tawo+Cj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCA1N2QzNjQ2NTY2Li4x
MDk3ZDJkZWFlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9Db25maWcuaW4KPiBAQCAtMTYwMCw2ICsxNjAwLDcgQEAgbWVudSAiR3JhcGhpY3MiCj4gICAg
ICAgICBzb3VyY2UgInBhY2thZ2UvbGVwdG9uaWNhL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJj
ZSAicGFja2FnZS9sZXNzdGlmL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9s
aWJhcnQvQ29uZmlnLmluIgo+ICsgICAgICAgc291cmNlICJwYWNrYWdlL2xpYmRlY29yL0NvbmZp
Zy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9saWJkbXR4L0NvbmZpZy5pbiIKPiAgICAg
ICAgIHNvdXJjZSAicGFja2FnZS9saWJkcmkyL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAi
cGFja2FnZS9saWJkcm0vQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRlY29y
L0NvbmZpZy5pbiBiL3BhY2thZ2UvbGliZGVjb3IvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43ODJmZTg1NWI0Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvbGliZGVjb3IvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwyNSBAQAo+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfTElCREVDT1IKPiArICAgICAgIGJvb2wgImxpYmRlY29yIgo+ICsgICAg
ICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgd2F5bGFuZAo+ICsgICAgICAgZGVwZW5k
cyBvbiBCUjJfVVNFX01NVSAjIHBhbmdvCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfV0NI
QVIgIyBwYW5nbwo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQg
IyBwYW5nbwo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80
XzkgIyBwYW5nbwo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAgIyBw
YW5nbwo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgcGFu
Z28sIHdheWxhbmQKPiArICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9DQUlSTwo+ICsgICAgICAg
c2VsZWN0IEJSMl9QQUNLQUdFX1BBTkdPCj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfV0FZ
TEFORAo+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1dBWUxBTkRfUFJPVE9DT0xTCj4gKyAg
ICAgICBoZWxwCj4gKyAgICAgICAgIGxpYmRlY29yIGlzIGEgbGlicmFyeSB0aGF0IGNhbiBoZWxw
IFdheWxhbmQgY2xpZW50cyBkcmF3Cj4gKyAgICAgICAgIHdpbmRvdyBkZWNvcmF0aW9ucyBmb3Ig
dGhlbS4gSXQgYWltcyB0byBwcm92aWRlIG11bHRpcGxlCj4gKyAgICAgICAgIGJhY2tlbmRzIHRo
YXQgaW1wbGVtZW50cyB0aGUgZGVjb3JhdGlvbiBkcmF3aW5nLgo+ICsKPiArICAgICAgICAgaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpYmRlY29yL2xpYmRlY29yCj4gKwo+ICtjb21t
ZW50ICJsaWJkZWNvciBuZWVkcyBhIHRvb2xjaGFpbiB3LyB3Y2hhciwgdGhyZWFkcywgQysrLCBn
Y2MgPj0gNC45Igo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICsgICAgICAgZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQKPiArICAgICAgIGRlcGVuZHMgb24gIUJS
Ml9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBcCj4g
KyAgICAgICAgICAgICAgICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJfVE9PTENIQUlOX0dDQ19BVF9M
RUFTVF80XzkKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkZWNvci9saWJkZWNvci5oYXNoIGIv
cGFja2FnZS9saWJkZWNvci9saWJkZWNvci5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi45ZTUxZTkwNTkzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UvbGliZGVjb3IvbGliZGVjb3IuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIExvY2FsbHkg
Y2FsY3VsYXRlZAo+ICtzaGEyNTYgIDgyYWRlY2U1YmFlYjYxOTQyOTJiMGQxYTkxYjRiM2QxMGRh
NDExMTVmMzUyYTVlNmM1ODQ0YjIwYjg4YTA1MTIgIGxpYmRlY29yLTAuMS4xLnRhci5nego+ICtz
aGEyNTYgIDUwOGE3N2QyZTdiNTFkOThhZGVlZDMyNjQ4YWQxMjRiN2IzMDI0MWE4ZTcwYjJlNzJj
OTlmOTJkOGU1ODc0ZDEgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkZWNvci9s
aWJkZWNvci5tayBiL3BhY2thZ2UvbGliZGVjb3IvbGliZGVjb3IubWsKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjIxNTA1ZGU3ODUKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvcGFja2FnZS9saWJkZWNvci9saWJkZWNvci5tawo+IEBAIC0wLDAgKzEsMjIgQEAKPiAr
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIGxpYmRlY29yCj4gKyMKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0xJQkRFQ09SX1ZFUlNJT04gPSAwLjEuMQo+ICtMSUJE
RUNPUl9TSVRFID0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpYmRlY29yL2xpYmRl
Y29yLy0vYXJjaGl2ZS8kKExJQkRFQ09SX1ZFUlNJT04pCj4gK0xJQkRFQ09SX0xJQ0VOU0UgPSBN
SVQKPiArTElCREVDT1JfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiArTElCREVDT1JfSU5TVEFM
TF9TVEFHSU5HID0gWUVTCj4gK0xJQkRFQ09SX0RFUEVOREVOQ0lFUyA9IGNhaXJvIGRidXMgcGFu
Z28gd2F5bGFuZCB3YXlsYW5kLXByb3RvY29scwo+ICtMSUJERUNPUl9DT05GX09QVFMgPSAtRGRl
bW89ZmFsc2UKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfREJVUykseXgpCj4gK0xJQkRFQ09S
X0NPTkZfT1BUUyArPSAtRGRidXM9ZW5hYmxlZAo+ICtMSUJERUNPUl9ERVBFTkRFTkNJRVMgKz0g
ZGJ1cwo+ICtlbHNlCj4gK0xJQkRFQ09SX0NPTkZfT1BUUyArPSAtRGRidXM9ZGlzYWJsZWQKPiAr
ZW5kaWYKPiArCj4gKyQoZXZhbCAkKG1lc29uLXBhY2thZ2UpKQo+IC0tCj4gMi4zOS4yCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKQmVzdCByZWdhcmRzLApT
ZWJhc3RpYW4KCi0tIApQb3VyIGxhIHBsYW7DqHRlLCBuJ2ltcHJpbWV6IGNlIG1haWwgcXVlIHNp
IGMnZXN0IG7DqWNlc3NhaXJlCgoKMTAtMTIgUnVlIE5pY29sYXMgQXBwZXJ0CjQ0MTAwIE5BTlRF
UwoKU2ViYXN0aWFuIFdFWUVSClN0YWdpYWlyZSBwcm9kdWN0aW9uCgpzZWJhc3RpYW4ud2V5ZXJA
c21pbGUuZnIKaHR0cDovL3d3dy5zbWlsZS5ldQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
