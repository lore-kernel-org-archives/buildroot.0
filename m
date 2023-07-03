Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCD6EB64DC
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD456408AF;
	Mon,  3 Jul 2023 10:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD456408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ryjNT4P5zVW; Mon,  3 Jul 2023 10:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01F51408D5;
	Mon,  3 Jul 2023 10:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01F51408D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF4881BF30C
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 10:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 969A340285
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 10:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 969A340285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENqJdsd1UEM2 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 10:29:10 +0000 (UTC)
X-Greylist: delayed 00:59:45 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A6BA40281
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net
 [188.165.48.182])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A6BA40281
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 10:29:09 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.20.39])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 11C77265E6
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 09:10:07 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dkn7g (unknown [10.110.171.191])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B7F471FD7A;
 Mon,  3 Jul 2023 09:10:06 +0000 (UTC)
Received: from armadeus.com ([37.59.142.102])
 by ghost-submission-6684bf9d7b-dkn7g with ESMTPSA
 id StD1DG6QomRGCwAA4D5dJw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 03 Jul 2023 09:10:06 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 11:10:00 +0200
Message-Id: <20230703091001.12573-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10407255790497688555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddvgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheeiveegjeetiedukedugfeileeigeeludeifeekleeuleefgfdvfefhgfehjeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdguvghrvghfvghrvghntggvugdrohhrghdprghrihgrughnvgdrshhprggtvgenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004a17a03e9-9f71-4101-8cf5-e1c1e9fab4c1,
 576E54CDB430C06E22A30D999DF6CF62A23EFA74)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/pkgconf: fix broken URL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVsZWFzZSB0YXJiYWxsIGxvY2F0aW9uIGhhcyBjaGFuZ2VkIFsxXSwgdXBkYXRlIFBLR0NPTkZf
U0lURS4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vcGtnY29uZi9wa2djb25mL2NvbW1pdC80Mzdj
MmEzMjE4YmZjYjFjYWU3ZmEzOGE0Y2NkMGNiMjk1NzVmZjA3CgpTaWduZWQtb2ZmLWJ5OiBTw6li
YXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQog
cGFja2FnZS9wa2djb25mL3BrZ2NvbmYubWsgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZ2NvbmYvcGtn
Y29uZi5tayBiL3BhY2thZ2UvcGtnY29uZi9wa2djb25mLm1rCmluZGV4IGU5NTg3ZmFlNmIyYy4u
MWQ3M2I2OTFlMTczIDEwMDY0NAotLS0gYS9wYWNrYWdlL3BrZ2NvbmYvcGtnY29uZi5taworKysg
Yi9wYWNrYWdlL3BrZ2NvbmYvcGtnY29uZi5tawpAQCAtNSw3ICs1LDcgQEAKICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCiAKIFBLR0NPTkZfVkVSU0lPTiA9IDEuNi4zCi1QS0dDT05GX1NJVEUgPSBo
dHRwczovL2Rpc3RmaWxlcy5kZXJlZmVyZW5jZWQub3JnL3BrZ2NvbmYKK1BLR0NPTkZfU0lURSA9
IGh0dHBzOi8vZGlzdGZpbGVzLmFyaWFkbmUuc3BhY2UvcGtnY29uZgogUEtHQ09ORl9TT1VSQ0Ug
PSBwa2djb25mLSQoUEtHQ09ORl9WRVJTSU9OKS50YXIueHoKIFBLR0NPTkZfTElDRU5TRSA9IHBr
Z2NvbmYgbGljZW5zZQogUEtHQ09ORl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwotLSAKMi4zOS4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
