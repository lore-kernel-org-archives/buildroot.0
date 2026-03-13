Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88FE107BCE5
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A477D40CD1;
	Fri, 13 Mar 2026 20:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40I2A9y7ZbR0; Fri, 13 Mar 2026 20:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C36ED40D01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435058;
	bh=KZVf7LE++pl/ZD73ab7yvr0DnN6fmAULJXf7SycmGlM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=blth/UWVyZYXZ2r8urVqmsbNdU3vrqLCsXjQoVjQ0d1XMWwLzoN0S1E7yox5ByOtt
	 R4OEOeWyN2Ooy3A27pEsF/DEfiTsalUtyAEiMJAH9MBvcodfWKs74y56XpzHrw28qY
	 lXSBNMsULN/lbtjlBYkl9TXzoxYD9eTftHJ7sHKZryWAjPn4JpWe7mwq8LuJWzsywX
	 IdExi+VByQDLxWkg31w2lcRmFlOx97EpyCXMx2K+/Sm+K95Ngy+GLAj9oruj2tDyY+
	 gb3xiZU6FiFq39HXbhyBBCo4WgwNI8FySJZPoFHXgsSvMgwD9qfVfJOIEQbCVQWLHP
	 JqKAvjpFSPBZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C36ED40D01;
	Fri, 13 Mar 2026 20:50:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55A921AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 535D060DE4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4yrs7MXTqe6 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D05660DDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D05660DDF
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D05660DDF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:50:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso24376705e9.1
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 13:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773435054; x=1774039854;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZASB/xMHrcr0d6JGyMhzQ+njoDvBh9PysqPTrL7X42o=;
 b=aX86zJTYSPWLh3PJSFHdZyg/22mRe8IxAy19kofLQLlQ+pnTmgTbBO4CGdIO9zbnay
 FsrsUWUtSgq3/RJc2vPfez4WY3fS7n/PyGXpzwOAJBGHNcVZAgRJDM8CRHcUAv8e6EUK
 ZowXJMKoENPl/SdAfQ8EFy2SymMbK39u+D3TXEYRjPfqlLMUP79D6wsvIjlYXt7Y1sEt
 bxYybYr4EldvShQ/Z4zM99n9IcuoThY2OV71bCUQZqkjjaHOqd0HYlIXCeDGfP9zf74I
 6XQGxeufUMKvle7jRQhH6AmW/BD+kEmoGf36rYjDTVpHOJlIuMyaIdPRWRUOHrpOZXFz
 KD2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsslfhQdu5h9tDOWEd3qIEcca2N84A3XUhjzp1uCeeLWIAtVw7VLklcmlqM+zph2z3uB2khdSo19U=@buildroot.org
X-Gm-Message-State: AOJu0Yxn6j+5xB0N68I4Jika0LEuPdorq9l8nPgQawHDflqTeRtrN8MM
 J87a4CSI0/fFwo6GsS4TQ5fHTsNziRL/o4KLNu1uNPAX+/PDBo4BeNF6ALaJ5Edm3R8=
X-Gm-Gg: ATEYQzzCW5+qnsierQmQDGfhXJxOrzw6cspX31DLftw1pqxXs0hMqHalA3t2uNeJ4lr
 3CcTZNvweWIGtYsx0JygTdPQQbwBGoX5+GXO5b20GxYvQ+aNR0iMdVwMBnasD7yjMa5nxmIO4rU
 QsXinrm01k/r21z/GDv4mazAe9i/lYIhjjb2l19TjvDm7Lg/2XgHDv9jloIe133AcJJ6bCLKr8P
 luDJOJU5ZpLWYgQSHh9HV+hJ2N+5NCK15gXiiR7cZEttn3l5VIaaonEFbSrhIq4cJv8R6RPggvL
 eElG8SVz2GuC7dqgLOsOVvQHG+6dcxzuG1dzWxsxpzzLYcFzQv4XLNIbJVhn25eetc8vPja/pYn
 vypWlSiIlRaMZ9EJ95ggVetVoDy/zlOyeYvOzcK8VGLPoDMg/qBMRedB3G32To1ABL71JB5Pl3L
 xPwJDCEjAVAMKuZiT+gVfueBz/UJE7YQAYWfGRlSDg2ZlYCNoX7HntFW0EmnRpdBSdRV/u9HEG8
 HwYjjyXfoPXAJZ9i2aY9B6D6O/hl4V1WBRGZ+W/1rp1dM6e2jbjR5bYXUeWe++Y2w==
X-Received: by 2002:a05:600c:1d0e:b0:47e:e076:c7a5 with SMTP id
 5b1f17b1804b1-485566ea474mr83128545e9.11.1773435053739; 
 Fri, 13 Mar 2026 13:50:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485563903bbsm50673775e9.0.2026.03.13.13.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 13:50:53 -0700 (PDT)
Message-ID: <7868097b-81f2-481c-b755-4500f64ca362@smile.fr>
Date: Fri, 13 Mar 2026 21:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <0b6f75dfab9a0258eebab63e0a47a4e4c9796246.1771243321.git.yann.morin@orange.com>
Content-Language: fr, en-US
In-Reply-To: <0b6f75dfab9a0258eebab63e0a47a4e4c9796246.1771243321.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773435054; x=1774039854; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZASB/xMHrcr0d6JGyMhzQ+njoDvBh9PysqPTrL7X42o=;
 b=A5FUjvyrI2tqhyS9ZuayWAo79v6FwCFmTxHmg7/fDmqRaef5VU7oN7Jq1bQ/oKm8tc
 Pl4xPCHNjWqUX4d7D8SKW63hNnVQkxl+n5rs+7DztoMttFpuVjtGV843W3sCA6Uy+Pwo
 iiDrzMVUZGpSs7u0iCyp+xAadXTBYDfzlNGB8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=A5FUjvyr
Subject: Re: [Buildroot] [PATCH] package/python-humanfriendly: new package
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMTYvMDIvMjAyNiDDoCAxMzowMiwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBv
cmFuZ2UuY29tPgo+IENjOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4K
PiBDYzogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+IC0tLQo+
ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4gIHBhY2thZ2UvcHl0aG9uLWh1bWFuZnJpZW5kbHkvQ29uZmlnLmluICAgICAgICAgICB8ICA3
ICsrKysrKysKPiAgLi4uL3B5dGhvbi1odW1hbmZyaWVuZGx5Lmhhc2ggICAgICAgICAgICAgICAg
ICAgIHwgIDMgKysrCj4gIC4uLi9weXRob24taHVtYW5mcmllbmRseS9weXRob24taHVtYW5mcmll
bmRseS5tayB8IDE2ICsrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1odW1hbmZyaWVu
ZGx5L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24taHVtYW5m
cmllbmRseS9weXRob24taHVtYW5mcmllbmRseS5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3B5dGhvbi1odW1hbmZyaWVuZGx5L3B5dGhvbi1odW1hbmZyaWVuZGx5Lm1rCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRl
eCAzNzFhMWMzM2UxLi4zMDY4ZGE3OWEzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmlu
Cj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMTE1Myw2ICsxMTUzLDcgQEAgbWVudSAi
RXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWh0dHBs
aWIyL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24taHR0cHgvQ29uZmlnLmlu
Igo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1odWVweS9Db25maWcuaW4iCj4gKwlzb3VyY2Ug
InBhY2thZ2UvcHl0aG9uLWh1bWFuZnJpZW5kbHkvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNr
YWdlL3B5dGhvbi1odW1hbml6ZS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9u
LWh3ZGF0YS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWh5cGVyZnJhbWUv
Q29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1odW1hbmZyaWVuZGx5L0Nv
bmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWh1bWFuZnJpZW5kbHkvQ29uZmlnLmluCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4wNjE5Nzg0M2IzCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWh1bWFuZnJpZW5kbHkvQ29uZmlnLmluCj4gQEAg
LTAsMCArMSw3IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fSFVNQU5GUklFTkRMWQo+
ICsJYm9vbCAicHl0aG9uLWh1bWFuZnJpZW5kbHkiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X1BZVEhPTjMKPiArCWhlbHAKPiArCSAgSHVtYW4gZnJpZW5kbHkgaW5wdXQvb3V0cHV0IGZvciB0
ZXh0IGludGVyZmFjZXMgdXNpbmcgUHl0aG9uLgo+ICsKPiArCSAgaHR0cHM6Ly9naXRodWIuY29t
L3hvbG94L3B5dGhvbi1odW1hbmZyaWVuZGx5LwoKVGhlIGxhc3QgY29tbWl0IGluIHRoZSB1cHN0
cmVhbSByZXBvc2l0b3J5IHdhcyBtZXJnZWQgaW4gMjAyMS4KSXMgdGhpcyBwcm9qZWN0IHN0aWxs
IGFjdGl2ZWx5IG1haW50YWluZWQ/ClNpbmNlIHRoZXJlIGlzIG5vIHJ1bnRpbWUgdGVzdCwgaXQg
bWF5IGJyZWFrIHdpdGggYW55IHB5dGhvbiBtYWpvciB1cGRhdGUuCgpUaG91Z2h0cz8KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24taHVtYW5mcmll
bmRseS9weXRob24taHVtYW5mcmllbmRseS5oYXNoIGIvcGFja2FnZS9weXRob24taHVtYW5mcmll
bmRseS9weXRob24taHVtYW5mcmllbmRseS5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi4zNWY5Mzk1MzI1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UvcHl0aG9uLWh1bWFuZnJpZW5kbHkvcHl0aG9uLWh1bWFuZnJpZW5kbHkuaGFzaAo+IEBAIC0w
LDAgKzEsMyBAQAo+ICsjIEZyb20gaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L2h1bWFuZnJpZW5k
bHkvI2h1bWFuZnJpZW5kbHktMTAuMC50YXIuZ3oKPiArc2hhMjU2ICA2YjBiODMxY2U4ZjE1Zjcz
MDA3MjFhYTQ5ODI5ZmM0ZTgzOTIxYTlhMzAxY2M3ZjYwNmJlNjY4NmEyMjg4ZGRjICBodW1hbmZy
aWVuZGx5LTEwLjAudGFyLmd6Cj4gK3NoYTI1NiAgNGFjNDhmNDExNzgwOWYyNzM0MDY2MTUwNDUw
ZjEyMGIzYmIxMTBhYzFkM2IzMjE3MDc5NWUwNTYwZGJiYzFmNSAgTElDRU5TRS50eHQKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24taHVtYW5mcmllbmRseS9weXRob24taHVtYW5mcmllbmRs
eS5tayBiL3BhY2thZ2UvcHl0aG9uLWh1bWFuZnJpZW5kbHkvcHl0aG9uLWh1bWFuZnJpZW5kbHku
bWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmZjZjNiNDc5MjQK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24taHVtYW5mcmllbmRseS9weXRo
b24taHVtYW5mcmllbmRseS5tawo+IEBAIC0wLDAgKzEsMTYgQEAKPiArIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiArIwo+ICsjIHB5dGhvbi1odW1hbmZyaWVuZGx5Cj4gKyMKPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiArCj4gK1BZVEhPTl9IVU1BTkZSSUVORExZX1ZFUlNJT04gPSAxMC4w
Cj4gK1BZVEhPTl9IVU1BTkZSSUVORExZX1NPVVJDRSA9IGh1bWFuZnJpZW5kbHktJChQWVRIT05f
SFVNQU5GUklFTkRMWV9WRVJTSU9OKS50YXIuZ3oKPiArUFlUSE9OX0hVTUFORlJJRU5ETFlfU0lU
RSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9jYy8zZi8yYzI5MjI0
YWNiMmUyZGY0ZDIwNDZlNGM3M2VlMjY2MjAyM2M1OGZmNWIxMTNjNGMxYWRhYzA4ODZjNDMKPiAr
Cj4gK1BZVEhPTl9IVU1BTkZSSUVORExZX0xJQ0VOU0UgPSBNSVQKPiArUFlUSE9OX0hVTUFORlJJ
RU5ETFlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4gKwo+ICtQWVRIT05fSFVNQU5GUklF
TkRMWV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICsKPiArJChldmFsICQocHl0aG9uLXBhY2th
Z2UpKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
