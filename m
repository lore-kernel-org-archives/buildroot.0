Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D070C25B79
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 15:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A933406C4;
	Wed, 15 May 2024 15:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKODBTZaJcPl; Wed, 15 May 2024 15:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FF33406DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF33406DF;
	Wed, 15 May 2024 15:31:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A96791BF841
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 960DC41AFE
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yz03HO7j0hx6 for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 15:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5348341AD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5348341AD7
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5348341AD7
 for <buildroot@buildroot.org>; Wed, 15 May 2024 15:31:19 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:6593:bfe:d2e6:b6da] (unknown
 [IPv6:2a01:e0a:12:eba0:6593:bfe:d2e6:b6da])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 6FFE2BFDEC;
 Wed, 15 May 2024 17:31:16 +0200 (CEST)
Message-ID: <4c9e89d1-48f6-48a7-b7af-0d429e2256cc@grenoble.cnrs.fr>
Date: Wed, 15 May 2024 17:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
To: buildroot@buildroot.org
References: <5647a701-8c5a-4ce6-92c3-3c252e1cd91b@grenoble.cnrs.fr>
Content-Language: en-US
In-Reply-To: <5647a701-8c5a-4ce6-92c3-3c252e1cd91b@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1715787076;
 bh=9l8zNpN2solcynQnbICQdvbMTDXwUlNAyLiQ+zgorVs=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=bNXctxNUiNz8VetWByCGQenZZc46siOd6qIxWPUhx6k2Afa+uUu+P7t4hlDomTHbW
 lj0MV78WvyHKMr0kcUjqdZZSIIKCwfg8LVzA06hPcqgpMyyPrOrf+x4wXp5+9KjGr5
 U9QG8qJESrS6lge0HKivmeFSlSZrjRnXSScuZEcb0pz1gVPTaMdYdG1jtTrrVXIWrZ
 rQ+TWt64Ku03ADJb7fytARKQ9Qrpni0y3WqvnrAUWbwICc7BCDvj3gEEQXwsllQ0UP
 pRk073lI1EFhYpiflNzXgIC4ROlZB36hMzBiSu2g3JzQ6WKCb0ahPRKEYosy9KLn9h
 iAoJtMxw4bEFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=bNXctxNU
Subject: Re: [Buildroot] Nginx fails to build with GCC 14
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYWxsIQoKT24gMjAyNC0wNS0xNCwgSSB3cm90ZToKPiBCdWlsZGluZyBuZ2lueCB3aXRo
IEdDQyAxNCBmYWlscyBhdCB0aGUgY29uZmlndXJlIHN0ZXAgd2l0aDoKPgo+ICAgICAuL2NvbmZp
Z3VyZTogZXJyb3I6IGxpYmF0b21pY19vcHMgbGlicmFyeSB3YXMgbm90IGZvdW5kLgoKSXQgdHVy
bnMgb3V0IHRoZSBpc3N1ZSBpcyBpbiBhIHRpbnkgdGVzdCBwcm9ncmFtIHRoYXQgdGhlIGNvbmZp
Z3VyZQpzY3JpcHQgdHJpZXMgdG8gY29tcGlsZSBpbiBvcmRlciB0byBwcm9iZSBmb3IgdGhlIGF0
b21pY19vcHMgbGlicmFyeS4KVGhlIGNvbXBpbGF0aW9uIGZhaWxzIG9uIGFuIOKAnGluY29tcGF0
aWJsZSBwb2ludGVyIHR5cGXigJ0gZXJyb3IuIFVwIHRvCkdDQyAxMywgaW1wbGljaXRseSBjYXN0
aW5nIGJldHdlZW4gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZXMgb25seQppc3N1ZWQgYSB3YXJu
aW5nLiBTaW5jZSBHQ0MgMTQsIHRoaXMgaXMgYW4gZXJyb3IuWzFdCgpJIGZpeGVkIHRoZSBpc3N1
ZSB3aXRoIHRoZSBtZXRhLXBhdGNoIChwYXRjaCBhZGRpbmcgYSBwYXRjaCkgYmVsb3cuIE1heQpJ
IG5vdyBzdWJtaXQgdGhpcyB0byBidWlsZHJvb3Q/IFNob3VsZCBJIGluc3RlYWQgYXR0ZW1wdCB0
byB1cHN0cmVhbSB0aGUKaW5uZXIgcGF0Y2ggYmVmb3JlIHN1Ym1pdHRpbmcgaGVyZSB0aGUgbWV0
YS1wYXRjaD8gQW55IGNvbW1lbnRzIG9uIHRoZXNlCnBhdGNoZXMgYXJlIHdlbGNvbWUuCgpSZWdh
cmRzLAoKRWRnYXIuCgpbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtMTQvcG9ydGluZ190by5o
dG1sI2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzCgotLSA+OCAtLQpTdWJqZWN0OiBbUEFUQ0gg
MS8xXSBwYWNrYWdlL25naW54OiBmaXggY29tcGlsZSBlcnJvciBpbiBjb25maWd1cmUgc2NyaXB0
CgpCdWlsZGluZyB3aXRoIEdDQyAxNCBmYWlscyBhdCB0aGUgY29uZmlndXJlIHN0ZXAgd2l0aDoK
CiAgICAuL2NvbmZpZ3VyZTogZXJyb3I6IGxpYmF0b21pY19vcHMgbGlicmFyeSB3YXMgbm90IGZv
dW5kLgoKVGhlIGVycm9yIGlzIG5vdCBjYXVzZWQgYnkgYSBtaXNzaW5nIGxpYnJhcnksIGJ1dCBi
eSBhbiB1bnJlbGF0ZWQKImluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUiIGVycm9yIGluIHRoZSB0
ZXN0IHByb2dyYW06CgogICAgLi4uCiAgICBjaGVja2luZyBmb3IgYXRvbWljX29wcyBsaWJyYXJ5
CiAgICBvYmpzL2F1dG90ZXN0LmM6IEluIGZ1bmN0aW9uICdtYWluJzoKICAgIG9ianMvYXV0b3Rl
c3QuYzo5OjQ4OiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAxIG9mICdBT19jb21wYXJlX2FuZF9z
d2FwJyBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxlLXBvaW50
ZXItdHlwZXNdCgpUaGlzIHVzZWQgdG8gYmUgYSB3YXJuaW5nLCBidXQgaXQgaXMgYW4gZXJyb3Ig
c2luY2UgR0NDIDE0LlsxXQoKRml4IHRoaXMgYnkgcGF0Y2hpbmcgdGhlIHRlc3QgcHJvZ3JhbSBp
biBvcmRlciB0byB1c2UgdGhlIGNvcnJlY3QKcG9pbnRlciB0eXBlcy4KClsxXSBodHRwczovL2dj
Yy5nbnUub3JnL2djYy0xNC9wb3J0aW5nX3RvLmh0bWwjaW5jb21wYXRpYmxlLXBvaW50ZXItdHlw
ZXMKClNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgot
LS0KIC4uLml4LWNvbXBpbGUtZXJyb3ItaW4tY29uZmlndXJlLXNjcmlwdC5wYXRjaCB8IDQwICsr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uZ2lueC8wMDExLUZpeC1jb21waWxlLWVycm9yLWluLWNv
bmZpZ3VyZS1zY3JpcHQucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL25naW54LzAwMTEtRml4
LWNvbXBpbGUtZXJyb3ItaW4tY29uZmlndXJlLXNjcmlwdC5wYXRjaCBiL3BhY2thZ2Uvbmdpbngv
MDAxMS1GaXgtY29tcGlsZS1lcnJvci1pbi1jb25maWd1cmUtc2NyaXB0LnBhdGNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmY4MTYwYTFkYTIKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL25naW54LzAwMTEtRml4LWNvbXBpbGUtZXJyb3ItaW4tY29uZmlndXJlLXNj
cmlwdC5wYXRjaApAQCAtMCwwICsxLDQwIEBACitGcm9tIGUxYmNhYzgzN2Y2YWVhYmM0ZGRlY2Uw
NmVjYmNmMmJjY2E4ZGQ2NTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBFZGdhciBC
b25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KK0RhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTY6
MzU6MjcgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGNvbXBpbGUgZXJyb3IgaW4gY29uZmln
dXJlIHNjcmlwdAorCitCdWlsZGluZyB3aXRoIEdDQyAxNCBmYWlscyBhdCB0aGUgY29uZmlndXJl
IHN0ZXAgd2l0aDoKKworICAgIC4vY29uZmlndXJlOiBlcnJvcjogbGliYXRvbWljX29wcyBsaWJy
YXJ5IHdhcyBub3QgZm91bmQuCisKK1RoZSBlcnJvciBpcyBub3QgY2F1c2VkIGJ5IGEgbWlzc2lu
ZyBsaWJyYXJ5LCBidXQgYnkgYW4gdW5yZWxhdGVkCisiaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlw
ZSIgZXJyb3IgaW4gdGhlIHRlc3QgcHJvZ3JhbToKKworICAgIC4uLgorICAgIGNoZWNraW5nIGZv
ciBhdG9taWNfb3BzIGxpYnJhcnkKKyAgICBvYmpzL2F1dG90ZXN0LmM6IEluIGZ1bmN0aW9uICdt
YWluJzoKKyAgICBvYmpzL2F1dG90ZXN0LmM6OTo0ODogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQg
MSBvZiAnQU9fY29tcGFyZV9hbmRfc3dhcCcgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBl
IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQorCitGaXggdGhlIGVycm9yIGJ5IHVzaW5n
IHRoZSBjb3JyZWN0IHBvaW50ZXIgdHlwZXMuCisKK1NpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0
IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgorLS0tCisgYXV0by9saWIvbGliYXRvbWljL2NvbmYg
fCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisK
K2RpZmYgLS1naXQgYS9hdXRvL2xpYi9saWJhdG9taWMvY29uZiBiL2F1dG8vbGliL2xpYmF0b21p
Yy9jb25mCitpbmRleCBkMWU0ODRhLi4wZjEyYjljIDEwMDY0NAorLS0tIGEvYXV0by9saWIvbGli
YXRvbWljL2NvbmYKKysrKyBiL2F1dG8vbGliL2xpYmF0b21pYy9jb25mCitAQCAtMjAsNyArMjAs
NyBAQCBlbHNlCisgICAgICAgICAgICAgICAgICAgICAgICNpbmNsdWRlIDxhdG9taWNfb3BzLmg+
IgorICAgICBuZ3hfZmVhdHVyZV9wYXRoPQorICAgICBuZ3hfZmVhdHVyZV9saWJzPSItbGF0b21p
Y19vcHMiCistICAgIG5neF9mZWF0dXJlX3Rlc3Q9ImxvbmcgIG4gPSAwOworKyAgICBuZ3hfZmVh
dHVyZV90ZXN0PSJ2b2xhdGlsZSBzaXplX3QgIG4gPSAwOworICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoIUFPX2NvbXBhcmVfYW5kX3N3YXAoJm4sIDAsIDEpKQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIDE7CisgICAgICAgICAgICAgICAgICAgICAgIGlmIChBT19mZXRjaF9h
bmRfYWRkKCZuLCAxKSAhPSAxKQorLS0gCisyLjM0LjEKKwotLSAKMi4zNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
