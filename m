Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FC4E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23CE882075;
	Wed, 11 Dec 2024 19:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcArBuMP83mu; Wed, 11 Dec 2024 19:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FFE582065
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FFE582065;
	Wed, 11 Dec 2024 19:42:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F9D2ED7
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36EC442F5F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mb6nUWDiQGYQ for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D472E40104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D472E40104
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D472E40104
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:41:58 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e384e3481so4571409e87.2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 11:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733946116; x=1734550916;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKS/159kw4htyUlyms6Fiko2KstvAr7n+fyvXh0H4j4=;
 b=VrVRqOmdQAPvcLlMKOSUy208lPx4e6mphoQkIYX67W8vZlJ8ylrzVz4sRPS3FOCwAa
 P/lpZZ22dTUEF6SI132jywoYMeo+Z8qpkrxRrFW7k7gMfpj280/JSYhRHM5icU0fkAyI
 E1nTVqvyfyTONLlKdo9nXq42Or15dDkD2DL0b5l4m1s4X86+Zov1pwU7xG3skqFgCyI5
 Xu3lL8l6N05UmNiF2242tqy/t9utr/ffVGwYAzt7ujwHpIdDvdtMhKSZfKV9eDolI+eA
 4sDqWqIuPj8O3qB5L1S2z9Ky8NF5j9JTAJYLntT09tVOW9tKmWIhHMnpko844ilhn8CI
 cLAA==
X-Gm-Message-State: AOJu0YzoHilghksHMmHL+vEAA8PkXgT2nnhd85/AJrGhc9/mMtz/ye0W
 u8VeyJuGK2v1N16CjsgCt7i5ZRl5i2u3akxLNxLQMPcDSh8tjKAdDqM+2+ap
X-Gm-Gg: ASbGncvowxHedgqFO5MYyJkqqhu/jdH6yLbRlFoXQkMhz08DH2v0Zb7Ozc0dZBYmGtv
 D+NlwPA8h8s/nVB3OpxK1VLofdAIUX59VXDhwtWllC1m5qdi6umBbEYxFWV49ODqe0tX6C64G1k
 6ThZQXyI5Vqthn2+/H7pQWe6arUhsQn42XBJ6iMU1wSOlQlpU/MCfmmd2S7wZvJtA4DeuoPylCn
 8YyDXB1vHwoBLXDEP0u86NndKhK5uOA8nvho/E8xHUjjw==
X-Google-Smtp-Source: AGHT+IHyhrkeTAGyaKyHQBE3jCDKgxAwIomfK+Oq1RA16SayAw13yTiLF4zD8a5p3IiRL8KIx/paxA==
X-Received: by 2002:a05:6512:3049:b0:53e:3a8a:79b3 with SMTP id
 2adb3069b0e04-5402f00bc2amr313948e87.21.1733946116125; 
 Wed, 11 Dec 2024 11:41:56 -0800 (PST)
Received: from curiosity ([5.188.167.4]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53ef509c093sm1463306e87.112.2024.12.11.11.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 11:41:54 -0800 (PST)
Date: Wed, 11 Dec 2024 22:41:50 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Z1nq_gneO4ORw3EG@curiosity>
References: <20241208214748.524923-1-geomatsi@gmail.com>
 <675c239b-5d11-4f07-be59-86f6f046da1d@smile.fr>
 <c4759881-c7b1-47be-b640-3a45d856fc7e@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4759881-c7b1-47be-b640-3a45d856fc7e@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733946116; x=1734550916; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zKS/159kw4htyUlyms6Fiko2KstvAr7n+fyvXh0H4j4=;
 b=F7hNazh9Olz2EEaGqajF1lHBqknm+ag/aMsY7UtKn6Eh/OPlFK7r+z9Qs+W0v7qBKO
 pWFQ0KRrL37aGjH9fXOUTN0o+sG9m9BmPXmHicvSzImDOBFIRe9VQjZSDj4MjFtONTdV
 v7Xqrww0Megnud0UIx77UTO15R+len8BylcktnQ8Er4mIvST1XcM1hEmv1v+MNyovI4h
 QlAPoQ3a51lKXq/J4NZRTmhBG4dqTXktZv1/7Byx/nJ2ocuCRLlYZv6/C6bf0MBx2TFs
 RMWsG6TIg46s0Vc4WWmWIZkXakJajVVlycbZvUYanDJoF61KyeAVxvxQRGUrLOH7S1Vb
 utlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F7hNazh9
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
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

SGkgUm9tYWluLAoKT24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMDg6MDY6NDJQTSArMDEwMCwgUm9t
YWluIE5hb3VyIHdyb3RlOgo+IEhlbGxvIEFsbCwKPiAKPiBMZSAxMS8xMi8yMDI0IMOgIDE0OjQz
LCBSb21haW4gTmFvdXIgYSDDqWNyaXTCoDoKPiA+IEhlbGxvIFNlcmdleSwKPiA+IAo+ID4gTGUg
MDgvMTIvMjAyNCDDoCAyMjo0NiwgU2VyZ2V5IE1hdHl1a2V2aWNoIGEgw6ljcml0wqA6Cj4gPj4g
SGkgVGhvbWFzLCBCZXJuZCwgYW5kIGFsbAo+ID4+Cj4gPj4gSSBoYXZlIGJlZW4gd2FpdGluZyBm
b3IgdGhlIG5ldyBMVFMgTGludXggdjYuMTIgaW4gQnVpbGRyb290IHRvIHN0YXJ0Cj4gPj4gc2Vu
ZGluZyBDaHJpc3RtYXMgdXBkYXRlcyBmb3Igc29tZSBvZiBteSBPcmFuZ2VQaSBib2FyZHMuIE5v
dyB2Ni4xMi4zCj4gPj4gaXMgYWxyZWFkeSBhdmFpbGFibGUsIGJ1dCB0aGUgbGF0ZXN0IGtlcm5l
bCBpcyBzdGlsbCBoYXZlIDYuMTEueC4KPiA+PiBTbyBJIGRlY2lkZWQgdG8gdW5kZXJ0YWtlIGEg
Y29weS1wYXN0ZSBleGVyY2lzZSB1c2luZyB0aGUgbGF0ZXN0IGtlcm5lbAo+ID4+IGFuZCBoZWFk
ZXJzIHVwZGF0ZSBzZXJpZXMgYnkgQmVybmQuIEhvcGUgSSBkaWRuJ3QgbWlzcyBhIHRoaW5nIHRh
a2luZwo+ID4+IGludG8gYWNjb3VudCB0aGF0IHRoaXMgaXMgYSBuZXcgTFRTLgo+ID4gCj4gPiBF
dmVyeXRoaW5nIHNlZW1zIGdvb2Qgc28gZmFyIDopCj4gCj4gRXhjZXB0IEkgbWlzc2VkIHRoZSBk
aXNjdXNzaW9uIGFib3V0IHRoZSBvdXQgb2YgdHJlZSBEVEJzIGlzc3VlIHJlcG9ydGVkIGJ5Cj4g
Q2hyaXMgUGFja2hhbSBhbmQgRWRnYXIgQm9uZXQgWzFdIDotKAo+IAo+IFsxXQo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9kY2JkM2Y3Ny1lNzM3LTQxYTItOWYyMy04NzE0MWQw
YmRmOWJAZ3Jlbm9ibGUuY25ycy5mci8KCklJVUMgdGhpcyBvdXQtb2YtdHJlZSBEVEIgaXNzdWUg
Y2FuIGJlIGhhbmRsZWQgc2VwYXJhdGVseS4gQXMgd2UKZGlzY3Vzc2VkIHByZXZpb3VzbHkgaW4g
dGhpcyBlbWFpbCB0aHJlYWQsIHVwZGF0aW5nIGxhdGVzdCBMaW51eAp2ZXJzaW9uIHRvIHY2LjEy
IGFuZCBmdXJ0aGVyIGRvZXMgbm90IGJyZWFrIHRob3NlIDUgYm9hcmRzIG5vdy4KClJlZ2FyZHMs
ClNlcmdleQoKPiA+PiBSZWdhcmRzLAo+ID4+IFNlcmdleQo+ID4+Cj4gPj4gU2VyZ2V5IE1hdHl1
a2V2aWNoICgzKToKPiA+PiAgIHt0b29sY2hhaW4sIGxpbnV4LWhlYWRlcnN9OiBhZGQgc3VwcG9y
dCBmb3IgNi4xMiBoZWFkZXJzCj4gPj4gICBsaW51eDogYnVtcCBsYXRlc3QgdmVyc2lvbiB0byA2
LjEyCj4gPj4gICBwYWNrYWdlL2xpbnV4LWhlYWRlcnM6IGRyb3AgNi4xMS54IG9wdGlvbgo+ID4+
Cj4gPj4gIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA3ICsrKysrKysKPiA+PiAgbGludXgvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDYgKysrLS0tCj4gPj4gIGxpbnV4L2xpbnV4Lmhhc2ggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPj4gIHBhY2thZ2UvbGludXgtaGVhZGVycy9D
b25maWcuaW4uaG9zdCAgICAgICAgICAgICB8IDE2ICsrKysrKysrKystLS0tLS0KPiA+PiAgdG9v
bGNoYWluL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrKysK
PiA+PiAgLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20vQ29uZmlnLmluLm9wdGlvbnMgIHwg
IDYgKysrKystCj4gPj4gIDYgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gPj4KPiA+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
