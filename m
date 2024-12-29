Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F5E7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26AC8605A5;
	Sun, 29 Dec 2024 20:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnQWaV0fN1IE; Sun, 29 Dec 2024 20:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 252E860876
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 252E860876;
	Sun, 29 Dec 2024 20:23:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A152AC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82C0E40186
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wfdZBB26Uxi for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:23:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DC7240167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC7240167
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DC7240167
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:23:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b064.dip0.t-ipconnect.de [84.161.176.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79CCCA4C418A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:22:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51356)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRzoN-000000000Lq-18CD
 for buildroot@buildroot.org; Sun, 29 Dec 2024 20:22:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 21:22:55 +0100
Message-Id: <20241229202255.1683450-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735503775;
 bh=kDfqjEIcIHHCityoF7TD3CXR8Y1eKKui7CkEaUKQcUc=;
 h=From:To:Subject:Date:From;
 b=LidghF5hW3dw42HnYBNPdc1S0z+1Vtz9hbcnzwxiYqyfxpvg5vaPIpPVacFyATj40
 n1m2tgxlXxF8TcocXnC2MpOPhY8cOwCrlzG5xFtVDj5N3g+cK82zLPZVZPkUhExdBo
 O9V3rhL68ULmsoyEmX6jFI/5ol49nVwQ2Tg5QLaB752gohZohdRgFMnFF3s/y8Q4qQ
 MbhU/e5zrA/o5zY6zKN+CVZ5CQ6QtM4paJMys4apgsgjEqKJJN2BC58Ewhb+OPytyU
 DQzSQ7b8yoDRRz3d07nKO8Kpl1P4hy/AeMj67+IkQ+DSzTlu9I7D+TpNBohtAISzdd
 zbR0yMA+/FkVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=LidghF5h
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.15
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
Release notes: https://news-web.php.net/php.announce/448

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index e3a1c6cf2f..535761f047 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  58b4cb9019bf70c0cbcdb814c7df79b9065059d14cf7dbf48d971f8e56ae9be7  php-8.3.14.tar.xz
+sha256  3df5d45637283f759eef8fc3ce03de829ded3e200c3da278936a684955d2f94f  php-8.3.15.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 89d7766e94..468a73667a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.14
+PHP_VERSION = 8.3.15
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
