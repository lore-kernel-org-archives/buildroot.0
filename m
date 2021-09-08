Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662F5C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 15:32:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AF1610C9
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 15:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1AF1610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FDFA83592;
	Wed,  8 Sep 2021 15:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4yecsDneKvx; Wed,  8 Sep 2021 15:32:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E21BF80CE9;
	Wed,  8 Sep 2021 15:32:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEB491BF46D
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 15:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB01B4070C
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 15:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CjDgXPuy4F94 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 15:32:25 +0000 (UTC)
X-Greylist: delayed 00:20:01 by SQLgrey-1.8.0
Received: from 3.mo177.mail-out.ovh.net (3.mo177.mail-out.ovh.net
 [46.105.36.172])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B68140459
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 15:32:25 +0000 (UTC)
Received: from player773.ha.ovh.net (unknown [10.108.1.112])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id C438D1700C3
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 16:56:23 +0200 (CEST)
Received: from armadeus.com (lfbn-str-1-556-12.w90-126.abo.wanadoo.fr
 [90.126.252.12])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 73F7A22009BF9;
 Wed,  8 Sep 2021 14:56:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003980107fd-70b4-4f7d-8ff4-2babe2a5cf55,
 EADA98BCC20AC2D5A098198FB2BDB57DCEC53566)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 90.126.252.12
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 16:55:23 +0200
Message-Id: <20210908145526.3543-2-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
References: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14922395894355192811
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefjedgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepleekgfetgefgheekffdtheekleffvdegieejueffkeetieeikeelffdtteefgfeinecuffhomhgrihhnpehsihhgmhgrqdgthhgvmhhnihhtiidruggvnecukfhppedtrddtrddtrddtpdeltddruddviedrvdehvddruddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH 2/5] package/bayer2rgb-neon: bump version to
 0.6.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvYmF5ZXIycmdiLW5lb24vYmF5ZXIycmdiLW5lb24u
aGFzaCB8IDIgKy0KIHBhY2thZ2UvYmF5ZXIycmdiLW5lb24vYmF5ZXIycmdiLW5lb24ubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmF5ZXIycmdiLW5lb24vYmF5ZXIycmdiLW5lb24uaGFzaCBi
L3BhY2thZ2UvYmF5ZXIycmdiLW5lb24vYmF5ZXIycmdiLW5lb24uaGFzaAppbmRleCBiMWU4N2Q3
YTM2Li4yNmExNGZjYjUxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2JheWVyMnJnYi1uZW9uL2JheWVy
MnJnYi1uZW9uLmhhc2gKKysrIGIvcGFja2FnZS9iYXllcjJyZ2ItbmVvbi9iYXllcjJyZ2ItbmVv
bi5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZDJl
M2U5N2JiOWRhMjE4ZjIyM2MwM2IyZjA4MGM1ZGE3MjcyMjRlNmU0Y2I5OTk3OTM5ODk3MTExMGRm
YWUwNCAgYmF5ZXIycmdiLW5lb24tYmVmM2VjYWZlMjkwZDYxYTUwZmQyN2RhM2U1ZDBkZjZmNGI4
ODA0NS1icjEudGFyLmd6CitzaGEyNTYgIGVkZjQ1MWRiYjUyYWQ2N2ViMzVmOTA0MzM5MGJkNzVl
YTcyMjhkNDkzYzk5MTg0YWFlODBiM2JkMjdiZWFiNjIgIGJheWVyMnJnYi1uZW9uLTE1ZmViMTEx
NWI0ODI4NDg4Y2MzNmQwOWY2MjVlMjNlOGI2YTBlYzUtYnIxLnRhci5negogc2hhMjU2ICA4Y2Vi
NGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWViNjVi
OTAzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JheWVyMnJnYi1uZW9uL2JheWVyMnJn
Yi1uZW9uLm1rIGIvcGFja2FnZS9iYXllcjJyZ2ItbmVvbi9iYXllcjJyZ2ItbmVvbi5tawppbmRl
eCAzNDUxMGU3NjE2Li5hNDgzODkwYzgxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2JheWVyMnJnYi1u
ZW9uL2JheWVyMnJnYi1uZW9uLm1rCisrKyBiL3BhY2thZ2UvYmF5ZXIycmdiLW5lb24vYmF5ZXIy
cmdiLW5lb24ubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwog
Ci1CQVlFUjJSR0JfTkVPTl9WRVJTSU9OID0gYmVmM2VjYWZlMjkwZDYxYTUwZmQyN2RhM2U1ZDBk
ZjZmNGI4ODA0NQorQkFZRVIyUkdCX05FT05fVkVSU0lPTiA9IDE1ZmViMTExNWI0ODI4NDg4Y2Mz
NmQwOWY2MjVlMjNlOGI2YTBlYzUKIEJBWUVSMlJHQl9ORU9OX1NJVEUgPSBodHRwczovL2dpdGxh
Yi1leHQuc2lnbWEtY2hlbW5pdHouZGUvZW5zYy9iYXllcjJyZ2IuZ2l0CiBCQVlFUjJSR0JfTkVP
Tl9TSVRFX01FVEhPRCA9IGdpdAogQkFZRVIyUkdCX05FT05fTElDRU5TRSA9IEdQTC0zLjAKLS0g
CjIuMzIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
