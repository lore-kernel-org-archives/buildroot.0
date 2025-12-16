Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44392D637A3
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A26C6104C;
	Tue, 16 Dec 2025 19:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9iGIl4tW2eO; Tue, 16 Dec 2025 19:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38CE361075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914185;
	bh=umGVuAiRpILkop1qWl5A7esYnRfIQXOY6tN/3fuBI5c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GHOVNR7yEcE52MYNlyft4qTxlTrv+IZ8QOMjDlqTMzwQ3eErsTnqUkXvIb4/Qi0E0
	 Pxq9uZAFzSygl0OynAsAaL1TaV/Psut84q835768rIjfZUeT+qThpG6jbJbxGDTZdh
	 wUg4PV9xOe74mYG4efLEeJi1PwTYn0hf/VbdZUKuxeWAtdreYW8QvgolKr97hDgTer
	 b0Co1YJle9i1CNAd7eNb6clcHyGKGMwd+bIU8b/YpW+oMxDguf0BLJJDu1dI3QXXjv
	 Z6iRcz2PMQcXlRryAf1JoITGeeuSwPC/6gI9YEMY66XUNKt1aBdTSDH+17wbc+AAKO
	 Bh41ZuOqUhS7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38CE361075;
	Tue, 16 Dec 2025 19:43:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B3C372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33A04404A5
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iK9qx3yqSpwc for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:43:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16609404A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16609404A6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16609404A6
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90260A4C45A3;
 Tue, 16 Dec 2025 20:41:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-16iu;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:40:58 +0100
Message-ID: <20251216194119.3020421-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914089;
 bh=7nwmIOhvXshvD24Q7T4DD3S8n6KtD1rPgBheHuTebVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bJdGd7hRbRI8B9y6oQ2wb1sRaAYoUY0izCQZk1kjh9K0LC0U4q9X7ArCUbVZ69D74
 21wGARILMw6AZRd7UXH/Gpy5ZzlnfXSWkf8hDrna2wNTFxflSZkCH0Z4gPEcrfL5gP
 XQw9tBssACKcZqI7ziSjd8+TCh2zcNKJEUOsDZyDMIqrkuM3WCtbhvEqGxXnFIjE9i
 ieM18SaX0O/CwRhIM2CgcHfqGt3vKMcP0y+42Uc9KkA0sgeXIGio6WnpWThbGrbNsR
 gfGpgSR2MYAFUVS4IADGDTJD686Fe26fPEleUEtyh1NSIhwc4w7C5ErH7zOI4SlvBC
 Qs2VkEPN/xDpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bJdGd7hR
Subject: [Buildroot] [PATCH 05/26] package/python-termcolor: bump version to
 3.2.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/termcolor/termcolor/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-termcolor/python-termcolor.hash | 4 ++--
 package/python-termcolor/python-termcolor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index 4bed487025..d73588d22c 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  26f496075070852b5d39762bbd14ec46  termcolor-2.5.0.tar.gz
-sha256  998d8d27da6d48442e8e1f016119076b690d962507531df4890fcd2db2ef8a6f  termcolor-2.5.0.tar.gz
+md5  50ce238ff23fb53077f746b751b7ba7b  termcolor-3.2.0.tar.gz
+sha256  610e6456feec42c4bcd28934a8c87a06c3fa28b01561d46aa09a9881b8622c58  termcolor-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index e2492ab3c4..e0a6677241 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 2.5.0
+PYTHON_TERMCOLOR_VERSION = 3.2.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/37/72/88311445fd44c455c7d553e61f95412cf89054308a1aa2434ab835075fc5
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/87/56/ab275c2b56a5e2342568838f0d5e3e66a32354adcc159b495e374cda43f5
 PYTHON_TERMCOLOR_SETUP_TYPE = hatch
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
