Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F92FC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 09:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B4F6110F;
	Wed,  6 Aug 2025 09:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znxZflBgtJmn; Wed,  6 Aug 2025 09:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59A156105D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59A156105D;
	Wed,  6 Aug 2025 09:57:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 164E531
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3B35844D1
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYkOELP8lOPE for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 09:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0584844D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0584844D2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0584844D2
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:57:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDB584329A;
 Wed,  6 Aug 2025 09:57:45 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 06 Aug 2025 11:57:45 +0200
Message-Id: <DBV97YP0K6IX.5WJ4MF4JBM8H@bootlin.com>
Cc: <buildroot@buildroot.org>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806-php-lua-v1-1-e1f524fed0a5@bootlin.com>
 <20250806105707.3db4f1e8@windsurf>
In-Reply-To: <20250806105707.3db4f1e8@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejieevgeejveefffekkeejhfeiteefkeekffduleefvdduudffvdejleffgefgvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754474266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugozIfIwwRoQSQVoVNk32ePTuFoooTI6VGdCq/FC6Mc=;
 b=NQJ/l/ECFQNPVAP9f0jYr2a/HhkL+j2yKbtfyszBP+snrXFaBF1fXp6vkN6G66rI4CVWi4
 le2UZGDzut5dK29FB6X69u5l9YdI4saleMJYnrd2Gb7ilcF5rrQZZZm0oj0iK1lfdKbphV
 d34F32P7Vkc2zfxGJe1haPucB+lyYkbTqi6UHsjc4bpU1IHO10CXNLIitEP4lkI+UBDGm1
 vHsX9fz+DmfY3fO6vXVtaWFJsolG20ETfjRnriQbQBPVy47yxctwodpEpldWtN2lqgSehS
 5HN2Bk/P4m6TvWHZLHgBYI/aGTLogJxZh0kTKtr0RmN6MYKTbGbwmGDU2hVh8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NQJ/l/EC
Subject: Re: [Buildroot] [PATCH] package/php-lua: fix build with GCC14
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gV2VkIEF1ZyA2LCAyMDI1IGF0IDEwOjU3IEFNIENFU1QsIFRob21hcyBQ
ZXRhenpvbmkgd3JvdGU6Cj4gSGVsbG8gQWxleGlzLAo+Cj4gT24gV2VkLCAwNiBBdWcgMjAyNSAx
MDoxMjo0OSArMDIwMAo+IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+IHdyb3RlOgo+Cj4+IE9uIEJ1aWxkcm9vdCAyMDI1LjAyLngsIHBocC1sdWEgYnVpbGQgZmFp
bHMgb24gdGhlIGZvbGxvd2luZyBlcnJvcjoKPgo+IEJ1aWxkcm9vdCAyMDI1LjAyLnggaXMgb25l
IHRoaW5nLCBidXQgZG8geW91IGFsc28gc2VlIHRoZSBzYW1lIGJ1aWxkCj4gaXNzdWUgb24gbWFz
dGVyPwoKWWVzLCBJIGhhdmUgdGhlIGJ1aWxkIGZhaWx1cmUgb24gdG9wIG9mIG1hc3RlciBhcyB3
ZWxsIChvbiB0b3Agb2YKMmZkNTIwYzhkNTJiICgicGFja2FnZS9nbG06IGJ1bXAgdmVyc2lvbiB0
byAxLjAuMSIpLCB0byBiZSBwcmVjaXNlKQo+Cj4gU2luY2UgdGhlcmUncyBubyBidWlsZCBmYWls
dXJlIGluIG91ciBhdXRvYnVpbGRlciAod2hpY2ggaXMga2luZCBvZgo+IHN1cnByaXNpbmcpLCBj
b3VsZCB5b3UgaW5jbHVkZSBpbiB0aGUgY29tbWl0IGxvZyBhIHNuaXBwZXQgb2YgYQo+IHJlYXNv
bmFibHkgbWluaW1hbCBkZWZjb25maWcgdGhhdCBleGhpYml0cyB0aGUgaXNzdWU/CgpTdXJlLCBJ
J2xsIGluY2x1ZGUgaXQgaW4gdGhlIG5leHQgcmV2aXNpb24uIEl0IGxvb2tzIGxpa2UgdGhpczoK
CkJSMl9hcm09eQpCUjJfY29ydGV4X2E5PXkKQlIyX0FSTV9FTkFCTEVfTkVPTj15CkJSMl9BUk1f
RU5BQkxFX1ZGUD15CkJSMl9BUk1fRlBVX05FT049eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkK
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKQlIyX1BBQ0tBR0VfTFVBPXkKQlIyX1BB
Q0tBR0VfUEhQPXkKQlIyX1BBQ0tBR0VfUEhQX0xVQT15CkJSMl9QQUNLQUdFX1BIUF9QRUNMX0RC
VVM9eQoKPiBBbHNvLCBkbyB5b3Uga25vdyB3aGF0IGNhdXNlZCB0aGUgZmFpbHVyZT8gSSB3b3Vs
ZCBzdXNwZWN0IGFuIHVwZGF0ZSBvZgo+IFBIUC4KCklmIEkgdHJ1c3QgdGhlIHVwc3RyZWFtIHBl
bmRpbmcgUFIsIHRoZSBmYWlsdXJlIGlzIGR1ZSB0byBjb21taXQKOTFlZjQxMjRlNTZhICgiUmVm
YWN0b3IgemVuZF9vYmplY3RfaGFuZGxlcnMgQVBJIHRvIHBhc3MgemVuZF9vYmplY3QqIGFuZAp6
ZW5kX3N0cmluZyogaW5zdGVkIG9mIHp2YWwocykuIikgaW4gdXBzdHJlYW0gUEhQIHByb2plY3Qu
IEkgZmFpbCB0byBmaW5kCnRoZSBjb3JyZXNwb25kaW5nIGVudHJ5IGluIGFueSBQSFAgY2hhbmdl
bG9nLCBidXQgZm9sbG93aW5nIHRoZSBnaXQKaGlzdG9yeSwgdGhpcyBoYXMgYmVlbiBpbnRyb2R1
Y2VkIHdpdGggUEhQIDguMC4wLiBJIHRyaWVkIHRvIHF1aWNrbHkgcmV2ZXJ0CnRvIFBIUCA3LjQu
MjAsIGJ1dCB0aGlzIHZlcnNpb24gZG9lcyBub3QgZXZlbiBidWlsZCBhbnltb3JlIG9uCmN1cnJl
bnQgQlIgKHVucmVsYXRlZCBidWlsZCBmYWlsdXJlcykKCkhvd2V2ZXIgSSBvYnNlcnZlIHRoYXQg
aWYgSSBzd2l0Y2ggZnJvbSBCb290bGluICdibGVlZGluZyBlZGdlJyB0b29sY2hhaW4KdG8gJ3N0
YWJsZScgdG9vbGNoYWluLCBwaHAtbHVhIGJ1aWxkIHN1Y2NlZWRzIG9uIG1hc3Rlci4gU28gSSBn
dWVzcyB0aGlzCmlzc3VlIGlzIGEgbWl4IG9mIEFQSSBjaGFuZ2UgYW5kIGNvbXBpbGVyIHVwZGF0
ZS4gV2hlbiB1c2luZyB0aGUgc3RhYmxlCnRvb2xjaGFpbiwgSSBzZWUgdGhlIHdhcm5pbmcgdGhh
dCBtYXRjaGVzIHRoZSBlcnJvciBJIHNlZSB3aGVuIHVzaW5nIHRoZQpibGVlZGluZy1lZGdlIHRv
b2xjaGFpbiAoLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlcykKCj4+IEkndmUgdGFrZW4gYSBs
b29rIGF0IHRoZSBvZmZpY2lhbCB1cHN0cmVhbSB0byBtYWtlIHRoZSBmaXggaW50ZWdyYXRlZCBp
bgo+PiBoZXJlIGFzIHdlbGwsIGJ1dCBpdCByZWFsbHkgbG9va3MgbGlrZSBhIGRlYWQgZW5kOiB0
aGVyZSBoYXMgYmVlbiBubwo+PiBhY3Rpdml0eSBmb3IgNSB5ZWFycywgYW5kIHRoZSBtYWludGFp
bmVyIGRvZXMgbm90IHNlZW0gdG8gYW5zd2VyIFBScyBvcgo+PiBpc3N1ZXMuIFRoZSBQUiBjb250
YWluaW5nIHRoZSB0d28gcGF0Y2hlcyBpbnRyb2R1Y2VkIHdpdGggdGhlIEJSIHBhY2thZ2UKPj4g
aGFzIG5vdCBldmVuIGJlZW4gbWVyZ2VkLiBJIGhhdmUgYmVlbiB0ZW1wdGVkIHRvIHJlcGxhY2Ug
dGhlIHVwc3RyZWFtCj4+IHNvdXJjZSB3aXRoIHRoZSBmb3JrIGZyb20gd2hpY2ggSSB0b29rIHRo
ZSBwYXRjaAo+PiAoaHR0cHM6Ly9naXRodWIuY29tL2JhZG9vL3BocC1sdWEpLCB3aGljaCBsb29r
cyBzbGlnaHRseSBsZXNzICJkZWFkIgo+PiAobGFzdCBhY3Rpdml0eSAyIHllYXJzIGFnbywgYW5k
IHNvbWUgd29yayBkb25lIHRvIHVwZGF0ZSB0aGUgbW9kdWxlCj4+IGNvbXBhdGliaWxpdHkgd2l0
aCBjdXJyZW50IFBIUCBtYWpvciB2ZXJzaW9uKS4gIEkgZXZlbnR1YWxseSBjaG9zZSB0bwo+PiBr
ZWVwIHRoZSBjdXJyZW50IHVwc3RyZWFtIGFuZCBicmluZyB0aGlzIHNpbmdsZSBwYXRjaCwgYnV0
IHBsZWFzZSBsZXQgbWUKPj4ga25vdyBpZiBjaGFuZ2luZyB0aGUgdXBzdHJlYW0gc291cmNlIHdv
dWxkIGJlIGJldHRlci4KPgo+IEl0J3Mgb2YgY291cnNlIGFubm95aW5nIHRvIGhhdmUgdW5tYWlu
dGFpbmVkIHRoaW5ncyBwYWNrYWdlZCBpbgo+IEJ1aWxkcm9vdC4gSSBndWVzcyBOaWNvbGFzIGlz
IHN0aWxsIHVzaW5nIHRoaXMgc29mdHdhcmUgY29tcG9uZW50Pwo+Cj4gVGhvbWFzCgoKCgotLSAK
QWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
