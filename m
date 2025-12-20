Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF5EE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E47D360E38;
	Sat, 20 Dec 2025 21:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eo9sgJ0yyDGy; Sat, 20 Dec 2025 21:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D02606D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266940;
	bh=ukejvfeP0gskuIgl9abtX0ATanDBjSUfrQFJMQzrGM8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Bap+s+7XthsnbIT2j9DOR2gGPza9MHYni3iGlZ5d8S6vZboB/0gllMGs3Mrrznr1y
	 ID1hHJuCVeLgVb4jtWUlqrjaORe7SLtkhY/GMd+oGf+dWxrsUpPkdEkZvFd3Q1aL3B
	 p00JZBfg74HM/h8D7B8M5ULQZZBRVcsYs0mDC87vGMR4bTyhtNzKjR0y80HD3h69fn
	 eP03Z8aecuxEm1xUD5p40JSL+mcaPidSefjcucnfJPbGoJ4kTg0mTG621g51Fe/gFY
	 SAGo5lpX1aTdewff1HK8P5OuYm0AGPajwwZGi2jhaXFl4GQBcN0A4/re2EQ6YY1Qzw
	 ahqww82iBNBTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89D02606D0;
	Sat, 20 Dec 2025 21:42:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CD7119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD885406D5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDxb_Ks1xY5t for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:42:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBAC7405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBAC7405A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBAC7405A3
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 239DCA4C4DAA;
 Sat, 20 Dec 2025 22:39:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-2FvL;
 Sat, 20 Dec 2025 21:39:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:44 +0100
Message-ID: <20251220213946.1088820-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266797;
 bh=iFqUvhHzeryBdQ6dKMtCp48sPPTxrQkd2bdyBvKzS/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TAN7QHBqDXfca/+rn/HGRVNJP7BXNOASaZKoYiihYWOY4/LYjO2yr5rfP/a76OkxX
 kSyHYjogJs2Hz/tR69qqGvfB5gD3ox/0wiRpPcZz4IriXmS64J9bf7z9Bzpex/JBOU
 99Ph8NlsnOsEdxmZ9YQCrMDuK09KvSi/1donF0xEnqahBgJDi6tPOg+59dYirpPhlv
 qunDki1nX/3mx91UzFIlIv1JeLA77b/WfvUuODpHt7piY1OyzXx9O371uydqqlNvX6
 DosjhuFY/4Ztgj5zfGDF5lDSlWuAeX7UNyMP2KG52L6nLV1soXDJUqdEKslZCPAQ7Z
 DA83WzamG/WyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TAN7QHBq
Subject: [Buildroot] [PATCH 13/15] package/python-libconf: update tarball URL
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
 package/python-libconf/python-libconf.hash | 2 +-
 package/python-libconf/python-libconf.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-libconf/python-libconf.hash b/package/python-libconf/python-libconf.hash
index d05efd37fd..33232aa1c1 100644
--- a/package/python-libconf/python-libconf.hash
+++ b/package/python-libconf/python-libconf.hash
@@ -1,4 +1,4 @@
-# Locally calculated
+# md5, sha256 from https://pypi.org/pypi/libconf/json
 sha256  66897870fcafce05624eafcc99e2dc8e150124e91019d9c29cc4f3bef64311dd  python-libconf-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3c2afc8c9f7a12032f225e6fa870e85af14d1b71236afe28d94a4b67e5e8c873  LICENSE
diff --git a/package/python-libconf/python-libconf.mk b/package/python-libconf/python-libconf.mk
index 65bdee8619..5bea1b2cc6 100644
--- a/package/python-libconf/python-libconf.mk
+++ b/package/python-libconf/python-libconf.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_LIBCONF_VERSION = 2.0.1
-PYTHON_LIBCONF_SITE = $(call github,ChrisAichinger,python-libconf,$(PYTHON_LIBCONF_VERSION))
+PYTHON_LIBCONF_SOURCE = libconf-$(PYTHON_LIBCONF_VERSION).tar.gz
+PYTHON_LIBCONF_SITE = https://files.pythonhosted.org/packages/c8/41/592c24b42ec6e349629f2b6310ff31255b213bc696c0e4ad2ee1d2bbb68e
 PYTHON_LIBCONF_SETUP_TYPE = setuptools
 PYTHON_LIBCONF_LICENSE = MIT
 PYTHON_LIBCONF_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
