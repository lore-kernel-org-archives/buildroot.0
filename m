Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD3DC83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 21:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB90483CB0;
	Thu,  3 Jul 2025 21:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYDEnKzOh4qZ; Thu,  3 Jul 2025 21:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13AB78131F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13AB78131F;
	Thu,  3 Jul 2025 21:01:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4455C15F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27EC84013F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxptJy27Nx8Y for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 21:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C22840050
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C22840050
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C22840050
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:00:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07af.dip0.t-ipconnect.de [91.58.7.175])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16A48A4C3858
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 23:00:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43992)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXR3B-0000000045Z-0N9L
 for buildroot@buildroot.org; Thu, 03 Jul 2025 21:00:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  3 Jul 2025 23:00:56 +0200
Message-Id: <20250703210056.1519541-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751576457;
 bh=glJTfTIBxy/hupKk2eAWdHX24YC40z2kitBa4xKkj/Q=;
 h=From:To:Subject:Date:From;
 b=WrWC3waxV+l28B0vV2u3Et9d9eFVy8O7UjvnWhDvZem2ghYe8d4OXm2lA1ptQSkVe
 9hswWix9wjv2SiXkBDIv84GPj3H5B9sJtGeZeAk+hFTYXx+lAUVOecYku1XIKIuSk+
 FO9sFrnjMl6vSncNtxW8MY9+ZLtEegKOxCfBjh8q3WEdrC4SU3RDNugLghGYPP90E5
 F6TVOuCMLW3jTI9HZXzf+UC1zplftc51+fxvxK2mWj0r09I9AL4yqHQ+Lid1VbOt/Q
 88rtY5ofu/DBMCOW9/hoTGryB1ynu0q42cWFTV5KA9J3h2VG/fmLKXN3fGFJr/xDZt
 6nhjJCpoJw+VQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=WrWC3wax
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.3.23
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

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3

Fixes CVE-2025-1735, CVE-2025-6491 & CVE-2025-1220:
https://news-web.php.net/php.announce/465

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4260c1e5f4..29162bd008 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  66c86889059bd27ccf460590ca48fcaf3261349cc9bdba2023ac6a265beabf36  php-8.3.22.tar.xz
+sha256  08be64700f703bca6ff1284bf1fdaffa37ae1b9734b6559f8350248e8960a6db  php-8.3.23.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index a049d90fde..b431d839fb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.22
+PHP_VERSION = 8.3.23
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
