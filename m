Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8335C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 13:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC83842909;
	Thu, 31 Jul 2025 13:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehpCw6HlyAhr; Thu, 31 Jul 2025 13:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28D44290B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28D44290B;
	Thu, 31 Jul 2025 13:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5B1F160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC3DD40F06
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCzN6ArBUmOp for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 13:15:00 +0000 (UTC)
X-Greylist: delayed 71756 seconds by postgrey-1.37 at util1-new.osuosl.org;
 Thu, 31 Jul 2025 13:14:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C10C440EDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10C440EDE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C10C440EDE
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:14:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53B6344267;
 Thu, 31 Jul 2025 13:14:56 +0000 (UTC)
Mime-Version: 1.0
Date: Thu, 31 Jul 2025 15:14:56 +0200
Message-Id: <DBQ9NNWKH3VS.KK3SWYJH4GQY@bootlin.com>
Cc: <tim.hammer@nav-timing.safrangroup.com>,
 <nicolas.carrier@nav-timing.safrangroup.com>, <buildroot@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-3-46e4a32e26da@bootlin.com>
 <20250730190231.51e0715e@windsurf> <DBQ8SCGP37TS.2V8HRWA7RWPTW@bootlin.com>
 <20250731144852.25bb9e9e@windsurf>
In-Reply-To: <20250731144852.25bb9e9e@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejieevgeejveefffekkeejhfeiteefkeekffduleefvdduudffvdejleffgefgvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrs
 hgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753967696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5i/GVfrDjjvZnNIFMH/N12ZcS4are0mJ/wfSjYLp8Fw=;
 b=Q7SzDxI2NzRNvJu3uBfHmpsZjFWfVRTHPn1KOI7bVlpOm7ELaFn0Hx0qUgjbpbbaE7H+Sw
 jW0i3vykIKUlkcVGe3FLiWLMMdi53cpEKsUl1IPiWaQC1Di+ojy/SbOlLBBNGhIjGloJxA
 bTxPSxzV8FVK4AUU8wTmJYIQ6rpMc9Nyn7v9AM6EQMQoXFU4rVWuh1Vzs/oceTR8+SC3jL
 66U+DVuxxDjZJyKJ3zYYOuEQ5LMJ4seninmyFyHMKnV/rTTQIN7KPWt942igsByB4l7AZw
 80F0d1GpLEXwqu9iPxVDs8LU2bJIzY86bysHKjCSsvtXN0/BNO9FRgbDzpVAIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q7SzDxI2
Subject: Re: [Buildroot] [PATCH 3/4] package/openscap: add openscap package
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

T24gVGh1IEp1bCAzMSwgMjAyNSBhdCAyOjQ4IFBNIENFU1QsIFRob21hcyBQZXRhenpvbmkgd3Jv
dGU6Cj4gT24gVGh1LCAzMSBKdWwgMjAyNSAxNDozNDowMSArMDIwMAo+IEFsZXhpcyBMb3Rob3LD
qSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4+IGl0IGxvb2tzIGxpa2Ug
Z2NyeXB0L25zcyBpcyBub3QgbWFuZGF0b3J5LiBCdXQgaWYgSSB0cnkgdG8gY29uZmlndXJlIGFu
ZAo+PiBydW4gYSBidWlsZCBpbiBhbiBlbnZpcm9ubWVudCB3aXRob3V0IGxpYmdjcnlwdCwgSSBn
b3Qgc2FtZSBsYXRlIGxpbmthZ2UKPj4gZXJyb3IsIGFib3V0IHNvbWUgbWlzc2luZyBjcmFwaV9p
bml0IChubywgSSBhbSBub3QgbWFraW5nIHRoaXMgZnVuY3Rpb24ncwo+PiBuYW1lIHVwLi4uKSBi
ZWluZyBtaXNzaW5nLiBJdCBhcHBlYXJzIHRoYXQgdGhlcmUgYXJlIGNvZGUgcGF0aHMKPj4gcHJl
cHJvY2Vzc2VkIGNvbmRpdGlvbm5hbHkgb24gZWl0aGVyIGxpYmdjcnlwdCBvciBuc3MgcHJlc2Vu
Y2UsIHdpdGhvdXQgYW55Cj4+IGZhbGxiYWNrIGlmIG5vbmUgaXMgZm91bmQuIEkgYW0gbm90IHN1
cmUgaWYgSSBhbSBmYWNpbmcgc29tZSBvcHRpb25hbAo+PiBkZXBlbmRlbmNpZXMgdGhhdCBhcmUg
bm90ICJvcHRpb25hbCBlbm91Z2giIGluIHRoZSBjb2RlIGJhc2UsIG9yIHNvbWUgaGFyZAo+PiBk
cGVuZGVuY2llcyB0aGF0IGFyZSBub3Qgc3VmZmljaWVudGx5IGVuZm9yY2VkIGluIHRoZSBjbWFr
ZSBmaWxlcy4gQnV0IGluCj4+IHRoZSBwcm9qZWN0IGN1cnJlbnQgc3RhdGUsIHRoZSBzb2Z0d2Fy
ZSBkb2VzIG5vdCBidWlsZCB3aXRob3V0IGxpYmdjcnlwdC4KPj4gCj4+IElmIEkgdGFrZSBhIGZ1
cnRoZXIgbG9vayBhdCB0aGUgZGV2IGRvYwo+PiAoaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQ0FQ
L29wZW5zY2FwL2Jsb2IvbWFpbi9kb2NzL2RldmVsb3Blci9kZXZlbG9wZXIuYWRvYyksCj4+IGl0
IHNlZW1zIHRvIGhpbnQgdGhhdCBsaWJnY3J5cHQgaXMgYWN0dWFsbHkgbmVlZGVkIGluIGFueSBj
YXNlLgo+Cj4gVGhhdCdzIGZpbmUsIHdlIGRvbid0IGV4cGVjdCB5b3UgdG8gZml4IGFsbCB1cHN0
cmVhbSBpc3N1ZXMgOikKPgo+IEhvd2V2ZXIsIG15IGNvbmNlcm4gd2FzIG5vdCBzbyBtdWNoIGFi
b3V0IGdjcnlwdCBiZWluZyBuZWVkZWQsIGJ1dCB0aGUKPiBmYWN0IHRoYXQgeW91IG5lZWQgb3Bl
bnNzbCAqYW5kKiBsaWJnY3J5cHQuIEFyZSBib3RoIHRydWx5IG5lZWRlZD8KCkFzIHNob3duZWQg
aW4gdGhlIHNhbXBsZSBhYm92ZTogeWVzLCBib3RoIGFyZSBuZWVkZWQsIE9wZW5TU0wgYmVjYXVz
ZSBpdCBpcwphIGhhcmQgZGVwZW5kZW5jeSBpbiBDTWFrZUxpc3RzLnR4dCAodGVzdGVkIGJ5IHJl
bW92aW5nIGxpYnNzbC1kZXYgZnJvbSBteQp0ZXN0aW5nIGVudiwgaXQgaW5kZWVkIGZhaWxzIHRv
IGNvbmZpZ3VyZSB0aGUgcHJvamVjdCwgYW5kIHRoZXJlIGlzIG5vCm9wdGlvbiB0byBkaXNhYmxl
IGl0KSwgYW5kIGxpYmdjcnlwdCwgYmVjYXVzZSBsaW5rYWdlIHdpbGwgZmFpbCBvdGhlcndpc2Uu
Cgo+PiBJJ2xsIHJlbW92ZSB0aGUgV0lUSF9DUllQVE89Z2NyeXB0IHRob3VnaCwgYXMgaXQgaXMg
dGhlIGRlZmF1bHQgdmFsdWUgaW4KPj4gQ01ha2VMaXN0cy50eHQuCj4KPiBXZWxsLCB5b3UgY2Fu
IGtlZXAgaXQgZXhwbGljaXQsIEkgdGhpbmsgaXQncyBhIGdvb2QgaWRlYS4KCkFDSwoKPj4gCj4+
ID4gLSBZb3UncmUgc2V0dGluZyBFTkFCTEVfUFlUSE9OMz1PTiwgYnV0IHlvdXIgdGFyZ2V0IHBh
Y2thZ2UgZG9lcyBub3QKPj4gPiAgIGRlcGVuZCBvbiBob3N0LXB5dGhvbjMgbm9yIHB5dGhvbjMg
aW4gdGVybXMgb2YgYnVpbGQgZGVwZW5kZW5jeS4KPj4gPiAgIENvdWxkIHlvdSBjbGFyaWZ5IHdo
YXQgdGhpcyBFTkFCTEVfUFlUSE9OMyBvcHRpb24gZG9lcz8gIAo+PiAKPj4gVGhhdCdzIGFuIG9t
aXNzaW9uIG9uIG15IHNpZGUuIFRoaXMgRU5BQkxFX1BZVEhPTjMgYWxsb3dzIGJ1aWxkaW5nIHNv
bWUKPj4gYmluZGluZ3MgKHRvIHdyaXRlIHNvbWUgcHl0aG9uIGF1dG9tYXRpb24gdG9vbHMgYmFz
ZWQgb24gb3BlbnNjYXAgPykgaWYgdGhlCj4+IGludGVycHJldGVyIGlzIGZvdW5kLiBJJ2xsIHJl
bW92ZSBpdC4KPgo+IFRoZW4gRU5BQkxFX1BZVEhPTjM9T0ZGIGlzIHByb2JhYmx5IGJldHRlci4g
R2VuZXJhbGx5IHNwZWFraW5nIHRoZSBtb3JlCj4gb3B0aW9ucyBhcmUgZXhwbGljaXRseSBzZXQs
IHRoZSBiZXR0ZXIuCgpBQ0sKCkFsZXhpcwotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
