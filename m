Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E621C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9C3160FFC;
	Sun, 10 Aug 2025 20:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-aQeNqlPj86; Sun, 10 Aug 2025 20:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A02C60FA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A02C60FA4;
	Sun, 10 Aug 2025 20:40:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29ED6154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CAD681D18
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6fdUMe2GUBY for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:40:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07DA281587
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DA281587
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07DA281587
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:40:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso22896335e9.3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754858418; x=1755463218;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ribptz6MtSfd3dZtQz0+CGRXofum2sVHR8MZbfLRM4U=;
 b=sWssZ3aUahJ9xXpYQnatKd+hJDoqbwgL1BB7xh6rT4g1d5RcCqo1f5VqdbT7zCdJkm
 HGqGuj0m47i2JHZhDup/7X+2D0N4zAwszW6Iy/+z4FHy9d9XupNEDV3OLQAH+UEVnGtt
 Bsvn1BlM2cXCsx4Bsj2lv5hOSKvLiQO3JxINLv6jr+yNETAi/xPPJtlPAgW8MUr+mXUL
 p+kyd1PhurvKQhGtR+f+FsEm5uSl5e0/IO22pc2+CrU9yLQ/hij6xXB2Q0FrWHeWVerF
 up3JRtioNseRUixbGkai8wHIjrtfUDcfETT43JXzPWGtj5zIIEecOBoGe1tsedC4RIhT
 Hsqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxBSQAVeM1jlNyQbj/kjLSjaV3jTw7ZYa4rFiKTGXONhZ95QIJWQVoPurAreYrd4IrgHybbNTSw+c=@buildroot.org
X-Gm-Message-State: AOJu0YzcnWEtKWFzcJpo6QGx4SkO2bHGwpqh2gFrxSwleZjj2FVvKtIf
 5TLFKhcGk3KlFkR8+z+JEQfzynhlzj9YKZz9NiMSwCRMh576fNNVfiszzrmwtBFpv0GCbdvPW0w
 ROQ4g
X-Gm-Gg: ASbGncssKS2kN0CyCxVOA3LyOL1wdG1W5iqOx/Si3slUYdlosCTeZ8oRE6Qj4neNE8m
 ijYegJZxusHLw77ZvXMQF1jw1HUPwmdrcvO5Jk/83O60Q5VTbtNMERcH5PlDavTDtCCRWFiHNT+
 yFdG+fSarwNQa/xfdWE0Y8nj1nSIADcH5EiieJ3AtVWSAAb6xl7eoWqg0dlxjvGZ48g+Lh3Z3eV
 TEhfDicJboH7KCoKFfjOTN78dVlFIz/tvWRTJNMMgWGOqjjcG0LlG0RIO/mpWFDRPQsU+Ch293f
 Wxot9/gUcNioK4OyQuh26/VNbQZx1llqvcFdT9+jAkrRF2385A3IT5cMOFWl2hl7i4H37Mml+U/
 OR9GgdjYPXUNsaOhJI/9xu/sXRs2K3dxYji/SqCfg3CbaiAm67rMslkIB6cZ4Hm5OxPvDR5aY5o
 RhQt6NawiI2a7Zj9pwyqIelqMiC+gdJlEwE+his4wDmHb6CUMI+BmJgindRggO
X-Google-Smtp-Source: AGHT+IEZfms06BCKUFwv4IPcB09o3gT6FmUxqrSrvw1gPgFh3NS7gU1ksCwugjgy7x/GXWBrUD0cqg==
X-Received: by 2002:a05:600c:1912:b0:442:c993:6f94 with SMTP id
 5b1f17b1804b1-459f4eb1a07mr89967215e9.12.1754858417997; 
 Sun, 10 Aug 2025 13:40:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0e70218sm254105385e9.20.2025.08.10.13.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 13:40:17 -0700 (PDT)
Message-ID: <73cb2b5e-736a-4c7c-b0ad-a0f827bacd86@smile.fr>
Date: Sun, 10 Aug 2025 22:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
 <0ead42e3-6522-4f92-8a21-a8c8352375c2@smile.fr>
 <20250810175224.788ea11f@windsurf> <875xevow94.fsf@dell.be.48ers.dk>
 <28185e62-aff8-4cad-ac61-a466c85e05a0@smile.fr>
 <20250810221607.487515bf@windsurf>
Content-Language: fr
In-Reply-To: <20250810221607.487515bf@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754858418; x=1755463218; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ribptz6MtSfd3dZtQz0+CGRXofum2sVHR8MZbfLRM4U=;
 b=cQwZIVdWuxMzHYoQCdg04D8QJ9D+XDQqSE+kijsxQ8wbhaq+prTUjIMoDtDzxdm7Gl
 HZWh9kEdYf2Oc4Np7CcaH/HlTShJpYPHeZDBShgPBM8XCSxRCNLjSU9KbLQoawXqPo0y
 I1s7Mn1xP8PmqFtSt4YjoKsPsmRhpCQgQhz48=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cQwZIVdW
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 drop tweak for Microblaze bleeding-edge toolchains
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
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTAvMDgvMjAyNSDDoCAyMjoxNiwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IE9uIFN1biwgMTAgQXVnIDIwMjUgMjE6MDg6MDAgKzAyMDAKPiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4gCj4+IFllcywgd2UgbmVlZCBh
bm90aGVyIHBhdGNoIFsxXSB0byBiZSBhYmxlIHRvIHRlc3QgdGhlIHJvb3RmcyB3aXRoIFFlbXUu
Cj4+IE9idmlvdXNseSB0aGlzIHBhdGNoIFsxXSBpcyBzdGlsbCB1bnN1cmUgKGV4Y2VwdCBpZiB5
b3UgbGV0IG1lIHBhdGNoIGdjYyBjb2RlIDpwKQo+IAo+IEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBy
ZWFzb25hYmx5IE9LLiBGaXJzdCBvZiBhbGwsIGl0IHZlcnkgb2J2aW91c2x5Cj4gb25seSB0b3Vj
aGVzIE1pY3JvYmxhemUgY29kZSwgc28gYXQgd29yc3Qgd2UgcmlzayBicmVha2luZwo+IE1pY3Jv
YmxhemUuLi4gd2hpY2ggaXMgYW55d2F5IGFscmVhZHkgYnJva2VuLiBBbHNvLCB0aGlzIHBhdGNo
Cj4gYmFzaWNhbGx5IHJlc3RvcmUgdGhlIGJlaGF2aW9yIHRoYXQgd2FzIGhhcHBlbmluZyBvbiBN
aWNyb2JsYXplIHByaW9yCj4gdG8KPiBodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0
O2E9Y29tbWl0O2g9M2I5YjhkNmNmZGY1OTMzN2Y0YjdjZTEwY2U5MmE5ODA0NGIyNjU3Yi4KPiBT
byBvdmVyYWxsLCBJIHRoaW5rIFJvbWFpbiB5b3UgY2FuIHN1Ym1pdCB0aGlzIGFzIGEgcHJvcGVy
IHBhdGNoIHRvCj4gQnVpbGRyb290LCBJIHRoaW5rIGl0J3MgYSAiZ29vZCBlbm91Z2giIHdvcmth
cm91bmQgZm9yIHNvbWV0aGluZyBsaWtlCj4gTWljcm9ibGF6ZS4KCkRvbmU6Cmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI1MDgxMDIwMzYyMS45NDU5MDAtMS1yb21haW4ubmFv
dXJAc21pbGUuZnIvVC8jdQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRob21hcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
