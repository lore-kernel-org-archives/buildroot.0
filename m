Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AB4C3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 21:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A936408FE;
	Sat, 17 May 2025 21:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TjVB6u29OBg; Sat, 17 May 2025 21:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF2A740912
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF2A740912;
	Sat, 17 May 2025 21:09:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AC32E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76F1840900
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tDv0YDHJbAE for <buildroot@buildroot.org>;
 Sat, 17 May 2025 21:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76CA1408FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76CA1408FE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76CA1408FE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:09:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9014743A6A;
 Sat, 17 May 2025 21:09:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uGOmc-00FBnA-0S;
 Sat, 17 May 2025 23:09:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 23:09:21 +0200
Message-Id: <20250517210922.3620220-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptddvtefgueetveffffefkeehtedtteeffeegvdejueetjeetheelhfevgfffteejnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/dhrystone: fix builds with GCC 15
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R0NDIDE1IGRlZmF1bHRzIHRvIC1zdGQ9Z251MjMsIHdoaWNoIGhhbmRsZXMgZnVuY3Rpb24gZGVj
bGFyYXRpb25zIHdpdGhvdXQKcGFyYW1ldGVycyBkaWZmZXJlbnRseSBmcm9tIGVhcmxpZXIgQyBz
dGFuZGFyZHMgbGVhZGluZyB0byBjb21waWxhdGlvbgplcnJvcnM6CgpkaHJ5XzEuYzogSW4gZnVu
Y3Rpb24g4oCYbWFpbuKAmToKZGhyeV8xLmM6MTc2OjE5OiBlcnJvcjogdG9vIG1hbnkgYXJndW1l
bnRzIHRvIGZ1bmN0aW9uIOKAmEZ1bmNfMuKAmTsgZXhwZWN0ZWQgMCwgaGF2ZSAyCiAgMTc2IHwg
ICAgIEJvb2xfR2xvYiA9ICEgRnVuY18yIChTdHJfMV9Mb2MsIFN0cl8yX0xvYyk7CgpodHRwczov
L2djYy5nbnUub3JnL2djYy0xNS9wb3J0aW5nX3RvLmh0bWwjYzIzLWZuLWRlY2xzLXdpdGhvdXQt
cGFyYW1ldGVycwoKQXMgYSB3b3JrYXJvdW5kLCBmb3JjZSB0aGUgYnVpbGQgdG8gdXNlIC1zdGQ9
Z251OTkgbW9kZS4KClNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dh
YXJkLmNvbT4KLS0tCiBwYWNrYWdlL2RocnlzdG9uZS9kaHJ5c3RvbmUubWsgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2RocnlzdG9uZS9kaHJ5c3RvbmUubWsgYi9wYWNrYWdlL2RocnlzdG9uZS9kaHJ5c3Rv
bmUubWsKaW5kZXggZDU0YzhkOTRlOC4uZjAwNTUzZDU2NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9k
aHJ5c3RvbmUvZGhyeXN0b25lLm1rCisrKyBiL3BhY2thZ2UvZGhyeXN0b25lL2RocnlzdG9uZS5t
awpAQCAtMTQsNyArMTQsNyBAQCBkZWZpbmUgREhSWVNUT05FX0VYVFJBQ1RfQ01EUwogZW5kZWYK
IAogZGVmaW5lIERIUllTVE9ORV9CVUlMRF9DTURTCi0JJChUQVJHRVRfQ09ORklHVVJFX09QVFMp
ICQoTUFLRSkgLUMgJChARCkKKwkkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgQ0ZMQUdTPSIkKFRB
UkdFVF9DRkxBR1MpIC1zdGQ9Z251OTkiICQoTUFLRSkgLUMgJChARCkKIGVuZGVmCiAKIGRlZmlu
ZSBESFJZU1RPTkVfSU5TVEFMTF9UQVJHRVRfQ01EUwotLSAKMi4zOS41CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
