Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA881D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 813D284101;
	Tue, 13 Jan 2026 19:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQZvwpREiNZk; Tue, 13 Jan 2026 19:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D98AC817D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333521;
	bh=GrfBLI6hVOOCHul8aSwJllj0/+fJUM6OOakCzmRiN8Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SDk96+Sm+MtLSs906iyWchS/Zq0hWOggda8ufXtcUeZNISjypJWS/NugKyUAjU0fb
	 GByH9fQsq7ALnBqXq/oqHgCoqwJF9hlqCZjGESP2NL3bUhHmq0zW6sKFL/+c5Y4EOy
	 dpfM33F7W8U1oITQUd3YKlMABqdSRNhxUMC1sube3wyHoN6UZ8lwxvcRM4d9yNVcUv
	 7RJr08g04eLRcQvKo1ITV6/Ub0YHBgF7jwDcv5cJYX2UipBOJQBoHSxdN5Ky/xeyLj
	 GmYzFGng09AcnBXpNb2eLTi9aJoZHhegRNgfOBKna03F6aAe8XFbQj3prsBCk64g4k
	 14dnDzCTVt2WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D98AC817D3;
	Tue, 13 Jan 2026 19:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3FE2231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4D9D406D5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfnB2_Z3Lgdg for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F32E40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F32E40373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F32E40373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8129B97A886; Tue, 13 Jan 2026 20:45:17 +0100 (CET)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:14 +0100
Message-ID: <20260113194515.97510-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250709-perf_libtraceevent-v2-2-3ea54fbe6b5b@bootlin.com>
References: <20250709-perf_libtraceevent-v2-2-3ea54fbe6b5b@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OcMi3fja/uHd2AcSt4h2iv6Ukvq2Zsv2K0m415tcZGw=;
 b=K0oy6dEr8sJLKw+BMnkU4OIs9spyz77jyS0IAbqRMBX4iAU+ypGkP3eYNz9GJ0pwBfHrPh
 FPulSX5oxeQrgWPXuUkRi87SKBej5hw4f5b52WfPm5K6jcIxgDvyL9Ro9mq9X4DC6DDaXH
 95TOQ/lL1fU3FOo/0gYdsMJ/m9x9AA1u7j4KnLWW5BMuFr+Uk5mrr0GV8GGBH/8AF1jcxA
 cFs9gaw5QiM76OvhSvaWvjhznuDlPa3J7+Cuhkz3Vg+tkMJyailp/8gs47NoRMkKRnqNlG
 UQleETG7PFu6tN8V4o+qxdGD5jBabxPTM49KLOMTt5QwRtcGoqZ9L95Ozx0cIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=K0oy6dEr
Subject: Re: [Buildroot] [PATCH v2 2/2] packages/linux-tools: perf: enforce
 PKG_CONFIG_LIBDIR
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRm9yIGtlcm5lbCBwYXRjaGVkIHdpdGggNDQwY2Y3NzYyNWUzICgicGVy
ZjogYnVpbGQ6IFNldHVwCj4gUEtHX0NPTkZJR19MSUJESVIgZm9yIGNyb3NzIGNvbXBpbGF0aW9u
IiksIGlmIG5laXRoZXIgUEtHX0NPTkZJR19MSUJESVIsCj4gUEtHX0NPTkZJR19QQVRIIG5vciBQ
S0dfQ09ORklHX1NZU1JPT1RfRElSIGFyZSBwcm92aWRlZCwgdGhlIHBlcmYKPiBNYWtlZmlsZSB3
aGlsZSB0cnkgdG8gc2V0IHNvbWUgZGVmYXVsdCB2YWx1ZSBmb3IgUEtHX0NPTkZJR19MSUJESVIs
Cj4gd2hpY2ggd2lsbCBub3QgcG9pbnQgY29ycmVjdGx5IHRvIGJ1aWxkcm9vdCBzdGFnaW5nIGRp
cmVjdG9yeS4gVGhpcwo+IGlzc3VlIHdpbGwgbGVhZCBmb3IgZXhhbXBsZSB0byBhIGZhaWx1cmUg
dG8gZmluZCBsaWJ0cmFjZWV2ZW50IGV2ZW4KPiBpZiBpdCBpcyBjb3JyZWN0bHkgZW5hYmxlZCBh
bmQgaW5zdGFsbGVkIGluIHRoZSBzdGFnaW5nIGRpciwgYW5kIHNvIGl0Cj4gd2lsbCBtYWtlIHBl
cmYgZmFpbCB0byBidWlsZC4KPiAKPiBNYWtlIHN1cmUgdG8gY2FsbCB0aGUgcGVyZiBtYWtlIGNv
bW1hbmQgd2l0aCBQS0dfQ09ORklHX0xJQkRJUiB2YXJpYWJsZQo+IHNldCBhbmQgcG9pbnRpbmcg
dG8gYnVpbGRyb290IHN0YWdpbmcgYXJlYSB0byBtYWtlIHN1cmUgdG8gcHJvcGVybHkKPiBkZXRl
Y3QgcGVyZiBkZXBlbmRlbmNpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOp
IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54IGFuZCAy
MDI1LjExLnguIFRoYW5rcwoKPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gbmV3IHBhdGNoCj4g
LS0tCj4gIHBhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluIHwgMSArCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbiBiL3BhY2thZ2UvbGludXgtdG9vbHMv
bGludXgtdG9vbC1wZXJmLm1rLmluCj4gaW5kZXggMWUxOWVlN2YxYzRlNDZkMjEwYzA3OWQ3OTZm
OTQ2MWYyYmZhYWUwOC4uMzIzODk0OGQ3NjA4OTIwZDZjMjM2ZTQ3ZmNkY2U4YTMxZmI2NzU0NSAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbgo+
ICsrKyBiL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluCj4gQEAgLTIz
LDYgKzIzLDcgQEAgUEVSRl9NQUtFX0ZMQUdTID0gXAo+ICAJSk9CUz0kKFBBUkFMTEVMX0pPQlMp
IFwKPiAgCUFSQ0g9JChQRVJGX0FSQ0gpIFwKPiAgCURFU1RESVI9JChUQVJHRVRfRElSKSBcCj4g
KwlQS0dfQ09ORklHX0xJQkRJUj0iJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWciIFwK
PiAgCXByZWZpeD0vdXNyIFwKPiAgCU5PX0dUSzI9MSBcCj4gIAlOT19MSUJQRVJMPTEgXAo+IAo+
IC0tIAo+IDIuNTAuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
