Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4B7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 16:16:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E26F061154
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 16:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E26F061154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E0383330;
	Wed,  8 Sep 2021 16:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oW1jKgWHSOJc; Wed,  8 Sep 2021 16:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E85E83312;
	Wed,  8 Sep 2021 16:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 350F51BF3CA
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 16:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24A86613B5
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 16:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5XPeXldciVg for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 16:16:46 +0000 (UTC)
X-Greylist: delayed 01:00:01 by SQLgrey-1.8.0
Received: from 6.mo178.mail-out.ovh.net (6.mo178.mail-out.ovh.net
 [46.105.53.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 637F7613AF
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 16:16:46 +0000 (UTC)
Received: from player773.ha.ovh.net (unknown [10.108.1.153])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 2C13BD93AC
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 16:56:53 +0200 (CEST)
Received: from armadeus.com (lfbn-str-1-556-12.w90-126.abo.wanadoo.fr
 [90.126.252.12])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id ABDCB22009DC9;
 Wed,  8 Sep 2021 14:56:49 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003ed17c66c-66a9-4370-a930-6ce8f41a33ac,
 EADA98BCC20AC2D5A098198FB2BDB57DCEC53566)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 90.126.252.12
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 16:55:26 +0200
Message-Id: <20210908145526.3543-5-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
References: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14930558668406385643
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefjedgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephfefhfejjeffgfeiteejhfetvdeftdekudeltedvveelleeileffgedufeefvddvnecukfhppedtrddtrddtrddtpdeltddruddviedrvdehvddruddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH 5/5] package/gst1-plugins-bayer2rgb-neon: enable
 for BR2_aarch64
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
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIy
cmdiLW5lb24vQ29uZmlnLmluIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1
Z2lucy1iYXllcjJyZ2ItbmVvbi9Db25maWcuaW4gYi9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1w
bHVnaW5zLWJheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgppbmRleCBkM2VlYzMwYzdhLi41NzAzMDBh
MzA0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJheWVyMnJn
Yi1uZW9uL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJh
eWVyMnJnYi1uZW9uL0NvbmZpZy5pbgpAQCAtMSw2ICsxLDYgQEAKIG1lbnVjb25maWcgQlIyX1BB
Q0tBR0VfR1NUMV9QTFVHSU5TX0JBWUVSMlJHQl9ORU9OCiAJYm9vbCAiZ3N0MS1wbHVnaW5zLWJh
eWVyMnJnYi1uZW9uIgotCWRlcGVuZHMgb24gQlIyX2FybSAmJiBCUjJfQVJNX0NQVV9IQVNfTkVP
TiAjIGJheWVyMnJnYi1uZW9uCisJZGVwZW5kcyBvbiAoQlIyX2FybSAmJiBCUjJfQVJNX0NQVV9I
QVNfTkVPTikgfHwgQlIyX2FhcmNoNjQgIyBiYXllcjJyZ2ItbmVvbgogCWRlcGVuZHMgb24gIUJS
Ml9TVEFUSUNfTElCUyAjIGJheWVyMnJnYi1uZW9uCiAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9M
SUJTVERDUFAgIyBiYXllcjJyZ2ItbmVvbgogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0Nf
QVRfTEVBU1RfNF85ICMgYmF5ZXIycmdiLW5lb24KLS0gCjIuMzIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
