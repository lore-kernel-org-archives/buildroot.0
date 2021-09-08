Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195A6C433FE
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 15:14:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F9B960F6C
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 15:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F9B960F6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0DE7404FE;
	Wed,  8 Sep 2021 15:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejI6EWr2Rnj2; Wed,  8 Sep 2021 15:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3923940355;
	Wed,  8 Sep 2021 15:14:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8F851BF376
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 15:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6CCC401EE
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 15:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4f-hexe2rH6 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 15:14:00 +0000 (UTC)
X-Greylist: delayed 00:17:21 by SQLgrey-1.8.0
Received: from 7.mo69.mail-out.ovh.net (7.mo69.mail-out.ovh.net [46.105.50.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 743134016F
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 15:14:00 +0000 (UTC)
Received: from player773.ha.ovh.net (unknown [10.110.171.54])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id AD3FACA290
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 16:56:37 +0200 (CEST)
Received: from armadeus.com (lfbn-str-1-556-12.w90-126.abo.wanadoo.fr
 [90.126.252.12])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 5A97922009CE4;
 Wed,  8 Sep 2021 14:56:34 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0039c3baadc-e762-4aa2-842b-e35ad01b097b,
 EADA98BCC20AC2D5A098198FB2BDB57DCEC53566)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 90.126.252.12
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 16:55:24 +0200
Message-Id: <20210908145526.3543-3-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
References: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14926336542764821483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefjedgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephfefhfejjeffgfeiteejhfetvdeftdekudeltedvveelleeileffgedufeefvddvnecukfhppedtrddtrddtrddtpdeltddruddviedrvdehvddruddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH 3/5] package/bayer2rgb-neon: enable for
 BR2_aarch64
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
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvYmF5ZXIycmdiLW5lb24vQ29uZmlnLmluICAgICAg
ICAgfCAyICstCiBwYWNrYWdlL2JheWVyMnJnYi1uZW9uL2JheWVyMnJnYi1uZW9uLm1rIHwgOCAr
KysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9iYXllcjJyZ2ItbmVvbi9Db25maWcuaW4gYi9wYWNrYWdl
L2JheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgppbmRleCA4ZmQxOGI0ZmE5Li43ODIyMTcxMDIwIDEw
MDY0NAotLS0gYS9wYWNrYWdlL2JheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L2JheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgpAQCAtMSw2ICsxLDYgQEAKIGNvbmZpZyBCUjJfUEFD
S0FHRV9CQVlFUjJSR0JfTkVPTgogCWJvb2wgImJheWVyMnJnYi1uZW9uIgotCWRlcGVuZHMgb24g
QlIyX2FybSAmJiBCUjJfQVJNX0NQVV9IQVNfTkVPTgorCWRlcGVuZHMgb24gKEJSMl9hcm0gJiYg
QlIyX0FSTV9DUFVfSEFTX05FT04pIHx8IEJSMl9hYXJjaDY0CiAJZGVwZW5kcyBvbiAhQlIyX1NU
QVRJQ19MSUJTCiAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAKIAlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOSAjIEMrKzExCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2JheWVyMnJnYi1uZW9uL2JheWVyMnJnYi1uZW9uLm1rIGIvcGFja2FnZS9iYXllcjJyZ2It
bmVvbi9iYXllcjJyZ2ItbmVvbi5tawppbmRleCBhNDgzODkwYzgxLi4yMTJmZTc2NzY2IDEwMDY0
NAotLS0gYS9wYWNrYWdlL2JheWVyMnJnYi1uZW9uL2JheWVyMnJnYi1uZW9uLm1rCisrKyBiL3Bh
Y2thZ2UvYmF5ZXIycmdiLW5lb24vYmF5ZXIycmdiLW5lb24ubWsKQEAgLTEzLDYgKzEzLDEyIEBA
IEJBWUVSMlJHQl9ORU9OX0lOU1RBTExfU1RBR0lORyA9IFlFUwogQkFZRVIyUkdCX05FT05fREVQ
RU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGhvc3QtZ2VuZ2V0b3B0CiBCQVlFUjJSR0JfTkVPTl9B
VVRPUkVDT05GID0gWUVTCiAKLUJBWUVSMlJHQl9ORU9OX0NPTkZfRU5WID0gQ0ZMQUdTPSIkKFRB
UkdFVF9DRkxBR1MpIC1tZnB1PW5lb24iCitCQVlFUjJSR0JfTkVPTl9DRkxBR1MgPSAkKFRBUkdF
VF9DRkxBR1MpCisKK2lmZXEgKCQoQlIyX2FybSkseSkKK0JBWUVSMlJHQl9ORU9OX0NGTEFHUyAr
PSAtbWZwdT1uZW9uCitlbmRpZgorCitCQVlFUjJSR0JfTkVPTl9DT05GX0VOViA9IENGTEFHUz0i
JChCQVlFUjJSR0JfTkVPTl9DRkxBR1MpIgogCiAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkp
Ci0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
