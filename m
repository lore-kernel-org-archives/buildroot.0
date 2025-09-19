Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640BCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 03:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6783560D77;
	Fri, 19 Sep 2025 03:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2DqOkcG_uhO; Fri, 19 Sep 2025 03:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 959B660D8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 959B660D8E;
	Fri, 19 Sep 2025 03:17:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EB5BE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6276D822A1
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pmekOhTe8P9 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 03:17:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AA3E8229C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AA3E8229C
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AA3E8229C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:17:17 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-50f8bf5c518so1244645137.3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758251836; x=1758856636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZgPuBmcg3S8GY0uISmwuIH0APLog8IGcyQMJOdTep+A=;
 b=utDRt0iCxGz8+H3IJrex+TFFW1E92v8VuwZ14cUD8GCFGMDJRsxI/UsEbPqGnPlLDT
 bNB1iZ8Q3uSiLCeC5ANV5XEuQbeBf+t1zKLmFHAx4V4iwZ+PtFwt0jGNQUhwSb4BmFie
 xUa7NsJDaVqKNAGpqcCyyxCT/qcSltYhxiZlX8kx1knfcctRm9c2l/4BcGyhY8eiHQWa
 OIrjEx43GN27KaAUpJu8UwPP7e230Sqw5DF3DmixbMqdJAFCBdn/hhXmnZhOrKiqopxo
 abXZ2p3awa1Io1hZ4W5mGSllqsVXUEViOHnQdEZCxcTP+7O+iwHLTgSw3iSSwp+X6QID
 gi8Q==
X-Gm-Message-State: AOJu0YygCB3zN59M+70jhpsbuU0CmIlsCRWHNy0Mekg7un1crdCq/zhJ
 gacHFt8TjaWpUZh68ZTQuQzWcvCsYnddJGfx/gmgISoE3/g/m6yrL91vOdt6QTRKuw2bW/K1iUF
 8LyFneyB0rF5sWPNcShkNsaXnUc27vOk=
X-Gm-Gg: ASbGnctUSbc/al9J1bBrK3R9/LBDnr2iovSL6bUHZ1Bgfr7I044v9RkEr9Y32gHa8FB
 AkWfMIA9Ijh6srIQ437pZbGZW4GC16XqOoux0MgWqA78lJha+3lxBaLgQIN3RQ1I9C/ye4b7qaM
 vhwWexEKJLvJDokaVb8LwwYxMZd1rpgdOMayb/inccur5R2apjT//wxkIhxw1tzVzuFFm7M/IAe
 mqO/omA2DZvj7SMUKw=
X-Google-Smtp-Source: AGHT+IFZbx9Xsg1j4VRgrmiH48JJkkeK4GTZ0zEDzDQXJULrGF439BKrqfDVsgr7Hem871A+X5e8SaN5baJU0QRpPMY=
X-Received: by 2002:a05:6102:3714:b0:521:f2f5:e444 with SMTP id
 ada2fe7eead31-588edae0412mr616606137.17.1758251835944; Thu, 18 Sep 2025
 20:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250909161325.59760-1-bernd@kuhls.net>
In-Reply-To: <20250909161325.59760-1-bernd@kuhls.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 18 Sep 2025 21:17:04 -0600
X-Gm-Features: AS18NWBPolayrcnoFYBL8_BTPtuZIJpmwLWrd0QvqRPYXqJ7eftxm3SLqdlVz2Y
Message-ID: <CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>, Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758251836; x=1758856636; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZgPuBmcg3S8GY0uISmwuIH0APLog8IGcyQMJOdTep+A=;
 b=m01IWm4jaGXTx9MjscXZqcWqftuOAs48xFB5TCe+iduQDAQOjMnb/DWoiuINc9+GGd
 tlngq8tAz9FNeGVq97ebQksmUc1fX6Tl0GsJYGdz1DP3f9Y9My+Qrm5s4nchtPQ1J402
 LCxtiiHlv1TK1mkHcdabjwbuE00OR1N8KP+KcYY3CwUEjw+RgM0rLpOpKNUzhw6tzppl
 +YizA4A/yYeK+NZWrfC9apBs81wUs7EKO4DBiOYYzksC4xoKtqUAk/8ON+6sMRQqYfco
 JuO3z6GtpILdhfUXV3/dKG0k5TOt+sLf2HZ9FvPn0KV+howtaOmYs3H+No2e3Pa9aLSM
 lfAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m01IWm4j
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCAxMDoyMuKAr0FNIEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+IHdyb3RlOgo+Cj4gUmViYXNlZCBwYXRjaCAwMDAxLgo+Cj4gUmVtb3ZlZCBHYWxsaXVt
IHhhIHN0YXRlIHRyYWNrZXI6Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Ev
bWVzYS8tL2NvbW1pdC8zYmUyYzQ3ZGIyMzE4ZWJlOTIyMmM4MGJmOTgxMDM4ZGY0Mzc0YjJkCj4K
PiBMZWdhY3kgaGFuZGxpbmcgZm9yIGJsaW5kIG9wdGlvbiBCUjJfUEFDS0FHRV9NRVNBM0RfTkVF
RFNfWEEgaXMgbm90Cj4gbmVjZXNzYXJ5Lgo+Cj4gUmVsZWFzZSBub3RlczoKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjUtQXVndXN0LzAw
MDgxNS5odG1sCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1h
bm5vdW5jZS8yMDI1LUF1Z3VzdC8wMDA4MTguaHRtbAo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNS1TZXB0ZW1iZXIvMDAwODIwLmh0bWwK
Pgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4g
IHBhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsgICAgICAgICAgICAgICB8
ICAyICstCj4gIC4uLi1tZXNvbi1vcHRpb24tdG8tZGlzYWJsZS1vcHRpb25hbC1uZW9uLXN1cHBv
ci5wYXRjaCB8ICA2ICsrKy0tLQo+ICBwYWNrYWdlL21lc2EzZC9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgOSAtLS0tLS0tLS0KPiAgcGFja2FnZS9tZXNhM2QvbWVz
YTNkLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIHBhY2th
Z2UvbWVzYTNkL21lc2EzZC5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsr
LS0tLS0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRl
cnMubWsgYi9wYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCj4gaW5kZXgg
NWNkMDVjYzlmZi4uNTkzMmQ3M2YyYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC1oZWFk
ZXJzL21lc2EzZC1oZWFkZXJzLm1rCj4gKysrIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNh
M2QtaGVhZGVycy5tawo+IEBAIC0xMiw3ICsxMiw3IEBAIGVuZGlmCj4KPiAgIyBOb3QgcG9zc2li
bGUgdG8gZGlyZWN0bHkgcmVmZXIgdG8gbWVzYTNkIHZhcmlhYmxlcywgYmVjYXVzZSBvZgo+ICAj
IGZpcnN0L3NlY29uZCBleHBhbnNpb24gdHJpY2tlcnkuLi4KPiAtTUVTQTNEX0hFQURFUlNfVkVS
U0lPTiA9IDI1LjEuOAo+ICtNRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjUuMi4yCgpJdCBsb29r
cyBsaWtlIHRoaXMgaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gZm9yIGNvZyh0aGlzIHBhdGNoIHdh
cyBmbGFnZ2VkCndoZW4gSSBiaXNlY3RlZCB0aGlzIGNvZyBjcmFzaCk6ClNlcCAxNyAyMTozNDox
MSBidWlsZHJvb3QgY29nWzEwMzc4XTogUmVuZGVyZXIgcHJvY2VzcyB0ZXJtaW5hdGVkIGFuZApm
YWlsZWQgdG8gcmVjb3ZlciB3aXRoaW4gMTAwMG1zClNlcCAxNyAyMTozNDoxMSBidWlsZHJvb3Qg
Y29nWzEwMzc4XTogPD4gQ3Jhc2ghOiBUaGUgcmVuZGVyZXIgcHJvY2VzcwpjcmFzaGVkLiBSZWxv
YWRpbmcgdGhlIHBhZ2UgbWF5IGZpeCBpbnRlcm1pdHRlbnQgZmFpbHVyZXMuClNlcCAxNyAyMToz
NDoxMSBidWlsZHJvb3QgY29nWzExNTU4XTogbGliRUdMIHdhcm5pbmc6IGZhaWxlZCB0byBnZXQK
ZHJpdmVyIG5hbWUgZm9yIGZkIC0xClNlcCAxNyAyMTozNDoxMSBidWlsZHJvb3QgY29nWzExNTU4
XTogbGliRUdMIHdhcm5pbmc6IE1FU0EtTE9BREVSOgpmYWlsZWQgdG8gcmV0cmlldmUgZGV2aWNl
IGluZm9ybWF0aW9uClNlcCAxNyAyMTozNDoxMSBidWlsZHJvb3QgY29nWzExNTU4XTogbGliRUdM
IHdhcm5pbmc6IGZhaWxlZCB0byBnZXQKZHJpdmVyIG5hbWUgZm9yIGZkIC0xClNlcCAxNyAyMToz
NDoxMSBidWlsZHJvb3QgY29nWzExNTU4XTogbGliRUdMIHdhcm5pbmc6IGVnbDogZmFpbGVkIHRv
CmNyZWF0ZSBkcmkyIHNjcmVlbgpTZXAgMTcgMjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMTU1OF06
IGxpYkVHTCB3YXJuaW5nOiBlZ2w6IGZhaWxlZCB0bwpjcmVhdGUgZHJpMiBzY3JlZW4KU2VwIDE3
IDIxOjM0OjExIGJ1aWxkcm9vdCBjb2dbMTE1NThdOiBDb3VsZCBub3QgY3JlYXRlIFdQRSBFR0wK
ZGlzcGxheTogRUdMX05PVF9JTklUSUFMSVpFRC4gQWJvcnRpbmcuLi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
