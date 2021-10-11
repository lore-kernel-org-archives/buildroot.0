Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0D8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 11:28:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1176E60E78
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 11:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1176E60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=blach.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C80F5402E1;
	Mon, 11 Oct 2021 11:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jormDmGnuQ38; Mon, 11 Oct 2021 11:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F38FD402C6;
	Mon, 11 Oct 2021 11:28:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47BC51BF20B
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 11:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C9B6085A
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 11:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKeZsWXFgInE for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 11:28:35 +0000 (UTC)
X-Greylist: delayed 00:06:12 by SQLgrey-1.8.0
Received: from 10.mo576.mail-out.ovh.net (10.mo576.mail-out.ovh.net
 [46.105.73.241])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 092FF606DF
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 11:28:34 +0000 (UTC)
Received: from player760.ha.ovh.net (unknown [10.110.115.149])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 8904622324
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 11:22:20 +0000 (UTC)
Received: from blach.pl (unknown [91.239.249.158])
 (Authenticated sender: grzegorz@blach.pl)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 0652E231574B4;
 Mon, 11 Oct 2021 11:22:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006cb9b82a0-358f-400e-ac31-5afe440b0fd2,
 B1AA4BDF6001395376160FE9AA83600E5B7F10B3) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 91.239.249.158
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 13:09:11 +0200
Message-Id: <20211011110913.406680-1-grzegorz@blach.pl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2191845647786131952
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtiedgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeekkedugeeijedvvdduudefkeffgeehueelhfeitdelheegffetkeekudfgteetkeenucffohhmrghinhepphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkpheptddrtddrtddrtddpledurddvfeelrddvgeelrdduheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeitddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH] package/python-pyjwt: bump to version 2.2.0
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
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index f3bc5d4814..6bfbe05bf9 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  34c235e02746683bfc81a61f9ec4dc85  PyJWT-2.1.0.tar.gz
-sha256  fba44e7898bbca160a2b2b501f492824fc8382485d3a6f11ba5d0c1937ce6130  PyJWT-2.1.0.tar.gz
+md5  c7c5b05a1dcee1fac0dc13fea892ed86  PyJWT-2.2.0.tar.gz
+sha256  a0b9a3b4e5ca5517cac9f1a6e9cd30bf1aa80be74fcdf4e28eded582ecfcfbae  PyJWT-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 5600459c65..123f12ef69 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.1.0
+PYTHON_PYJWT_VERSION = 2.2.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/0c/c6/3cdc7cb1289b35186fd7fd61836b6d83632ca0f7eee552516777361667b1
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/b9/6d/e5ac4eb80724cb4201de6dcbc1e8a9f5cb65a0424b30c4c69e49bc1363d1
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
