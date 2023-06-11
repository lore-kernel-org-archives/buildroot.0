Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B484CC77B7A
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 00:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2815D60B8C;
	Mon, 12 Jun 2023 00:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2815D60B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7w6PqfO-IfYx; Mon, 12 Jun 2023 00:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BC660B43;
	Mon, 12 Jun 2023 00:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58BC660B43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D31461BF947
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 00:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A767B82056
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 00:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A767B82056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJGI5sKmTqML for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 00:55:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 444A382055
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net
 [87.98.172.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 444A382055
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 00:55:28 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.138.245])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 46E9224334
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 23:36:36 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pl8sk (unknown [10.109.138.36])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 716371FD10;
 Sun, 11 Jun 2023 23:36:35 +0000 (UTC)
Received: from blach.pl ([37.59.142.107])
 by ghost-submission-6684bf9d7b-pl8sk with ESMTPSA
 id QFmcFYNahmSPFgAAc/dVnA
 (envelope-from <grzegorz@blach.pl>); Sun, 11 Jun 2023 23:36:35 +0000
X-OVh-ClientIp: 91.239.248.252
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 01:36:18 +0200
Message-Id: <20230611233619.128038-5-grzegorz@blach.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611233619.128038-1-grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6522338161690296663
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepifhriigvghhorhiiuceulhgrtghhuceoghhriigvghhorhiisegslhgrtghhrdhplheqnecuggftrfgrthhtvghrnhepieffhfetleevtddutdeutdefleegvdejveefueethefgtdfgjefhvdetffejhedvnecuffhomhgrihhnpehphihpihdrohhrghdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppeduvdejrddtrddtrddupdeluddrvdefledrvdegkedrvdehvddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhiivghgohhriiessghlrggthhdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00151a39f78-4e2f-46fa-9190-61fca5001389,
 8D931DDE0DEECB89AEA118D672F623587F6625E2) smtp.auth=grzegorz@blach.pl
Subject: [Buildroot] [PATCH 5/6] package/python-redis: bump to version 4.5.5
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 209ff35b78..e27f87bd50 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  4ab691af57ac346c2e630ce2787a424f  redis-4.4.0.tar.gz
-sha256  7b8c87d19c45d3f1271b124858d2a5c13160c4e74d4835e28273400fa34d5228  redis-4.4.0.tar.gz
+md5  ad365234df634680d15294ddc87c42de  redis-4.5.5.tar.gz
+sha256  dc87a0bdef6c8bfe1ef1e1c40be7034390c2ae02d92dcd0c7ca1729443899880  redis-4.5.5.tar.gz
 # Locally computed sha256 checksums
 sha256  7801a39e3a1aec58a7ea7c9f4dc1238cf0922c36a1fc8eff0bb7d684ff6dd354  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index bbbd6f1df2..186702dc83 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 4.4.0
+PYTHON_REDIS_VERSION = 4.5.5
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7a/05/671367bb466b3301bc4543fdad6ac107214ca327c8d97165b30246d87e88
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/30/128c5599bc3fa61488866be0228326b3e486be34480126f70e572043adf8
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
