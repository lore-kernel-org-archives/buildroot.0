Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9C3C7EE23
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 01:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4D560B78;
	Mon, 12 Jun 2023 01:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4D560B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPWueiUJavmj; Mon, 12 Jun 2023 01:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC1D60B42;
	Mon, 12 Jun 2023 01:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC1D60B42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1F7C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 01:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C844C60B42
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 01:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C844C60B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEs6PyJUlXoY for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 01:21:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FDAE60B1C
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net
 [46.105.56.136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FDAE60B1C
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 01:21:35 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.20.179])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 87EA322B49
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 23:36:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pl8sk (unknown [10.109.138.36])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BB9FD1FD10;
 Sun, 11 Jun 2023 23:36:36 +0000 (UTC)
Received: from blach.pl ([37.59.142.107])
 by ghost-submission-6684bf9d7b-pl8sk with ESMTPSA
 id gGyvJ4RahmSPFgAAc/dVnA
 (envelope-from <grzegorz@blach.pl>); Sun, 11 Jun 2023 23:36:36 +0000
X-OVh-ClientIp: 91.239.248.252
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 01:36:19 +0200
Message-Id: <20230611233619.128038-6-grzegorz@blach.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611233619.128038-1-grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6522619635404718401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepifhriigvghhorhiiuceulhgrtghhuceoghhriigvghhorhiisegslhgrtghhrdhplheqnecuggftrfgrthhtvghrnhepieffhfetleevtddutdeutdefleegvdejveefueethefgtdfgjefhvdetffejhedvnecuffhomhgrihhnpehphihpihdrohhrghdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppeduvdejrddtrddtrddupdeluddrvdefledrvdegkedrvdehvddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhiivghgohhriiessghlrggthhdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001d17b6215-fa3a-4c45-8d4e-b8451f2b9666,
 8D931DDE0DEECB89AEA118D672F623587F6625E2) smtp.auth=grzegorz@blach.pl
Subject: [Buildroot] [PATCH 6/6] package/python-rpi-ws281x: bump to version
 5.0.0
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
 package/python-rpi-ws281x/python-rpi-ws281x.hash | 4 ++--
 package/python-rpi-ws281x/python-rpi-ws281x.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
index ffdd826b6f..42bc205523 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
-md5  016e1f03f9168ef03d4baf074aa60f03  rpi_ws281x-4.3.4.tar.gz
-sha256  072eff1787e579d1710381b27c467709e3aab28ac579c7a47d7cc87398496f28  rpi_ws281x-4.3.4.tar.gz
+md5  9c87b5bedba0a48bb97e9953378dfb78  rpi_ws281x-5.0.0.tar.gz
+sha256  00ce6db771436b778d0930245cf8ea2aae11008cc5fd67d57789c5422af3ee55  rpi_ws281x-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index 73befeb56e..610467b160 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_WS281X_VERSION = 4.3.4
+PYTHON_RPI_WS281X_VERSION = 5.0.0
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/e2/d4/75fcc4f3412b9b16e39e6cd6156f2e171fe7b2e79057be17d1acf38fded4
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/c0/1e/642208a685c5e96d38323f42c75d9b24f95e2d1b8390dd104e04a712f29e
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
