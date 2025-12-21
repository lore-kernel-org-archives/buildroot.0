Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D93E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BA078227B;
	Sun, 21 Dec 2025 22:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYqgnxqDsSm0; Sun, 21 Dec 2025 22:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06FA682240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356727;
	bh=QUPPZqsRawAkMQrMVy1gXUyVAUiachylcMASKSTuU68=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qcQDZBwBRqAy+etbNd59sfsoRTweAbwYAVZ1Ym/3srx2s3KQjS3QHi0UY+UHgxlvy
	 WKA+3edPZHENtYwe3IQc4Z3Kp7NrEHeJk1eQ3S25R9FNVFaWlrW1EGyo1GJimf0gHz
	 r6K8GalUDCguZNE0apgLa+9U2V6hftr8/ETJoOSJEcHNFGjkKEcMUHxP4+Y1oAcbNz
	 INpWqrD0/VNplTOcMku8tyhliARdG21B3WXGa7Gf738PbyNC9nAuCJRTckn3EChA5E
	 VPgz0y+gBq8E2vahCrEuvAvUBIIq2m6YAvAcJgAQPP7iz1Zm9RxtDtxF1bKN9OLRoK
	 L2m9HNoiuQ98w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06FA682240;
	Sun, 21 Dec 2025 22:38:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CBE0B119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE6EC407B9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3xKtHfVZ6LH for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1B4B407A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B4B407A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1B4B407A9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82382A4C4E65;
 Sun, 21 Dec 2025 23:35:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-34DH;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:39 +0100
Message-ID: <20251221223441.185169-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356506;
 bh=WnzBoZpd8zsGv6ClGzRIfn+R2hE5/0tGjeaV6Hcd4WI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dnZbieCeJA02IhodA5qLbvbIs5HLfwWa1w7jvAsKhp5wuYTDAqmlbupTZakiaK+Nt
 MFkqdKTEddYcSVfpNt5YiA6nsNDdDVO3GENr+GFecRlWM5nle48NxHfTa0FoIVpvZN
 KHvQBC4HuuPK3vqNbuR6RopmmBJoKMi5Cnxcao495cVHA9kXAseI8J45yvz4IejRRz
 Mb2URlGjYeMg7DsgV073Fdc9Rt3+KDuiEGHPP0gue8IQmIZtp7ThRWzIrHWgxbysUq
 fay6i3HFVBOAQrzEvwojEnjxWdzN1Av0A2QFupCqcCUpL02bQIIjkMa1tzi+u9s3yk
 xsqYbBzKj0p9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dnZbieCe
Subject: [Buildroot] [PATCH v2 21/23] package/python-pyqrcode: update
 tarball URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyqrcode/python-pyqrcode.hash | 4 ++--
 package/python-pyqrcode/python-pyqrcode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyqrcode/python-pyqrcode.hash b/package/python-pyqrcode/python-pyqrcode.hash
index c946ba9d9b..9c1dfce294 100644
--- a/package/python-pyqrcode/python-pyqrcode.hash
+++ b/package/python-pyqrcode/python-pyqrcode.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyqrcode/json
+# md5, sha256 from https://pypi.org/pypi/pyqrcode/json
 md5  371f29f4b03bd2830c6e0319258b1259  PyQRCode-1.2.1.tar.gz
-# Locally computed
 sha256  fdbf7634733e56b72e27f9bce46e4550b75a3a2c420414035cae9d9d26b234d5  PyQRCode-1.2.1.tar.gz
+# Locally computed
 sha256  bef0c3595451da5132dea99e288fb5dafcbc469e0643f993a4ba0a69980f5ec9  setup.py
diff --git a/package/python-pyqrcode/python-pyqrcode.mk b/package/python-pyqrcode/python-pyqrcode.mk
index f3eac5a3c0..6dfe1afa6d 100644
--- a/package/python-pyqrcode/python-pyqrcode.mk
+++ b/package/python-pyqrcode/python-pyqrcode.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYQRCODE_VERSION = 1.2.1
 PYTHON_PYQRCODE_SOURCE = PyQRCode-$(PYTHON_PYQRCODE_VERSION).tar.gz
-PYTHON_PYQRCODE_SITE = https://pypi.python.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
+PYTHON_PYQRCODE_SITE = https://files.pythonhosted.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
 PYTHON_PYQRCODE_SETUP_TYPE = setuptools
 PYTHON_PYQRCODE_LICENSE = BSD-3-Clause
 PYTHON_PYQRCODE_LICENSE_FILES = setup.py
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
