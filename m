Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F857E63F12
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1BB580F39;
	Sun, 15 Feb 2026 21:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLh0To3gmF8X; Sun, 15 Feb 2026 21:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E1FD80F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771191582;
	bh=JxsY57KyuQXXRSOy3L8GONDh6qPY++SMjuR0/Iba8Dc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=lvpCqCfILDfNMI6JtBZV5MhisONlbEVHdXGgFMRWgfXtYTes4+9GRROxJ2vQib7P6
	 Vzdalru60pOFUwRFqk7bNs4+lkqkAKGGdqF/BhTst4Zn46WopvV03Fere0OnLQKMHs
	 g+ayeI9Ke/GJd9WJf8jFhefqipi7Rfv31Bi8H+nMQBH03WjGfvh4cfC7tATuHZsZpw
	 ademMfJI5RY95CSUR59KvfEop30ElLoXJ5od75enLlQNA1Shaycc+7G7Qkq/Ffs095
	 k8/BCg1Hg1NIO08AZ4kVIjsOcCLJEND+g7nAPiucZwrLMuzJYP8RD0hvbDgS2cRoKg
	 KKZS42ROjqXVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E1FD80F0E;
	Sun, 15 Feb 2026 21:39:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36E451EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1879280F0E
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vq3Z6Z8caqSa for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 21:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 956A280ECF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 956A280ECF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 956A280ECF
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.18.229]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQIv-1vNqfv1BIt-00j3ot; Sun, 15
 Feb 2026 22:39:36 +0100
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 22:39:11 +0100
Message-ID: <20260215213913.713705-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215213913.713705-1-fiona.klute@gmx.de>
References: <20260215213913.713705-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DYHJWv0/F6I1U9AwUpxlzFbWAP7q4vy+Wri7p6vW2PclsrJiH1+
 JxqN8kzmM2QFeQRQYUWy2P+r/B52u1PH2tN46A6QLdT38Njpphx944k4Djqh6gucRx2Squf
 Dx97HBMPtKtgTJgJCDhiwrYVtHezroEO1w1LBRB+arTHNoxnLwx7BZnPTzEjr/F6dEeTv+a
 zepkPGQgj8wyV5iLWOajQ==
UI-OutboundReport: notjunk:1;M01:P0:e2zNATTfrGQ=;wMnx6IPRJgXLmjhW4rDTOX+hhN0
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771191576; x=1771796376; i=fiona.klute@gmx.de;
 bh=whbsbfKUSD6GURXfjCN0a6JjGEYeqH0d4r2YO7VtRSk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NL9hmV9WW+VHG8aMbpn1I8EVTnGsOijhK9SHOes2DVNyPOeceiy84AHqISdjqrrG
 iMFecWXn6AGWCsl3IBR7QSAuVPhXFB1WlQUAQrFwr9rYGq5UfCQ7bgHrLvjOHOhvU
 DfF2A7at1DSpkLcMlUWiC4QMaM3PlaPpmHtfg6HAwOVc+AXoRisc4SxtxlZsO4qsE
 rrNP+reoTWmqzsr8fnDA/Dua43rXN443oyrHUzJ32ApwkGTJ3Q+F8dC0zCHZWS0g3
 20RVQGKwXG+vXny5blqtRWOtiu7rVdZvjtTvdGHlomSY2HkZIQsqUOw9jz8/rdhWf
 t18xGMjFwZl343tivg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=NL9hmV9W
Subject: [Buildroot] [PATCH 2/4] package/python-textual: bump to version
 7.5.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index 7a9c2d403e..68f996aeec 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  e8d6a911d150acdf7b46dc30a1a1d94d  textual-7.0.0.tar.gz
-sha256  617638a2be74fb7507aff3ea6ec9374148be02e5a7bb1d02396d1d557b66c0a9  textual-7.0.0.tar.gz
+md5  88b5c60f9713a6cc3b5cf625c4f5efe3  textual-7.5.0.tar.gz
+sha256  c730cba1e3d704e8f1ca915b6a3af01451e3bca380114baacf6abf87e9dac8b6  textual-7.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index 77187b3102..93881f6d02 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 7.0.0
+PYTHON_TEXTUAL_VERSION = 7.5.0
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/d4/9c/ebc9ca1f95366bef4c0e8360f4a77400d47a79aeecc08747de1990ef8bdc
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/9f/38/7d169a765993efde5095c70a668bf4f5831bb7ac099e932f2783e9b71abf
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
