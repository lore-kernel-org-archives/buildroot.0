Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B2ED2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B4583BBF;
	Tue, 13 Jan 2026 19:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ug9RWtAZwJ9k; Tue, 13 Jan 2026 19:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B3E817C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333518;
	bh=nfcaux2LCbnpxx6pgOm0qWB44IUCVkvzUnmqBV+veFc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=icOr9bzyXdUOh3xkFX/dGDapUeu7/otYQe5R/GqLmND4uwwyRZkNfsZlVjcsbBVCs
	 odN+xd9cdzfkACjldEPnFAdlwyzcu8HtxNPfGYJ2ZOPKgh1BeO5UUxCEjNUh9XtJHD
	 5yJXvPHtc6MP8QOm8KjPYC0CZ0D6jx8GpiJXS2We6mdL9MHPzam77bfMqV+1UdsUsR
	 T89BjQ6nCR47WnAum/HSS7XeNRzYXcRm3MMecfaWWaj76VxOWZRADgHefzUW0f2TG2
	 Xq2t2DjTfIuIJdvlD6Zfmc8RP+ZSJQXAIo20MddXtC1PRY52TuVHLTMDyJ+bJITess
	 bmgWoFwEn3DGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B3E817C3;
	Tue, 13 Jan 2026 19:45:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB2DC1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC9E2817C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bl3mbBN9IMFF for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C519E815DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C519E815DC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C519E815DC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB709B97A885; Tue, 13 Jan 2026 20:45:13 +0100 (CET)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:02 +0100
Message-ID: <20260113194511.97418-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250709-perf_libtraceevent-v2-1-3ea54fbe6b5b@bootlin.com>
References: <20250709-perf_libtraceevent-v2-1-3ea54fbe6b5b@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dP1/rD7pHRdpteSMa3udwk8zhXSDrbxedy2jWc6rcAs=;
 b=Fp2aszMluCrqsMb8tBeN1xbgb9xI79VkbRYirbEH5zEDbIYkaD5Zc3Rpr25v4iWl3Tq/jX
 MKBq/I7wv2TTSSmqDJU6RVlHc0abcBoGbxAiLLNUhsj4ygBWiqYEVe7S4YBO92gc2ceM4j
 Ptfckp1hWt25WVEwj1RUkKqUrwXFjaVhQi2pWIWjRSqFp4z4O8fKf/FD8lSxqEXs++5+zw
 7xkSDHj49/+ue3W41iElVRs1kNA8je/3Nf5HaTDAlNblnRJtzu1mjKd8Xs/v3G9t9XXN83
 azYRfc4vsfCKO4++TKDvxJ3M1JJO/ocVbC+gRGtu4WIAy1NpRCumdNlYFAikaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Fp2aszMl
Subject: Re: [Buildroot] [PATCH v2 1/2] package/linux-tools: perf: build
 with libtraceevent support when it is selected
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

SW4gcmVwbHkgb2Y6Cj4gV2hlbiB0cnlpbmcgdG8gcGVyZm9ybSBhIGN1c3RvbSB1cHJvYmUgcmVj
b3JkaW5nIG9uIGEgdGFyZ2V0IHdpdGggcGVyZgo+IGJ1aWx0IGJ5IGJ1aWxkcm9vdCwgdGhlIHJl
Y29yZGluZyBzdGVwIGZhaWxzIGFzIHBlcmYgY2FuIG5vdCByZWNvcmQKPiB1cHJvYmVzIHdpdGhv
dXQgbGlidHJhY2VldmVudCBzdXBwb3J0Ogo+IAo+ICAgJCBwZXJmIHByb2JlIC14IGxpbmtlZF9s
aXN0IGluc2VydF9uYW1lIGluZGV4Cj4gICBUYXJnZXQgcHJvZ3JhbSBpcyBjb21waWxlZCB3aXRo
b3V0IG9wdGltaXphdGlvbi4gU2tpcHBpbmcgcHJvbG9ndWUuCj4gICBQcm9iZSBvbiBhZGRyZXNz
IDB4ODA4IHRvIGZvcmNlIHByb2JpbmcgYXQgdGhlIGZ1bmN0aW9uIGVudHJ5Lgo+IAo+ICAgQWRk
ZWQgbmV3IGV2ZW50Ogo+ICAgICBwcm9iZV9saW5rZWRfbGlzdDppbnNlcnRfbmFtZSAob24gaW5z
ZXJ0X25hbWUgaW4gL3Jvb3QvZ2RiL2xpbmtlZF9saXN0IHdpdGggaW5kZXgpCj4gCj4gICBwZXJm
IGlzIG5vdCBsaW5rZWQgd2l0aCBsaWJ0cmFjZWV2ZW50LCB0byB1c2UgdGhlIG5ldyBwcm9iZSB5
b3UgY2FuIHVzZSB0cmFjZWZzOgo+IAo+ICAgICAgICAgICBjZCAvc3lzL2tlcm5lbC90cmFjaW5n
Lwo+ICAgICAgICAgICBlY2hvIDEgPiBldmVudHMvcHJvYmVfbGlua2VkX2xpc3QvaW5zZXJ0X25h
bWUvZW5hYmxlCj4gICAgICAgICAgIGVjaG8gMSA+IHRyYWNpbmdfb24KPiAgICAgICAgICAgY2F0
IHRyYWNlX3BpcGUKPiAgICAgICAgICAgQmVmb3JlIHJlbW92aW5nIHRoZSBwcm9iZSwgZWNobyAw
ID4gZXZlbnRzL3Byb2JlX2xpbmtlZF9saXN0L2luc2VydF9uYW1lL2VuYWJsZQo+ICAgJCBwZXJm
IHJlY29yZCAtZSBwcm9iZV9saW5rZWRfbGlzdDppbnNlcnRfbmFtZSAuL2xpbmtlZF9saXN0Cj4g
ICBldmVudCBzeW50YXggZXJyb3I6ICdwcm9iZV9saW5rZWRfbGlzdDppbnNlcnRfbmFtZScKPiAg
ICAgICAgICAgICAgICAgICAgICAgIFxfX18gdW5zdXBwb3J0ZWQgdHJhY2Vwb2ludAo+IAo+ICAg
bGlidHJhY2VldmVudCBpcyBuZWNlc3NhcnkgZm9yIHRyYWNlcG9pbnQgc3VwcG9ydAo+ICAgUnVu
ICdwZXJmIGxpc3QnIGZvciBhIGxpc3Qgb2YgdmFsaWQgZXZlbnRzCj4gCj4gICAgVXNhZ2U6IHBl
cmYgcmVjb3JkIFs8b3B0aW9ucz5dIFs8Y29tbWFuZD5dCj4gICAgICAgb3I6IHBlcmYgcmVjb3Jk
IFs8b3B0aW9ucz5dIC0tIDxjb21tYW5kPiBbPG9wdGlvbnM+XQo+IAo+ICAgICAgIC1lLCAtLWV2
ZW50IDxldmVudD4gICBldmVudCBzZWxlY3Rvci4gdXNlICdwZXJmIGxpc3QnIHRvIGxpc3QgYXZh
aWxhYmxlIGV2ZW50cwo+IAo+IGxpYnRyYWNlZXZlbnQgc3VwcG9ydCBmb3IgcGVyZiBoYXMgYmVl
biBkaXNhYmxlZCB3aXRoIGNvbW1pdAo+IGI0YWI0NWE1YzFkYiAoInBhY2thZ2UvbGludXgtdG9v
bHM6IGRpc2FibGUgbGlidHJhY2V2ZW50IGRldGVjdGlvbiIpCj4gYmVjYXVzZSB0aGVyZSB3YXMg
bm8gbGlidHJhY2VldmVudCBwYWNrYWdlIGluIGJ1aWxkcm9vdCB0byByZXBsYWNlIHRoZQo+IGZv
cm1lciBsaWJ0cmFjZWV2ZW50IHJlbW92ZWQgZnJvbSB0aGUga2VybmVsIHNvdXJjZXMuIFNpbmNl
IHRoZW4sIGNvbW1pdAo+IDE0NzRmMWIzNGIxNyAoInBhY2thZ2UvbGlidHJhY2VldmVudDogbmV3
IHBhY2thZ2UiKSBoYXMgaW50cm9kdWNlZCBhCj4gbGlidHJhY2VldmVudCBwYWNrYWdlLiBXZSBj
YW4gdGhlbiBleHBvc2UgYWdhaW4gdGhlIHBvc3NpYmlsaXR5IHRvIGJ1aWxkCj4gcGVyZiB3aXRo
IGxpYnRyYWNlZXZlbnQgc3VwcG9ydC4KPiAKPiBNYWtlIGJ1aWxkcm9vdCBwZXJmIG1ha2VmaWxl
IGRldGVjdCBpZiBsaWJ0cmFjZWV2ZW50IHBhY2thZ2UgaGFzIGJlZW4KPiBlbmFibGVkLCBhbmQg
aWYgc28sIGFsbG93IHRvIGJ1aWxkIHBlcmYgd2l0aCBsaWJ0cmFjZWV2ZW50IHN1cHBvcnQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGlu
LmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54IGFuZCAyMDI1LjExLnguIFRoYW5rcwoKPiAtLS0K
PiBDaGFuZ2VzIGluIHYyOgo+IC0gbm8gY2hhbmdlCj4gLS0tCj4gIHBhY2thZ2UvbGludXgtdG9v
bHMvbGludXgtdG9vbC1wZXJmLm1rLmluIHwgNyArKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4gYi9wYWNrYWdlL2xpbnV4LXRvb2xzL2xp
bnV4LXRvb2wtcGVyZi5tay5pbgo+IGluZGV4IGQ2NzMxODU3MWFhNGRlZWZkZTViMzhlZmZlMWFk
ZTBiODdmNDYyN2IuLjFlMTllZTdmMWM0ZTQ2ZDIxMGMwNzlkNzk2Zjk0NjFmMmJmYWFlMDggMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4KPiAr
KysgYi9wYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbgo+IEBAIC0yOCw3
ICsyOCw2IEBAIFBFUkZfTUFLRV9GTEFHUyA9IFwKPiAgCU5PX0xJQlBFUkw9MSBcCj4gIAlOT19M
SUJQWVRIT049MSBcCj4gIAlOT19MSUJCSU9OSUM9MSBcCj4gLQlOT19MSUJUUkFDRUVWRU5UPTEg
XAo+ICAJTk9fU0hFTExDSEVDSz0xCj4gIAo+ICAjIFdlIG5lZWQgdG8gcGFzcyBhbiBhcmd1bWVu
dCB0byBsZCBmb3Igc2V0dGluZyB0aGUgZW11bGF0aW9uIHdoZW4KPiBAQCAtMTI4LDYgKzEyNywx
MiBAQCBQRVJGX01BS0VfRkxBR1MgKz0gQ09SRVNJR0hUPTEKPiAgIyBiYXJlICJpZmRlZiBDT1JF
U0lHSFQiIGNvbnN0cnVjdHMuCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJ
QlRSQUNFRVZFTlQpLHkpCj4gK1BFUkZfREVQRU5ERU5DSUVTICs9IGxpYnRyYWNlZXZlbnQKPiAr
ZWxzZQo+ICtQRVJGX01BS0VfRkxBR1MgKz0gTk9fTElCVFJBQ0VFVkVOVD0xCj4gK2VuZGlmCj4g
Kwo+ICAjIFdlIHJlYWxseSBkbyBub3Qgd2FudCB0byBidWlsZCB0aGUgcGVyZiBkb2N1bWVudGF0
aW9uLCBiZWNhdXNlIGl0Cj4gICMgaGFzIHN0cmluZ2VudCByZXF1aXJlbWVudCBvbiB0aGUgZG9j
dW1lbnRhdGlvbiBnZW5lcmF0aW9uIHRvb2xzLAo+ICAjIGxpa2UgeG1sdG8gYW5kIGFzY2lpZG9j
KSwgd2hpY2ggbWF5IGJlIGxhZ2dpbmcgYmVoaW5kIG9uIHNvbWUKPiAKPiAtLSAKPiAyLjUwLjAK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
