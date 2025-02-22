Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8353BC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 21:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36AC54035C;
	Sat, 22 Feb 2025 21:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gf5G99GxQlwV; Sat, 22 Feb 2025 21:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF2D44038D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF2D44038D;
	Sat, 22 Feb 2025 21:29:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88198943
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77B0E40129
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkioMHOTlPLr for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 21:29:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C40EB400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C40EB400BA
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C40EB400BA
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:29:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso1797017f8f.3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740259744; x=1740864544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sKAoLiaL2ammgOlbf7EOsJN13lC99WAsUFAIDmnRHDw=;
 b=hJ+3a6vBCRB9s8vYdP1OSWuyS2IPGEg3ZO43bW7+33P4QgpjxBAncWicVTywOPASQe
 E5FBjiL/w4rawo0nWQenEPmSyLa4ajgBmC2Iz2r2W1vNbEmJg30uxYRF+rRyLAQ4PX/1
 Ni+70fks9KbQn9+GqZvrmWqZdrmjBoUXx4Ll/V5/mv95nZTsoXbscyY13uRbd3pEn2qG
 Qv1CtvOl/eF6EbrmPAp+9pTnd7WdD2LMHEvLbTflqjmVGLXUMr3hPIXfOqlNn9v178jQ
 xLcNzXt5VrEmzuLyY7eR1tn4v0KtaIhgJP3VdZKfIRi+/QYiQKwWH20klj6FyVZjWTI+
 McFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTAHUJsziOeoQDGof2pbjSVrYB30UAiaz0/BPmrWVSSZOm4u0IX4MJITFrnVDf4Nb3p9HJsA9fg3o=@buildroot.org
X-Gm-Message-State: AOJu0Yzsc80zbIEqJ8erY3epbp/W9ynqNguIY8S7WhOZbStt/ZueIPUO
 3ceUYS/SynILgMypha652c13yRUrpKC3yK5t+hURyngbJhEuEKHPCrlLRUAq164=
X-Gm-Gg: ASbGncvucdKS0tD2J+KiqHip6xUb4vQwPjj+YoizcSPxUN/tQrIOsfBkXXO3/7uMk3O
 Ziw0aTEmP41TpUNY1L9nCzlas1ljkcC7ihc78/SrufBPNJW+ACuHlce81LSZJDM3alYq4A2Ah18
 SCckLiWjvfOgZJJRsIQj/Zpo2Q5iYb7QWjlFNodjUaMrzOomLTwo+hUE9vK8D9VewKzoBNv1hkG
 vECFnjOHAI252v5KmsmivLmZKdVmWN8mMS9ZYjj/HOaHIKeoEGpF3PdomoR55xi2jTD70voQaCj
 04SMzF0PzqS3J1vgUVEnOMQgY2Of0e1TluzUyMIl8rSAwqcFgoWLiA5oZSb6ysalE4zOWn21Aif
 1zpY2GYVM0QNkpz8tlvKNTuZBC0ZPpMH4p43BNvZg3FD83/3kYNVWYs8EGhLYqw==
X-Google-Smtp-Source: AGHT+IFiJmV4OaLsszXKT2Pd0tF2SEnisPe10/HTLWcGR1VOlUEIe8QoUIwLKcZ5gx2PZJICRzlehw==
X-Received: by 2002:a5d:5f4d:0:b0:38f:2f0e:980c with SMTP id
 ffacd0b85a97d-38f6f0bbb76mr7216876f8f.47.1740259744322; 
 Sat, 22 Feb 2025 13:29:04 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbe0sm27461405f8f.39.2025.02.22.13.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2025 13:29:03 -0800 (PST)
Message-ID: <3c0169e9-7c7e-4223-aea1-d884823a5c57@smile.fr>
Date: Sat, 22 Feb 2025 22:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org,
 yann.morin@orange.com
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
 <20250205135825.2310972-2-fiona.klute@gmx.de> <Z7nf_jNmDVM-N6WI@landeda>
 <CA+h8R2p90D+sS3C3OU6iN+0k_icWd1GB=zj0zgq0aWRrOkX4BA@mail.gmail.com>
Content-Language: fr
In-Reply-To: <CA+h8R2p90D+sS3C3OU6iN+0k_icWd1GB=zj0zgq0aWRrOkX4BA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740259744; x=1740864544; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sKAoLiaL2ammgOlbf7EOsJN13lC99WAsUFAIDmnRHDw=;
 b=LiGUJAtHfyPeRS54F4kgfATUWDKx+LkbYcajle3c3Lo3Dpz2exmopFqV6c0Vg47iI3
 lYuVGdzQPWRMalb/RGVWnAj6tNoiZ0Ygjta+ubuzsOd8t0XU9kzxOKmeqRuXTR5ixZlc
 c31h3JEiFTgAEPHTknBEAnYzPnclPv1aHP8ME=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=LiGUJAtH
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-golang: use ld.bfd
 instead of ld.gold on aarch64
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sIEZpb25hLCBZYW5uLCBDaHJpc3RpYW4sCgpMZSAyMi8wMi8yMDI1IMOgIDE4OjUwLCBD
aHJpc3RpYW4gU3Rld2FydCB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gQWxsLAo+IAo+IE9u
IFNhdCwgRmViIDIyLCAyMDI1IGF0IDY6MzLigK9BTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcgo+IDxtYWlsdG86eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+PiB3cm90ZToK
PiAKPiAgICAgRmlvbmEsIEFsbCwKPiAKPiAgICAgT24gMjAyNS0wMi0wNSAxNDo1OCArMDEwMCwg
RmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gICAgID4gRnJvbTogIkZp
b25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZSA8bWFpbHRvOmZpb25hLmtsdXRl
QGdteC5kZT4+Cj4gICAgID4KPiAgICAgPiBHbyBmb3JjZXMgdXNlIG9mIHRoZSBHb2xkIGxpbmtl
ciBvbiBhYXJjaDY0IGR1ZSB0byBhIGJ1ZyBpbiBCRkQgdGhhdAo+ICAgICA+IGlzIGZpeGVkIGlu
IEJpbnV0aWxzID49IDIuNDEgKHRoYXQgaW5jbHVkZXMgYWxsIHZlcnNpb25zIHByb3ZpZGVkIGJ5
Cj4gICAgID4gQnVpbGRyb290KS4gRm9yY2luZyBHb2xkIHdpbGwgYnJlYWsgd2l0aCB0b29sY2hh
aW5zIHRoYXQgZG9uJ3QgcHJvdmlkZQo+ICAgICA+IGl0IChsaWtlIHRoZSBCdWlsZHJvb3QgdG9v
bGNoYWlucyksIHNvIG92ZXJyaWRlIHRoZSBmbGFnIGFuZCB1c2UgQkZELgo+ICAgICA+Cj4gICAg
ID4gVGhpcyBvdmVycmlkZSBzaG91bGQgYmUgcmVtb3ZlZCBpZiBHbyBzdG9wcyBmb3JjaW5nIEdv
bGQsIGFuZCBtYXkgaGF2ZQo+ICAgICA+IHRvIGJlIGFkYXB0ZWQgaWYgdGhlIHNldCBvZiBhdmFp
bGFibGUgbGlua2VycyBjaGFuZ2VzIChlLmcuIHdpdGggYQo+ICAgICA+IGZ1dHVyZSBCaW51dGls
cyB1cGRhdGUpLgo+IAo+ICAgICBUaGlzIHBhdGNoIHdvdWxkIGZpeCBpc3N1ZXMgYWxzbyByZWxh
dGVkIHRvIGNvbnRhaW5lcmQsIHRoYXQgd2UgYWxzbwo+ICAgICBzZWUgaW4gdGhlIGF1dG9idWls
ZGVycywgZS5nLjoKPiAKPiAgICAgwqAgwqAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvYTU5Lwo+ICAgICBhNTliYzk5OWU5NjIwZmY2YjlkOTcxMzhhMmRlODk4YWFkYzA3
NTI5L2J1aWxkLWVuZC5sb2cgPGh0dHA6Ly8KPiAgICAgYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy9hNTkvCj4gICAgIGE1OWJjOTk5ZTk2MjBmZjZiOWQ5NzEzOGEyZGU4OThhYWRjMDc1
MjkvYnVpbGQtZW5kLmxvZz4KPiAKPiAgICAgwqAgwqAgWy4uLl0vaG9zdC9iaW4vYWFyY2g2NC1i
dWlsZHJvb3QtbGludXgtZ251LWdjYyBbLi4uXSAtZnVzZS1sZD1nb2xkIFsuLi5dCj4gICAgIMKg
IMKgIGNvbGxlY3QyOiBmYXRhbCBlcnJvcjogY2Fubm90IGZpbmQgJ2xkJwo+ICAgICDCoCDCoCBj
b21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+IAo+ICAgICBSZWdhcmRzLAo+ICAgICBZYW5uIEUuIE1P
UklOLgo+IAo+IAo+IEkgYW0gc2VlaW5nIHRoZXNlIGJ1aWxkIGZhaWx1cmVzIG9uIG15IGVuZCBh
cyB3ZWxsIGFuZCByZWNvbW1lbmQgbWVyZ2luZyB0aGlzCj4gc2VyaWVzLgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gQ2hyaXN0aWFuIFN0ZXdhcnQKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
