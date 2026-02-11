Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84034ECD6EE
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 21:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A07A80D36;
	Wed, 11 Feb 2026 21:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9YluEO7xSmf; Wed, 11 Feb 2026 21:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4982C80D3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770845394;
	bh=bKdWZh9FE4gjJXhxjeUycf/gs5o//02vJvooa866Yj4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J28RhrDIOzmmTUn1g/3TMi0yowSWA0ep8rz7O99c/+ZsO8BjKZ9FC55kBwUMQBBWH
	 reX11LXGvEWOSVgPTYKwgEEnhGRd3KnIp332fpW/a5guWv6++8KjOGhV6UxY7u1Po8
	 SRGtm2r/GfyUGWUy0l8j+t8wraJ3q8el2wciGQMXr+oZ1uskbi4GfZJm7xO+cEFL2U
	 Q/+CSQBTKh89AKFbfoZE7EMFLu0niPpY1/M/IjDwLIBcuyqbkcoFEVNvCpHa9cPZmn
	 kppwZc1TNBCde3/+7Fq5kQmDmOcD082JxkoZM4V6qH7JDa2c3XPlXXQVozgAF9qQLs
	 iWH6wIhbcBjBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4982C80D3C;
	Wed, 11 Feb 2026 21:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E14423D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 21:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AE6E61113
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 21:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPGH904T3vmL for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 21:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 338D861128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 338D861128
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 338D861128
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 21:29:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CDEE519F593;
 Wed, 11 Feb 2026 22:29:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Feb 2026 22:29:48 +0100
MIME-Version: 1.0
Date: Wed, 11 Feb 2026 22:29:48 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <677cef30-38c8-4126-9dbb-b45c553ed702@smile.fr>
References: <20260202144550.1877480-1-romain.naour@smile.fr>
 <677cef30-38c8-4126-9dbb-b45c553ed702@smile.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <f18fce38721f407ac19698406c39dc79@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770845389;
 bh=emt8jfuno53Ut+6zbJ7Xsq3EhnW8RDEh5ipmBZ0P3MQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hcmqPzvz3l6jjsIo6UyvvBQacYE4dACn8jgYqjrsSQyMoOrB7pDwZRjb7G/IxPR8N
 rNEHcBYCT9zrVuDeEnE2pYyeeEB3E53B0VuKIdWfnpdZEUFHlPUXxEOOksX3eYNJcF
 t7n9wbIfKhWQ8yneu13pBbrVbFQsdsCU2OJpeQuqaW5Cmb06IqbwiDgVie+xO3Jd/4
 rDt2ytqDg6Z92YbAQYRe1PFsnMRgM29MCJu52jlxay222zCx3SVSJ7+MopMHRgw+i+
 MiJUlGaHvS9Nc6QlTdSFUBhCUVj4I2S4rNR+goeygIi0m5yewhZh5iDMpmExgxoI0o
 7rV2sZYk2Zjag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hcmqPzvz
Subject: Re: [Buildroot] [PATCH]
 support/testing/tests/package/test_firewalld: use ext2 instead of cpio
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gMDIvMDIvMjAyNiAxNTo1NywgUm9tYWluIE5hb3VyIHZpYSBidWlsZHJv
b3Qgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gTGUgMDIvMDIvMjAyNiDDoCAxNTo0NSwgUm9tYWluIE5h
b3VyIGEgw6ljcml0wqA6Cj4+IFRoZSBDUElPIGZpbGVzeXN0ZW0gZ2VuZXJhdGVkIGJ5IHRoZSB0
ZXN0X2ZpcmV3YWxsZCB0ZXN0IGlzIHRvbwo+PiBsYXJnZSwgYW5kIGRvZXNuJ3QgZml0IGFzIGFu
IGluaXRyYW1mcyBpbiB0aGUgMjU2TUIgb2YgUkFNIGF2YWlsYWJsZQo+PiBpbiB0aGUgdmVyc2F0
aWxlcGIgbWFjaGluZS4gVGhpcyBjYXVzZXMgYSAiSW5pdHJhbWZzIHVucGFja2luZyBmYWlsZWQ6
Cj4+IHdyaXRlIGVycm9yIiB3aGVuIGJvb3RpbmcsIGFuZCBtYW55IGZpbGVzIGJlaW5nIG1pc3Np
bmcgZnJvbSB0aGUgcm9vdAo+PiBmaWxlc3lzdGVtLCB1bHRpbWF0ZWx5IGNhdXNpbmcgdGhlIHRl
c3QgdG8gZmFpbC4KPj4gCj4+IFRoZSB0ZXN0X2ZpcmV3YWxsZCB0ZXN0IGluaXRpYWxseSBzdGFy
dGVkIHRvIGZhaWwgZm9sbG93aW5nIGEgc3lzdGVtZAo+PiB1cGRhdGUgWzFdWzNdOgo+PiAKPj4g
ICBbQlJURVNUIyBzeXN0ZW1jdGwgaXMtYWN0aXZlIGZpcmV3YWxsZAo+PiAgIGZhaWxlZAo+PiAK
Pj4gQnV0IHJlYWxseSBzdGFydGVkIHRvIGNyYXNoIGF0IGJvb3QgZm9sbG93aW5nIGEgcHl0aG9u
IDMuMTQgdXBkYXRlCj4+IFsyXVs0XToKPj4gCj4+ICAgUnVuIC9pbml0IGFzIGluaXQgcHJvY2Vz
cwo+PiAgIC9pbml0OiBleGVjOiBsaW5lIDE1OiAvc2Jpbi9pbml0OiBub3QgZm91bmQKPj4gCj4+
IEFsc28sIHVwZGF0ZSBUZXN0RmlyZXdhbGxkU3lzVkluaXQgdG8gdXNlIGV4dDIgaW5zdGVhZCBv
ZiBjcGlvLgo+PiAKPj4gWzFdIDkyNmUwNTA0ZDA2YjVkNjFkN2FmZmIyNGI5NGIxMzNiOTE2Yjcx
ZjcKPj4gWzJdIGEwYTZhYmM4YjE5M2U1YmRhYjUzMjYzMjRkNzI5OWMxOWQ1ZDhjNjcKPj4gCj4+
IEZpeGVzOgo+PiBbM10gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy8xMjk0NDc5NzA1OQo+PiBbNF0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xMTg1Njg0MDk0MAo+PiAKPj4gU2lnbmVkLW9mZi1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgoKPiBPdmVyIHRoZSB0aW1lLCB3ZSBoYXZlIHRoZSBzYW1lIGlzc3VlIHdpdGggdGhlIGxp
bWl0ZSBvZiAyNTZNQiBvZiBSQU0gCj4gb24gdGhpcwo+IHFlbXUgdGFyZ2V0LiBEbyB3ZSBwbGFu
IHRvIHVzZSBhbm90aGVyIHRhcmdldCBieSBkZWZhdWx0PyBNYXliZSBzd2l0Y2ggCj4gdG8KPiBh
YXJjaDY0IHRhcmdldCA/CgpGb3IgdGhpcyBraW5kIG9mIHNvbWV3aGF0IGxhcmdlciB0ZXN0cyAo
c3lzdGVtZCwgcHl0aG9uLCAuLi4pLCBJIGFncmVlIAp3ZQpjb3VsZCBzd2l0Y2ggdG8gYWFyY2g2
NCB2aXJ0IG1hY2hpbmUuIEl0IHN1cHBvcnRzIG1vcmUgbWVtb3J5LCBhbmQgCmV4ZWN1dGlvbgp3
aWxsIHByb2JhYmx5IGJlIGZhc3RlciB0b28uCgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9hOWRmMjA2MTkwZTUzMTY4MDhiOTAzMTRlNDI1NGJh
OWU4NDllNDAzCj4gKGZpcnN0IHN3aXRjaCB0byBleHQyIGhhcHBlbmVkIGluIDIwMjIpCj4gCj4g
V2Ugbm93IGhhdmUgbWFueSB0ZXN0cyBidWlsZGluZyB0aGVpciBvd24gYWFyY2g2NCBrZXJuZWwg
c2luY2Ugd2UgZG9uJ3QgCj4gaGF2ZSBhCj4gcHJlYnVpbHQgYWFyY2g2NCBrZXJuZWwgeWV0Lgo+
IAo+IFRob3VnaHRzPwoKSSB3b3VsZCBhbHNvIGJlIGluIGZhdm9yIHRvIGFkZCBhIHByZWJ1aWx0
IGtlcm5lbCB3aXRoIGFhcmNoNjQgCmRlZmNvbmZpZy4KVG8ga2VlcCBpdCBhbGlnbmVkIHdpdGgg
dGhlIG90aGVyIGFybXY1LzcsIHdlIHNob3VsZCBwcm9iYWJseSBhZGQgYSAKc2NyaXB0CndpdGhp
bmcgdGhlIEJ1aWxkcm9vdCBzb3VyY2UgdGhhdCByZWdlbmVyYXRlIHRob3NlIChhbmQgYWxzbyB0
cmFjayB0aGVpcgprZXJuZWwgY29uZmlncykuCgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KCkJl
c3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
