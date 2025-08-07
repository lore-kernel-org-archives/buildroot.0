Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD300C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76370401EB;
	Thu,  7 Aug 2025 17:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1C_xyAaPy1P; Thu,  7 Aug 2025 17:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF6D2401EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF6D2401EF;
	Thu,  7 Aug 2025 17:44:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 264F631
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D3E260596
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quab-e6ScJFl for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16ABC6059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16ABC6059C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16ABC6059C
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FC85442AA;
 Thu,  7 Aug 2025 17:44:07 +0000 (UTC)
Date: Thu, 07 Aug 2025 19:43:46 +0200
Message-Id: <20250807-libldns_drill-v1-0-5d8713fb0860@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANLllGgC/x3MQQqAIBBA0avIrBNUUqSrRETmWANioRCBePek5
 Vv8X6FgJiwwsQoZHyp0pQ45MNjPLR3IyXeDEkoLKwyP5KJPZfWZYuTCyiB1GA1qB725MwZ6/9+
 8tPYBYTfuVF8AAAA=
X-Change-ID: 20250806-libldns_drill-081f15f46e5b
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgtdehffdtveejgefghfdtudejveekleeihfeuuddtffehffejueeijefglefgjeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhou
 hhprdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754588647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kDZMVh21L1ej+CGDnIrRUC4cEKOTG6Vv85oPqJwHlS4=;
 b=JJDenIyKJUklNwGbwLQcElnqQrFK1l8LWaiIAG4FCluOUtG0s1pTPvGRFplszi3uWKg7WU
 QoJCIhN/xYCb5V2H60ytl5Oh52W+wc6SM5uIBEqutdjjF4Y4w17aJLv+BdsgFEX5sfE82u
 CShDRjj5b9QDibjLOLz3HPWHGcA4AENIMP8xS7N9kzCGnWpUwPJJ5MUB221OaM3DKxzmFB
 lqHUPPjs97RnQrHfnt6sPnoTmwqDJio6ki3i9pOjh1J2MNXYV2YsjHkm+ZbrUavZGJKcl+
 8PWeDmxFZVPtv7iDx5oNK1GEQJKu0YfrtnVdaKw+AvXtZ3UXEwriVvvkcHM0JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JJDenIyK
Subject: [Buildroot] [PATCH 0/2] package/libldns: allow to build drill
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

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGFpbXMgdG8gYWxsb3cgYnVpbGRpbmcgdGhlIGRyaWxs
IGNvbW1hbmRsaW5lIHRvb2wsCnN1cHBvcnRlZCBieSBsaWJsZG5zIHBhY2thZ2UuIFRoaXMgaXMg
YSBzbWFsbCBDTEkgdG9vbCBhbGxvd2luZyB0bwpwZXJmb3JtIGFuZCBkZWJ1ZyBETlMgcmVxdWVz
dHMuIFdoaWxlIGF0IGl0LCB0aGUgc2VyaWVzIGJyaW5ncyBpbiBhCnNtYWxsIHJ1bnRpbWUgdGVz
dCB2YWxpZGF0aW5nIHRoYXQgdGhlIGJpbmFyeSAoYW5kIHNvLCB0aGUgbGlicmFyeSBpdApkZXBl
bmRzIG9uKSBpcyBjb3JyZWN0bHkgYnVpbHQsIGluc3RhbGxlZCwgYW5kIHRoYXQgaXQgaXMgYWJs
ZSB0byBydW4gb24KdGhlIHRhcmdldCBhcmNoaXRlY3R1cmUuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KQWxleGlzIExvdGhv
csOpICgyKToKICAgICAgcGFja2FnZS9saWJsZG5zOiBhZGQgYW4gb3B0aW9uIHRvIGJ1aWxkIGFu
ZCBpbnN0YWxsIGRyaWxsCiAgICAgIHN1cHBvcnQvdGVzdGluZzogYWRkIGJhc2ljIHJ1bnRpbWUg
dGVzdCBmb3IgbGlibGRucy9kcmlsbAoKIHBhY2thZ2UvbGlibGRucy9Db25maWcuaW4gICAgICAg
ICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCiBwYWNrYWdlL2xpYmxkbnMvbGlibGRu
cy5tayAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCiBzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X2xpYmxkbnMucHkgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIDMg
ZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IDEzNzVhYWJm
NzRjMmY5NmE2NjIxZTM1ZmZmMTcxZTVhNDdhNzQyNWUKY2hhbmdlLWlkOiAyMDI1MDgwNi1saWJs
ZG5zX2RyaWxsLTA4MWYxNWY0NmU1YgoKQmVzdCByZWdhcmRzLAotLSAKQWxleGlzIExvdGhvcsOp
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
