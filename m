Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CA3C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EA2240118;
	Sun,  9 Jan 2022 18:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qyt-44S1P8Mt; Sun,  9 Jan 2022 18:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDD3040166;
	Sun,  9 Jan 2022 18:12:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 379E21BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 341E2812B4
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtYgy3el5TtX for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:11:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 146A7812B1
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:11:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id w26so1491075wmi.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=am//IxWoBEJmxc1DTDMgJlXMcSNs5tpGrLNWSPfJgdA=;
 b=EkfdrbkIh5JdvglAxBEPqAQErKsnsy7mo1mjaR9p8UuzP/hcMsytnEP62O8pliLGr3
 CRj3vLHIsJ94rwdjpowvQGHi0jYOiVPk/fSOICnhSRv00yc/4IhHqLN+1pVDaIRItNki
 X0rungQVvEvlTdKZOveVZiOob2aV9sJx5DXBFpHoKZds8BOhK9Cu+247sVxwGHFP9qoR
 f3GHRwLo9qeul2+eDMeiMXLv0z1AYX4il6W9FUJMYDe4NH/zcQPfhFKapOpxnIv/AbE/
 EF+bY3oZlQiomON+5pPixXyxgsnE0hpCFBR5IhbNNYSqv3AWW1INEDp4zMHseZu5D3yR
 HISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=am//IxWoBEJmxc1DTDMgJlXMcSNs5tpGrLNWSPfJgdA=;
 b=GH0jE56Zyui1XwBtQx/Wlb9+/ZOAIeFwcuJ9w8xB7Sw7ZASQuI9FehBLLy9cO5VrN+
 QQOQJmYI7mN3Z3vc5pHJEo/mP7d+ubPKhqHq3zlBWnHq3BeAumniogEHTRvfeXq1TMqQ
 4Vu2zDnsWs6xXz4EfCybhLdZLZUF7qFd8l629DtqSpeTy8ezZgnEuNbt770CCnammAAz
 v3ky8gOzJo5HcajY5tiqvBPhq3srGNAUaKk4pgGRq3hc9B4FanRmp1nAK95qFnD4oRYK
 36Fc0V7FyHiT1YwfFWpC34Fk16S4nxR/T3s0Ow9CDANnTqu9LHMt1sLATVG0UaG9v2Ji
 IdAw==
X-Gm-Message-State: AOAM532KKKb+A23Tc8t3DzJQtRzZ/ZgvTPjB0yNI+oe7zedFD09idYCD
 9IRCAgY12rMvo5H+5j9u2hnMaQ==
X-Google-Smtp-Source: ABdhPJwOszNz+J1di2kpkbagq0q95JxpXWVaUL+2Yjeaj5robeGEw/awFMaBXA6kvlJbE2jEy+bobg==
X-Received: by 2002:a05:600c:a54:: with SMTP id
 c20mr18789244wmq.48.1641751915233; 
 Sun, 09 Jan 2022 10:11:55 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id i8sm5929627wmq.36.2022.01.09.10.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 10:11:54 -0800 (PST)
Message-ID: <caf72f5d-ce45-8a1f-c8ad-170a7e8df29a@mind.be>
Date: Sun, 9 Jan 2022 19:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220109171511.3293111-1-arnout@mind.be>
 <73b148ec-c6bd-fb58-64fd-fd4e224f966e@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <73b148ec-c6bd-fb58-64fd-fd4e224f966e@smile.fr>
Subject: Re: [Buildroot] [PATCH] package/mesa3d: Gallium VC4 driver depends
 on NEON
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOS8wMS8yMDIyIDE4OjI0LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gQXJub3V0
LAo+IAo+IExlIDA5LzAxLzIwMjIgw6AgMTg6MTUsIEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3Nl
bnNpdW0vTWluZCkgYSDDqWNyaXTCoDoKPj4gU2luY2UgdmVyc2lvbiAyMS4zLjAgb2YgbWVzYTNk
LCB0aGUgZ2VuZXJpYyBicm9hZGNvbSBpbmZyYXN0cnVjdHVyZQo+PiAod2hpY2ggaXMgY2FsbGVk
IHYzZCBidXQgaXMgdXNlZCBhbHNvIGZvciBWQzQpIHN0YXJ0ZWQgdXNpbmcgTkVPTgo+PiBpbnN0
cnVjdGlvbnMuIFRoaXMgbGVhZHMgdG8gYXNzZW1ibGVyIGZhaWx1cmVzIHdoZW4gVkM0IGlzIGJ1
aWx0IGZvcgo+PiAzMi1iaXQgQVJNIHdpdGhvdXQgTkVPTjoKPj4KPj4gRkFJTEVEOiBzcmMvYnJv
YWRjb20vbGlidjNkX25lb24uYS5wL2NvbW1vbl92M2RfdGlsaW5nLmMubwo+PiAvaG9tZS9idWls
ZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvaG9zdC9iaW4vYXJtLWxpbnV4LWdj
YyBbLi4uXSAtYyAuLi9zcmMvYnJvYWRjb20vY29tbW9uL3YzZF90aWxpbmcuYwo+PiAvdG1wL2Nj
QXZ1Zk52LnM6IEFzc2VtYmxlciBtZXNzYWdlczoKPj4gL3RtcC9jY0F2dWZOdi5zOjYwMjogRXJy
b3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGB2bGRtIHI3LHtxMCxxMSxx
MixxM30nIGluIEFSTSBtb2RlCj4+IFsuLi5dCj4+IC90bXAvY2NBdnVmTnYuczo2ODY6IEVycm9y
OiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgdnN0bSByNyx7cTAscTEscTIs
cTN9JyBpbiBBUk0gbW9kZQo+Pgo+PiBMZXQgdGhlIFZDNCBkcml2ZXIgZGVwZW5kIG9uIE5FT04g
Zm9yIDMyLWJpdCBBUk0uIEFhcmNoNjQgYWx3YXlzIGhhcwo+PiBORU9OLCBzbyBubyBjb25kaXRp
b24gaXMgbmVlZGVkIHRoZXJlLgo+IAo+IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZF
Ul9WM0Qgc2VsZWN0aW5nCj4gQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1ZDNCBh
bHJlYWR5IHJlcXVpcmVzIE5FT04uCgogIFllYWgsIGJ1dCBWQzQgZG9lc24ndCBzZWxlY3QgVjNE
IHNvIHRoYXQgZG9lc24ndCBtZWFuIGFueXRoaW5nLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAK
PiBSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gCj4g
QmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+Pgo+PiBGaXhlczoKPj4gaHR0cDovL2F1dG9i
dWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMmI1LzJiNTMxZjdhYTQ1MDZlZTMxYTcyNTJjODdh
MmU0MDFmZmZhYjlkZmIvCj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
LzZmOS82ZjllN2M4NjQ4MDhkYzBmYWZiY2E3Yzg5ODQ2NTFmZTkyZWRiYWYyLwo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRA
bWluZC5iZT4KPj4gLS0tCj4+ICAgcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIHwgMiArLQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmln
LmluCj4+IGluZGV4IDM0YjAzNTIwNTYuLjM3YzRmODA3OGUgMTAwNjQ0Cj4+IC0tLSBhL3BhY2th
Z2UvbWVzYTNkL0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPj4g
QEAgLTI3NCw3ICsyNzQsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJ
VkVSX1YzRAo+PiAgIAo+PiAgIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklW
RVJfVkM0Cj4+ICAgCWJvb2wgIkdhbGxpdW0gdmM0IGRyaXZlciIKPj4gLQlkZXBlbmRzIG9uIEJS
Ml9hcm0gfHwgQlIyX2FhcmNoNjQKPj4gKwlkZXBlbmRzIG9uIChCUjJfYXJtICYmIEJSMl9BUk1f
Q1BVX0hBU19ORU9OKSB8fCBCUjJfYWFyY2g2NAo+PiAgIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fSEFTX1NZTkNfNCB8fCAhQlIyX1BBQ0tBR0VfWE9SRzcgIyBsaWJ4c2htZmVuY2UKPj4gICAJ
c2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzIGlmIEJSMl9QQUNLQUdFX1hPUkc3Cj4+ICAg
CXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVIKPj4KPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
