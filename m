Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB79C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD2C08308B;
	Wed, 13 Aug 2025 16:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4YRIUZ2xR7o; Wed, 13 Aug 2025 16:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F163C82F20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F163C82F20;
	Wed, 13 Aug 2025 16:33:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD5C81B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B366C60A8D
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBIhwg_k2Tg0 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E25660A8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E25660A8B
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E25660A8B
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:33:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 04652580A6A
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:13:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CADF4397F;
 Wed, 13 Aug 2025 16:13:36 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 13 Aug 2025 18:13:35 +0200
Message-Id: <DC1FLJG5I3Y7.3FIUHNMEGPB45@bootlin.com>
Cc: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806-php-lua-v2-1-a73faad939e9@bootlin.com>
 <e0045fd1-40e1-4af8-8031-9e051aff6833@smile.fr>
 <DBZCJ6MUT01E.IED2BZIAW291@bootlin.com> <20250813124353.4015c466@windsurf>
In-Reply-To: <20250813124353.4015c466@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeekieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejieevgeejveefffekkeejhfeiteefkeekffduleefvdduudffvdejleffgefgvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgp
 dhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755101616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRSocFDhRwCpo05XTQXcAAsFuivnWSbSpGAeiLOhTgY=;
 b=OocIn6aVQdUJ7roF2pWQzxgEcKkXjzoZot78SkvFevrIR/x5a5vs2pnfDopI6GEbBmOi38
 hwsfkBy/nK3dC92sm3Vdai2maRnyGIJxk+zXvVKsRB0ADih0dKvVJoQu8sQ5Ooy6KdulqW
 Vi3g76yhBNC4qWeOKkvARNKZQPo4Ffknt1ZbZeL2/f5WjPoP1IHACl3+4PgGyO+DeQ3PAt
 HeS5sdB+O/gZUNiLk2K9nJkcOuvBGeG3EYcXH76eShQF3xFu5u2IeOs/sMzsq4j+olvNQz
 VFfzRJGbqtJoaOydKfLSbfe9NqEovDSgqaGZaz7VPmi4hsgcCMvHtWD9CaZyGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OocIn6aV
Subject: Re: [Buildroot] [PATCH v2] package/php-lua: fix build with
 PHP8/GCC14
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

SGksCgpPbiBXZWQgQXVnIDEzLCAyMDI1IGF0IDEyOjQzIFBNIENFU1QsIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBPbiBNb24sIDExIEF1ZyAyMDI1IDA3OjI0OjA3ICsw
MjAwCj4gQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6
Cj4KPj4gPiBDaGVjay1wYWNrYWdlIHdhcm4gYWJvdXQgbWlzc2luZyAiVXBzdHJlYW06IiBsaW5r
Lgo+PiA+Cj4+ID4gU2luY2UgdGhlIHBhdGNoIGNvbWUgZnJvbSBhIGZvcmssIHVzaW5nICJVcHN0
cmVhbSIgbG9va3Mgd3JvbmcgaGVyZS4KPj4gPiBNYXliZSBVcHN0cmVhbTogbi9hID8gIAo+PiAK
Pj4gU3VyZSwgSSBjYW4gYWRkIHRoaXMgZW1wdHkgVXBzdHJlYW0gaW4gdGhlIG5leHQgcmV2aXNp
b24uCj4KPiBJIGRvbid0IHRoaW5rICJVcHN0cmVhbTogbi9hIiBpcyB2ZXJ5IHVzZWZ1bC4KPgo+
IEluIGZhY3QsIHNvbWV0aGluZyBsaWtlOgo+Cj4gVXBzdHJlYW06IHVwc3RyZWFtIGRlYWQsIHRh
a2VuIGZyb20gZm9yayBhdCBodHRwczovL2dpdGh1Yi5jb20vYmFkb28vcGhwLWx1YS9wdWxsLzgK
Pgo+IGlzIElNTyBhIGxvdCBtb3JlIHVzZWZ1bC4KClN1cmUsIEkgY2FuIHVwZGF0ZSBzZXQgc29t
ZXRoaW5nIGxpa2UgdGhpcy4gQnV0IGp1c3QgdG8gcmUtY2xhcmlmeSwgdGhlCmZvcmsgaXNuJ3Qg
cmVhbGx5IGFsaXZlIG5laXRoZXIuIEl0IGhhcyBqdXN0IGJlZW4gZGVhZCBmb3IuLi4gbGVzcyBs
b25nZXIuCkknbGwgd2FpdCBhIGJpdCBiZWZvcmUgcmUtc3Bpbm5pbmcgaW4gY2FzZSBhbnlvbmUg
ZWxzZSBjb21lcyB3aXRoIGFub3RoZXIKb3Bpbmlvbi4KPgo+IFRob21hcwoKCgoKLS0gCkFsZXhp
cyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
