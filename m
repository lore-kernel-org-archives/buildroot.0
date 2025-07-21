Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFEEC83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 12:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DF9606E8;
	Mon, 21 Jul 2025 12:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckNy7tPnCsA7; Mon, 21 Jul 2025 12:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F9D6086D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F9D6086D;
	Mon, 21 Jul 2025 12:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 835B91F7
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 12:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7436B83C00
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 12:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDAU5PuiNW-j for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 12:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.32.188.33;
 helo=arcturus.nroach44.id.au; envelope-from=nroach44@nroach44.id.au;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DC0181FE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC0181FE3
Received: from arcturus.nroach44.id.au (arcturus.nroach44.id.au [45.32.188.33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DC0181FE3
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 12:11:55 +0000 (UTC)
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1))
 (No client certificate requested)
 by arcturus.nroach44.id.au (Postfix) with ESMTPS id 3A9E429829
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 20:11:50 +0800 (AWST)
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
 id E630C2982F; Mon, 21 Jul 2025 20:11:49 +0800 (AWST)
Received: from [IPV6:2403:5814:4228:10:13da:b743:ca26:dcc4] (unknown
 [IPv6:2403:5814:4228:10:13da:b743:ca26:dcc4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by arcturus.nroach44.id.au (Postfix) with ESMTPSA id 1338729823;
 Mon, 21 Jul 2025 20:11:44 +0800 (AWST)
Message-ID: <024d5a02-33a7-4201-8669-78e39cd23fa7@nroach44.id.au>
Date: Mon, 21 Jul 2025 20:11:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250714154029.3327599-1-nroach44@nroach44.id.au>
 <04838f22a50504ea1073a51827dc09f1@free.fr>
Content-Language: en-US
In-Reply-To: <04838f22a50504ea1073a51827dc09f1@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753099910;
 bh=AsiCHNzNSB+OxJknEIEblu8quHEehzdtgnA+OjtSEJQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hBuFA4Z3UQpKLcDJ+e7hDaM7IQom+On3AWwiGRtrqPI+3GGi5QfHpLhZs80/4V644
 sWfkTPIGe5elBsxeLbgvURgyS6cpYxC2IP21f8QPJf351lXytNSLctIZuYkzolnENr
 79FrTFOBEYyzRy9ALHj/7CfDN/YhFHlzKGmNCx6Kfbz7gk5LzXtC3ctlQzjRYglEVG
 Tpe3LCPIiA9O8anhAd0vVIiOM7whWRFO/KBkQcnI7ijEhZ7OsyXkYrDPIV4dlbh4L/
 ekcksmOPRkVNdqseoMJOZ2TTrLSqUZBtU3ST8I39YLxI/WzzB3IezjON7eyq2vDK8G
 Pwhiiz8Q+Aobg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753099909;
 bh=AsiCHNzNSB+OxJknEIEblu8quHEehzdtgnA+OjtSEJQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GyUEiK5esNKaZv4BwrFhu7HIusau8RoigTskuXEdPTVWt3h6C9yEkpjYN7vSarlLE
 nwLunTFuNIHYaa2/0X1uiTkjLsm3sDvQL//XEBwT7qnITKWXPaB4/iSkA022GvppOK
 AFVVTSbRMk7alI6Ko/AR4/ZM+2VBMI4VgIwDERU7/el3yOYTvdENtq1xnVVShpokyu
 Ma0Wwbf7p6pJfS4RLngBjgxUhNIzdY2RD+tJj5zg5ws601ndVlS+wBk4CP/FrGYL8B
 D1P58lYJoY14hdZFeh8eWAjNYCWhc/LXBj/Wa8JyU/ioBP8mbd4h1VkbBcfI2fQEux
 LNY3oB6xM0tfA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753099905;
 bh=AsiCHNzNSB+OxJknEIEblu8quHEehzdtgnA+OjtSEJQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HED4ObOc6sCsU2MIF1oAwmrspTsS6KCOg2t57AS1zB83nt1nl4trMhlasu9E8pOmZ
 nTO7DRWo7VsYJLQv4ymTWi/6OAFNr406l+jh2Rk1HPDPPyLgWfKqbIdLkXlIqy9y+/
 uWkEjOwn3cVqEAqbIJxa/sby37ddImbjLQQggC8gmmZaePWomh7ZvS8ow9NTdid+At
 WXHmmmZgXzgUI6f7XY/xYipwhujl2LbOHf6OGJji9zk5QOlWIWAaNOfxt7PB78Bi4x
 TDh3fiyKespbkmjxz+CemMtS6UaAHNQQSVn0m35V73rRFkbD1q0CGI/AGp04wKnGdI
 f1M08PFt34Chg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=nroach44.id.au
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=nroach44.id.au
 header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL
 header.b=hBuFA4Z3; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=GyUEiK5e; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=HED4ObOc
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: require libxcrypt,
 allowing hashed passwords without PAM
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
From: Nathaniel Roach via buildroot <buildroot@buildroot.org>
Reply-To: Nathaniel Roach <nroach44@nroach44.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKT24gMTUvNy8yNSAwMToyMywgSnVs
aWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkgTmF0aGFuaWVsLAo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0
Y2ghCj4KPiBPbiAxNC8wNy8yMDI1IDE3OjQwLCBOYXRoYW5pZWwgUm9hY2ggdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPj4gUGVyIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2lzc3Vlcy8yNyAsCj4+IG9uIGJ1aWxkcyB3aXRob3V0IFBBTSwgc3VkbyB3aWxsICJmYWls
IiBhbGwgcGFzc3dvcmQgcHJvbXB0cy4KPj4KPj4gSXQgd2FzIGZvdW5kIHRoYXQgaXQncyBzaW1w
bHkgY2hlY2tpbmcgdGhlIGVudGVyZWQgc3RyaW5nIGFnYWluc3QgdGhlCj4+IHJhdyBoYXNoLCBi
ZWNhdXNlICdsaWJjcnlwJyBpc24ndCBhdmFpbGFibGUuIFRoYXQncyBwcm92aWRlZCBieQo+PiBs
aWJ4Y3J5cHQsIHNvIHJlcXVpcmUgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbmllbCBS
b2FjaCA8bnJvYWNoNDRAbnJvYWNoNDQuaWQuYXU+Cj4+IC0tLQo+PiDCoHBhY2thZ2Uvc3Vkby9D
b25maWcuaW4gfCAxICsKPj4gwqBwYWNrYWdlL3N1ZG8vc3Vkby5ta8KgwqAgfCAxICsKPj4gwqAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9zdWRvL0NvbmZpZy5pbiBiL3BhY2thZ2Uvc3Vkby9Db25maWcuaW4KPj4gaW5kZXggZWU1ZWE1
NDJhYi4uODViYzQ4NTliOCAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9zdWRvL0NvbmZpZy5pbgo+
PiArKysgYi9wYWNrYWdlL3N1ZG8vQ29uZmlnLmluCj4+IEBAIC0yLDYgKzIsNyBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfU1VETwo+PiDCoMKgwqDCoCBib29sICJzdWRvIgo+PiDCoMKgwqDCoCAjIHVz
ZXMgZm9yaygpCj4+IMKgwqDCoMKgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPj4gK8KgwqDCoCBz
ZWxlY3QgQlIyX1BBQ0tBR0VfTElCWENSWVBUIGlmIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQwo+
Cj4gSXQgaXMgYSBiaXQgb2RkIHRvIHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJYQ1JZUFQgaWYKPiBC
UjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgaXMgc2V0IChkaXNyZWdhcmRpbmcgaWYKPiBCUjJfUEFD
S0FHRV9MSU5VWF9QQU0gaXMgc2V0IG9yIG5vdCkgaGVyZS4uLgo+Cj4+IMKgwqDCoMKgIGhlbHAK
Pj4gwqDCoMKgwqDCoMKgIFN1ZG8gaXMgYSBwcm9ncmFtIGRlc2lnbmVkIHRvIGFsbG93IGEgc3lz
YWRtaW4gdG8gZ2l2ZQo+PiDCoMKgwqDCoMKgwqAgbGltaXRlZCByb290IHByaXZpbGVnZXMgdG8g
dXNlcnMgYW5kIGxvZyByb290IGFjdGl2aXR5LiBUaGUKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
c3Vkby9zdWRvLm1rIGIvcGFja2FnZS9zdWRvL3N1ZG8ubWsKPj4gaW5kZXggZjU3YTg2ODA1YS4u
MmQxZjhkODFjOSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9zdWRvL3N1ZG8ubWsKPj4gKysrIGIv
cGFja2FnZS9zdWRvL3N1ZG8ubWsKPj4gQEAgLTM0LDYgKzM0LDcgQEAgU1VET19ERVBFTkRFTkNJ
RVMgKz0gbGludXgtcGFtCj4+IMKgU1VET19DT05GX09QVFMgKz0gLS13aXRoLXBhbQo+PiDCoFNV
RE9fUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBTVURPX0lOU1RBTExfUEFNX0NPTkYKPj4g
wqBlbHNlCj4+ICtTVURPX0RFUEVOREVOQ0lFUyArPSBsaWJ4Y3J5cHQKPgo+IC4uLnRoZW4gdG8g
YWRkIHRoZSBkZXBlbmRlbmN5ICJTVURPX0RFUEVOREVOQ1kgKz0gbGlieGNyeXB0Igo+IG9ubHkg
aWYgQlIyX1BBQ0tBR0VfTElOVVhfUEFNIGlzIHNldCBoZXJlLgo+Cj4gVGhpcyBjcmVhdGVzIHRo
ZSBjYXNlIHdoZW4gd2UgaGF2ZSBhIGEgZ2xpYmMgdG9vbGNoYWlucwo+IGFuZCBsaW51eC1wYW0g
ZW5hYmxlZCBub3QgYnJpbmdpbmcgdGhlIGxpYnhjcnlwdCBkZXBlbmRlbmN5Lgo+IHN1ZG8gd2ls
bCBkZXRlY3QgdGhlIGxpYmNyeXB0IGRlcGVuZGluZyB0aGUgYnVpbGQgb3JkZXIuCj4KPiBTaG91
bGRuJ3Qgd2UgaGF2ZSBpbnN0ZWFkIGEgY29uZGl0aW9uYWwgYmxvY2sgb24gbGlieGNyeXB0LAo+
IG91dHNpZGUgdGhlIGxpbnV4LXBhbSBjb25kaXRpb25hbCBibG9jaz8gVGhpcyBpcyBhbHNvIHRo
ZQo+IHVzdWFsIHBhdHRlcm4gZm9yIGhhbmRsaW5nIGdsaWJjL2xpYnhjcnlwdC4gRm9yIGV4YW1w
bGU6Cj4KPiDCoMKgwqAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJYQ1JZUFQpLHkpCj4gwqDCoMKg
IFNVRE9fREVQRU5ERU5DSUVTICs9IGxpYnhjcnlwdAo+IMKgwqDCoCBlbmRpZgo+Cj4gSSB0aGlu
ayBpdCdzIGJldHRlciB0byBhbHdheXMgYXZvaWQgdGhpcyBzaW1wbGUgc3RyaW5nCj4gY29tcGFy
aXNvbiBmYWxsYmFjayBmb3IgcGFzc3dvcmQuCj4KPiBJZiB5b3UgYWdyZWUgdG8gdGhpcyBwcm9w
b3NhbCwgY291bGQgeW91IHNlbmQgYW4gdXBkYXRlZCBwYXRjaCwKPiBwbGVhc2U/Cj4KPiBXaGls
ZSBhdCBpdCwgY291bGQgeW91IGFsc28gYWRkIGEgcmVmZXJlbmNlIGluIHRoZSBjb21taXQgbG9n
Cj4gcG9pbnRpbmcgdG8gdGhlIHJlbGV2YW50IHN1ZG8gY29kZSBwb3J0aW9uLCBlLmc6Cj4gaHR0
cHM6Ly9naXRodWIuY29tL3N1ZG8tcHJvamVjdC9zdWRvL2Jsb2IvdjEuOS4xN3AxL3BsdWdpbnMv
c3Vkb2Vycy9hdXRoL3Bhc3N3ZC5jI0wxMzkgCj4KPgpJJ3ZlIHNlbnQgYW4gdXBkYXRlZCBvbmUg
d2l0aCB0aGVzZSBzdWdnZXN0aW9ucyBhbmQgYSB0d2Vha2VkIHRpdGxlLCBzbyAKdGhpcyBvbmUg
Y2FuIGJlIGNsb3NlZCBvdXQuCgo+PiDCoFNVRE9fQ09ORl9PUFRTICs9IC0td2l0aG91dC1wYW0K
Pj4gwqBlbmRpZgo+Pgo+PiAtLSAKPj4gMi4zOS41Cj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBKdWxp
ZW4uCgpDaGVlcnMsCk5hdGhhbmllbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
