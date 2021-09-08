Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B7BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 16:15:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A89461154
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 16:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A89461154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FB7E40489;
	Wed,  8 Sep 2021 16:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csXGg8wzHGMI; Wed,  8 Sep 2021 16:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB9D402AC;
	Wed,  8 Sep 2021 16:15:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7A41BF3CA
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 16:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F331402AC
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 16:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3gmRl2YRzh9 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 16:15:14 +0000 (UTC)
X-Greylist: delayed 01:00:01 by SQLgrey-1.8.0
Received: from 2.mo550.mail-out.ovh.net (2.mo550.mail-out.ovh.net
 [178.32.119.250])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B0C040219
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 16:15:14 +0000 (UTC)
Received: from player773.ha.ovh.net (unknown [10.110.171.171])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 8AE0920EED
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 14:56:19 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-556-12.w90-126.abo.wanadoo.fr
 [90.126.252.12])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 6D93922009B5A;
 Wed,  8 Sep 2021 14:56:16 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003c981091e-0d1e-456f-acac-bc8f4804cc82,
 EADA98BCC20AC2D5A098198FB2BDB57DCEC53566)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 90.126.252.12
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 16:55:22 +0200
Message-Id: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14920988519210019819
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefjedgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepheekheeuleefgfdujeehkedtgfehfefgieeufeffjeeujeevfeefgfeggeehgeeinecuffhomhgrihhnpehphhihthgvtgdruggvpdhsihhgmhgrqdgthhgvmhhnihhtiidruggvnecukfhppedtrddtrddtrddtpdeltddruddviedrvdehvddruddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH 1/5] package/bayer2rgb-neon: update URL in
 Config.in file
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

VGhlIFVSTCBwb2ludGluZyB0byBwaHl0ZWMuZGUgaXMgb2Jzb2xldGUgYW5kIG5vdCBldmVuIHVz
ZWQgYnkKQnVpbGRyb290LgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNl
YmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvYmF5ZXIycmdiLW5l
b24vQ29uZmlnLmluIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9iYXllcjJyZ2ItbmVvbi9Db25maWcuaW4g
Yi9wYWNrYWdlL2JheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgppbmRleCBlZDA2NWMxZWQ3Li44ZmQx
OGI0ZmE5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2JheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL2JheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgpAQCAtOSw3ICs5LDcgQEAgY29uZmln
IEJSMl9QQUNLQUdFX0JBWUVSMlJHQl9ORU9OCiAJICB0byBkZWNvZGUgcmF3IGNhbWVyYSBiYXll
ciB0byBSR0IgdXNpbmcKIAkgIE5FT04gaGFyZHdhcmUgYWNjZWxlcmF0aW9uLgogCi0JICBodHRw
czovL2dpdC5waHl0ZWMuZGUvYmF5ZXIycmdiLW5lb24vCisJICBodHRwczovL2dpdGxhYi1leHQu
c2lnbWEtY2hlbW5pdHouZGUvZW5zYy9iYXllcjJyZ2IKIAogY29tbWVudCAiYmF5ZXIycmdiLW5l
b24gbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrLCBkeW5hbWljIGxpYnJhcnksIGdjYyA+PSA0Ljki
CiAJZGVwZW5kcyBvbiBCUjJfYXJtICYmIEJSMl9BUk1fQ1BVX0hBU19ORU9OCi0tIAoyLjMyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
