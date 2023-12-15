Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C94CC4167B
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 21:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9702E404D1;
	Fri, 15 Dec 2023 21:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9702E404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgDDPgh4iMIF; Fri, 15 Dec 2023 21:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70490404DF;
	Fri, 15 Dec 2023 21:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70490404DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6A861BF2F6
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 21:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C002B6F4C2
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 21:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C002B6F4C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5ZDv-VNmnkJ for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 21:26:06 +0000 (UTC)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9562760D52
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 21:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9562760D52
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-da077db5145so925805276.0
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 13:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702675565; x=1703280365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UJU40Ct4NN9CT4RoTv7Vq6vhjqrRwNm/0w84lJRDBYM=;
 b=NKAs4+jV5IKyZTh/k95OgiZ6sAXs0FknewjhWiijgYqO85mAuLitINSrREfOjk2Hr1
 FOd+K+Mju9Ek/ll8m4albuJcWCuiWHzTizf37yx4iDEfw8Rb31lWSUj45+CHq5EzSweh
 NjIMQ/vpFi2ZQkOM2nMK+QjHBECmsbgQbf2maaUUYos7mLYouPhhSkR5NVjLW7qU8IxR
 h+MnzzYlj/BVMPu4cFO8e39+A6bekvAXKlkOg2Qpfr2y9jEnIIF77rf/HIs+dBjKjZXo
 9OfeHyInYFFR3ypwmpf30lju7RrXbOBtrVGJbQ8ntYDRzzCapAk4HIwhyft/LUFjH7JU
 r9OQ==
X-Gm-Message-State: AOJu0YwUBjTKWd6gd7UkL2lfrAn16idDB4FVckPSt6oDLPZdD6fA7tF2
 VelhTMK6/RnxErtCuXcT4lrCgp5XLa6O9w3tisO38w==
X-Google-Smtp-Source: AGHT+IFOCzk9T3TKuY24QOkb2JrRY5xijw4ZV71ootvyQ/CUZGkr+bh+wkKjvFMFYF86lEHONNsV2EFCMpFJHHScA24=
X-Received: by 2002:a25:f61f:0:b0:dbc:e2aa:1cb4 with SMTP id
 t31-20020a25f61f000000b00dbce2aa1cb4mr2633285ybd.86.1702675565459; Fri, 15
 Dec 2023 13:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
 <20231213164311.4180059-4-dario.binacchi@amarulasolutions.com>
 <CAAE6iEUqGKqt=qvBQQ+NAqXsJ2dk=5W3PK+=1A5hzFJqrA2uGQ@mail.gmail.com>
In-Reply-To: <CAAE6iEUqGKqt=qvBQQ+NAqXsJ2dk=5W3PK+=1A5hzFJqrA2uGQ@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 15 Dec 2023 22:25:54 +0100
Message-ID: <CABGWkvr07wTs1vmcWvoOec858vx9C4VzFdXJ0TqTDr56rx0Wrw@mail.gmail.com>
To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702675565; x=1703280365;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJU40Ct4NN9CT4RoTv7Vq6vhjqrRwNm/0w84lJRDBYM=;
 b=DJU3pBejPaY/Tk1viYOH2Z9ZP4lijmBMxGDhOoOAt/b2a1yq3NhIdI7LXh1O9fAWIV
 lMqDXfA1SDQ1nxR+XRo7BeI66MRsPdpNBm538EKoevRFKxoR5le+2wNY7IrR3fi7665l
 bAfCFrlj+sXqyT0W45KANqluaX1teYjP2KRQk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DJU3pBej
Subject: Re: [Buildroot] [PATCH v2 03/11] package/python-jsonschema: add
 host variant
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgODo0MeKAr1BNIEZyYW7D
p29pcyBQZXJyYWQKPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cj4KPgo+Cj4gTGUg
bWVyLiAxMyBkw6ljLiAyMDIzIMOgIDE3OjQ0LCBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNj
aGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+IGEgw6ljcml0IDoKPj4KPj4gUmVjZW50IHZlcnNpb24g
b2YgVS1Cb290IHVzZSBiaW5tYW4gdG8gcHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcK
Pj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJvb3QgY29tYmluYXRpb25zLCB0byBtb3Jl
IGNvbXBsZXgKPj4gYXJyYW5nZW1lbnRzIHdpdGggbWFueSBwYXJ0cy4gVGhpcyBwYWNrYWdlIGlz
IHJlcXVpcmVkIGJ5IGJpbm1hbi4KPj4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBNaWNoYWVsIFRyaW1h
cmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+IFNpZ25lZC1v
ZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bT4KPj4gLS0tCj4+ICBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMSArCj4+ICBwYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1hL0NvbmZpZy5pbi5ob3N0ICAg
ICAgIHwgNiArKysrKysKPgo+Cj4gQWRkaW5nIGFuIENvbmZpZy5pbi5ob3N0IGZvciB0aGlzIGtp
bmQgb2YgcGFja2FnZSBpcyBub3QgdXNlZnVsLCBzZWUgZG9jdW1lbnRhdGlvbiBzZWN0aW9uIDE4
LjIuMi4gQ29uZmlnLmluLmhvc3QgZmlsZQo+CgpEbyBJIG5lZWQgdG8gZHJvcCB0aGUgQ29uZmln
LmluLmhvc3QgZmlsZSBmb3IgYWxsIHRoZSBwYWNrYWdlcyBuZWVkZWQgYnkgYmlubWFuPwpPciBv
bmx5IGZvciB0aGlzIG9uZT8KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4gRnJhbsOnb2lz
Cj4KPj4gIHBhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWEvcHl0aG9uLWpzb25zY2hlbWEubWsgfCA2
ICsrKysrKwo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tanNvbnNjaGVtYS9Db25maWcuaW4uaG9zdAo+Pgo+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvQ29uZmlnLmlu
Lmhvc3QKPj4gaW5kZXggYzgwODQyYzMzYTJmLi41ZDIxMjFkZTAyYTQgMTAwNjQ0Cj4+IC0tLSBh
L3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKPj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4uaG9zdAo+
PiBAQCAtODUsNiArODUsNyBAQCBtZW51ICJIb3N0IHV0aWxpdGllcyIKPj4gICAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWN5dGhvbi9Db25maWcuaW4uaG9zdCIKPj4gICAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWdyZWVubGV0L0NvbmZpZy5pbi5ob3N0Igo+PiAgICAgICAgIHNv
dXJjZSAicGFja2FnZS9weXRob24taW5pcGFyc2UvQ29uZmlnLmluLmhvc3QiCj4+ICsgICAgICAg
c291cmNlICJwYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1hL0NvbmZpZy5pbi5ob3N0Igo+PiAgICAg
ICAgIHNvdXJjZSAicGFja2FnZS9weXRob24ta2ZsYXNoL0NvbmZpZy5pbi5ob3N0Igo+PiAgICAg
ICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tbHhtbC9Db25maWcuaW4uaG9zdCIKPj4gICAgICAg
ICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXB5eWFtbC9Db25maWcuaW4uaG9zdCIKPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWEvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdl
L3B5dGhvbi1qc29uc2NoZW1hL0NvbmZpZy5pbi5ob3N0Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZmQyNzVhNDFiMjAwCj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvcGFja2FnZS9weXRob24tanNvbnNjaGVtYS9Db25maWcuaW4uaG9zdAo+PiBAQCAtMCww
ICsxLDYgQEAKPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTl9KU09OU0NIRU1BCj4+
ICsgICAgICAgYm9vbCAiaG9zdCBweXRob24tanNvbnNjaGVtYSIKPj4gKyAgICAgICBoZWxwCj4+
ICsgICAgICAgICBUaGUgaG9zdCBpbXBsZW1lbnRhdGlvbiBvZiBKU09OIFNjaGVtYSB2YWxpZGF0
aW9uIGZvciBQeXRob24uCj4+ICsKPj4gKyAgICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9weXRo
b24tanNvbnNjaGVtYS9qc29uc2NoZW1hCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1q
c29uc2NoZW1hL3B5dGhvbi1qc29uc2NoZW1hLm1rIGIvcGFja2FnZS9weXRob24tanNvbnNjaGVt
YS9weXRob24tanNvbnNjaGVtYS5tawo+PiBpbmRleCBkZWU4N2U4ZjlkOWIuLjZmMjIwNmYzYTAz
YyAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9weXRob24tanNvbnNjaGVtYS9weXRob24tanNvbnNj
aGVtYS5tawo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1hL3B5dGhvbi1qc29uc2No
ZW1hLm1rCj4+IEBAIC0xNSw0ICsxNSwxMCBAQCBQWVRIT05fSlNPTlNDSEVNQV9ERVBFTkRFTkNJ
RVMgPSBcCj4+ICAgICAgICAgaG9zdC1weXRob24taGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWUgXAo+
PiAgICAgICAgIGhvc3QtcHl0aG9uLWhhdGNoLXZjcwo+Pgo+PiArSE9TVF9QWVRIT05fSlNPTlND
SEVNQV9ERVBFTkRFTkNJRVMgPSBcCj4+ICsgICAgICAgaG9zdC1weXRob24taGF0Y2hsaW5nIFwK
Pj4gKyAgICAgICBob3N0LXB5dGhvbi1oYXRjaC1mYW5jeS1weXBpLXJlYWRtZSBcCj4+ICsgICAg
ICAgaG9zdC1weXRob24taGF0Y2gtdmNzCj4+ICsKPj4gICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdl
KSkKPj4gKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQo+PiAtLQo+PiAyLjQzLjAKPj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgoKLS0gCgpE
YXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmlu
YWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAg
VHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1
dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
