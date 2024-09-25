Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D947C369A4
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 07:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA9B60B17;
	Wed, 25 Sep 2024 07:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2rrCnAolWNZ; Wed, 25 Sep 2024 07:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4CFA60B23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4CFA60B23;
	Wed, 25 Sep 2024 07:48:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEF641BF271
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 07:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC9DF4040A
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 07:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUvRWRQbBpTE for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 07:48:35 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.178.240; helo=mslow1.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32B2A40180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B2A40180
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32B2A40180
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 07:48:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4DE00C19A6
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 07:48:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30DFA1BF209;
 Wed, 25 Sep 2024 07:48:26 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Wed, 25 Sep 2024 09:48:27 +0200
MIME-Version: 1.0
Message-Id: <20240925-mscan-coreutils-v1-1-3765769290e8@yoseli.org>
X-B4-Tracking: v=1; b=H4sIAErA82YC/x2N0QqDMAwAf0XyvEDbOWT7lbGH2EYNaB2JiiD++
 +oej+O4A4xV2OBVHaC8icmcC/hbBXGg3DNKKgzBhdo9wwMni5QxzsrrIqMhpdTc64a87xyUqiV
 jbJVyHK5uIltYL/FV7mT/r96f8/wB83ApNHoAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727250506; l=2395;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=jjxIT4Zq6T0+MUdS+hgFZ+N/3BOqa8k0BOA0KVKj0nI=;
 b=C+WChQn40LH8qw/WDmViQXt84rupCs/zmi7G+B2+AHzsMs6ZofddpXCEHFYLVsaTTyUKdmqik
 NcSJQpFk248BnQ4VY/ddrjExo5NJwocokFs8+9Wn8jsAnjNdWui3BS9
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1727250507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U9MD3tToHQYnAL5TxifgmNz8zWpGbhzrs1MIFOeX4Vk=;
 b=mVb4sJi2vgF0kUWCh4ITpapFoF2Scw43+9hjSBORbdGQzhHpM2cQyj3Enjed3/t4ED/10s
 mZ1nMg/XgLJ6fjJWW1ATGtJpMKdM+5w0jogLwVBa2ToQK3XDezIcnPKryjSwPeFUP/qVRy
 WYOnPUES+5V/fMD1VCObcOo0hXLYeSOH/+siyfplc0bF1JraonL1iua3+5Km9grX1Ft2dx
 1UPzJAqRfSzNc0c5gk/m47RP6/Ux6G8ihT4uzS86sKCJYfNd2+WHoX+3ZSFPbn2uzqq60b
 ApY4FeQ1/jGVjmevWVZH5dZV/X7PaC2Zo8DVI6fW1InMIBFXMEmcQ/JwSWYI0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=mVb4sJi2
Subject: [Buildroot] [PATCH] package: coreutils: fix mcel for uClibc-ng
 compatibility
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UHJvYmxlbSByZXBvcnRlZCBieSBXYWxkZW1hciBCcm9ka29yYiBpbjoKaHR0cHM6Ly9saXN0cy5n
bnUub3JnL3IvYnVnLWdudWxpYi8yMDI0LTA4L21zZzAwMTMwLmh0bWwKClRoaXMgcGF0Y2ggbW9k
aWZpZXMgbWNlbF9zY2FuIHRvIGF2b2lkIHRyZWF0aW5nIHVDbGliYy1uZyBhcyBpZiBpdCB3ZXJl
CmdsaWJjLCByZXNvbHZpbmcgY29tcGF0aWJpbGl0eSBpc3N1ZXMuCgpTcGVjaWZpY2FsbHksIHVD
bGliYy1uZyB3YXMgaW5jb3JyZWN0bHkgdHJlYXRlZCBsaWtlIGdsaWJjIGluIHRoZSBjb2RlLAp3
aGljaCBsZWQgdG8gaW5jb3JyZWN0IGFzc3VtcHRpb25zIGFib3V0IHRoZSBtYnN0YXRlX3QgaW5p
dGlhbGl6YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1p
Y2hlbC5oYXV0Ym9pc0B5b3NlbGkub3JnPgotLS0KIC4uLi8wMDAxLWNvcmV1dGlscy1tY2VsLXBv
cnQtdG8tdUNsaWJjLW5nLnBhdGNoICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2NvcmV1
dGlscy8wMDAxLWNvcmV1dGlscy1tY2VsLXBvcnQtdG8tdUNsaWJjLW5nLnBhdGNoIGIvcGFja2Fn
ZS9jb3JldXRpbHMvMDAwMS1jb3JldXRpbHMtbWNlbC1wb3J0LXRvLXVDbGliYy1uZy5wYXRjaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4zMDBhMGI3MWFiCi0tLSAvZGV2
L251bGwKKysrIGIvcGFja2FnZS9jb3JldXRpbHMvMDAwMS1jb3JldXRpbHMtbWNlbC1wb3J0LXRv
LXVDbGliYy1uZy5wYXRjaApAQCAtMCwwICsxLDM0IEBACitGcm9tIGM0ZTkyM2E5OGYzNGZlNWY1
ZWMzYjQ5NTQzZTkwNzE2ZWMyYTQ1ZmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBK
ZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0Ym9pc0B5b3NlbGkub3JnPgorRGF0
ZTogVHVlLCAyNCBTZXAgMjAyNCAxODowODozMSArMDIwMAorU3ViamVjdDogW1BBVENIXSBjb3Jl
dXRpbHM6IG1jZWw6IHBvcnQgdG8gdUNsaWJjLW5nCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0CisKK1Byb2JsZW0gcmVwb3J0ZWQgYnkgV2FsZGVtYXIgQnJvZGtvcmIgaW46Cito
dHRwczovL2xpc3RzLmdudS5vcmcvci9idWctZ251bGliLzIwMjQtMDgvbXNnMDAxMzAuaHRtbAor
KiBsaWIvbWNlbC5oIChtY2VsX3NjYW4pOiBEb27DouKCrOKEonQgdHJlYXQgdUNsaWJjLW5nIGxp
a2UgZ2xpYmMuCisKK1NpZ25lZC1vZmYtYnk6IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWlj
aGVsLmhhdXRib2lzQHlvc2VsaS5vcmc+CistLS0KKyBsaWIvbWNlbC5oIHwgMyArKy0KKyAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQg
YS9saWIvbWNlbC5oIGIvbGliL21jZWwuaAoraW5kZXggZjZmMDA2Yy4uZGNhNGQwOCAxMDA2NDQK
Ky0tLSBhL2xpYi9tY2VsLmgKKysrKyBiL2xpYi9tY2VsLmgKK0BAIC0yMjEsNyArMjIxLDggQEAg
bWNlbF9zY2FuIChjaGFyIGNvbnN0ICpwLCBjaGFyIGNvbnN0ICpsaW0pCisgCisgICAvKiBBbiBp
bml0aWFsIG1ic3RhdGVfdDsgaW5pdGlhbGl6YXRpb24gb3B0aW1pemVkIGZvciBzb21lIHBsYXRm
b3Jtcy4KKyAgICAgIEZvciBkZXRhaWxzIGFib3V0IHRoZXNlIGFuZCBvdGhlciBwbGF0Zm9ybXMs
IHNlZSB3Y2hhci5pbi5oLiAgKi8KKy0jaWYgZGVmaW5lZCBfX0dMSUJDX18gJiYgMiA8IF9fR0xJ
QkNfXyArICgyIDw9IF9fR0xJQkNfTUlOT1JfXykKKysjaWYgKGRlZmluZWQgX19HTElCQ19fICYm
IDIgPCBfX0dMSUJDX18gKyAoMiA8PSBfX0dMSUJDX01JTk9SX18pIFwKKysJJiYgIWRlZmluZWQg
X19VQ0xJQkNfXykKKyAgIC8qIEFsdGhvdWdoIG9ubHkgYSB0cml2aWFsIG9wdGltaXphdGlvbiwg
aXQncyB3b3J0aCBpdCBmb3IgR05VLiAgKi8KKyAgIG1ic3RhdGVfdCBtYnM7IG1icy5fX2NvdW50
ID0gMDsKKyAjZWxpZiAoZGVmaW5lZCBfX0ZyZWVCU0RfXyB8fCBkZWZpbmVkIF9fRHJhZ29uRmx5
X18gfHwgZGVmaW5lZCBfX09wZW5CU0RfXyBcCistLSAKKzIuMzkuMgorCgotLS0KYmFzZS1jb21t
aXQ6IDA5ODI0OThjNjczNWEyZDkwYjU1NDAzNzBkMTdlNDhjMzFjOTYyYmMKY2hhbmdlLWlkOiAy
MDI0MDkyNS1tc2Nhbi1jb3JldXRpbHMtYWRkNzM0N2ExMWYwCgpCZXN0IHJlZ2FyZHMsCi0tIApK
ZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0Ym9pc0B5b3NlbGkub3JnPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
