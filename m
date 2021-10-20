Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5778CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 15:51:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC4CC60FF2
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 15:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC4CC60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=blach.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8135D40295;
	Wed, 20 Oct 2021 15:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4Qa5jTTmB_S; Wed, 20 Oct 2021 15:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E37314029A;
	Wed, 20 Oct 2021 15:51:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4E01BF426
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 15:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE0D1401BE
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 15:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOXqoHMm6GTC for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 15:51:54 +0000 (UTC)
X-Greylist: delayed 03:00:01 by SQLgrey-1.8.0
Received: from 7.mo583.mail-out.ovh.net (7.mo583.mail-out.ovh.net
 [178.32.124.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ABBD4011B
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 15:51:54 +0000 (UTC)
Received: from player763.ha.ovh.net (unknown [10.108.4.44])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 8C83B23B80
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:15:16 +0000 (UTC)
Received: from blach.pl (unknown [91.239.249.158])
 (Authenticated sender: grzegorz@blach.pl)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id 5A4EB23702F62;
 Wed, 20 Oct 2021 12:15:11 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0029e1fae3f-af55-48df-a7f1-70a2e4046ab8,
 62D5A6D5ED72A11F1880B84BD2924B47748EC117) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 91.239.249.158
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 14:15:04 +0200
Message-Id: <20211020121505.26860-1-grzegorz@blach.pl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 600104652121850177
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeekkedugeeijedvvdduudefkeffgeehueelhfeitdelheegffetkeekudfgteetkeenucffohhmrghinhepphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkpheptddrtddrtddrtddpledurddvfeelrddvgeelrdduheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeifedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH] package/python-pyjwt: Bump to version 2.3.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 6bfbe05bf9..5ea6c0cd50 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  c7c5b05a1dcee1fac0dc13fea892ed86  PyJWT-2.2.0.tar.gz
-sha256  a0b9a3b4e5ca5517cac9f1a6e9cd30bf1aa80be74fcdf4e28eded582ecfcfbae  PyJWT-2.2.0.tar.gz
+md5  60cf2d463157bf21eb37be0430521036  PyJWT-2.3.0.tar.gz
+sha256  b888b4d56f06f6dcd777210c334e69c737be74755d3e5e9ee3fe67dc18a0ee41  PyJWT-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 123f12ef69..ba8130e7ca 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.2.0
+PYTHON_PYJWT_VERSION = 2.3.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/b9/6d/e5ac4eb80724cb4201de6dcbc1e8a9f5cb65a0424b30c4c69e49bc1363d1
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/1d/8e/01bdcfdbb352daaba8ea406d9df149c5bba7dbf70f908d4fa4c269fe6a08
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
