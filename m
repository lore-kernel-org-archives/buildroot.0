Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DE4C83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 18:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E87EF81096;
	Tue, 15 Jul 2025 18:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWgRALw3CDQk; Tue, 15 Jul 2025 18:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE7680E94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE7680E94;
	Tue, 15 Jul 2025 18:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF824DF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFFD780D38
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DcCLFlfVpih for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 18:03:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C166D80E94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C166D80E94
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C166D80E94
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:03:01 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DC6562C83425;
 Tue, 15 Jul 2025 20:02:58 +0200 (CEST)
Message-ID: <d0473d32-8362-4c92-be5e-1cb82c370c4e@bubu1.eu>
Date: Tue, 15 Jul 2025 20:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>,
 buildroot@buildroot.org
Cc: Colin Foster <colin.foster@in-advantage.com>
References: <20250715160149.2886803-1-gero.schwaericke@sevenlab.de>
Content-Language: en-US
In-Reply-To: <20250715160149.2886803-1-gero.schwaericke@sevenlab.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752602579; bh=FSud9yo7bmh0EInrgb8bQHbGV371FMCW1OATUpqvSEg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=UdF//B6XzzBU/zPhdH5U6UUW0z+3D+ERvBjEzWGrYjZxeEn1k9at95PxUsMOfDqei
 aih4DghUpwdC/NuJkvLnefhBsGJoA43s7tZGtq9KyFcNhJPPCfDiuaZEpsUfZvue7X
 hcVjUZ2WJwJktkm0fhfItdZ4194jg7Wzst1tQAqNgla6mtJhL9fsTsRGO+aUboFhpj
 1VPl6e0uZ2PrrqnqWAsy269PFe5XmXxw9QgN3TjphEyqeGrM9ZECWLCyZgyKLRWvC5
 BUnOwCvWHwGF5qmaUbJkrGx78PdKiHjrydnNo5DlchMLpD1a0aiWL9TujEaitVtRm1
 ojpdqWVRr22Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=UdF//B6X
Subject: Re: [Buildroot] [PATCH] package/rauc-hawkbit-updater: fix missing
 user
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2VybywKCkkgZm91bmQgYWxtb3N0IGV4YWN0bHkgdGhpcyBjaGFuZ2UgaW4gb3VyIGxvY2Fs
IHBhdGNoZXMgcmVjZW50bHkgYnV0IApkaWRuJ3QgZ2V0IGFyb3VuZCB0byB1cHN0cmVhbWluZyB0
aGlzIHlldC4uLiBvb3BzLgoKU21hbGwgbm90ZSBiZWxvdyBmb3Igc29tZXRoaW5nIHRoYXQgc2hv
dWxkIHByb2JhYmx5IGJlIGNoYW5nZWQgZm9yIApjb25zaXN0ZW5jeS4KCk9uIDE1LjA3LjI1IDE4
OjAwLCBHZXJvIFNjaHfDpHJpY2tlIHdyb3RlOgo+IFN5c3RlbWQgc3VwcG9ydCBmb3IgdGhlIFJB
VUMgaGF3a2JpdCB1cGRhdGVyIHdhcyBhZGRlZCBpbgo+IAo+ICAgIDRhYTdhNGFkOGEgKHBhY2th
Z2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXI6IGFkZCBzeXN0ZW1kIG9wdGlvbmFsIGRlcGVuZGVuY3ks
IDIwMjQtMDctMTApCj4gCj4gVGhpcyBpbnN0YWxscyB0aGUgUkFVQyBoYXdrYml0IHVwZGF0ZXIg
c2VydmljZSwgd2hpY2ggZXhlY3V0ZXMgYXMgdXNlcgo+ICJyYXVjLWhhd2tiaXQiIFsxXSwgd2hp
Y2ggZG9lc24ndCBleGlzdCBieSBkZWZhdWx0Lgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20v
cmF1Yy9yYXVjLWhhd2tiaXQtdXBkYXRlci9ibG9iLzI3MTFjMGUwMjc4MWViOWQ5NzI4NWM4NzE5
N2YxYmFmZWY3NWQwZDEvc2NyaXB0L3JhdWMtaGF3a2JpdC11cGRhdGVyLnNlcnZpY2UKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvLnNjaHdhZXJpY2tlQHNldmVubGFi
LmRlPgoKUmV2aWV3ZWQtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1Pgo+
IC0tLQo+ICAgcGFja2FnZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQtdXBkYXRl
ci5tayB8IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3JhdWMtaGF3a2JpdC11cGRhdGVyL3JhdWMtaGF3a2JpdC11cGRh
dGVyLm1rIGIvcGFja2FnZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQtdXBkYXRl
ci5tawo+IGluZGV4IGRhMWMwMjBiYjYuLjVlZTg0MTRiOTEgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQtdXBkYXRlci5tawo+ICsrKyBiL3Bh
Y2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXIvcmF1Yy1oYXdrYml0LXVwZGF0ZXIubWsKPiBAQCAt
MTUsNiArMTUsMTAgQEAgUkFVQ19IQVdLQklUX1VQREFURVJfQ0ZMQUdTID0gJChUQVJHRVRfQ0ZM
QUdTKSAtc3RkPWM5OQo+ICAgaWZlcSAoJChCUjJfUEFDS0FHRV9TWVNURU1EKSx5KQo+ICAgUkFV
Q19IQVdLQklUX1VQREFURVJfREVQRU5ERU5DSUVTICs9IHN5c3RlbWQKPiAgIFJBVUNfSEFXS0JJ
VF9VUERBVEVSX0NPTkZfT1BUUyArPSAtRHN5c3RlbWQ9ZW5hYmxlZAo+ICsjIHJhdWMtaGF3a2Jp
dC11cGRhdGVyLnNlcnZpY2UgdXNlcyB0aGlzIHVzZXIgYW5kIGdyb3VwCj4gK2RlZmluZSBSQVVD
X0hBV0tCSVRfVVBEQVRFUl9VU0VSUwo+ICsJcmF1Yy1oYXdrYml0IC0xIHJhdWMtaGF3a2JpdCAt
MSAhIC0gLSAtIFJBVUMgSGF3a2JpdCBVcGRhdGVyCgpPdGhlciBfVVNFUlMgZGVmaW5pdGlvbnMg
aW4gYnVpbGRyb290IGFsbCB1c2UgKiBpbnN0ZWFkIG9mICEgZm9yIHRoZSAKcGFzc3dvcmQgZmll
bGQuIE5vdCBzdXJlIGlmIHRoYXQgbWFrZXMgYW55IGRpZmZlcmVuY2UgaW4gcGFzc3dvcmQgYnV0
IAooZnJvbSBzaGFkb3coNSkpIHRoZSBjb252ZW50aW9uIHNlZW1zIHRvIGJlIHRoYXQgdGhlICch
JyBwcmVmaXggaXMgCnNwZWNpZmljYWxseSBmb3IgbG9ja2VkIGFjY291bnRzLgoKPiArZW5kZWYK
PiAgIGVsc2UKPiAgIFJBVUNfSEFXS0JJVF9VUERBVEVSX0NPTkZfT1BUUyArPSAtRHN5c3RlbWQ9
ZGlzYWJsZWQKPiAgIGVuZGlmCgpCZXN0LApNYXJjdXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
