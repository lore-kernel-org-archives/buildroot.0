Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676D0C54EAA
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 00:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0152282718;
	Sat, 28 Jan 2023 00:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0152282718
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjpcTLUciSTz; Sat, 28 Jan 2023 00:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F14C82684;
	Sat, 28 Jan 2023 00:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F14C82684
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF0C1BF977
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 00:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 241FA82684
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 00:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 241FA82684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLCP9MJ55A0Q for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 00:35:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1825B82670
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1825B82670
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 00:35:57 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-142b72a728fso8644206fac.9
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 16:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2SSflQVbMnHRITRpeJ7Fh3LLCMOEuqJ3pZBKItym2Lw=;
 b=ACqGlJzdmo/tqySbsfZbRMC3uCucPq1bRd0XKTfh9q3ulQz/BLR+8fzcSKB5ppOYdO
 SeAWkKbEs5tZ1afB9ryGOfZ7eSN+C36wvW+caJz/O7LTAd0p6Ts/AciU2xhXQ+CWEcfM
 z/JPoGw+vHKwu+UCkoAviVLDZb3jFgTN/d058hNdMmtXwU/xlCF7CxOF21FMOjPMLE81
 wgWDqQ6aO9wU0jq4h9gp1RKvZMwg487e3qtt4RetFqfpzRzCPSVXZxXLRW9sGSM4dg8U
 kbsWikzwIZHSBMhJqNn8nRNJMf+UNLzC9UaoNZcT7lf3UwjxK8PshVVnIfB/BhlCTwx7
 BkVA==
X-Gm-Message-State: AO0yUKXYz3pS5+cVgUYzHnhpY+lQJ0R2Wx7gJEIfbKZWvdFR3TowlW5H
 uanCR6Fz4azF7f4MXTcC/koK7FENmNCFUawUsRc=
X-Google-Smtp-Source: AK7set/KNBtLyDKziJtD0a2RvTyo4bBfgY6yzNOfLjoTVvAvQMNVSrXNljdfSiDd3ymiBgzSlUgjZTvtBucmADYRpgA=
X-Received: by 2002:a05:6871:6aaa:b0:163:501b:e7b with SMTP id
 zf42-20020a0568716aaa00b00163501b0e7bmr602813oab.18.1674866157120; Fri, 27
 Jan 2023 16:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <20220728014402.142320-2-james.hilliard1@gmail.com>
 <d23235cc-ab94-f5dc-f3c9-a22604b9d750@smile.fr>
In-Reply-To: <d23235cc-ab94-f5dc-f3c9-a22604b9d750@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 27 Jan 2023 17:35:45 -0700
Message-ID: <CADvTj4pwShLU1HNr_DeD-0zjCM336zmmS9zRE_6uN5iPOK7xbQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2SSflQVbMnHRITRpeJ7Fh3LLCMOEuqJ3pZBKItym2Lw=;
 b=fjMwCMjR3SP3Je2qfbb38FaG/9yngWIMJO2/HRLiWIVYpa+a32cIyxwi/C7wrrXgHb
 sRfS7m5YawC+O5RN0oop87QX8tJLCx+ja4Ti6ZRb1O/o6pkbBvTurTE8ujxRS7NfDMsR
 NuLB1UgqJ9uLxDXyv722R/iPSN1DTtomI8klXc3EHTnYxakpMQ9/y9JSsKyo1ifTs89C
 TMeZl19F4E0qbEDO0ugYQwwTwcTQUCiW5xZeKQrtj/KlGK3/SPhIz61kgAq6sqZ922Os
 0yr7QBlQnzSNq2LI36b2Wh5wX6ahjO8yksCQARx0xx/3RC1VRbUmBWdwhMjYXC6Vy6gO
 B8+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fjMwCMjR
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-meson: generate relocatable
 pkgconfigs
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
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKYW4gMTEsIDIwMjMgYXQgODozMCBBTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IExlIDI4LzA3LzIwMjIgw6AgMDM6
NDQsIEphbWVzIEhpbGxpYXJkIGEgw6ljcml0IDoKPiA+IFRoaXMgZm9ybWF0IHByZXZlbnRzIHBr
Z2NvbmZpZyBwYXRoIGlzc3VlcyB3aGVuIHVzaW5nIG1lc29uJ3MKPiA+IGJ1aWx0LWluIGluc3Rh
bGwgZnVuY3Rpb25hbGl0eS4KPgo+IElzIGFueSBwYWNrYWdlIGN1cnJlbnRseSBhZmZlY3RlZCBi
eSB0aGlzIGlzc3VlPwoKV2UgY3VycmVudGx5IGFyZW4ndCB1c2luZyBtZXNvbidzIGJ1aWx0LWlu
IGluc3RhbGwgZmVhdHVyZSBBRkFJVSBzbyBJCmRvbid0IHRoaW5rCnRoZXJlJ3MgY3VycmVudGx5
IGFueSBwYWNrYWdlcyBoYXZpbmcgaXNzdWVzIGhlcmUuCgo+Cj4gSSB3b3VsZCBhZGQgYSByZWZl
cmVuY2UgbGluazoKPiBodHRwczovL21lc29uYnVpbGQuY29tL1BrZ2NvbmZpZy1tb2R1bGUuaHRt
bCNyZWxvY2F0YWJsZS1wa2djb25maWctZmlsZXMKPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4K
Pgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvcGtnLW1lc29uLm1rIHwgMiArKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9wa2ctbWVzb24ubWsgYi9wYWNrYWdlL3BrZy1tZXNvbi5tawo+ID4gaW5kZXggMTU2YjAwNWZk
ZC4uMTgzMGM3YjEwYyAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcGtnLW1lc29uLm1rCj4gPiAr
KysgYi9wYWNrYWdlL3BrZy1tZXNvbi5tawo+ID4gQEAgLTEzNCw2ICsxMzQsNyBAQCBkZWZpbmUg
JCgyKV9DT05GSUdVUkVfQ01EUwo+ID4gICAgICAgQ1hYX0ZPUl9CVUlMRD0iJCQoSE9TVENYWCki
IFwKPiA+ICAgICAgICQkKCQkKFBLRylfQ09ORl9FTlYpIFwKPiA+ICAgICAgICQkKE1FU09OKSBc
Cj4gPiArICAgICAgICAgICAgIC0tcGtnY29uZmlnLnJlbG9jYXRhYmxlIFwKPiA+ICAgICAgICAg
ICAgICAgLS1wcmVmaXg9L3VzciBcCj4gPiAgICAgICAgICAgICAgIC0tbGliZGlyPWxpYiBcCj4g
PiAgICAgICAgICAgICAgIC0tZGVmYXVsdC1saWJyYXJ5PSQoaWYgJChCUjJfU1RBVElDX0xJQlMp
LHN0YXRpYyxzaGFyZWQpIFwKPiA+IEBAIC0xNTQsNiArMTU1LDcgQEAgZGVmaW5lICQoMilfQ09O
RklHVVJFX0NNRFMKPiA+ICAgICAgIG1rZGlyIC1wICQkKCQkKFBLRylfU1JDRElSKS9idWlsZAo+
ID4gICAgICAgJCQoSE9TVF9DT05GSUdVUkVfT1BUUykgXAo+ID4gICAgICAgJCQoJCQoUEtHKV9D
T05GX0VOVikgJCQoTUVTT04pIFwKPiA+ICsgICAgICAgICAgICAgLS1wa2djb25maWcucmVsb2Nh
dGFibGUgXAo+ID4gICAgICAgICAgICAgICAtLXByZWZpeD0kJChIT1NUX0RJUikgXAo+ID4gICAg
ICAgICAgICAgICAtLWxpYmRpcj1saWIgXAo+ID4gICAgICAgICAgICAgICAtLXN5c2NvbmZkaXI9
JCQoSE9TVF9ESVIpL2V0YyBcCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
