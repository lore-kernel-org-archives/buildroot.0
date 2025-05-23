Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222FDC54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C85D740BA4;
	Fri, 23 May 2025 20:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdB5_zhbimWF; Fri, 23 May 2025 20:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E944075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E944075D;
	Fri, 23 May 2025 20:43:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C953C68
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF15540BF5
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T8eajC0pOxL for <buildroot@buildroot.org>;
 Fri, 23 May 2025 20:43:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E142840BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E142840BB0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E142840BB0
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:43:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4c95fc276so300994f8f.3
 for <buildroot@buildroot.org>; Fri, 23 May 2025 13:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748033020; x=1748637820;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h8+9kiKOGgtTIEZr7GmWarKTDNc1cW+uGFCZ7gPd5Ew=;
 b=ad8B37M+pB8MdNtwqTMkzQZNpiCS7zw4JV/+muirK+ERePFagegmkC5W4+0JsjmsNC
 r9mwZi3ixf1o2Yadrm0wamOklUeXEoyKIiXoWXbz4AxowKKEMZh+974W7a5pF/OU4NIP
 d5e9gCHZWTjJ0UQxIwXpkb3T0GEnaUxP27LMC153gQu7RyOGyuvTnGYo9yQGogoCT0ie
 U1tg0jah4+/jhtctXN7Q/tUZB1RkLB/rCteVWNFFJPtIOZUufUZ+4G2ZtZhKx009VG7h
 p/pwSC9J2ZcE45vsQSKbPnbtTdWOqFbfBrZDb8Vvisj23i5hRJ9TFbI+lh44IgIP/G1R
 TLQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXETIlOA6AGuXdCBb/E+OmpX51A3ODNwzWwqPJU9ntOxxby6rlcE3DoXdLS7xlvho3B2OiU/gAlFsE=@buildroot.org
X-Gm-Message-State: AOJu0YwW465Udtofur84t+6/f6gi4tyWHERl29XQEwkH7z0ofbm/f2Sc
 2X6HfN5b2ANoVpemmiXYUaErzvwfTJE0ynkiqtHigVdxAhwXrflOeCcNgt8dcIgjNc4=
X-Gm-Gg: ASbGnctJ1wI68YjPWkTPgqFlusSbfPM+9t5x/JOmmEm0dzbMDekrUkGZo91O3WSkNPh
 G7lvp7k5A5eYZnegrhX3U0ipmDNFYnmFuMs7KmXr54LpYCkMSsDbV43dg+bYpYBa3i4zjQPWXGp
 KN6Lzg9bZCSa69zIqcpZDhG+2AViWp2yFdXTjAumnjJc7QNlMw2LkSjDNf4EUtas62viu0ShN+s
 10V4ntKf9Onws+dtRtQbGkAH/mOohNDAwiOnqTdEtYwYkLQqE3QZLdtA/Ip9a4F2qhNwRD6it+/
 0eF7ka32avPkFUjHV9PyMwBUd/qZJ5/w8yhU+ZdOZoVFcEWaakWqfV8jmbHBSPn9zoetFavv1AF
 ITfE+tvLogmP3iz7/wKCoxxBJhHERv+WTSyKQpJ13fcKrHxV7oSqQ8SSHYMK7TmvnRy7Dh9yEfb
 A66h6kLixg18WHPQ==
X-Google-Smtp-Source: AGHT+IES/Ql5kfGDIC5BqrKeB482R6nwVTcnDyeRITweCskDEN7wLjnNHEZJ6LcaS0wbaZiHnMYuDw==
X-Received: by 2002:a5d:64e6:0:b0:3a3:620a:696a with SMTP id
 ffacd0b85a97d-3a4cb489b7fmr602798f8f.39.1748033019738; 
 Fri, 23 May 2025 13:43:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f?
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d1basm28089677f8f.15.2025.05.23.13.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 13:43:39 -0700 (PDT)
Message-ID: <0fc0e45d-8960-43e0-92e2-81832eb9c28c@smile.fr>
Date: Fri, 23 May 2025 22:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
 <20250523174313.7056-3-vincent.stehle@laposte.net>
Content-Language: fr
In-Reply-To: <20250523174313.7056-3-vincent.stehle@laposte.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1748033020; x=1748637820; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h8+9kiKOGgtTIEZr7GmWarKTDNc1cW+uGFCZ7gPd5Ew=;
 b=rOFKb4IzklPNWHGhcXtuBeEP1WY5pmRJ0BXsSrvZoxmdXWiw1KHcMnpKCHbIrEGj8O
 yC/KTjBPRkwnuQYP3sG2dafsN03w5wx5ICfjX3YiIAZhO2dFaDvTsbVmlniPV+lGb293
 ondOjJ/RUwf8pM3Kv2Hl8UTM5yDTO7WWfkB9g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=rOFKb4Iz
Subject: Re: [Buildroot] [PATCH 2/5] package/gcc: enable hppa support
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
bmV0Pgo+IENjOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4KPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IENj
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC0tLQo+
ICBwYWNrYWdlL2djYy9Db25maWcuaW4uaG9zdCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY2MvQ29uZmlnLmluLmhvc3Qg
Yi9wYWNrYWdlL2djYy9Db25maWcuaW4uaG9zdAo+IGluZGV4IDEwZmU0YmY2MDkuLmY0ODQyOWRi
OTYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nY2MvQ29uZmlnLmluLmhvc3QKPiArKysgYi9wYWNr
YWdlL2djYy9Db25maWcuaW4uaG9zdAo+IEBAIC02MCw2ICs2MCw3IEBAIGNvbmZpZyBCUjJfR0ND
X1NVUFBPUlRTX0RMQU5HCj4gIAlib29sCj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQKPiAg
CWRlZmF1bHQgeSBpZiBCUjJfYXJtCj4gKwlkZWZhdWx0IHkgaWYgQlIyX2hwcGEKPiAgCWRlZmF1
bHQgeSBpZiBCUjJfaTM4Ngo+ICAJZGVmYXVsdCB5IGlmIEJSMl9taXBzIHx8IEJSMl9taXBzZWwK
PiAgCWRlZmF1bHQgeSBpZiBCUjJfbWlwczY0IHx8IEJSMl9taXBzNjRlbAoKQlIyX0dDQ19TVVBQ
T1JUU19ETEFORyBpcyBvbmx5IHN1cHBvcnRlZCB1cCB0byBnY2MtMTIuCmlzIHJlYWxseSBuZWVk
ZWQgdG8gYWRkIGhwcGEgaGVyZSA/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
