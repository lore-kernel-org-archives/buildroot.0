Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB87E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 415D260E39;
	Sat, 20 Dec 2025 21:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnWaPQ3GGhJ2; Sat, 20 Dec 2025 21:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7078E60E14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266903;
	bh=rFu6U58ydqdZpWVTnzWnXVLZGZnkrZNOU56fkuZDkLs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wn5c9KQfKkdbEt/QZ6uxYjT5yZU81jfq/r3mU1yRQJvo/Hoihz9TLAm1qleGuxZ+3
	 k8xud/ntbLRt42niEIlu6Po9X/DhhSFq0jPwsPqngI4V0xfHpmIGSsSghTDrLgsjDb
	 cq2FoGoWU5DKfjRgn0ZZh4v7ByMvWGesnbWBH6dK28QxVREIHfP5fOxsQKUrBjJ1s0
	 w+ufUp1vOt/cQld2MPyb1D0o266nXRnnS3KjeRu3BQPJcFK0bcVtT6I/BUvgwhK3Kc
	 rDFSN68V7Nh2WgiIJu/2/ioEo3bCX5SNhI6ZaMl9AMmTWFxxz3nBJ0lWziKPxaBl6L
	 7eblz/7tj1YDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7078E60E14;
	Sat, 20 Dec 2025 21:41:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 324B6119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2367760E14
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVM9DDFtIcc9 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:41:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1408D60E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1408D60E0D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1408D60E0D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 865FBA4C4D7D;
 Sat, 20 Dec 2025 22:39:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fy-000000001mj-42qu;
 Sat, 20 Dec 2025 21:39:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:36 +0100
Message-ID: <20251220213946.1088820-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266796;
 bh=HXQjUGjizNyeHVB8PbHBUE1zDU4TxkeOvp7DyEQCohQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ovjtVd6/jCjGf0QwtH+GwPEpKGmsOcWLplal9A83xyMoAtlLLln4YVgYjCsAFz1tl
 7Hl9VX/XMHAgac7qJvX3z5Q9Cpzx8hK9k+0aKSOUKhRm/Uu+09di8bzdqho/N6ST5I
 TG8LyMd57QogT1XybUz3qQ05I9B4W9TYRM30SOwzrzOPvFrFCgglI+tsL1/4N2Fsi5
 e56Asp53why9bXrhJ0DolUhLdHwH0hZaBln/MXcvY3c/gQLF+zmV2R0IkpaDH5WqZJ
 /17ZtYn8l4F3AhZS1TLNznvuJOxQHtEhlzV2YKJvCsqPcbEU91zqH7aTQT0vcSQy8P
 tuekiI/vuUg3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ovjtVd6/
Subject: [Buildroot] [PATCH 05/15] package/python-crcmod: update tarball URL
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
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-crcmod/python-crcmod.hash | 4 ++--
 package/python-crcmod/python-crcmod.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-crcmod/python-crcmod.hash b/package/python-crcmod/python-crcmod.hash
index 43ef7dd8e7..81a7f34614 100644
--- a/package/python-crcmod/python-crcmod.hash
+++ b/package/python-crcmod/python-crcmod.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/crcmod/json
+# md5, sha256 from https://pypi.org/pypi/crcmod/json
 md5  2d5b92117d958dcead94f9e17f54cd32  crcmod-1.7.tar.gz
-# Locally computed
 sha256  dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e  crcmod-1.7.tar.gz
+# Locally computed sha256 checksums
 sha256  89480768826f408daea1f3caff0509c2cc9606e10f6bb0ccfd12a3d604842c35  LICENSE
diff --git a/package/python-crcmod/python-crcmod.mk b/package/python-crcmod/python-crcmod.mk
index c97f8808c1..a8f2e86be6 100644
--- a/package/python-crcmod/python-crcmod.mk
+++ b/package/python-crcmod/python-crcmod.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRCMOD_VERSION = 1.7
 PYTHON_CRCMOD_SOURCE = crcmod-$(PYTHON_CRCMOD_VERSION).tar.gz
-PYTHON_CRCMOD_SITE = https://pypi.python.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
+PYTHON_CRCMOD_SITE = https://files.pythonhosted.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
 PYTHON_CRCMOD_SETUP_TYPE = setuptools
 PYTHON_CRCMOD_LICENSE = MIT
 PYTHON_CRCMOD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
