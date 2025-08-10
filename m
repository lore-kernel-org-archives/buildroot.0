Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86165C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 19:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50EB98124A;
	Sun, 10 Aug 2025 19:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B66vqnIHKmYR; Sun, 10 Aug 2025 19:08:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DDFF81223
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DDFF81223;
	Sun, 10 Aug 2025 19:08:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00CE031
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB63140616
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrDXeVnCZnjb for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 19:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFAC34027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFAC34027C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFAC34027C
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:08:02 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso2208516f8f.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 12:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754852881; x=1755457681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SuKWUw9xcmQ1Frk7HfW2Var6t/eWpevHESEbcFKHmHQ=;
 b=DdDbBw8tUVdpHzM/NHKmitFmTJJe+JT+vl/AGY8mZJIZDLxwoGoV/GDcgJYxDbEbBq
 xGnoo3VwmGhPdRc8YWZKLm4fj7/uWUAf3LEm3bwSeN072EhgqVw4gFwcdP9rNHQ8HpIR
 VansA/PCOXJOGHnXPRFyuomU1UI1+owruxS/XC/fF725HQu2b3KVnAWbF9+0Y9Q2gYf3
 BlLQZnd0MycuHwaQ0xnyLvwmEKCHBgPrExPKdhYA+67MJgtKl26oVkTD9Iw7aCfcEWHG
 ck1O4c70osoXZ3tGnIurG/MhIIl2B3DvlmLXkIpK6v3UwncogMtfZvruHcV/FRepF/q1
 neMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7VjmSr9QIzZBJf3ZWcJ0jJb6nmlXfOQCWs00mOvn1KE6MLC1kcuKkkGUTQeMfpEvUu6mb3uqPRvI=@buildroot.org
X-Gm-Message-State: AOJu0YzMwzcfW5gDznZOxaF+pRRGQcJKY/BzfVXN6Qd5Z6KWd/Og1Mc3
 XSpk117D/3v3m3xzA43BY0dLEarhgoxKqxjtUQp445BShAwZMq8TnPC6IkUbKjYGs4AA/JAbHoF
 gf/lg
X-Gm-Gg: ASbGncu3qTtUWOKJM4DIZr6jrH5GpXk5gxYE9fUow9v/5CfqowmyJfgUAkNUbGGO6E+
 3lj9teOEvR/0cAK2L479ztyAr5iX06fTTCKw9T/5v9Ou4K3KD4goArs0AlZQkhataPBEzaMOw/R
 lPu6xnu/cmbcrb3QrcscXwRs0oY9qMBI/8cDTmHdP9XE4cLBCDX2SY6wrZavcJOWG5NOA+dRb6T
 qDTKmNzBsSjNZ6VgknZ7yUhudPNWfKyW09pXbKCJ/3tNMAdPSjGmpBau5WApyGB8nv907IjQFO3
 HBnkUwOaosvPTD/JkNvIJJBj3/f0ZXgqWK2BXESsofoYFLfbHzarx5L9Ym8+3ZGP9j7Aefsp89G
 Fqq/uhQs39YgMkpV8ZY0NALNKvte98GDX8VliELknRBZEIwE530CJh+s8WlrBfzkxzrmD3r4JXu
 aAcLOJ3KOtvgAOCLKWVnqkUDxFl0wNHVm6BlrVRUeEcNPCAJdwqucOa534YpotpC2viAiutdU=
X-Google-Smtp-Source: AGHT+IEDbXs3w1SUiCBfMa/wEWWaOou79fu0J+5s7ORJuErnsxffa6CO1ouwsCXvxVX8GugPQP6fEA==
X-Received: by 2002:a05:6000:40de:b0:3b7:9350:44d4 with SMTP id
 ffacd0b85a97d-3b900b49960mr8419763f8f.11.1754852880694; 
 Sun, 10 Aug 2025 12:08:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c48de68sm38147295f8f.67.2025.08.10.12.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 12:08:00 -0700 (PDT)
Message-ID: <28185e62-aff8-4cad-ac61-a466c85e05a0@smile.fr>
Date: Sun, 10 Aug 2025 21:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
 <0ead42e3-6522-4f92-8a21-a8c8352375c2@smile.fr>
 <20250810175224.788ea11f@windsurf> <875xevow94.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <875xevow94.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754852881; x=1755457681; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SuKWUw9xcmQ1Frk7HfW2Var6t/eWpevHESEbcFKHmHQ=;
 b=ACIoP3DvK/16CM3LebG/Kq5iy32ioGjYLmSxsePV9m0T0Ckc7Tror8kumhZFit4iIJ
 OfPKQ8QjHk5qjLRdznjahM8dqlEeEh6DB2oh5CXavqkdmP7GnwjthpZ45oafjGvX2SWF
 b0Hc9R88GKsAdaZfTy8FW8LXXYIbG8BI3Ctdk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ACIoP3Dv
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsIFRob21hcywgQWxsLAoKTGUgMTAvMDgvMjAyNSDDoCAyMDo0MCwgUGV0ZXIg
S29yc2dhYXJkIGEgw6ljcml0wqA6Cj4+Pj4+PiAiVGhvbWFzIiA9PSBUaG9tYXMgUGV0YXp6b25p
IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6Cj4gCj4gID4g
T24gU3VuLCAxMCBBdWcgMjAyNSAxNjoxMTowOSArMDIwMAo+ICA+IFJvbWFpbiBOYW91ciA8cm9t
YWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPiAKPiAgPj4gSSBndWVzcyB5b3UgYXJlIHJlZmVy
cmluZyB0byB0aGUgcGVuZGluZyBwYXRjaCBmcm9tIE5lYWwgRnJhZ2VyIFsxXS4KPiAgPj4gCj4g
ID4+IFsxXQo+ICA+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRy
b290L3BhdGNoLzIwMjUwNzI4MDQ1MTQ1LjEzMjMzMy0xLW5lYWwuZnJhZ2VyQGFtZC5jb20vCj4g
Cj4gID4gQ29ycmVjdC4gVGhpcyBwYXRjaCBpcyBwZW5kaW5nIGZvciBCdWlsZHJvb3QgbWFzdGVy
LCBidXQgSSBkaWQKPiAgPiBpbnRlZ3JhdGUgaXQgaW50byBteSB0b29sY2hhaW4gYnVpbGQuCj4g
Cj4gSSB3YW50ZWQgdG8gYXBwbHkgdGhpcyBhbmQgZ2V0IDIwMjUuMDgtcmMxIG91dCAtIEJ1dCBp
ZiBJIHJlYWQgdGhlCj4gZGlzY3Vzc2lvbiBjb3JyZWN0bHksIGdjYyAxNS54IGlzIGJyb2tlbiBv
biBNaWNyb2JsYXplIGV2ZW4gd2l0aCB0aGF0Cj4gcGF0Y2gsIHNvIHdoYXQgZG8gd2UgZG8/Cj4g
CgpZZXMsIHdlIG5lZWQgYW5vdGhlciBwYXRjaCBbMV0gdG8gYmUgYWJsZSB0byB0ZXN0IHRoZSBy
b290ZnMgd2l0aCBRZW11LgpPYnZpb3VzbHkgdGhpcyBwYXRjaCBbMV0gaXMgc3RpbGwgdW5zdXJl
IChleGNlcHQgaWYgeW91IGxldCBtZSBwYXRjaCBnY2MgY29kZSA6cCkKClsxXQpodHRwczovL2dp
dGh1Yi5jb20vYm9vdGxpbi9idWlsZHJvb3QtdG9vbGNoYWlucy9jb21taXQvODM5NDdjN2JiNjE1
ODA3MmJjMmY1MmI1OGU5MDg5MWNkM2RjMDRhMgoKQmVzdCByZWdhcmRzLApSb21haW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
