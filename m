Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC48CC83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 21:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB4F61526;
	Wed, 16 Jul 2025 21:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biMaiIhXtnRD; Wed, 16 Jul 2025 21:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B6BA61519
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B6BA61519;
	Wed, 16 Jul 2025 21:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A910C234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E8CD83F52
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqV-uJ3BhOv1 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 21:09:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B35F583EE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B35F583EE4
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B35F583EE4
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 21:09:01 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b] (unknown
 [IPv6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 4D3D3C0E09;
 Wed, 16 Jul 2025 23:08:58 +0200 (CEST)
Message-ID: <25430fea-b185-436e-8f88-b53f4fe04673@grenoble.cnrs.fr>
Date: Wed, 16 Jul 2025 23:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Buildroot development <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
 <8c5d92c3-172b-405e-8711-1b561c7ae7b1@grenoble.cnrs.fr>
 <20250716203906.GA9246@pevik>
Content-Language: en-US, fr
In-Reply-To: <20250716203906.GA9246@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1752700138;
 bh=7d2Cut1mCx/ihML3SrlG02/FsocQ4MrBlP1lUWzZ9Tg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JN8bTU5HEcK65laqad1IackAH7s9+aPIU5EFE/oFXYERrabT+DqIcYgaU69uBgaMg
 I7GJ3LrtVSxtCdazaGBEUJ2kK24KzIfSc4qkVRLI0zFnRJKMfq/PfzYycx7Jic9QID
 YRjwkD4P8tZFKky0a02Luycs44ikq779pIFlbTDtzA/1efWoQJNxcjVg70kVxjiIR7
 b7nfS/R8Xnu5qH6wpIprJmlsvlOj5vjUA098mmYyrZmnSc/QqWprlC/RvM7M3yXixA
 bMFI+zD+EIu53ysdihalzxV86m9o0gdWexpMopXbY/PbnF7lv+oALrtt4gCaAy3U6h
 h2H8s7w351uUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=JN8bTU5H
Subject: Re: [Buildroot] [PATCH v2 1/4] support/kconfig/patches: make all
 patches quilt-friendly
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTYvMDcvMjAyNSAyMjozOSwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSBFZGdhciwKPiAKPj4g
QWNjb3JkaW5nIHRvIHN1cHBvcnQva2NvbmZpZy9SRUFETUUuYnVpbGRyb290LCB0aGUgcGF0Y2hl
cyBpbgo+PiBzdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8gYXJlIG1lYW50IHRvIGJlIGFwcGxpZWQg
YnkgcXVpbHQuIEhvd2V2ZXIsIHR3bwo+PiBvZiB0aG9zZSBwYXRjaGVzIGFyZSBpbiBnaXQgZm9y
bWF0LCB3aGljaCBtYWtlcyBxdWlsdCBlcnJvciBvdXQgd2l0aDoKPiAKPj4gICAgIEFwcGx5aW5n
IHBhdGNoIHBhdGNoZXMvMjIta2NvbmZpZy1seGRpYWxvZy1maXgtY2hlY2std2l0aC1HQ0MxNC5w
YXRjaAo+PiAgICAgY2FuJ3QgZmluZCBmaWxlIHRvIHBhdGNoIGF0IGlucHV0IGxpbmUgMzIKPj4g
ICAgIFsuLi5dCj4+ICAgICBObyBmaWxlIHRvIHBhdGNoLiAgU2tpcHBpbmcgcGF0Y2guCj4gCj4+
IEZpeCB0aGUgZm9ybWF0IHRvIG1ha2UgcXVpbHQgaGFwcHkuCj4gCj4gSG93IGFib3V0IHVzaW5n
ICdnaXQgcXVpbHRpbXBvcnQnIGluc3RlYWQ/CgpJIGRpZG4ndCBrbm93IGFib3V0IOKAnGdpdCBx
dWlsdGltcG9ydOKAnS4gSSBndWVzcwpzdXBwb3J0L2tjb25maWcvUkVBRE1FLmJ1aWxkcm9vdCBj
b3VsZCBiZSByZXdyaXR0ZW4gdG8gdXNlIGl0LCBhbHRob3VnaAp0aGUgZmFjdCB0aGF0IOKAnGdp
dCBxdWlsdGltcG9ydOKAnSBjcmVhdGVzIGNvbW1pdHMgbWF5IHNvbWV3aGF0IGNvbXBsaWNhdGUK
dGhlIHByb2NlZHVyZSBkZXNjcmliZWQgdGhlcmUuCgpSZWdhcmRzLAoKRWRnYXIuCgo+IEtpbmQg
cmVnYXJkcywKPiBQZXRyCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBn
cmVub2JsZS5jbnJzLmZyPgo+PiAtLS0KPj4gIC4uLmNvbmZpZy1seGRpYWxvZy1maXgtY2hlY2st
d2l0aC1HQ0MxNC5wYXRjaCB8IDExICsrKy0tLS0KPj4gIC4uLm9uZmlnLW1uLWNvbmYtaGFuZGxl
LWJhY2tzcGFjZS1ILWtleS5wYXRjaCB8IDMxICsrKysrKysrKy0tLS0tLS0tLS0KPj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gCj4+IGRpZmYg
LS1naXQgYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMi1rY29uZmlnLWx4ZGlhbG9nLWZpeC1j
aGVjay13aXRoLUdDQzE0LnBhdGNoIGIvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjIta2NvbmZp
Zy1seGRpYWxvZy1maXgtY2hlY2std2l0aC1HQ0MxNC5wYXRjaAo+PiBpbmRleCA0MTA4MWJiNDVk
Li5lZGNjODU3MTkwIDEwMDY0NAo+PiAtLS0gYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMi1r
Y29uZmlnLWx4ZGlhbG9nLWZpeC1jaGVjay13aXRoLUdDQzE0LnBhdGNoCj4+ICsrKyBiL3N1cHBv
cnQva2NvbmZpZy9wYXRjaGVzLzIyLWtjb25maWctbHhkaWFsb2ctZml4LWNoZWNrLXdpdGgtR0ND
MTQucGF0Y2gKPj4gQEAgLTI1LDEwICsyNSwxMCBAQCBUZXN0ZWQtYnk6IFBldHIgVm9yZWwgPHBl
dHIudm9yZWxAZ21haWwuY29tPgo+PiAgIGtjb25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cu
c2ggfCAyICstCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4+IC1kaWZmIC0tZ2l0IGEva2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxvZy5z
aCBiL2tjb25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKPj4gLWluZGV4IDE2Y2Q5YTMx
ODYuLjI3ZDZjMzBhNTcgMTAwNzU1Cj4+IC0tLS0gYS9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4
ZGlhbG9nLnNoCj4+IC0rKysgYi9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoCj4+
ICtJbmRleDoga2NvbmZpZy5uZXcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKPj4gKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KPj4gKy0tLSBrY29uZmlnLm9yaWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKPj4g
KysrKyBrY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoCj4+ICBAQCAtNDgsNyArNDgs
NyBAQCB0cmFwICJybSAtZiAkdG1wIiAwIDEgMiAzIDE1Cj4+ICAgY2hlY2soKSB7Cj4+ICAgICAg
ICAgICAkY2MgLXggYyAtIC1vICR0bXAgMj4vZGV2L251bGwgPDwnRU9GJwo+PiBAQCAtMzgsNiAr
MzgsMyBAQCBpbmRleCAxNmNkOWEzMTg2Li4yN2Q2YzMwYTU3IDEwMDc1NQo+PiAgIEVPRgo+PiAg
IAlpZiBbICQ/ICE9IDAgXTsgdGhlbgo+PiAgIAkgICAgZWNobyAiICoqKiBVbmFibGUgdG8gZmlu
ZCB0aGUgbmN1cnNlcyBsaWJyYXJpZXMgb3IgdGhlIiAgICAgICAxPiYyCj4+IC0tLSAKPj4gLTIu
NDQuMAo+PiAtCj4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMy1rY29u
ZmlnLW1uLWNvbmYtaGFuZGxlLWJhY2tzcGFjZS1ILWtleS5wYXRjaCBiL3N1cHBvcnQva2NvbmZp
Zy9wYXRjaGVzLzIzLWtjb25maWctbW4tY29uZi1oYW5kbGUtYmFja3NwYWNlLUgta2V5LnBhdGNo
Cj4+IGluZGV4IDZlMzIxMTVmNzAuLmY3MmY5ZjMzOWIgMTAwNjQ0Cj4+IC0tLSBhL3N1cHBvcnQv
a2NvbmZpZy9wYXRjaGVzLzIzLWtjb25maWctbW4tY29uZi1oYW5kbGUtYmFja3NwYWNlLUgta2V5
LnBhdGNoCj4+ICsrKyBiL3N1cHBvcnQva2NvbmZpZy9wYXRjaGVzLzIzLWtjb25maWctbW4tY29u
Zi1oYW5kbGUtYmFja3NwYWNlLUgta2V5LnBhdGNoCj4+IEBAIC0xNiwxMSArMTYsMTEgQEAgU2ln
bmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNv
bT4KPj4gICBrY29uZmlnL25jb25mLmd1aS5jICAgICAgICAgfCAzICsrLQo+PiAgIDMgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+PiAtZGlmZiAtLWdp
dCBhL2tjb25maWcvbHhkaWFsb2cvaW5wdXRib3guYyBiL2tjb25maWcvbHhkaWFsb2cvaW5wdXRi
b3guYwo+PiAtaW5kZXggNjExOTQ1NjExYmY4Li4xZGNmYjI4OGVlNjMgMTAwNjQ0Cj4+IC0tLS0g
YS9rY29uZmlnL2x4ZGlhbG9nL2lucHV0Ym94LmMKPj4gLSsrKyBiL2tjb25maWcvbHhkaWFsb2cv
aW5wdXRib3guYwo+PiAtQEAgLTExMyw3ICsxMTMsOCBAQCBpbnQgZGlhbG9nX2lucHV0Ym94KGNv
bnN0IGNoYXIgKnRpdGxlLCBjb25zdCBjaGFyICpwcm9tcHQsIGludCBoZWlnaHQsIGludCB3aWR0
aAo+PiArSW5kZXg6IGtjb25maWcvbHhkaWFsb2cvaW5wdXRib3guYwo+PiArPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
PiArLS0tIGtjb25maWcub3JpZy9seGRpYWxvZy9pbnB1dGJveC5jCj4+ICsrKysga2NvbmZpZy9s
eGRpYWxvZy9pbnB1dGJveC5jCj4+ICtAQCAtMTI2LDcgKzEyNiw4IEBAIGludCBkaWFsb2dfaW5w
dXRib3goY29uc3QgY2hhciAqdGl0bGUsIGNvbnN0IGNoYXIgKnByb21wdCwgaW50IGhlaWdodCwg
aW50IHdpZHRoCj4+ICAgCQkJY2FzZSBLRVlfRE9XTjoKPj4gICAJCQkJYnJlYWs7Cj4+ICAgCQkJ
Y2FzZSBLRVlfQkFDS1NQQUNFOgo+PiBAQCAtMzAsMTAgKzMwLDEwIEBAIGluZGV4IDYxMTk0NTYx
MWJmOC4uMWRjZmIyODhlZTYzIDEwMDY0NAo+PiAgIAkJCQlpZiAocG9zKSB7Cj4+ICAgCQkJCQl3
YXR0cnNldChkaWFsb2csIGRsZy5pbnB1dGJveC5hdHIpOwo+PiAgIAkJCQkJaWYgKGlucHV0X3gg
PT0gMCkgewo+PiAtZGlmZiAtLWdpdCBhL2tjb25maWcvbmNvbmYuYyBiL2tjb25maWcvbmNvbmYu
Ywo+PiAtaW5kZXggYTQ2NzBmNGU4MjVhLi5hYzkyYzBkZWQ2YzUgMTAwNjQ0Cj4+IC0tLS0gYS9r
Y29uZmlnL25jb25mLmMKPj4gLSsrKyBiL2tjb25maWcvbmNvbmYuYwo+PiArSW5kZXg6IGtjb25m
aWcvbmNvbmYuYwo+PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiArLS0tIGtjb25maWcub3JpZy9uY29uZi5jCj4+
ICsrKysga2NvbmZpZy9uY29uZi5jCj4+ICBAQCAtMTA0OCw3ICsxMDQ4LDcgQEAgc3RhdGljIGlu
dCBkb19tYXRjaChpbnQga2V5LCBzdHJ1Y3QgbWF0Y2hfc3RhdGUgKnN0YXRlLCBpbnQgKmFucykK
Pj4gICAJCXN0YXRlLT5tYXRjaF9kaXJlY3Rpb24gPSBGSU5EX05FWFRfTUFUQ0hfVVA7Cj4+ICAg
CQkqYW5zID0gZ2V0X21leHRfbWF0Y2goc3RhdGUtPnBhdHRlcm4sCj4+IEBAIC00MywxMSArNDMs
MTEgQEAgaW5kZXggYTQ2NzBmNGU4MjVhLi5hYzkyYzBkZWQ2YzUgMTAwNjQ0Cj4+ICAgCQlzdGF0
ZS0+cGF0dGVybltzdHJsZW4oc3RhdGUtPnBhdHRlcm4pLTFdID0gJ1wwJzsKPj4gICAJCWFkal9t
YXRjaF9kaXIoJnN0YXRlLT5tYXRjaF9kaXJlY3Rpb24pOwo+PiAgIAl9IGVsc2UKPj4gLWRpZmYg
LS1naXQgYS9rY29uZmlnL25jb25mLmd1aS5jIGIva2NvbmZpZy9uY29uZi5ndWkuYwo+PiAtaW5k
ZXggN2JlNjIwYTFmY2RiLi43N2Y1MjVhODYxN2MgMTAwNjQ0Cj4+IC0tLS0gYS9rY29uZmlnL25j
b25mLmd1aS5jCj4+IC0rKysgYi9rY29uZmlnL25jb25mLmd1aS5jCj4+IC1AQCAtNDM5LDcgKzQz
OSw4IEBAIGludCBkaWFsb2dfaW5wdXRib3goV0lORE9XICptYWluX3dpbmRvdywKPj4gK0luZGV4
OiBrY29uZmlnL25jb25mLmd1aS5jCj4+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+ICstLS0ga2NvbmZpZy5vcmln
L25jb25mLmd1aS5jCj4+ICsrKysga2NvbmZpZy9uY29uZi5ndWkuYwo+PiArQEAgLTQ0MCw3ICs0
NDAsOCBAQCBpbnQgZGlhbG9nX2lucHV0Ym94KFdJTkRPVyAqbWFpbl93aW5kb3csCj4+ICAgCQlj
YXNlIEtFWV9GKEZfRVhJVCk6Cj4+ICAgCQljYXNlIEtFWV9GKEZfQkFDSyk6Cj4+ICAgCQkJYnJl
YWs7Cj4+IEBAIC01Nyw2ICs1NywzIEBAIGluZGV4IDdiZTYyMGExZmNkYi4uNzdmNTI1YTg2MTdj
IDEwMDY0NAo+PiAgIAkJY2FzZSBLRVlfQkFDS1NQQUNFOgo+PiAgIAkJCWlmIChjdXJzb3JfcG9z
aXRpb24gPiAwKSB7Cj4+ICAgCQkJCW1lbW1vdmUoJnJlc3VsdFtjdXJzb3JfcG9zaXRpb24tMV0s
Cj4+IC0tLSAKPj4gLTIuNDguMQo+PiAtCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
