Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91A9E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2CA0812A0;
	Sun, 21 Dec 2025 22:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGPIbj0FUJfW; Sun, 21 Dec 2025 22:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB03182235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356702;
	bh=UkjH6WaWbtRJsEkqNQxvgyAX9ve8rucgZmcxOgmos7Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pnT4rK6olBOVEy1xDFojiXYvqLt58awab88BojUh9EZNKbctF+Np1lDovgM2sLxqq
	 Rzozmw3X/PNPsm3yT1S2Ndi02i57ENbAco/0ydbq7DIOGD1/JvnWpIR00kBi15ZEjB
	 QTa3+iq5oVcUgFnssB5tMxD62/MpvjW/F+ULrszC5bPb4KQxB66Zy4uHZvJNssqtnE
	 Pt5/8CYSTF1hvDUOLYLeFMjgMG50y7A7hiMkEFc8ycKWY7kn/hSSsMTSMDPiOTYK17
	 BxDsejOWn4AKN37eBO5ehXIoddIsU+efLY+3E9fcl/3WCPUFh83aVJ7iPGcyPW2LjA
	 do7n0OzIR7Hkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB03182235;
	Sun, 21 Dec 2025 22:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F5D2119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7194E82235
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHn1SdTfBHkj for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FBB0812A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FBB0812A0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FBB0812A0
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24DCBA4C4E61;
 Sun, 21 Dec 2025 23:35:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-2Tmc;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:37 +0100
Message-ID: <20251221223441.185169-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356506;
 bh=M7G0ZnAOOfPxusKtCYQwso6/L44N2iQ7RxK8B/lOLU8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IxyybKqEPktXpfS5q5q0lzJBygpoWWs0lRMlfG5mm5y2lOrdBcEw3K+cbzCJQeGeg
 KkzVh9Nab9PkoZaQFcdFARLON2iki/m5uSR4+/eAHqiNQISnrToVB+GhyNp95gYfzz
 1KZw7wc+JQRBdWWZXRlbJvqnDtwqsv+sBzDgeV362hP4Ux2GcwpHaR+5qlNYPI4wFK
 j/xMkSrxuUUrQ23b5lapl7dQeEMYLWgpewzCIsSrSCHUG7mUDOPXt+W1NTCO5z1Rgj
 V2IDVS48Suf2wgXGdmIDSEB0IDH6rZNpzJ6nnu98q3ZMvBMjXfNE2dwl+EvzVxqJg9
 xbuzn6/EsUxhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IxyybKqE
Subject: [Buildroot] [PATCH v2 19/23] package/python-pyinotify: update
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
 package/python-pyinotify/python-pyinotify.hash | 6 ++++--
 package/python-pyinotify/python-pyinotify.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-pyinotify/python-pyinotify.hash b/package/python-pyinotify/python-pyinotify.hash
index 72095ff6e5..9eecfbf9be 100644
--- a/package/python-pyinotify/python-pyinotify.hash
+++ b/package/python-pyinotify/python-pyinotify.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  7943f198c5cef2bdc121d847937fbe565daaa7d4daaf1b8de8ef5689812f481c  python-pyinotify-0.9.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyinotify/json
+md5  8e580fa1ff3971f94a6f81672b76c406  pyinotify-0.9.6.tar.gz
+sha256  9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4  pyinotify-0.9.6.tar.gz
+# Locally computed sha256 checksums
 sha256  97c96d577f761e23c7778bda2b163dba7b94e4defdd7873b7155bed252820608  COPYING
diff --git a/package/python-pyinotify/python-pyinotify.mk b/package/python-pyinotify/python-pyinotify.mk
index b4ea66299d..61666e8b49 100644
--- a/package/python-pyinotify/python-pyinotify.mk
+++ b/package/python-pyinotify/python-pyinotify.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_PYINOTIFY_VERSION = 0.9.6
-PYTHON_PYINOTIFY_SITE = $(call github,seb-m,pyinotify,$(PYTHON_PYINOTIFY_VERSION))
+PYTHON_PYINOTIFY_SOURCE = pyinotify-$(PYTHON_PYINOTIFY_VERSION).tar.gz
+PYTHON_PYINOTIFY_SITE = https://files.pythonhosted.org/packages/e3/c0/fd5b18dde17c1249658521f69598f3252f11d9d7a980c5be8619970646e1
 PYTHON_PYINOTIFY_SETUP_TYPE = setuptools
 PYTHON_PYINOTIFY_LICENSE = MIT
 PYTHON_PYINOTIFY_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
