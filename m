Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D03AC369CA
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 18:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F24A1402D8;
	Fri, 18 Apr 2025 18:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wi4XKHKZWOF8; Fri, 18 Apr 2025 18:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3144C402D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3144C402D9;
	Fri, 18 Apr 2025 18:28:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3E811F
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 18:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7A0F4311C
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 18:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8CPhLu48fVx for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 18:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1F3C43172
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1F3C43172
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1F3C43172
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 18:28:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2DE543992;
 Fri, 18 Apr 2025 18:28:49 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 18 Apr 2025 20:28:49 +0200
Message-Id: <D99Z7C7QHM5F.OINX99GI7LWN@bootlin.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Julien Olivain" <ju.o@free.fr>, <buildroot@buildroot.org>, "Francis
 Laniel" <flaniel@linux.microsoft.com>, "Thomas Perale"
 <thomas.perale@mind.be>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250415-bump_pahole-v1-1-6c6df3ff497f@bootlin.com>
 <51a49e9cb3753181d544641efbf14880@free.fr>
 <D97IPBMKJNQL.1EF4TZDMMBRCA@bootlin.com> <20250418123743.51192de0@windsurf>
In-Reply-To: <20250418123743.51192de0@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvfevuffhofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekgfffhfehhfefgeekhfffudfhheekveffleeuhfelgfefueevhedvkeduhfehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhlrghnihgvlheslhhinhhug
 idrmhhitghrohhsohhfthdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggv
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745000930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8En39/qE7XxRTD8AHxKtEg0D03592cV8gO13vxv/sU=;
 b=lsDYks1tRnAsOJVXGCC1Grnfik/gNV/qqpJlt4TiTOHznnvignVKHVCMpgNuz+3MqSSmyX
 AF0FahoDbhn9/SvDQp2xQJLtec8pm1y6cRaOZ8JK2ty3hiRao1CRA1xkd/C1sijSb57IQx
 OGNDRro8H6qU1cHT12YPcdCBIiIfjw+J0EE0Mi292/rQ6gO1bLUc/315lhmi5e4U37F2Un
 96k83x6d2UydedPE2KIXkTTo4b1sGROOtroQKuwKKieRu6QQnzJUn8aOM7l4Rekz7Q1uTa
 jQCQ8CuqvCC2GP04j2seTyCVaSgWUr7q4B3BJ+Gtp+lA0pwTlz+2QBGIgKpEDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lsDYks1t
Subject: Re: [Buildroot] [PATCH] package/pahole: bump to version 1.28
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

SGkgVGhvbWFzLAoKT24gRnJpIEFwciAxOCwgMjAyNSBhdCAxMjozNyBQTSBDRVNULCBUaG9tYXMg
UGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gT24gVHVlLCAxNSBBcHIgMjAyNSAyMzow
NzozOSArMDIwMAo+IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
IHdyb3RlOgo+Cj4+IEluIGNhc2UgaXQgaGFzIHNsaXBwZWQgdGhyb3VnaDogYXMgdGhlIGlzc3Vl
IGFsc28gZXhpc3RzIG9uIHRoZSBjdXJyZW50Cj4+IHJlbGVhc2UgYnJhbmNoLCBkbyB5b3Ugd2Fu
dCBtZSB0byBzZW5kIGEgcGF0Y2ggdGFyZ2V0aW5nIHRoZSAyMDI1LjAyLngKPj4gYnJhbmNoIHRv
IGJhY2twb3J0IHRoZSB1cHN0cmVhbSBwYXRjaCBmaXhpbmcgdGhlIGlzc3VlID8gKGJlY2F1c2Ug
SSBndWVzcwo+PiBidW1waW5nIHRoZSBwYWNrYWdlIHZlcnNpb24gb24gdGhlIHJlbGVhc2UgYnJh
bmNoIGlzIG5vdCBhbiBvcHRpb24gPykKPgo+IEluIGZhY3QgaWRlYWxseSBpbiB0aGlzIHNpdHVh
dGlvbiBteSBwZXJzb25hbCBwcmVmZXJlbmNlIGlzIHRoYXQgZnJvbQo+IHRoZSBzdGFydCB0aGUg
dGhpbmcgZ2V0cyBzdWJtaXR0ZWQgYXMgdHdvIHBhdGNoZXM6Cj4KPiAxLiBPbmUgZG9pbmcgdGhl
IGJhY2twb3J0IG9mIHRoZSBmaXgsIHdpdGhvdXQgYnVtcGluZyB0aGUgdmVyc2lvbgo+Cj4gMi4g
T25lIGRvaW5nIHRoZSB2ZXJzaW9uIGJ1bXAsIGRyb3BwaW5nIHRoZSBmaXggYmFja3BvcnQgYWxv
bmcgdGhlIHdheQo+Cj4gVGhpcyB3YXksIHdlIGNhbiBlYXNpbHkgYmFja3BvcnQgKDEpIHRvIG91
ciBjdXJyZW50IExUUy9zdGFibGUgYnJhbmNoLgoKQUNLLCBub3RlZCBmb3IgbmV4dCB0aW1lLgoK
QWxleGlzCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
