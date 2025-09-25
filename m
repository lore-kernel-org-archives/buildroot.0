Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED10CAC5B1
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 14:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A21D2613AB;
	Thu, 25 Sep 2025 14:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzVWFGl_nqhd; Thu, 25 Sep 2025 14:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC47961483
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC47961483;
	Thu, 25 Sep 2025 14:51:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE734177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 14:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A04E6613AB
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 14:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8oizooF3xmF for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 14:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63C7361483
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C7361483
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63C7361483
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 14:50:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00D0043B4E;
 Thu, 25 Sep 2025 14:50:57 +0000 (UTC)
Date: Thu, 25 Sep 2025 16:50:52 +0200
MIME-Version: 1.0
Message-Id: <20250925-fix-pyopenssl-v1-1-dce0a1fc2644@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMtW1WgC/x2MQQqAIBAAvyJ7zjBBsr4SHSLXWggTF8IQ/550H
 JiZAoyJkGEWBRI+xHSHBkMnYD+3cKAk1xi00kZN2khPWcb3jhiYL2lGtM76QVnnoTUxYRP+3/I
 3vdJ9hrXWDzFiTRlqAAAA
X-Change-ID: 20250925-fix-pyopenssl-57e8d8f108df
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiieejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedukedvffeiheeuuefgudejgfdtvdegkedvtdeiffffleevtdegffejkeejlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudekiegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1758811858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=849ljHrSSaj9W+aj0x/k9ttQltoRcI9ra06xJAodZ1E=;
 b=IzTVC2RFeGOH+TMpFbAMs1upEz4twWyQtb0IFdx01DrmGDyP0XtNAUWOT8wBPTuNIDdzpS
 a54mRC5T6OHLSR31jRSvmvqeRiYMDVAbqK+57y9t/BSxTrS2LAHbmMGeAD1KFUm5/PRUL6
 r2ANZx50Yw7OKCuZHOjSUhDdPsAgVDWMWAbzqYglOcD0TEgSliZE6qeM3jlFmAWcFRWcyS
 kNojIUULZ3ToCs8aq9zIIozC9+rEHczLGKpQe4+8t6ZKQ9Oh7Qa5/IkuPClgJjbdBOAWp6
 5bcAl5ni3YasZ7kQpH3FMq6CXQbXJcPFOVf6MUF4AxKtIeOvY+FcuvUKrd8zXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IzTVC2RF
Subject: [Buildroot] [PATCH 2025.02.x] package/python-pyopenssl: add missing
 dependency for deprecation handling
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBjb21taXQgYmJkY2I3NWQ3ZjE5ICgicGFja2FnZS9weXRob24tcHlvcGVuc3NsOiBidW1w
IHRvIHZlcnNpb24KMjUuMC4wIikgaGFzIGJlZW4gYWRkZWQsIGl0IGhhcyBzaWxlbnRseSBpbnRy
b2R1Y2VkIGEgbmV3IGRlcGVuZGVuY3kgb24KdHlwaW5nX2V4dGVuc2lvbnMgdGhhdCBoYXMgbm90
IGJlZW4gcG9ydGVkIGluIHRoZSBjb3JyZXNwb25kaW5nCkNvbmZpZy5pbiwgcmVzdWx0aW5nIGlu
IGZhaWx1cmVzIGF0IHJ1bnRpbWUgd2hlbiB0cnlpbmcgdG8gaW1wb3J0IHRoZQptb2R1bGU6CgpN
b2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ3R5cGluZ19leHRlbnNpb25zJwoK
VGhlIHVwc3RyZWFtIHByb2plY3QgaGFzIGluZGVlZCBpbnRyb2R1Y2VkIHRoZSBmb2xsb3dpbmcg
ZGVwcmVjYXRpb24KaGFuZGxpbmcgc25pcHBldCB3aXRoIGNvbW1pdCAxYjJiMGVkMjE5ODYgKCJV
c2UgdHlwZS1sZXZlbCBkZXByZWNhdGlvbnMKKCMxMzg5KSIpOgoKICBpZiBzeXMudmVyc2lvbl9p
bmZvID49ICgzLCAxMyk6CiAgICAgIGZyb20gd2FybmluZ3MgaW1wb3J0IGRlcHJlY2F0ZWQKICBl
bGlmIHN5cy52ZXJzaW9uX2luZm8gPCAoMywgOCk6CiAgICAgIF9UID0gdHlwaW5nLlR5cGVWYXIo
IlQiKQoKICAgICAgZGVmIGRlcHJlY2F0ZWQobXNnOiBzdHIsICoqa3dhcmdzOiBvYmplY3QpIC0+
IENhbGxhYmxlW1tfVF0sIF9UXToKICAgICAgICAgIHJldHVybiBsYW1iZGEgZjogZgogIGVsc2U6
CiAgICAgIGZyb20gdHlwaW5nX2V4dGVuc2lvbnMgaW1wb3J0IGRlcHJlY2F0ZWQKClRoaXMgdGhl
biBicmVha3Mgc3lzdGVtcyB3aXRoIHB5b3BlbnNzbCA+PSAyNS4wLjAsIHB5dGhvbiA8IDMuMTMs
IHB5dGhvbgo+PSAzLjgsIGFuZCB3aXRob3V0IHR5cGluZ19leHRlbnNpb25zLgoKRml4IHRoZSBt
aXNzaW5nIGRlcGVuZGVuY3kgYnkgYWRkaW5nIGl0IGV4cGxpY2l0ZWx5IGluIHB5b3BlbnNzbApD
b25maWcuaW4KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Ci0tLQpUaGUgc3BlY2lmaWMgYnVnIGNvbmRpdGlvbnMgZGVzY3JpYmVkIGFi
b3ZlIGFyZSBvbmx5IHByZXNlbnQgaW4gdGhlCjIwMjUuMDIueCBicmFuY2g6IHB5dGhvbiBoYXMg
YmVlbiB1cGRhdGVkIHRvIHZlcnNpb24gMy4xMyByaWdodCBhZnRlcgp0aGlzIHJlbGVhc2UgYnJh
bmNoLCBtYWtpbmcgdGhlIGZpeCB1bm5lZWRlZCBvbiB0aGUgb3RoZXIgcmVsZWFzZQpicmFuY2hl
cyBvciBtYXN0ZXIuCi0tLQogcGFja2FnZS9weXRob24tcHlvcGVuc3NsL0NvbmZpZy5pbiB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tcHlvcGVuc3NsL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLXB5b3BlbnNzbC9Db25m
aWcuaW4KaW5kZXggNTZmMzhmNTg4ODFmYmYyYjBjZjU5NDA0ODIzOGIzYzEwY2M0MDU1MC4uMTg0
YWQzYzVmNWJjMTkwZDk1NWQzODZiMTgxNmY2NjAxYzRhNzI0YSAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9weXRob24tcHlvcGVuc3NsL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3B5dGhvbi1weW9wZW5z
c2wvQ29uZmlnLmluCkBAIC0yLDYgKzIsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZ
T1BFTlNTTAogCWJvb2wgInB5dGhvbi1weW9wZW5zc2wiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTICMgcHl0aG9uLWNyeXB0b2dyYXBoeQog
CXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fQ1JZUFRPR1JBUEhZICMgcnVudGltZQorCXNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fVFlQSU5HX0VYVEVOU0lPTlMKIAloZWxwCiAJICBQeXRob24g
d3JhcHBlciBtb2R1bGUgYXJvdW5kIHRoZSBPcGVuU1NMIGxpYnJhcnkuCiAKCi0tLQpiYXNlLWNv
bW1pdDogYzU1YmVkMjYzZDM4ZGRhMDIwNDg0NjUwY2Y3ZDA3ZTk0NzdhMGQ1YgpjaGFuZ2UtaWQ6
IDIwMjUwOTI1LWZpeC1weW9wZW5zc2wtNTdlOGQ4ZjEwOGRmCgpCZXN0IHJlZ2FyZHMsCi0tIApB
bGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
