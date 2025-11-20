Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38458CF887F
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F41986064A;
	Thu, 20 Nov 2025 21:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ax9cikXdplJW; Thu, 20 Nov 2025 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A5F9614F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A5F9614F8;
	Thu, 20 Nov 2025 21:45:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D93C2122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF5A56F55C
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIYXqR7mtkm0 for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 21:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC696614F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC696614F8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC696614F8
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:45:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DCE8A4C72B7
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:45:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMCSh-000000000sm-0H8c
 for buildroot@buildroot.org; Thu, 20 Nov 2025 21:45:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 22:45:07 +0100
Message-ID: <20251120214507.1251665-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763675117;
 bh=2WSq2AKCOK0qa4foaWXvUk7pRvwsI0USIUEWd0qvcbE=;
 h=From:To:Subject:Date:From;
 b=CQAbIsQDtbx+q+Mv69K4xH7vmbGCzYBigNv6+Dn2lxfEzqaIOxCRHB0nKQaLUh2Bk
 HQ+yYYVoYe7uhFqK41YUZgQL1lY3bGhXMzNQkA3OBY60PZPr3SRkaIZLsTB8kO10VD
 8uCzE3D0CmGBLxMlk2dyz4XACcFkNGlWBDgGnwXsnLRE24XifCZBcNxw/UeS6b5FBt
 sSGYLzB2KhVOrtL6sKPlx+dxscytwXoZgP3OR8rEKmgUvsIBuUjvBjyP0H0NmGTMzB
 8WwJ8CJDujr9v0UYrxSBFEbMiyhgBl+4Lxq68zDqDY1f0uZtnH5Yb46lbC6wlKlHFx
 Nmsmge4pMaucg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=CQAbIsQD
Subject: [Buildroot] [PATCH 1/1] package/php-gnupg: bump version to 1.5.4
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

Changelog: https://pecl.php.net/package-changelog.php?package=gnupg

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-gnupg/php-gnupg.hash | 2 +-
 package/php-gnupg/php-gnupg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index 084de7750a..8bd2eb5c90 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9906f465ab2343cb2f3127ee209c72760238745c34878d9bbc1576486219252  gnupg-1.5.1.tgz
+sha256  4d4a0980759bf259e4129ef02cb592bbeb103b4005e7b4bb6945d79488951a50  gnupg-1.5.4.tgz
 sha256  da1136d4d9326317cbd320dadddf7e9b4b4edffd973eb083cb7b9754fb6a15d9  LICENSE
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index 89054f5f7c..6b76795533 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 1.5.1
+PHP_GNUPG_VERSION = 1.5.4
 PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
 PHP_GNUPG_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
