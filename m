Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBCBEF587B
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 14:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A675082308;
	Sun, 15 Feb 2026 14:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PzLmfyPAOUx; Sun, 15 Feb 2026 14:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1779F81B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771164740;
	bh=9Ns5AWr/Hf50f5Fv0Tnbmx1ImR6Rw30VYftqgcsf/HY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j7IsK9TvwNIxZr57XpU8575amu3Fj4BMb+y99M3agSLRpfObkD5V0ZBJQPith6H6s
	 YeZfyz88kGrKuqm7VP4nGWtyi1pT2ttQUtIJd8ZUG+DJIHOabLC7xdrzoT0K8cKjA5
	 YDa98OxE/RQoK1cflAc+czNML9go0iU+bO/+OmVAd8BFlDKypiTTEg7LGm2FODpE24
	 DONLi/vQbhBx0THGMFhLTXcYKw4tyOZiYYtCB/UwrX80tA6OpvYkvoDej+CkN+pNdG
	 q+ExSAngGJERCLIAYGI3no05mAu2KAVWVXt7hWZ9zlKMgpFePn//07JhhjRhYhgOEX
	 W3GMubEjt9FRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1779F81B70;
	Sun, 15 Feb 2026 14:12:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EEDF1EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D0DB81B70
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hU03TEp_X8c3 for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 14:12:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6DC881B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DC881B35
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6DC881B35
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:12:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38953A4C0EC2
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 15:12:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53816)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrcr6-000000005Wv-2LYI
 for buildroot@buildroot.org; Sun, 15 Feb 2026 14:12:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 15:12:12 +0100
Message-ID: <20260215141212.503466-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771164733;
 bh=Ddw//6js8FjNoKgq2U9ob166G0vyqeufr3E+5h8ebzc=;
 h=From:To:Subject:Date:From;
 b=MGd0xcmsiV2fVaZuHFMGeNkG6QJp9uCLu8MX9Fy59E/c8OXiPVzqVqE7vyXNmgaum
 Q5u0cIren+IwIlJKUbKmXtmpdOXlOCE03+fV3l2DAK9S+SqHH8aU+L92QBHKWQelVo
 cMuaI9u9QMj/uPuRmuPjaN6Y9sUjOm8eX3bALspKtCam1DI1d2Jy5h8uoh9OZ9C9ax
 pKeMBUg8BgDV+ikl+KAGuu1GlSNStiXLLHhKnbqarQcWfuCrNt3lwlXiMLCQyEFi5g
 H0P9/zSGt/ztd2TXstDpK9t1hbviXnqTYOESyBxL+cQqPmTUmAhnTubiPyAInjSyNF
 DemJgnO1NdbTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=MGd0xcms
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.5.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.php.net/ChangeLog-8.php#8.5.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6d13f11e56..5747e153f2 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  cb75a9b00a2806f7390dd64858ef42a47b443b3475769c8af6af33a18b1381f1  php-8.5.2.tar.xz
+sha256  ce65725b8af07356b69a6046d21487040b11f2acfde786de38b2bfb712c36eb9  php-8.5.3.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 2c91ef7b63..4cba87a06e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.2
+PHP_VERSION = 8.5.3
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
