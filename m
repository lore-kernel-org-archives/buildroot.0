Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3FFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EEFE60F70
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EEFE60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=blach.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0D014037C;
	Mon, 25 Oct 2021 12:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSc1ikgUJ5Dj; Mon, 25 Oct 2021 12:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC607402A2;
	Mon, 25 Oct 2021 12:51:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3A9B1BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CDCE80D68
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USnZJslI5YyC for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:51:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 14.mo583.mail-out.ovh.net (14.mo583.mail-out.ovh.net
 [188.165.51.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59E0880D45
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:51:57 +0000 (UTC)
Received: from player711.ha.ovh.net (unknown [10.108.4.200])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 82F3520299
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:41:57 +0000 (UTC)
Received: from blach.pl (unknown [91.239.249.158])
 (Authenticated sender: grzegorz@blach.pl)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 43DB2236A9D1F;
 Mon, 25 Oct 2021 12:41:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0052896d0b6-a2ba-4d66-adab-8196035bfb64,
 B5E1B199B6C6818015DC995F5C02C058A21CB8B4) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 91.239.249.158
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 14:41:44 +0200
Message-Id: <20211025124145.390665-1-grzegorz@blach.pl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11967190112874217968
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeekkedugeeijedvvdduudefkeffgeehueelhfeitdelheegffetkeekudfgteetkeenucffohhmrghinhepphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkpheptddrtddrtddrtddpledurddvfeelrddvgeelrdduheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH] package/python-crontab: bump to version 2.6.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index 2247cf3d3d..b3aa96fc1b 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  7731a2253e853abfb6eceb8045368f22  python-crontab-2.5.1.tar.gz
-sha256  4bbe7e720753a132ca4ca9d4094915f40e9d9dc8a807a4564007651018ce8c31  python-crontab-2.5.1.tar.gz
+md5  2982bdce2d9b7789f32da649a9507c4b  python-crontab-2.6.0.tar.gz
+sha256  1e35ed7a3cdc3100545b43e196d34754e6551e7f95e4caebbe0e1c0ca41c2f1b  python-crontab-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index ddb1067db2..9b29e11ccd 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.5.1
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/1b/7e/fb78b96de58a49b8ef807c321870ef4de3de5928fd71a40a400aed714310
+PYTHON_CRONTAB_VERSION = 2.6.0
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/06/b0/c270a1b5c83d9e0f83ab654d3153c39d80f61ba49fefde50fd23ab351381
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
