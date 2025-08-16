Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04E2CA0EEB
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 09:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ECC4614B9;
	Sat, 16 Aug 2025 09:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZA0xasa2sLdb; Sat, 16 Aug 2025 09:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2ECB61237
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2ECB61237;
	Sat, 16 Aug 2025 09:15:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D780959
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F6CE40C67
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Y4b-WUb072a for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 09:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 768EA40C5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768EA40C5D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 768EA40C5D
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:15:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0BE88430E9;
 Sat, 16 Aug 2025 09:15:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 11:15:12 +0200
Message-ID: <20250816091514.1361588-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816091514.1361588-1-thomas.petazzoni@bootlin.com>
References: <20250816091514.1361588-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeigeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehheffkedvffdtffeivddufffhgeelveefjeeitdfgudehteffieduudefgfetgeenucffohhmrghinhepsghuihhlughrohhothdrnhgvthenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgto
 hhmpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopeihvghgohhrshhlihhsthhssehgohhoghhlvghmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755335716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+GjhQRHqVyRFxZqjpW4FzGQObbzctw27Yi0u/OPeC4=;
 b=bDIu3x8TZu4RqkEPZ7g3PXByelMvleRSsmd2nguWQaL0VG3XOCfFU/K5avw3Xb41SEmqNf
 YQErknzj6SIcU7TlrkhRM1Zu0MroD8SQWMO8lttQSyiAyS4P4xEOgt5y4pN44AycSdpwVg
 1ClECq6KW+nLQGaJOlmcDm68Hb9dBAeg97pKFjbXVcq8RPsEV9EeaI5xiRtUOdGc5OGUvd
 sp9iPgQwygUowT7hCRf7Go3F1cPBu2qkUtAVLGiNQW8xyR8g0/0A8CxrDfURkELfUgII74
 pTUJssxg25Myc4e+5MFIA6eF8zBRJgjD6cbZ2rPhTcWKzsqZVJHZtApmjkBeyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bDIu3x8T
Subject: [Buildroot] [PATCH 2/2] package/python3: work around GCC bug 121567
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBQeXRob24gMyBpcyBidWlsdCB3aXRoIC1PMiBvciAtTzMgb24gU3VwZXJILCB0aGUgYnVp
bGQgZmFpbHMKd2l0aDoKCk9iamVjdHMvb2JtYWxsb2MuYzo1MDM6MTogZXJyb3I6IHVuYWJsZSB0
byBmaW5kIGEgcmVnaXN0ZXIgdG8gc3BpbGwgaW4gY2xhc3Mg4oCYUjBfUkVHU+KAmQogIDUwMyB8
IH0KICAgICAgfCBeCk9iamVjdHMvb2JtYWxsb2MuYzo1MDM6MTogZXJyb3I6IHRoaXMgaXMgdGhl
IGluc246CihpbnNuIDE4IDI0MyAyMyAyIChwYXJhbGxlbCBbCiAgICAgICAgICAgIChzZXQgKHN1
YnJlZzpTSSAocmVnOlFJIDE3NikgMCkKICAgICAgICAgICAgICAgICh1bnNwZWNfdm9sYXRpbGU6
U0kgWwogICAgICAgICAgICAgICAgICAgICAgICAobWVtL3Y6UUkgKHJlZzpTSSA0IHI0IFsxNzVd
KSBbLTEgIFMxIEEzMl0pCiAgICAgICAgICAgICAgICAgICAgICAgIChyZWc6UUkgNyByNyBbMTc4
XSkKICAgICAgICAgICAgICAgICAgICAgICAgKHJlZzpRSSA2IHI2IFsxODBdKQogICAgICAgICAg
ICAgICAgICAgIF0gVU5TUEVDVl9DTVBYQ0hHXzEpKQogICAgICAgICAgICAoc2V0IChtZW0vdjpR
SSAocmVnOlNJIDQgcjQgWzE3NV0pIFstMSAgUzEgQTMyXSkKICAgICAgICAgICAgICAgICh1bnNw
ZWNfdm9sYXRpbGU6UUkgWwogICAgICAgICAgICAgICAgICAgICAgICAoY29uc3RfaW50IDAgWzBd
KQogICAgICAgICAgICAgICAgICAgIF0gVU5TUEVDVl9DTVBYQ0hHXzIpKQogICAgICAgICAgICAo
c2V0IChyZWc6U0kgMTQ3IHQpCiAgICAgICAgICAgICAgICAodW5zcGVjX3ZvbGF0aWxlOlNJIFsK
ICAgICAgICAgICAgICAgICAgICAgICAgKGNvbnN0X2ludCAwIFswXSkKICAgICAgICAgICAgICAg
ICAgICBdIFVOU1BFQ1ZfQ01QWENIR18zKSkKICAgICAgICAgICAgKGNsb2JiZXIgKHNjcmF0Y2g6
U0kpKQogICAgICAgICAgICAoY2xvYmJlciAocmVnOlNJIDAgcjApKQogICAgICAgICAgICAoY2xv
YmJlciAocmVnOlNJIDEgcjEpKQogICAgICAgIF0pICIuL0luY2x1ZGUvY3B5dGhvbi9weWF0b21p
Y19nY2MuaCI6MTA1OjEwIDQwNyB7YXRvbWljX2NvbXBhcmVfYW5kX3N3YXBxaV9zb2Z0X2d1c2F9
CiAgICAgKGV4cHJfbGlzdDpSRUdfREVBRCAocmVnOlFJIDYgcjYgWzE4MF0pCiAgICAgICAgKGV4
cHJfbGlzdDpSRUdfREVBRCAocmVnOlFJIDcgcjcgWzE3OF0pCiAgICAgICAgICAgIChleHByX2xp
c3Q6UkVHX1VOVVNFRCAocmVnOlFJIDE3NikKICAgICAgICAgICAgICAgIChleHByX2xpc3Q6UkVH
X1VOVVNFRCAocmVnOlNJIDEgcjEpCiAgICAgICAgICAgICAgICAgICAgKGV4cHJfbGlzdDpSRUdf
VU5VU0VEIChyZWc6U0kgMCByMCkKICAgICAgICAgICAgICAgICAgICAgICAgKG5pbCkpKSkpKSkK
T2JqZWN0cy9vYm1hbGxvYy5jOjUwMzogY29uZnVzZWQgYnkgZWFybGllciBlcnJvcnMsIGJhaWxp
bmcgb3V0CgpUSGUgYnVnIGhhcyBiZWVuIHJlcG9ydGVkIHVwc3RyZWFtLCBidXQgdW50aWwgaXQg
Z2V0cyBmaXhlZCwgbGV0J3MKd29yayBpdCBhcm91bmQgYnkgdXNpbmcgLU8xIGluc3RlYWQuIE5v
dGUgdGhhdApCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzEyMTU2NyBpcyBvbmx5IHNldCB3aGVu
IC1PMiBvciAtTzMgaXMKY29uZmlndXJlZCwgc28gdGhlcmUncyBubyBuZWVkIHRvIGNoZWNrIGFn
YWluLgoKRml4ZXM6CgogIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9j
YWMxMjNlZTlmM2E2ZGY2MjYzYjY5ZGNlM2FjMGQ1MzU1MThlYzNmLwoKU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiBwYWNr
YWdlL3B5dGhvbjMvcHl0aG9uMy5tayB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsgYi9w
YWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5tawppbmRleCAzMzdlMTQwMWRlLi4wODJkZDY5YmYxIDEw
MDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5taworKysgYi9wYWNrYWdlL3B5dGhv
bjMvcHl0aG9uMy5tawpAQCAtMTkyLDYgKzE5MiwxNSBAQCBlbHNlCiBQWVRIT04zX0NPTkZfRU5W
ICs9IGFjX2N2X2JpZ19lbmRpYW5fZG91YmxlPXllcwogZW5kaWYKIAorUFlUSE9OM19DRkxBR1Mg
PSAkKFRBUkdFVF9DRkxBR1MpCisKK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR18x
MjE1NjcpLHkpCitQWVRIT04zX0NGTEFHUyArPSAtTzEKK2VuZGlmCisKK1BZVEhPTjNfQ09ORl9F
TlYgKz0gXAorCUNGTEFHUz0iJChQWVRIT04zX0NGTEFHUykiCisKIGlmZXEgKCQoQlIyX1BBQ0tB
R0VfR0VUVEVYVF9QUk9WSURFU19MSUJJTlRMKSx5KQogUFlUSE9OM19ERVBFTkRFTkNJRVMgKz0g
Z2V0dGV4dAogZW5kaWYKLS0gCjIuNTAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
