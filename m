Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE0AC54756
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81BE761396;
	Fri, 16 May 2025 21:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdtoDxT0yeCi; Fri, 16 May 2025 21:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 969F661397
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969F661397;
	Fri, 16 May 2025 21:05:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0F522CD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A637817BA
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8qbILmEVFIl for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8AD181166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8AD181166
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8AD181166
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:05:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A51E2439A8;
 Fri, 16 May 2025 21:04:57 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 16 May 2025 23:04:49 +0200
Message-ID: <20250516210452.342275-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
References: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelheethfdtgffghfdtieduvefghffhfeekhfekvdejvdekhfdtkeekhfevffevveenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohihkhholhhlvghnshhvvghnughsvghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhis
 egsohhothhlihhnrdgtohhmpdhrtghpthhtohepsggrgihitghhvgesghhmrghilhdrtghomhdprhgtphhtthhopehjvghsshgvvghvghesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747429497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMHP8ama8fSCukM/N+dpeMv56MZVz0XCW+i56oWFMCM=;
 b=On85Y59qiJ21EmnvpME04rIlVpmqA/rTsQ8FH2A2VPH3guPSj+IliBKPPqvkVIZZni64ts
 1XHah5toDj9q4aD1CAxoHAKf5A2baRzELyIU14/85c7Q5sPCNSMyf9iykYXViE72vpsI3S
 3nTYpAEwV+XjuaTR/Z0g+uw2g6mBNfeh3zAXSknpN3GKNSLRGgnNvc/eAvnx6+3ja1m703
 6klKDhQQPE4KPrqmz0oqgQ2Lm5/TudQCba3ZC6/4plcaYn4nqHQ5w1h4kWvnvIo+PQsUls
 i7HWf546KqeQgVQxosODc3N3gkKdzsvsRPQ66/RxcVXWD3gflbU7cSRGvq8q7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=On85Y59q
Subject: [Buildroot] [PATCH 3/4] package/qt6/qt6multimedia: ffmpeg support
 needs headers >= 5.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIFY0TDIgY29kZSBpbiB0aGUgZmZtcGVnIHBsdWdpbiB1c2VzIFY0TDJfUElYX0ZNVF9CR1JB
MzIgd2hpY2ggd2FzCm9ubHkgaW50cm9kdWNlZCBpbiBrZXJuZWwgaGVhZGVycyA1LjIsIGluIHVw
c3RyZWFtIGtlcm5lbCBjb21taXQKZTI1ZWM5MTQxMTE0YzcxMjRlZWJhMDkzODVlMjcyZGQ3NmZi
ZTYxNy4KCkZpeGVzOgoKL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9idWlsZHJvb3Qvb3V0cHV0cy9x
dC9idWlsZC9xdDZtdWx0aW1lZGlhLTYuOC4xL3NyYy9wbHVnaW5zL211bHRpbWVkaWEvZmZtcGVn
L3F2NGwyY2FtZXJhLmNwcDozNjo0MzogZXJyb3I6IOKAmFY0TDJfUElYX0ZNVF9CR1JBCjMy4oCZ
IHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZTsgZGlkIHlvdSBtZWFuIOKAmFY0TDJfUElY
X0ZNVF9CR1IzMuKAmT8KICAgMzYgfCAgICAgeyBRVmlkZW9GcmFtZUZvcm1hdDo6Rm9ybWF0X0JH
UkE4ODg4LCBWNEwyX1BJWF9GTVRfQkdSQTMyICB9LAogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWNEwyX1BJWF9GTVRfQkdSMzIK
CndoZW4gYnVpbGRpbmc6CgogQlIyX2FybT15CiBCUjJfY29ydGV4X2E5PXkKIEJSMl9BUk1fRU5B
QkxFX1ZGUD15CiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKIEJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfQk9PVExJTj15CiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQVJNVjdfRUFCSUhG
X01VU0xfU1RBQkxFPXkKIEJSMl9QQUNLQUdFX1FUNj15CiBCUjJfUEFDS0FHRV9RVDZCQVNFX1hD
Qj15CiBCUjJfUEFDS0FHRV9RVDZNVUxUSU1FRElBPXkKIEJSMl9QQUNLQUdFX1FUNk1VTFRJTUVE
SUFfRkZNUEVHPXkKIEJSMl9QQUNLQUdFX1hPUkc3PXkKCmF0IGEgdGltZSB3aGVuIHRoZSBCb290
bGluIHN0YWJsZSB0b29sY2hhaW4gd2FzIHVzaW5nIExpbnV4IDQuMTkKaGVhZGVycy4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
Ci0tLQogcGFja2FnZS9xdDYvcXQ2bXVsdGltZWRpYS9Db25maWcuaW4gfCA3ICsrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3F0Ni9x
dDZtdWx0aW1lZGlhL0NvbmZpZy5pbiBiL3BhY2thZ2UvcXQ2L3F0Nm11bHRpbWVkaWEvQ29uZmln
LmluCmluZGV4IDMxMDdjYWE1OTcuLmY2NGY2MGEwMDQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcXQ2
L3F0Nm11bHRpbWVkaWEvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvcXQ2L3F0Nm11bHRpbWVkaWEv
Q29uZmlnLmluCkBAIC0yOCwxMCArMjgsMTcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1FUNk1VTFRJ
TUVESUFfRVhBTVBMRVMKIAloZWxwCiAJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBRdDYgTXVs
dGltZWRpYSBleGFtcGxlcy4KIAorY29tbWVudCAiZmZtcGVnIHBsdWdpbiBuZWVkcyBrZXJuZWwg
aGVhZGVycyA+PSA1LjIiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9GRk1QRUdfQVJDSF9TVVBQ
T1JUUworCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUFVMU0VBVURJT19IQVNfQVRPTUlDCisJZGVw
ZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfMgorCiBjb25maWcgQlIy
X1BBQ0tBR0VfUVQ2TVVMVElNRURJQV9GRk1QRUcKIAlib29sICJmZm1wZWcgcGx1Z2luIgogCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfRkZNUEVHX0FSQ0hfU1VQUE9SVFMKIAlkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX1BVTFNFQVVESU9fSEFTX0FUT01JQworCSMgVjRMMl9QSVhfRk1UX0JHUkEzMgor
CWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfMgogCSMgcXQ2LW11
bHRpbWVkaWEgZmZtcGVnIHBsdWdpbiBuZWVkcwogCSMgcXQ2YmFzZS1jb25jdXJyZW50LCBQdWxz
ZUF1ZGlvIGFuZCBmZm1wZWctc3djYWxlLgogCXNlbGVjdCBCUjJfUEFDS0FHRV9GRk1QRUcKLS0g
CjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
