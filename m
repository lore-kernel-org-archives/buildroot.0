Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA75BC3064D
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 17:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80983811DD;
	Wed, 26 Jun 2024 17:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFO100h5ID40; Wed, 26 Jun 2024 17:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E68180D61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E68180D61;
	Wed, 26 Jun 2024 17:19:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6422B1BF855
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 17:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F54B60C06
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 17:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgatSYSvIp0F for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 17:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFD6960657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD6960657
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFD6960657
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 17:19:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.117.148]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNNy-1rsG0U0oF8-00LAib; Wed, 26
 Jun 2024 19:19:40 +0200
To: buildroot@buildroot.org
Date: Wed, 26 Jun 2024 19:19:20 +0200
Message-ID: <20240626171922.718270-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626171922.718270-1-fiona.klute@gmx.de>
References: <20240626171922.718270-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1FdNTncfNTqu6jJAoxUr1rgfHe4iN/aeC+5oLtGL9I044EUxSGx
 FgD/jCN5PJLPHfIRX4Yn0XboQ5DDtrPZ3KyieRyzUspzp6P9M13nvh84z9a9L6FIYeQr7P1
 v1Y5xpWPqRU/KAhlb4YoWbcWgf5jzQr0Tt7BiqxQoWsn6jyjqpZx18MRUbDPaUdOwBDUfWc
 8YMmRmApp2YV6K0QVuVkg==
UI-OutboundReport: notjunk:1;M01:P0:iTYAAodaXOo=;hT/JnnDeZn2/X4v97goCh+Wh+c4
 TstdI5n4AfgvzmEmoFb/wX6IBVsJ/ljvlZRy5BjlOzpIgW36gtKuR2psiMfhQlTiRo/pbLF10
 dkIVrQa+ZjirOuvBAvRcZxehz/FOJMbpTsA7IReQBpsNmR36KVS8VYOSRLC2z9e4xuHp7VMyH
 DHbdRdyTkFK72kC4DST6/BMily/lWx3ZyM4JkrXFxeO2+f7A6hKvPeV5HEk6AOm3v3oEqDjyh
 luV2yMif/AMxgcTDwzIXexdYJyfJZSmmgeqyJh1wXFMVjs8RIMgohC+4NiTNuUtCIJjuchUFt
 J2Z4WZVb3bgoCseBkKPIpRjnkwmrkslZ+baHMX8L5rY//3Oio8MKa6CQRkF5uP47yk/MP3vX+
 dOoCIPvx4/v/6YDU06/bYPZaEcZV4ZUmHDxjG6wGVsyi+0WW9aN8mTqCHd+Zs3KKVkvhr2shS
 w+VYJA9c3Wsfb7WcrApqvRTLrxXqmN6mT1T5iUHOgbSkrGyYjG3iEjVdzK17kKyv5Bq9zPTj2
 P1bE76kLj1YuOuiYEBT4kpMB9UNux7TT6Yhw9qJad8UYaAV63McLiO12o4D1cP1Z4WBkOWIhG
 Z45U9LTwyM2/8xZQbU3hRVNxfobhr0D5sOsY+aZQz7GcWwTBu/SpViolfC6wzEQSN/atzJuSd
 cOGCJmVBkhU5muwp8qV8rcXAC+Fi0VbcqxEVj0uXoRp5vCjrL3ZAO4qtY3e9Ewrv4RxYEfA9P
 MgzlC+DNu1MVWFFeykEGJUzChVInHOtpD76XmwnN9jPXI/QVzJryiumJTSvyw4AFb8FOJqbJG
 gTpgknCiAdJ2EKH3O/mVnYK7w0u9SvDjC/sdGG2XMBJDY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719422380; x=1720027180; i=fiona.klute@gmx.de;
 bh=jTcw5opoU2irgCLWh7q6GelDyvzbleClkb+17fizCxg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=oDEoMBC1zM/2Sv4ylJo80OGYYA7SmFekbZ8D1p3McZTubJHNAIeCW9XZsHYu8Qxz
 WaoE9czfoL0R/pxwPSm65YhSUHopZCG2a4j8CeiA83KEoowF/C50cKpnCmx7ioyx0
 hoUWEWYhshzWR9QiC+p8MoiYju2nX7kIGzRi29z25fASCwFwom0Ib3BLcuQTlAK6T
 99qsHfO5WieOagYoNmxwyfrWc6xoqLHGe1XVVir+Paf3/e7/RVN828lzEFjrLN7c2
 GJI8uwE72oYzfrVI3cuZD+hEeEs5J/xtYBmKCSlBbpK0XBPiIm64+C+O1DCFTlkwP
 CR22W7ImIfEjHuKTgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=oDEoMBC1
Subject: [Buildroot] [PATCH 1/3] package/python-pyasyncore: new package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pyasyncore is a compatibility package that provides the asyncore
module removed from the standard library in Python 3.12. It is needed
to support fail2ban without a bundled copy and should be removed as
soon as nothing in Buildroot depends on it.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 package/Config.in                                |  1 +
 package/python-pyasyncore/Config.in              | 10 ++++++++++
 package/python-pyasyncore/python-pyasyncore.hash |  5 +++++
 package/python-pyasyncore/python-pyasyncore.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-pyasyncore/Config.in
 create mode 100644 package/python-pyasyncore/python-pyasyncore.hash
 create mode 100644 package/python-pyasyncore/python-pyasyncore.mk

diff --git a/package/Config.in b/package/Config.in
index 550fdc1f41..5277394499 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1253,6 +1253,7 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pyasyncore/Config.in"
 	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
diff --git a/package/python-pyasyncore/Config.in b/package/python-pyasyncore/Config.in
new file mode 100644
index 0000000000..ad1376a243
--- /dev/null
+++ b/package/python-pyasyncore/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PYASYNCORE
+	bool "python-pyasyncore"
+	help
+	  Make asyncore available for Python 3.12 onwards.
+
+	  This is a compatibility package using the code removed from
+	  the standard libary, upstream does not intend any
+	  maintenance.
+
+	  https://github.com/simonrob/pyasyncore
diff --git a/package/python-pyasyncore/python-pyasyncore.hash b/package/python-pyasyncore/python-pyasyncore.hash
new file mode 100644
index 0000000000..ee4665fe5e
--- /dev/null
+++ b/package/python-pyasyncore/python-pyasyncore.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyasyncore/json
+md5  f97e2b69f1fa11470867b395c2fabf84  pyasyncore-1.0.4.tar.gz
+sha256  2c7a8b9b750ba6260f1e5a061456d61320a80579c6a43d42183417da89c7d5d6  pyasyncore-1.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
new file mode 100644
index 0000000000..9d08d493c4
--- /dev/null
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyasyncore
+#
+################################################################################
+
+PYTHON_PYASYNCORE_VERSION = 1.0.4
+PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
+PYTHON_PYASYNCORE_SITE = https://github.com/simonrob/pyasyncore/releases/download/v$(PYTHON_PYASYNCORE_VERSION)
+PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
+PYTHON_PYASYNCORE_LICENSE = Python Software Foundation License
+PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
