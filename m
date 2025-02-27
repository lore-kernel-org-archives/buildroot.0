Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716AEC19F2E
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 14:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1249F415DC;
	Thu, 27 Feb 2025 14:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KtY4kGJMs-T; Thu, 27 Feb 2025 14:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE7D0415E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE7D0415E6;
	Thu, 27 Feb 2025 14:41:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D1C69
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8CE8414BE
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17AaXUBe91KZ for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 14:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6067B414B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6067B414B5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6067B414B5
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:40:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8B684439C;
 Thu, 27 Feb 2025 14:40:51 +0000 (UTC)
Date: Thu, 27 Feb 2025 15:40:50 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Kory Maincent via buildroot <buildroot@buildroot.org>, Romain Naour
 <romain.naour@smile.fr>, thomas.petazzoni@bootlin.com
Message-ID: <20250227154050.654316dc@kmaincent-XPS-13-7390>
In-Reply-To: <87v7swppg2.fsf@dell.be.48ers.dk>
References: <20250221-fixes_octavo-v2-0-0bb2012512eb@bootlin.com>
 <20250221-fixes_octavo-v2-3-0bb2012512eb@bootlin.com>
 <87v7swppg2.fsf@dell.be.48ers.dk>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfevfeehtdffuedvhfeigeejveeuuddvhffghefhvdeugeettdegteetkeekgfenucffohhmrghinhepvghlihhnuhigrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiii
 ihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1740667252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZmhrHomURFXa9q/UnHP14CAlBdT8G4RCUf1H3NU6Qq8=;
 b=n4PoDBfsU+ynyzMtWTH5U2o2UcEkdBzh5tZ9hdmKwAnY/8QKfy3ILFG8BUyAdg71XLdEzb
 b8stS1XgP07NDhvrNjS3cnHsHdjpSTw2g9lCXeYdKz8vQ7/yR9jft1WQ5+NmdCfh8as/9m
 ffj9vzRVOnxj6+OKgQcZb/R34QOZxq13Wz3Ev0IjL5XMU8w4kexFf4a0wnIg65OhuxSkpj
 Hhk0/LMcWuZPWw6RcgP7sM9eMSmoMsS8x/QfbttZ65sgBA/5p5dSDuaFUvOyRLVEvNazJg
 doSeTD2y6bk0LNzzFPMvfYOFftLv1BrV12RVLECf6EYXGAqEpZw9jBrPnCp+Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n4PoDBfs
Subject: Re: [Buildroot] [PATCH v2 3/3] configs/octavo: Switch to Bootlin
 stable toolchain
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyNiBGZWIgMjAyNSAxODo0ODoyOSArMDEwMApQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgoKPiAgWy4uLl0gIAo+IAo+ICA+IFVwZGF0ZSB0aGUgT2N0
YXZvIGNvbmZpZ3VyYXRpb25zIHRvIHVzZSB0aGUgQm9vdGxpbiBnbGliYyBzdGFibGUgcHJlYnVp
bHQKPiAgPiBleHRlcm5hbCB0b29sY2hhaW4sIGFzIHJlY29tbWVuZGVkIGluIHRoZSBCdWlsZHJv
b3QgbWVldGluZyByZXBvcnQgZnJvbQo+ICA+IEVMQ0UgMjAyNDogaHR0cHM6Ly9lbGludXgub3Jn
L0J1aWxkcm9vdDpEZXZlbG9wZXJEYXlzRUxDRTIwMjQgIAo+IAo+ICA+IFNpZ25lZC1vZmYtYnk6
IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+ICAKPiAKPiBDb21taXR0
ZWQsIHRoYW5rcy4KPiAKPiBjaGVjay1wYWNrYWdlIGNvbXBsYWlucyB0aGF0IHRoZXNlIGRlZmNv
bmZpZ3MgZG8gbm90IGhhdmUgZG93bmxvYWQKPiBoYXNoZXMgZm9yIHRoZWlyIGtlcm5lbC9ib290
bG9hZGVyIHBhcnRzIGFuZCBkbyBub3QgZW5mb3JjZSBoYXNoIGNoZWNrczoKPiAKPiBBcHBseWlu
ZzogY29uZmlncy9vY3Rhdm86IFN3aXRjaCB0byBCb290bGluIHN0YWJsZSB0b29sY2hhaW4KPiBj
b25maWdzL29jdGF2b19vc2QzMm1wMV9icmtfZGVmY29uZmlnOjA6IG1pc3NpbmcKPiBCUjJfRE9X
TkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTIGNvbmZpZ3Mvb2N0YXZvX29zZDMybXAxX3JlZF9kZWZj
b25maWc6MDoKPiBtaXNzaW5nIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVMKPiAKPiBD
YXJlIHRvIHNlbmQgYSBwYXRjaCB0byBmaXggdGhhdD8KCk9rIEkgd2lsbC4KClJlZ2FyZHMsCi0t
IApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
