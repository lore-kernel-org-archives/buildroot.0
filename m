Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD93C54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C923560D65;
	Fri, 23 May 2025 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uz7ZCQ228Mrp; Fri, 23 May 2025 20:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F9BA60B9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9BA60B9F;
	Fri, 23 May 2025 20:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4050119
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B52AA83BA5
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6KikIvtn3z2 for <buildroot@buildroot.org>;
 Fri, 23 May 2025 20:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08A4583BBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A4583BBB
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08A4583BBB
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:45:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so1718735e9.0
 for <buildroot@buildroot.org>; Fri, 23 May 2025 13:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748033108; x=1748637908;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9GU3YNmH1e6Wj2b8y2a2bndlV2Y1ahIWeiPp2RN6dmc=;
 b=BNe0JGoDhxAxCWHdOWcogEnMjiLRguoO/KkZ8+eug7SMfvkPgAQHdJjGwUNpAKFgsV
 0P/R3wnyJkwjgiy7rF9nxzcRe8aaf/Q4tziQRnJq6nMv23LBMMBTmny6IVUGz6UvP1mh
 DVd5z95TvQ6h4ZwTO4+E8V7bFED+UJoOosNzVuHcDT/TjkZ6cJW+XP46mhUDqzJMl7P6
 /vIf2YaZTY/5u+HiwZPtRIeYnJfy9pU8c3ezWkpv6GdXs1W/TUX9orC7kqR+14H9B5G6
 L/gV9PJDb/6Djw6AsfIhN8f3rDcKshr2m/0IN7e/HCfbxkigDYMXKWtx8p91DhRrPZaK
 KMOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtCyh3QHuYVs2lqIqO+FnUt1qpFz2DWrarTU3wEpPlFkpmaV2muQyt9nY3tSADcotJuHBGN90kSys=@buildroot.org
X-Gm-Message-State: AOJu0YzCEXTJrJeDssXK0aPzO623te2VM3p8Pk3P44eWMs0D4W90xk4/
 luX0mRVA9bvs8cQdGlhVpyMQFq52SWS+3/e0TBW60KSZNt2wKkT0ywFlzjT5yy2Om+A=
X-Gm-Gg: ASbGncu3EcBUhawJkzF8UAgm1KETss9h5a42bIsowlxXp7KLD+tOzArrgi1+52IcNFJ
 M3QY2tl2RaOSqwf84Ra7+Rb73TV+081c9wZlEZ1uUTobSX0zWSKR4ZvbG8tywV9e9GIrE5K55mM
 N640UehimdOiGKRvVP082i8XpA/u5BQppxEunyHr44v0Z6W6gh0zmCM+2EsJhhW/FcusrIXkylG
 7QwUh70hR6tM+j7jxlgYV5UF9cOzdOLEHmE5zlv8+2DPmV9uz2SveJd7vTQH85eRoisj5cYU4Q7
 kRLoQu3dhk8Q/JILTqW2SdxUSF4hQaItPz6vDr8+Uj/GagfwqaLx/KJikJU+xZGlups6/4q/pOK
 au/4qXJ6+w9gAiH944iGboz/gckFcvCh2MREGZKv9AE+QeqVU2b7lRoUV5+J7fNJuNYdYleGDPv
 wzylKXJJGvKV+J+33Xhh0OYaKL
X-Google-Smtp-Source: AGHT+IEo39GkhColJrCIokaNpBa/lQpyhDwzjbPclI7BzpD/Ip8WBFCIX/MBbysWOthniPZIKCeffA==
X-Received: by 2002:a05:6000:186f:b0:3a3:648c:e6c0 with SMTP id
 ffacd0b85a97d-3a4cb40885amr561193f8f.10.1748033107991; 
 Fri, 23 May 2025 13:45:07 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f?
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35fa8c6d6sm26775693f8f.26.2025.05.23.13.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 13:45:07 -0700 (PDT)
Message-ID: <d231a36f-c309-427b-8a6a-5d7ee6b574c9@smile.fr>
Date: Fri, 23 May 2025 22:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
 <20250523174313.7056-4-vincent.stehle@laposte.net>
Content-Language: fr
In-Reply-To: <20250523174313.7056-4-vincent.stehle@laposte.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1748033108; x=1748637908; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9GU3YNmH1e6Wj2b8y2a2bndlV2Y1ahIWeiPp2RN6dmc=;
 b=LthjNnSpN3f+FjFWLoID0vZ7TQPAltYCf8KHcwGV5TLmCOCdVxZlPABSLFoTFrbk5I
 NQs9clSbJrUHa+8YxpNVF3mCU8RWbMZADWWyFw3YQsaNa/skRDxNN/E66Cbl97ODbcBM
 favUv2PFc2cvLIl1rBSjLnH3og20TnMD2fUSU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=LthjNnSp
Subject: Re: [Buildroot] [PATCH 3/5] package/glibc: enable hppa support
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

SGVsbG8gVmluY2VudCwgQWxsLAoKTGUgMjMvMDUvMjAyNSDDoCAxOTo0MywgVmluY2VudCBTdGVo
bMOpIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBBZGQgc3VwcG9ydCBmb3IgSFBQQS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUu
bmV0Pgo+IENjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gLS0tCj4g
IHBhY2thZ2UvZ2xpYmMvQ29uZmlnLmluIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dsaWJjL0NvbmZpZy5pbiBiL3BhY2th
Z2UvZ2xpYmMvQ29uZmlnLmluCj4gaW5kZXggNTI3NTJlOTc1ZS4uOTYxYjk4NGIzZCAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2dsaWJjL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvZ2xpYmMvQ29u
ZmlnLmluCj4gQEAgLTQsNiArNCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HTElCQ19BUkNIX1NV
UFBPUlRTCj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FybWViCj4gIAlkZWZhdWx0IHkgaWYgQlIyX2Fh
cmNoNjQKPiAgCWRlZmF1bHQgeSBpZiBCUjJfYWFyY2g2NF9iZQo+ICsJZGVmYXVsdCB5IGlmIEJS
Ml9ocHBhCgpXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCwgeW91IGNhbiByZW1vdmUgQlIyX0FSQ0hf
SEFTX05PX1RPT0xDSEFJTl9CVUlMRFJPT1QKYWRkZWQgaW4gdGhlIGZpcnN0IHBhdGNoLgoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+ICAJZGVmYXVsdCB5IGlmIEJSMl9pMzg2Cj4gIAlkZWZhdWx0
IHkgaWYgQlIyX202OGtfbTY4awo+ICAJZGVmYXVsdCB5IGlmIEJSMl9taXBzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
