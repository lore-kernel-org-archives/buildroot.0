Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CC0CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 19:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 820E680D90;
	Thu, 16 Oct 2025 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmC5qg-XTnMh; Thu, 16 Oct 2025 19:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B515880D8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B515880D8D;
	Thu, 16 Oct 2025 19:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC175968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D244C80D8D
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHOSfWVoNJWc for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 19:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A430780D8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A430780D8B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A430780D8B
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:37:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DB29419F593;
 Thu, 16 Oct 2025 21:37:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Oct 2025 21:37:50 +0200
MIME-Version: 1.0
Date: Thu, 16 Oct 2025 21:37:50 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Titouan Christophe
 <titouan.christophe@mind.be>, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20251015102331.83657-1-vincent.stehle@arm.com>
References: <20251015102331.83657-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d11b98d9e16ff56ff745af8d4c13a1cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760643474;
 bh=e66ABw9ip4C2uAr+BKe+xSuBq+tBroy75TI3toKOdVQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NCAWrkkZfqc6q4e6lTbmYgwrvn3wQGgB4jSIVCRtrIV2+IQKmld6QPh/293dUdt/r
 hxhn3XqBrBKcmY4JQNzLvPFwxxZwStH7fV+pgeW/ETMOPpWwSdXUVUsw2qGK6SDp0x
 eM0g1Dz26LiomrOgMKkG1xU1ByHAFm480AJUtfhMo4p4HldmqE6HVWp5UeLuG8HMBO
 fO73eIDLZLucbo+f0JeELhKBUU+FpoVZl57qjLtspRowHkj8CcoNsw5hSKUS5o8/zS
 DDcw6LHGJ3c/OQ5WqIRPC3A0RPoaaRe9msPTwI+XjLsOpOIJXx23np5IDWyc2KRLBh
 e0QJI1TB6eY2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NCAWrkkZ
Subject: Re: [Buildroot] [PATCH v2] support/testing: test_xen: add networking
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

T24gMTUvMTAvMjAyNSAxMjoyMywgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IEVuaGFuY2UgdGhl
IFhlbiBweXRob24gdGVzdHMgdG8gZXhlcmNpc2UgbmV0d29ya2luZzoKPiAKPiAtIEFkZCB0aGUg
bmV0d29ya2luZyBzdXBwb3J0IHdlIG5lZWQgdG8gdGhlIExpbnV4IGtlcm5lbCAKPiBjb25maWd1
cmF0aW9ucy4KPiAtIEFkZCBhIHZpcnR1YWwgbmV0d29yayBpbnRlcmZhY2UgdG8gdGhlIFhlbiBk
b20xIGNvbmZpZ3VyYXRpb25zLgo+IC0gVXBkYXRlIHRoZSB0ZXN0IGluIHRoZSBmb2xsb3dpbmcg
d2F5Ogo+ICAgKiBTdGFydCB0aGUgZW11bGF0b3Igd2l0aCByZXN0cmljdGVkIG5ldHdvcmtpbmcu
Cj4gICAqIENyZWF0ZSBhIG5ldHdvcmsgYnJpZGdlIGluIGRvbTAuCj4gICAqIENoZWNrIHRoYXQg
bmV0d29ya2luZyBpcyBmdW5jdGlvbmFsIGluIGJvdGggZG9tYWlucyBieSBwaW5nJ2luZyB0aGUK
PiAgICAgZ2F0ZXdheS4KPiAgIChSZWZlciBhbHNvIHRvIHRoZSBkaWFncmFtIGluIHRoZSBweXRo
b24gc2NyaXB0LikKPiAtIFdoaWxlIGF0IGl0LCBidW1wIExpbnV4IGtlcm5lbCB0byA2LjE3LjEg
YW5kIFUtQm9vdCB0byAyMDI1LjA3Lgo+ICAgV2UgYWxzbyBuZWVkIHRvIGFkanVzdCB0aGUgRFRC
IGFkZHJlc3MgaW4gdGhlIEFybSAzMmIgVS1Cb290IHNjcmlwdCAKPiB0bwo+ICAgYWNjb21tb2Rh
dGUgdGhlIG5ldyBVLUJvb3QgdmVyc2lvbiwgd2hpY2ggZG9lcyBub3QgaGF2ZSBlbm91Z2ggZnJl
ZSAKPiBzcGFjZQo+ICAgYXJvdW5kIHRoZSBjb250cm9sIERUQiBhbnltb3JlLgo+ICAgV2UgZGlz
YWJsZSBJUHY2IGluIGJvdGgga2VybmVsIGNvbmZpZ3VyYXRpb25zIHRvIG1ha2UgdGhlIDMyYiB0
ZXN0IAo+IHBhc3MKPiAgIG9uIGdpdGxhYiBDSS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50
IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
