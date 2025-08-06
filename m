Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC89C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 12:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D87B383D4A;
	Wed,  6 Aug 2025 12:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgpPXLXHD3Ck; Wed,  6 Aug 2025 12:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1BB483D1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1BB483D1E;
	Wed,  6 Aug 2025 12:14:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 245EBD79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0052883CFE
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paUiApg4_rLA for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 12:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFC8283BC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC8283BC4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFC8283BC4
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:14:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B166441FE;
 Wed,  6 Aug 2025 12:14:29 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 06 Aug 2025 14:14:29 +0200
Message-Id: <DBVC4NHTNJCS.Z7MM8XO0B49K@bootlin.com>
Cc: <buildroot@buildroot.org>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806-php-dbus-v1-1-78cbe7d1797f@bootlin.com>
 <20250806110836.387c867c@windsurf> <DBV9S1S4XEEA.2DHT8AEV8PEL9@bootlin.com>
 <20250806123423.33451a9c@windsurf>
In-Reply-To: <20250806123423.33451a9c@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudektddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejffdtleefgfeugedvtdekgeeuhefgjeeihfeuheelffefkefhvdejheeiheegteenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpghhnuhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughin
 hgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754482469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWj0p40TRd4AHMjntUSZKFV5y23uqxkwsbUcU0HsF3s=;
 b=Q3M4SeNS7e/LwbHbBCTWdO1vcDUdWHZr/KFMKWKmsXVlSmxxgEuCVB+/eKSSCapXysMAm8
 5xkf+3Cl3PfsC/1zxrKDrEOEUk0Dg5qls1eH9QnopsW949GX3rHUUT7zjZG+TJCM2QE675
 M/VelcQGO7w9SBGhv6s3dAImCvZGzPORuF3uxRl2L/HHTv3HfOc0Hkwfsyap2Ckhh5YjiR
 JTUM0ljadTeRI5I2Z3wUNbjs9fTOJ6oIhN9WS8ZVBs03UGigf9i2wfFfy8xRLc9XGtUAJI
 l2y4bvCUxMXTV+dSZVX6DMeYpl2GVmgim/FlmY1rUGpgIbiYo4lozSR9SRc6aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q3M4SeNS
Subject: Re: [Buildroot] [PATCH] package/php-pecl-dbus: fix build with PHP8
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

T24gV2VkIEF1ZyA2LCAyMDI1IGF0IDEyOjM0IFBNIENFU1QsIFRob21hcyBQZXRhenpvbmkgd3Jv
dGU6Cj4gSGVsbG8gQWxleGlzLAo+Cj4gT24gV2VkLCAwNiBBdWcgMjAyNSAxMjoyMzo1OSArMDIw
MAo+IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+
Cj4+IFllcywgSSBoYXZlIHRob3NlIGlzc3VlcyBvbiB0aGUgbWFzdGVyIGJyYW5jaCwgb24gMmZk
NTIwYzhkNTJiCj4+ICgicGFja2FnZS9nbG06IGJ1bXAgdmVyc2lvbiB0byAxLjAuMSIpCj4KPiBP
SyEKPgo+PiA+IElzIHRoZSBpc3N1ZQo+PiA+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5u
ZXQvcmVzdWx0cy9lOTgvZTk4OTJiYmVmYTc4MWI0MDNmZDNkODM0YjZjNDg1MjdjOGUwNzhiYS9i
dWlsZC1lbmQubG9nCj4+ID4gcGVyaGFwcyA/IElmIHNvLCBwbGVhc2UgYWRkIGEgcmVmZXJlbmNl
IHRvIHRoZSBhdXRvYnVpbGRlciBmYWlsdXJlLiAgCj4+IAo+PiBZZXMsIHRoYXQgbG9va3MgbGlr
ZSB0aGUgc2FtZSBpc3N1ZSAhIE9rLCBJJ2xsIGFkZCBhIHJlZmVyZW5jZS4KPgo+IFBlcmZlY3Qu
Cj4KPj4gPiBGb3IgYnVnL2J1aWxkIGZpeGVzLCB3ZSBsaWtlIHRvIHVuZGVyc3RhbmQgc2luY2Ug
d2hlbiB0aGUgcHJvYmxlbSBpcwo+PiA+IG9jY3VycmluZywgaS5lIHdoaWNoIGNvbW1pdCBpbnRy
b2R1Y2VkIHRoZSByZWdyZXNzaW9uLiBJZiB0aGlzIHBhY2thZ2UKPj4gPiB3YXMgYnVpbGRpbmcg
b24gMjAyNC4wMiBhbmQgbm8gbG9uZ2VyIG9uIDIwMjUuMDIsIEkgc3VzcGVjdCBpdCdzIG9uZSBv
Zgo+PiA+IHRoZSBQSFAgdmVyc2lvbiBidW1wIGJldHdlZW4gdGhvc2UgdHdvIHJlbGVhc2VzOiAg
Cj4+IAo+PiBUaGUgdXBzdHJlYW0gY29tbWl0IGluIFBIUCBwcm9qZWN0IGxlYWRpbmcgdG8gdGhp
cyBpc3N1ZSBpcyBhY3R1YWxseSB0aGUKPj4gc2FtZSBhcyBmb3IgdGhlIHBocC1sdWEgcGFja2Fn
ZSAoY29tbWl0IDkxZWY0MTI0ZTU2YSAoIlJlZmFjdG9yCj4+IHplbmRfb2JqZWN0X2hhbmRsZXJz
IEFQSSB0byBwYXNzIHplbmRfb2JqZWN0KiBhbmQgemVuZF9zdHJpbmcqIGluc3RlZCBvZgo+PiB6
dmFsKHMpLiIpLCBzbyB0aGUgaXNzdWUgaGFzIGJlZW4gaW50cm9kdWNlZCB3aGVuIHRoZSBQSFAg
cGFja2FnZWQgaGFzIGJlZW4KPj4gYnVtcGVkIHRvIDguMC4wLCBub3QgbGF0ZXIuIEFuZCBhZ2Fp
biwgSSBjYW4gc2VlIHRoZSBpc3N1ZSB3aXRoIGEgbWluaW1hbAo+PiBkZWZjb25maWcgX3doZW4g
dXNpbmcgYm9vdGxpbiBibGVlZGluZy1lZGdlIHRvb2xjaGFpbl8uIFdpdGggc3RhYmxlCj4+IHRv
b2xjaGFpbiwgd2UgY2FuIHNwb3QgdGhlIGNvcnJlc3BvbmRpbmcgd2FybmluZyBpbiBwaHAtZGJ1
cyBidWlsZCBsb2dzLAo+PiBidXQgaXQgaXMgbm90IHR1cm5lZCBpbnRvIGFuIGFjdHVhbCBlcnJv
ci4KPgo+IEFoLCBPSy4gSSB3YXMgd29uZGVyaW5nIHRoZW4gd2h5IHRoZSBpc3N1ZSB3YXMgbm90
IGhhcHBlbmluZyB3aXRoCj4gQnVpbGRyb290IDIwMjQuMDIgd2hpY2ggYWxyZWFkeSBoYWQgUEhQ
ID49IDguMC4wLgo+Cj4gU28gaXQncyByZWFsbHkgdGhlIHN3aXRjaCB0byBHQ0MgMTUueCB0aGF0
IGV4aGliaXRzIHRoZSBpc3N1ZSwgdHVybmluZwo+IGl0IGludG8gYSBoYXJkIGJ1aWxkIGVycm9y
LgoKSSBndWVzcyB5b3UgYXJlIG1lYW5pbmcgR0NDIDE0LnggOikKQW5kIEJUVywgSSBzZWUgdGhh
dCB0aGUgY2hhbmdlIGlzIGRvY3VtZW50ZWQgaW4gR0NDMTQgcG9ydGluZyBndWlkZToKaHR0cHM6
Ly9nY2MuZ251Lm9yZy9nY2MtMTQvcG9ydGluZ190by5odG1sCgpJJ2xsIHVwZGF0ZSB0aGUgdjIg
d2l0aCB0aG9zZSBkZXRhaWxzLCB0aGFua3MgZm9yIHRoZSByZXZpZXcgIQoKQWxleGlzCgotLSAK
QWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
