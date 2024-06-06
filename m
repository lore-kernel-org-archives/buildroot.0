Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB91C41513
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0EE849AD;
	Thu,  6 Jun 2024 19:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qfjsP0GQEnS; Thu,  6 Jun 2024 19:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B1D848D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B1D848D6;
	Thu,  6 Jun 2024 19:52:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3A641BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFD784179F
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8L8sGjD58HN for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDC064046B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC064046B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDC064046B
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:52:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b643.dip0.t-ipconnect.de [84.161.182.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA582A4C26BC
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 21:52:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sFJ9c-000000002BO-293n
 for buildroot@buildroot.org; Thu, 06 Jun 2024 19:52:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 21:52:08 +0200
Message-Id: <20240606195208.3184198-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1717703528;
 bh=FpLQtrwsTSkAS3lc20n8lW4jFrhCiRcVz+zBpxq5n4A=;
 h=From:To:Subject:Date:From;
 b=FxdrwSEPNHX460rQsENq0r2TFDaTpTNhYTAudpFx1rsFCljiqTHncDykH73YUBHJu
 4DYq+IfuDBAx8Ob++lp8jro04Exj1bJgzvhIgHsjK4lgJ648xHrDkXmUsWLTzmofq7
 rIFTvE43s4JfF+rylSKvFGiDtR+0LHSrvSPSDf1etHINxu9rdCl4aWKWo/1xGym3UO
 yYe0odaLWZDFLIi0ekUcNisomOrsooHfOqnsYXy50DORxH0GsQ8Pe5/WQ/vaDBhDdL
 1Hh7f3i9UibqJvWZqlp50eCENLVPysnn5cHyeJc30N32hskA3v4KSTavAvClzx6ODA
 /0ExY5SlxHetg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=FxdrwSEP
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.3.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2024-4577, CVE-2024-5458, CVE-2024-5585

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://news-web.php.net/php.announce/429

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 9b25eabd32..cd5f8a1c1b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  d53433c1ca6b2c8741afa7c524272e6806c1e895e5912a058494fea89988570a  php-8.3.7.tar.xz
+sha256  aea358b56186f943c2bbd350c9005b9359133d47e954cfc561385319ae5bb8d7  php-8.3.8.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ad2d901dfd..268b8e0a62 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.7
+PHP_VERSION = 8.3.8
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
