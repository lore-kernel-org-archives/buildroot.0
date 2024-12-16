Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CF4E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4011840296;
	Mon, 16 Dec 2024 21:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXTP-cI1xDb1; Mon, 16 Dec 2024 21:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E862C40298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E862C40298;
	Mon, 16 Dec 2024 21:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3E5EC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE24B4024C
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKCz23Uiu7Oc for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C89EB40191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C89EB40191
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C89EB40191
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:42:54 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:f91e:6b33:afd1:eb35] (unknown
 [IPv6:2a01:e0a:12:eba0:f91e:6b33:afd1:eb35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 35F62BFBF1;
 Mon, 16 Dec 2024 22:42:51 +0100 (CET)
Message-ID: <1320efbb-ea34-4eb4-8206-d656896e5870@grenoble.cnrs.fr>
Date: Mon, 16 Dec 2024 22:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 Buildroot development <buildroot@buildroot.org>
Cc: Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Michael Walle <mwalle@kernel.org>
References: <cc0e87ea-5830-4b14-86eb-b021bc5b254a@grenoble.cnrs.fr>
 <616c0945-34d1-484b-814d-f1199b83377c@mind.be>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <616c0945-34d1-484b-814d-f1199b83377c@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1734385371;
 bh=9EQN5AIVrxhtr6Y0h/kKtBk/Nxa/EfQaCe5nZPj3DgA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ejdvTR9MUDC5NkHrB6qfyOq9KFL+ddgQjzCHqXwSHnGYuye+wQ435NSbWorwnU48O
 zS38alIEnoEb0YYk/nMNYx/xb4S8r3USxk4uuXJeBs9L5a6//ne3nGlcxzMKq4ub9o
 2C4VjTIPg407a36H89gH01Jt8v84swoPV3OdV97GLtDZst+qwVUd8FVyfVuu0niCrb
 tAlSIhqW8RVngJqTlJ1cYBJmWuwDC/FnSPKnlEBC3PcTUD/ExG0a6xg0AnbIxWX2nH
 e8XJJ7LLkUj77KTYCEiL+i5gvsUAvgVZFyqDHhKc+o75N5gJWdb0RMk3H8EIcKaoCR
 DcUmgB3y9n3NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=ejdvTR9M
Subject: Re: [Buildroot] [PATCH 1/1] linux: make out-of-tree DTS work with
 newest kernels
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+IMKg
SGkgRWRnYXIsCj4gCj4gT24gMTYvMTIvMjAyNCAxNzozNywgRWRnYXIgQm9uZXQgd3JvdGU6Cj4+
IFNpbmNlIExpbnV4IDYuMTIgKGNvbW1pdCBlN2UyOTQxMzAwZDIsICJrYnVpbGQ6IHNwbGl0IGRl
dmljZSB0cmVlIGJ1aWxkCj4+IHJ1bGVzIGludG8gc2NyaXB0cy9NYWtlZmlsZS5kdGJzIiksIHRo
ZSBrZXJuZWwgYnVpbGQgcHJvY2VzcyBkb2VzIG5vdAo+PiBidWlsZCB0aGUgRFRCcyBmcm9tIHRo
ZSBzb3VyY2UgZmlsZXMgbGlzdGVkIGluCj4+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19Q
QVRILlsxXSBUaGlzIGlzIGJlY2F1c2UgaXQgZXhwZWN0cyBhbGwgdGhlCj4+IERUUyBmaWxlcyB0
byBsaXZlIGluIHZlbmRvci1zcGVjaWZpYyBzdWJkaXJlY3RvcmllcyBvZgo+PiBhcmNoLyRBUkNI
L2Jvb3QvZHRzLyAsIHdoZXJlYXMgQnVpbGRyb290IGRyb3BzIHRoZW0gaW4gdGhlIHRvcCBkdHMK
Pj4gZGlyZWN0b3J5Lgo+Pgo+PiBGdWxmaWxsaW5nIHRoaXMga2VybmVsIGV4cGVjdGF0aW9uIHdv
dWxkIHJlcXVpcmUgYSBuZXcgY29uZmlndXJhdGlvbgo+PiBwYXJhbWV0ZXIgZm9yIHRoZSBuYW1l
IG9mIHRoZSBhcHByb3ByaWF0ZSB2ZW5kb3Igc3ViZGlyZWN0b3J5LiBJdCB3b3VsZAo+PiBhbHNv
IHJlcXVpcmUgY2hhbmdpbmcgdGhlIHJlbGF0aXZlIHBhdGhzIHRvIGluY2x1ZGVkIC5kdHNpIGZp
bGVzLgo+Pgo+PiBMZXQncyBhZGQgaW5zdGVhZCBhIHJ1bGUgdG8gdGhlIHRvcCBkdHMvTWFrZWZp
bGUgZm9yIGVhY2ggRFRCIHdlIHdhbnQgdG8KPj4gYnVpbGQuIFRoaXMgYXZvaWRzIGJyZWFraW5n
IHVzZXIncyBvdXQtb2YtdHJlZSBjb25maWd1cmF0aW9ucy4KPiAKPiDCoElzIHRoaXMgZ29pbmcg
dG8gd29yayBmb3Iga2VybmVscyA8IDYuMTIgYXMgd2VsbD8gMy4wIGlzIHRoZSBvbGRlc3Qgb25l
IHdlIChtb3JlIG9yIGxlc3MpIHN1cHBvcnQgKGFuZCBpdCBoYXMgZHRzIGFscmVhZHkgZm9yIHBv
d2VycGMpLgoKSSBzdWNjZXNzZnVsbHkgYnVpbGQtdGVzdGVkIHRoaXMgcGF0Y2ggd2l0aAphY21l
c3lzdGVtc19hY3F1YV9hNV81MTJtYl9kZWZjb25maWcgKGtlcm5lbCA2LjYuMzApLiBUaGVuIEkg
dXBncmFkZWQKdGhhdCBkZWZjb25maWcgdG8gdjYuMTIuNSBhbmQgdGVzdGVkIGFnYWluLgoKPj4g
WzFdIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQt
T2N0b2Jlci83NjU0NjMuaHRtbAo+Pgo+PiBSZXBvcnRlZC1ieTogQ2hyaXMgUGFja2hhbSA8anVk
Z2UucGFja2hhbUBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25l
dEBncmVub2JsZS5jbnJzLmZyPgo+PiAtLS0KPj4gwqAgbGludXgvbGludXgubWsgfCAxICsKPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9saW51
eC9saW51eC5tayBiL2xpbnV4L2xpbnV4Lm1rCj4+IGluZGV4IDFkM2Q4ZmZmYTYuLjM1ZjM1OGM1
NmYgMTAwNjQ0Cj4+IC0tLSBhL2xpbnV4L2xpbnV4Lm1rCj4+ICsrKyBiL2xpbnV4L2xpbnV4Lm1r
Cj4+IEBAIC01MTcsNiArNTE3LDcgQEAgZGVmaW5lIExJTlVYX0JVSUxEX0NNRFMKPj4gwqDCoMKg
wqDCoCAkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfR0NDX1BMVUdJTlMpCj4+IMKg
wqDCoMKgwqAgJChmb3JlYWNoIGR0cywkKGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fRFRTX1BBVEgpKSwgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3AgLWYgJChkdHMpICQo
TElOVVhfQVJDSF9QQVRIKS9ib290L2R0cy8KPj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8gImR0Yi15
ICs9ICQobm90ZGlyICQoZHRzOiUuZHRzPSUuZHRiKSkiID4+ICQoTElOVVhfQVJDSF9QQVRIKS9i
b290L2R0cy9NYWtlZmlsZQo+IAo+IMKgVGhpcyBpcyBnb2luZyB0byBjb250aW51ZSBhZGRpbmcg
dGhhdCBsaW5lIHdoZW4gd2UgcmVidWlsZC4gSSB0aGluayB0aGUgYmVzdCBzb2x1dGlvbiBpcyB0
byBkbyBpdCBpbiBhIFBPU1RfUEFUQ0hfSE9PSyAtIGFuZCBzaW5jZSB3ZSBhbHNvIHdhbnQgdG8g
ZG8gaXQgaW4gdGhlIE9WRVJSSURFX1NSQ0RJUiBjYXNlLCB0aGUgc2FtZSBjb2RlIHNob3VsZCBi
ZSBpbmNsdWRlZCBhcyBhIFBPU1RfUlNZTkNfSE9PSyBhcyB3ZWxsLgo+IAo+IMKgVGhhdCBhbHNv
IGNvbnZlbmllbnRseSBtYWtlcyBpdCBlYXN5IHRvIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3
aHkgd2UgZG8gdGhpcyAoY2ZyLiAiZHRicyBtb3ZlZCBmcm9tIGFyY2gvJEFSQ0gvYm9vdCB0byBh
cmNoLyRBUkNIL2Jvb3QvZHRzIHNpbmNlIDMuOC1yYzEiIGNvbW1lbnRzKS4KPiAKPiDCoEFsc28s
IHdlIGRvbid0IHVzZSB0aGUgJChmb286JS54PSUueSkgY29uc3RydWN0LCBpbnN0ZWFkIHdlIHVz
ZSBjb25zdHJ1Y3QgJChwYXRzdWJzdCAlLmR0cywlLmR0YiwkKGR0cykpCgpVbmRlcnN0b29kLiBJ
J2xsIHJlc3BpbiBmb2xsb3dpbmcgdGhlc2Ugc3VnZ2VzdGlvbi4KClJlZ2FyZHMsIGFuZCB0aGFu
a3MgZm9yIHRoZSBxdWljayByZXZpZXchCgpFZGdhci4KCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0
Cj4+IMKgwqDCoMKgwqAgKQo+PiDCoMKgwqDCoMKgICQoTElOVVhfTUFLRV9FTlYpICQoQlIyX01B
S0UpICQoTElOVVhfTUFLRV9GTEFHUykgLUMgJChARCkgYWxsCj4+IMKgwqDCoMKgwqAgJChMSU5V
WF9NQUtFX0VOVikgJChCUjJfTUFLRSkgJChMSU5VWF9NQUtFX0ZMQUdTKSAtQyAkKEBEKSAkKExJ
TlVYX1RBUkdFVF9OQU1FKQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
