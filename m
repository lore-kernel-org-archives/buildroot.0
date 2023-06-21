Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69861EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 09:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C7860FE9;
	Wed, 21 Jun 2023 09:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C7860FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzBBVe7j22Vo; Wed, 21 Jun 2023 09:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCBA860ABE;
	Wed, 21 Jun 2023 09:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCBA860ABE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2EA1BF4E5
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 09:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00D5E401CA
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 09:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D5E401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ove9XaPcq6Cs for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 09:57:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4171F40181
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4171F40181
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 09:57:34 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3113da5260dso3062058f8f.2
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 02:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687341452; x=1689933452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tdUDyg2QRIsRuRG6WPxUUGRBR9iTQchOf/YW+/YsSVM=;
 b=LWx/DK+lIXgDvAm91/XDS60OuvLKlnwTkpd6sG0yXIKBujuPWGzDPfdGv+nxbBo9UR
 TuC0Nqv8UchwPX4P9S5534Oidk3B4wU+1KZ3P64rwcVRQRmMEEhc+M0gdqE2kCJpLsuH
 0lQz31/FjkOSjT+zvtb/WJSaFOL+RY7KmYewN4bvUBaE1ckKHxAx8q74oUn1AQCcUEhE
 iRhKWew5/WWEksZLgZL41Wzy0CxhmADdhuUwPiGRirkYSZ1EbQIHrEjbT4F8ltA5GW03
 /2MEuR1wKwKUATfkbFJUnaAKyOJcRt6bo2rk9aCxaPIiTOosZ9E4OjZXKxj6Ot18Pjxv
 iqRQ==
X-Gm-Message-State: AC+VfDx6aoicnAjECGp3VwjjJjihia+N7FauZft4ee3Su2u/Dj7vNJ87
 gMtQpvjsmdDE+DvHSkAK2kmEQw==
X-Google-Smtp-Source: ACHHUZ7B4b6SHxvKtY8VVglSIispBXBAaWWnHeeEjhMO1jeuX+VlcuesLA6HBKQ5IrpLMW5YSi8erQ==
X-Received: by 2002:a5d:534a:0:b0:307:904b:29e1 with SMTP id
 t10-20020a5d534a000000b00307904b29e1mr10570724wrv.20.1687341452268; 
 Wed, 21 Jun 2023 02:57:32 -0700 (PDT)
Received: from [10.5.2.165]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4c8b000000b0030c4d8930b1sm4000918wrs.91.2023.06.21.02.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 02:57:31 -0700 (PDT)
Message-ID: <1a3add30-eff5-9dfa-c4d9-3ca9122a6f08@smile.fr>
Date: Wed, 21 Jun 2023 11:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Arnout Vandecappelle <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605070859.1877231-1-james.hilliard1@gmail.com>
 <0fc72d11-35b2-b6a2-8028-89c3093567a5@mind.be>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <0fc72d11-35b2-b6a2-8028-89c3093567a5@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1687341452; x=1689933452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tdUDyg2QRIsRuRG6WPxUUGRBR9iTQchOf/YW+/YsSVM=;
 b=WBvI52JI7H8tRrmXk4r8+Sc/Wl93W4EwReMMuQohy1nul0glz6QIcF0IflWgwZr/5i
 elNAYuuFqE1qbJ5lAaN3HujCnGmIGpq2p9HDQDfDjp/IBZ+0FQ9cn3LT4sV9GzzP14HS
 JczT4336uL4Vi4HO86q7CH2NRhYgLJJ5L4NufoaTWpYmC0sj222/unP3g4JAty5xGCBj
 X0NgAKdiLEZbW3F5Ikg30EV2TenoJuLy+1KSoK1DkmKnZ9fLHI+c2R079Yyw43RH+g7d
 YqvsdSxiac0FKOemWReLUkmcgIFGaxCbB5BJvtl4VwMXYW17gcJMnGig/Wmc7sd63Ypl
 pSbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=WBvI52JI
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 67.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsIEFybm91dCwgQWxsLAoKTGUgMTgvMDYvMjAyMyDDoCAxNTowMiwgQXJub3V0
IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IAo+IAo+IE9uIDA1LzA2
LzIwMjMgMDk6MDgsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+PiBMaWNlbnNlIGhhc2ggY2hhbmdl
ZCBkdWUgdG8gbmFtZSByZW1vdmFsOgo+PiBodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRv
b2xzL2NvbW1pdC81OTU3ZDU4MjY2ZTQ3OWYxMjRiMzFmMzBlNDMyMmU3OThmZGYzODZiCgpTaW5j
ZSB0aGlzIGNvbW1pdCwgb25lIG9mIHRoZSBweXRob24gdGVzdCBmYWlsIChUZXN0UHl0aG9uUHkz
R3Bpb3plcm8gWzFdKToKCiAgRmlsZQoiL2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC90
ZXN0LW91dHB1dC9UZXN0UHl0aG9uUHkzR3Bpb3plcm8vaG9zdC9saWIvcHl0aG9uMy4xMS9zaXRl
LXBhY2thZ2VzL3BrZ19yZXNvdXJjZXMvX19pbml0X18ucHkiLApsaW5lIDg2OCwgaW4gX3Jlc29s
dmVfZGlzdAogICAgcmFpc2UgRGlzdHJpYnV0aW9uTm90Rm91bmQocmVxLCByZXF1aXJlcnMpCnBr
Z19yZXNvdXJjZXMuRGlzdHJpYnV0aW9uTm90Rm91bmQ6IFRoZSAnY29sb3J6ZXJvJyBkaXN0cmli
dXRpb24gd2FzIG5vdCBmb3VuZAphbmQgaXMgcmVxdWlyZWQgYnkgdGhlIGFwcGxpY2F0aW9uCgpC
dXQgaWYgeW91IGxvb2sgY2xvc2VyIGluIHRoZSBidWlsZCBsb2csIHlvdSB3aWxsIG5vdGljZSBu
ZXcgc2V0dXB0b29sIHdhcm5pbmc6CgpbLi4uXXN5c3Jvb3QvdXNyL2xpYi9weXRob24zLjExL2Rp
c3R1dGlscy9jbWQucHk6NjI6ClNldHVwdG9vbHNEZXByZWNhdGlvbldhcm5pbmc6IHNldHVwLnB5
IGluc3RhbGwgaXMgZGVwcmVjYXRlZC4KISEKKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKICAgICAg
ICBQbGVhc2UgYXZvaWQgcnVubmluZyBgYHNldHVwLnB5YGAgZGlyZWN0bHkuCiAgICAgICAgSW5z
dGVhZCwgdXNlIHB5cGEvYnVpbGQsIHB5cGEvaW5zdGFsbGVyLCBweXBhL2J1aWxkIG9yCiAgICAg
ICAgb3RoZXIgc3RhbmRhcmRzLWJhc2VkIHRvb2xzLgoKICAgICAgICBTZWUgaHR0cHM6Ly9ibG9n
LmdhbnNzbGUuaW8vYXJ0aWNsZXMvMjAyMS8xMC9zZXR1cC1weS1kZXByZWNhdGVkLmh0bWwKZm9y
IGRldGFpbHMuCgoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgoKU28sIGl0IG1lYW5zIHRoYXQgdGhl
IHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgZm9yIHB5dGhvbiB1c2UgYSBkZXByZWNhdGVkIGluc3Rh
bGwKbWV0aG9kLiBJJ20gbm90IHN1cmUgd2h5IHRoaXMgaXNzdWUgYXBwZWFyIG9ubHkgd2l0aCBw
eXRob24tcGlvemVybyBidXQgaXQgc2VlbXMKdGhhdCB3ZSBuZWVkIHRvIHVwZGF0ZSB0aGUgcHl0
aG9uIGluZnJhc3RydWN0dXJlLgoKQ2FuIHlvdSBoYXZlIGEgbG9vaz8KClsxXSBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzQ1MDU5Nzc5MDYKWzJdCmh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyMy4wNS54
L3BhY2thZ2UvcGtnLXB5dGhvbi5tayNMMTk1CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPj4KPj4g
U2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
Cj4gCj4gwqBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+IAo+IMKgUmVnYXJkcywKPiDCoEFy
bm91dAo+IAo+PiAtLS0KPj4gwqAgcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0
dXB0b29scy5oYXNoIHwgNiArKystLS0KPj4gwqAgcGFja2FnZS9weXRob24tc2V0dXB0b29scy9w
eXRob24tc2V0dXB0b29scy5ta8KgwqAgfCA0ICsrLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLmhhc2gKPj4gYi9wYWNrYWdlL3B5
dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLmhhc2gKPj4gaW5kZXggNzZhZDFiYTFj
ZS4uYmUxMzA2MzcyOCAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9weXRob24tc2V0dXB0b29scy9w
eXRob24tc2V0dXB0b29scy5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMv
cHl0aG9uLXNldHVwdG9vbHMuaGFzaAo+PiBAQCAtMSw0ICsxLDQgQEAKPj4gwqAgIyBGcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHlwaS9zZXR1cHRvb2xzL2pzb24KPj4gLW1kNcKgIDFmZDhiZDA0YjBi
ZWQ5NWFkNmM4MWYwM2IxYzA4MGJjwqAgc2V0dXB0b29scy02NS42LjMudGFyLmd6Cj4+IC1zaGEy
NTbCoCBhNzYyMDc1N2JmOTg0YjU4ZGVhZjMyZmM4YTQ1NzdhOWJiYzA4NTBjZjkyYzIwZTFjZTQx
YzM4YzE5ZTVmYjc1wqAKPj4gc2V0dXB0b29scy02NS42LjMudGFyLmd6Cj4+IC1zaGEyNTbCoCBk
YjNmMDI0NmIxZjkyNzhmMTU4NDViOTlmZWM0NzhiOGI1MDZlYjc2NDg3OTkzNzIyZjhjNmUyNTQy
ODVmYWY4wqAKPj4gTElDRU5TRQo+PiArbWQ1wqAgNjI4YWIxYWU3ZDE0MTg1ZTVlNTM2NzQwZWEz
MWI1Y2XCoCBzZXR1cHRvb2xzLTY3LjguMC50YXIuZ3oKPj4gK3NoYTI1NsKgIDYyNjQyMzU4YWRj
NzdmZmE4NzIzM2JjNGQyMzU0YzRiMjY4MmQyMTQwNDhmNTAwOTY0ZGJlNzYwY2NlZGYxMDLCoAo+
PiBzZXR1cHRvb2xzLTY3LjguMC50YXIuZ3oKPj4gK3NoYTI1NsKgIDg2ZGEwZjAxYWVhZTQ2MzQ4
YTNjM2Q0NjUxOTVkYzFjZWNjZGU3OWY3OWU4Nzc2OWE2NGI4ZGEwNGIyYTQ3NDHCoAo+PiBMSUNF
TlNFCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1
cHRvb2xzLm1rCj4+IGIvcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29s
cy5tawo+PiBpbmRleCAyMjZlZjJiNDc5Li42ZDEwMTcyY2RjIDEwMDY0NAo+PiAtLS0gYS9wYWNr
YWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLm1rCj4+ICsrKyBiL3BhY2th
Z2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPj4gQEAgLTQsOSArNCw5
IEBACj4+IMKgICMKPj4gwqAKPj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4gwqAgLVBZVEhP
Tl9TRVRVUFRPT0xTX1ZFUlNJT04gPSA2NS42LjMKPj4gK1BZVEhPTl9TRVRVUFRPT0xTX1ZFUlNJ
T04gPSA2Ny44LjAKPj4gwqAgUFlUSE9OX1NFVFVQVE9PTFNfU09VUkNFID0gc2V0dXB0b29scy0k
KFBZVEhPTl9TRVRVUFRPT0xTX1ZFUlNJT04pLnRhci5nego+PiAtUFlUSE9OX1NFVFVQVE9PTFNf
U0lURSA9Cj4+IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9iNi8yMS9j
YjlhOGQwYjJjODU5N2M4M2ZjZThlOWMwMjg4NGJjZTNkNDk1MWU0MWU4MDdmYzM1NzkxYzZiMjNk
OWEKPj4gK1BZVEhPTl9TRVRVUFRPT0xTX1NJVEUgPQo+PiBodHRwczovL2ZpbGVzLnB5dGhvbmhv
c3RlZC5vcmcvcGFja2FnZXMvMDMvMjAvNjMwNzgzNTcxZTc2ZTVmYTVmM2U5ZjI5Mzk4Y2EzYWNl
Mzc3MjA3YjgxOTZiNTRlMGZmZGYwOWYxMmMxCj4+IMKgIFBZVEhPTl9TRVRVUFRPT0xTX0xJQ0VO
U0UgPSBNSVQKPj4gwqAgUFlUSE9OX1NFVFVQVE9PTFNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UK
Pj4gwqAgUFlUSE9OX1NFVFVQVE9PTFNfQ1BFX0lEX1ZFTkRPUiA9IHB5dGhvbgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
