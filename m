Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AECCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 16:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3D0827B1;
	Fri, 15 May 2026 16:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjrolhnqQxjk; Fri, 15 May 2026 16:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE9F82735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778861585;
	bh=7EgnOokMbKoUqA82FyoyW9/G+qhMK8fF2cjHV94vjwo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dVs4PdPaFMPAIDaFb3fVTYTkJvgZxR9gwS19sE9qkaY8GRnBIRqanNLQERJtbbbR+
	 Nx2m0FR+041xcXdJoG/7UF8AxNzVscAYzhznBVfaz6mTTJupG2cMjLD3G9ay/I6+TO
	 uNG+zqpkGRNbylHeaWlYBJk8hbPh+shMYvDHLfrtex0tqLqmOR2VKukrPInluCSWWj
	 RZl2C+gz8npXYDHyrequweBW6JT4Vd4O2zOc0OB8fwKoIccJapBqVgPox78HNWTCAS
	 Arfo0oN7OlbyYLzEgucmn/FtbLx8XXAKMOiPpWI0qZLBBJXjKo/9kVFoFcdMUb/2Md
	 wjKZLMy90Ltgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE9F82735;
	Fri, 15 May 2026 16:13:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE0B36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7AEA82735
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ako1pvN0CEze for <buildroot@buildroot.org>;
 Fri, 15 May 2026 16:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4932D826EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4932D826EF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4932D826EF
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:13:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so48435745e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778861581; x=1779466381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uLx1OoJ0mffQGu5152KCISp3baqnr2QAq04DobrK4kM=;
 b=rK30FNkTfV467c0vW551r96U10qqCj/Wfu/p8v+p7YEg70m3p7Z8tvrjqW2M806fsF
 g/IaMh0PxkRoKpLbKLFQKNxC+DidOboQioFy7B0wB5OhTV0Gkla9UfkM8hI038lAtrNy
 pA1HJ6Lju4nIpXoykJcU4U5SzVgsA+GaoG9i5HFu6gFqDP3XzeaQlXLeUjr7wBwWnGfD
 j1tDTxk3JlM7YTX0sX0tk677RlyQsjuOCvXI3ba0xU5ksxe+7wOAIsmBbxRO3krLv8wG
 hBi11mT5Il/RJ5XiWscFbeBxP32xYYdTEWBPhpQmXgM+QcRpyvufMedrVuUm3cInEecC
 SNUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/NSWeShFzqXRwsRgz1eVXCrHTbqsDcUP5NCUfAZYIu0ELZfJpNZEgNcw4nDONN+1DfeibGSbSmzp0=@buildroot.org
X-Gm-Message-State: AOJu0YzFDYx2PHqFhh6299faZtaXUlZOQWywHwhHxKmY4drcYsJEZC5+
 0tBQwPqb2jT4wMdU5veHy7SES4tUU9o3lC4H2WNKbErQtIgBm/81fLel9PCKTbrcWQ4=
X-Gm-Gg: Acq92OEMzHn0zR7OXDaSGAsRVn4Zyo+QgwWd3PWdhvixg06oaxD+ZwenefNG8XeA2bF
 Ve075L+aIOvCrLYCCSmHekNoIsAlpz0wqnsE6VUfP59di9wKqHf1w2qkMo+clTIr8NsSRbDW11q
 unZ1Gr5e6N+o8aC7s9uOc9O625Fka7vEhbPdWXEIaVWR2xh+vHJpJiLhu4c6rA9xv3tzfmMfm/m
 AnS+/IdTvs04daT7QKVrHza8WOUHTYa+y8oTDnX0fjqtKNQulNPvZQD+BTH+y+nC5FPrtj7fks/
 sYSx3aVNz/OqWhVL1GxWZfU2YJ23cVNedWWUX2hovn40IzkWqEgn7bkey428LZw1Ww8YzaYmuU2
 bmXb0qiQOPq6AH5IFAJOyVyQDUHprUyrViVdTEihlyp49BtSm4hRXkDdt7mrMuBU543tFMRQLXl
 lorXEUfb7UNOrwLDi3GQy+QBt2q0n2Qh0SGAzZ8TA8+WpjBXLtjMsy8Yy3D2x79Av26X46jsMAd
 IKa4k56tA8U5sR52r6xBC6NBcHuPh+eUm3WaD88jiXGihkqpRWPtIadacd2qCae/g==
X-Received: by 2002:a05:600c:34c7:b0:48a:54fd:54ea with SMTP id
 5b1f17b1804b1-48fe60ecd93mr71789585e9.12.1778861581058; 
 Fri, 15 May 2026 09:13:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe6b9efsm28863795e9.5.2026.05.15.09.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 09:13:00 -0700 (PDT)
Message-ID: <e11f4b54-19d5-4d90-a920-ec3d5e55fad9@smile.fr>
Date: Fri, 15 May 2026 18:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
References: <20260514-qemu-v11-0-0-v3-1-e64cbadaa8e5@anodize.com>
 <5b126290-bc03-43ca-b11f-134a828235d9@smile.fr>
 <df5404cb93cf7c23fcc27a8aed20a31a@free.fr>
Content-Language: fr, en-US
In-Reply-To: <df5404cb93cf7c23fcc27a8aed20a31a@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778861581; x=1779466381; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uLx1OoJ0mffQGu5152KCISp3baqnr2QAq04DobrK4kM=;
 b=YbGub0zLM+3jvm/qY39dftf8YgLFZ6R2pnnmlT+25PnS3VBByzGumo//0ETag2P5FP
 SmxhP325bx/6PaBC2Xtf70oUmTICJv/r5UH1K9tf5hPLjhqrm6BausuVlBw64+X9D6t2
 eJjPzb8afCL0ifr2buUmTioh68OQpxxuVqQ5U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=YbGub0zL
Subject: Re: [Buildroot] [PATCH v3] package/qemu: bump to version 11.0.0
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

SGVsbG8gSnVsaWVuLAoKTGUgMTUvMDUvMjAyNiDDoCAxODowMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBIaSBSb21haW4sCj4gCj4gT24gMTUvMDUvMjAyNiAxNTozNywgUm9tYWluIE5h
b3VyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IEhlbGxvIEpvc2VwaCwKPj4KPj4gTGUgMTQvMDUv
MjAyNiDDoCAyMjo0NiwgSm9zZXBoIEtvZ3V0IGEgw6ljcml0wqA6Cj4+PiBDaGFuZ2Vsb2c6Cj4+
PiBodHRwczovL3dpa2kucWVtdS5vcmcvQ2hhbmdlTG9nLzExLjAKPj4+Cj4+PiBOb3RlOgo+Pj4g
wqAgLSBTdXBwb3J0IGZvciBhbGwgMzItYml0IGhvc3Qgc3lzdGVtcyBoYXMgYmVlbiByZW1vdmVk
Lgo+Pj4gwqAgLSBTdXBwb3J0IGZvciBtaWNyb2JsYXplZWwgaGFzIGJlZW4gZm9sZGVkIGludG8g
dGhlIG1pY3JvYmxhemUgdGFyZ2V0Cj4+Pgo+Pj4gUWVtdSB2MTEuMC4wIGRyb3BzIDMyLWJpdCBz
dXBwb3J0IGZvciBob3N0cywgYWxsIHFlbXUgYnVpbGRzIG11c3Qgbm93IGJlCj4+PiA2NC1iaXQu
IEhvc3RzIHJ1bm5pbmcgNjQtYml0IHFlbXUgYnVpbGRzIGNhbiBzdGlsbCBlbXVsYXRlIDMyLWJp
dAo+Pj4gdGFyZ2V0cy4KPj4+Cj4+PiBDb25mdXNpbmdseSwgdGhlIHFlbXUgcGFja2FnZSBpcyBh
bHNvIGNhcGFibGUgb2YgYmVpbmcgYnVpbHQgYW5kIHJ1bm5pbmcKPj4+IG9uIGJ1aWxkcm9vdCBo
b3N0cywgYW5kIHRhcmdldHMuIEluIGFueSBjYXNlLCBxZW11IG9ubHkgc3VwcG9ydHMgcnVubmlu
Zwo+Pj4gb24gNjQtYml0IGhvc3RzICh3aGljaCBtYXkgYmUgYnVpbGRyb290IHRhcmdldHMpLCBz
byBhZGp1c3QKPj4+IEJSMl9QQUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQgdG8gaW5k
aWNhdGUgbm8gc3VwcG9ydCBmb3IgMzItYml0Cj4+PiBidWlsZHJvb3QgdGFyZ2V0cywgYW5kIGRy
b3AgY29uZmlncyBmb3IgYXJjaGl0ZWN0dXJlcyBsaWtlIEJSMl9hcm0gdGhhdAo+Pj4gYXJlIGlt
cGxpY2l0bHkgMzItYml0IG9ubHkuCj4+Pgo+Pj4gU2VwYXJhdGVseSwgdGhlIHFlbXUgbWljcm9i
bGF6ZWVsIHRhcmdldCB3YXMgcmVtb3ZlZCB3aXRoIGNvbW1pdAo+Pj4gNDZhMjVhZTNmMGU3NWUy
MzBjMDZlMjE0MzU4NTBiMWNkMWM0NGYwNywgYXMgdGhlIG1pY3JvYmxhemUgKHFlbXUpCj4+PiB0
YXJnZXQgc3VwcG9ydHMgYm90aCBlbmRpYW5uZXNzZXMsIHNvIHRoYXQncyBmaXhlZCB1cCBpbiB0
aGUgcGFja2FnZQo+Pj4gTWFrZWZpbGUgYXMgd2VsbC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBK
b3NlcGggS29ndXQgPGpvc2VwaEBhbm9kaXplLmNvbT4KPj4KPj4gUnVudGltZSB0ZXN0ZWQgZm9y
IGhvc3QtcWVtdToKPj4KPj4gaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9w
aXBlbGluZXMvMjUyNTU4OTY5OAo+Pgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIGluIHYzOgo+Pj4gLSBV
cGRhdGUgQ29uZmlnLmluIHRvIHByb3Blcmx5IGZpbHRlciBvdXQgMzItYml0IGJ1aWxkcyBbUm9t
YWluXQo+Pj4gLSBEaXNhYmxlIGRvd25sb2FkcyBmcm9tIFB5UEkgW1JvbWFpbl0KPj4+IC0gQWRk
IGRlcGVuZGVuY2llcyBmb3IgaG9zdC1weXRob24tc2V0dXB0b29scyBhbmQgaG9zdC1weXRob24t
d2hlZWwKPj4KPj4gSSB3YXMgbm90IHN1cmUgaWYgaXQgc3RyaWNsdHkgbmVjZXNzYXJ5IHNpbmNl
IHdlIGRpc2FibGUgZG93bmxvYWRzLgo+PiBXZSBmb2xsb3cgdXBzdHJlYW0gIkJ1aWxkIEluZm9y
bWF0aW9uIiByZWNvbW1lbmRhdGlvbnM6Cj4+Cj4+IGh0dHBzOi8vd2lraS5xZW11Lm9yZy9DaGFu
Z2VMb2cvMTEuMCNCdWlsZF9JbmZvcm1hdGlvbgo+Pgo+PiAiV2hlbiBpbnRlcm5ldCBhY2Nlc3Mg
aXMgbm90IGFsbG93ZWQsIHRoaXMgZnVuY3Rpb25zIGFzIGEgY29uZmlndXJlLXRpbWUgY2hlY2sK
Pj4gZW5zdXJpbmcgdGhhdCBvdXIgZW52aXJvbm1lbnQgaGFzIHRoZSBuZWNlc3NhcnkgbWluaW11
bSB2aWFibGUgdmVyc2lvbnMgZm9yCj4+IHRoZXNlIHBhY2thZ2luZyB0b29scyBhdmFpbGFibGUu
Igo+Pgo+PiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS8KPj4gY29tbWl0
LzRlNTViYjRiZTUzYmM3YTVlM2ZlMTQyOWFmMTJkMmUzMDkwMDQ5YTUKPj4KPj4+IC0gUmV3b3Jk
IGxlZ2FjeSBjb25maWcgdG8gY2xhcmlmeSB0aGF0IG1pY3JvYmxhemVlbCBpcyBub3QgZHJvcHBl
ZAo+Pj4gwqAgW1JvbWFpbl0KPj4+IC0gTGluayB0byB2MjogaHR0cHM6Ly9wYXRjaC5tc2dpZC5s
aW5rLzIwMjYwNTEzLXFlbXUtdjExLTAtMC12Mi0xLQo+Pj4gZGUyZThlM2M1ODY5QGFub2RpemUu
Y29tCj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IC0gQWRkZWQgQ29uZmlnLmluIGNvbW1lbnQg
ZG9jdW1lbnRpbmcgNjQtYml0IHJlcXVpcmVtZW50Cj4+PiAtIEV4cGFuZGVkIGNvbW1pdCBtZXNz
YWdlIHRvIGV4cGxhaW4gMzItYml0IHJlbW92YWwgW0JhcnVjaF0KPj4+IC0gRml4ZWQgYnVpbGQg
ZmFpbHVyZSB3aXRoIG1pY3JvYmxhemVlbCB0YXJnZXQKPj4+IC0gQWRkZWQgbGVnYWN5IGNvbmZp
ZyBmb3IgbWljcm9ibGF6ZWVsCj4+PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQu
bGluay8yMDI2MDUxMi1xZW11LXYxMS0wLTAtCj4+PiB2MS0xLTc3NmViZmZiYjNhZkBhbm9kaXpl
LmNvbQo+Pj4KPj4+IFRvOiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gQ2M6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gwqBDb25maWcuaW4ubGVn
YWN5wqDCoMKgwqDCoMKgIHzCoCA4ICsrKysrKysrCj4+PiDCoHBhY2thZ2UvcWVtdS9Db25maWcu
aW4gfCAxMiArLS0tLS0tLS0tLS0KPj4+IMKgcGFja2FnZS9xZW11L3FlbXUuaGFzaCB8wqAgMiAr
LQo+Pj4gwqBwYWNrYWdlL3FlbXUvcWVtdS5ta8KgwqAgfCAxNSArKysrKysrKysrKystLS0KPj4+
IMKgNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmluLmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKPj4+
IGluZGV4IGVhZDljZWFhMDguLjkwNjA2ZWJkNGIgMTAwNjQ0Cj4+PiAtLS0gYS9Db25maWcuaW4u
bGVnYWN5Cj4+PiArKysgYi9Db25maWcuaW4ubGVnYWN5Cj4+PiBAQCAtMTQ2LDYgKzE0NiwxNCBA
QCBlbmRpZgo+Pj4KPj4+IMKgY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBpbiAyMDI2
LjA1Igo+Pj4KPj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9UQVJHRVRfTUlDUk9CTEFaRUVM
Cj4gCj4gU2luY2UgeW91IGFwcGxpZWQgdGhpcyBpbnRvIHRoZSBicmFuY2ggIm5leHQiLCB0aGlz
IGxlZ2FjeSBvcHRpb24gc2hvdWxkIGhhdmUKPiBiZWVuIG1vdmVkIHRvIGEgbmV3ICJMZWdhY3kg
b3B0aW9ucyByZW1vdmVkIGluIDIwMjYuMDgiIGJsb2NrLCByaWdodD8KCkluZGVlZCwgYnV0IHRo
ZXJlIG5vICJMZWdhY3kgb3B0aW9ucyByZW1vdmVkIGluIDIwMjYuMDgiIGJsb2NrIHlldC4KCkkg
c2hvdWxkIGhhdmUgY3JlYXRlZCBpdCA6LS8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+Pj4g
K8KgwqDCoCBib29sICJxZW11IHRhcmdldCBtaWNyb2JsYXplZWwgcmVtb3ZlZCIKPj4+ICvCoMKg
wqAgc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVVfVEFSR0VUX01JQ1JPQkxBWkUKPj4+ICvCoMKgwqAg
c2VsZWN0IEJSMl9MRUdBQ1kKPj4+ICvCoMKgwqAgaGVscAo+Pj4gK8KgwqDCoMKgwqAgVmVyc2lv
biAxMS4wLjAgb2YgcWVtdSBmb2xkZWQgbWljcm9ibGF6ZWVsIHN1cHBvcnQgaW50bwo+Pj4gK8Kg
wqDCoMKgwqAgdGhlIG1pY3JvYmxhemUgdGFyZ2V0Lgo+Pj4gKwo+Pj4gwqBjb25maWcgQlIyX0tF
Uk5FTF9IRUFERVJTXzZfMTkKPj4+IMKgwqDCoMKgIGJvb2wgImtlcm5lbCBoZWFkZXJzIHZlcnNp
b24gNi4xOS54IGFyZSBubyBsb25nZXIgc3VwcG9ydGVkIgo+Pj4gwqDCoMKgwqAgc2VsZWN0IEJS
Ml9MRUdBQ1kKPiAKPiBbLi4uXQo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBKdWxpZW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
