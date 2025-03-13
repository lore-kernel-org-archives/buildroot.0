Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C123C35FF1
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 19:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94C141443;
	Thu, 13 Mar 2025 19:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MY87ZBwuKrf; Thu, 13 Mar 2025 19:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9102F4143E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9102F4143E;
	Thu, 13 Mar 2025 19:15:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D36B7C8
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 19:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C158B610D0
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 19:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szkhg46nLiHu for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 19:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71FD56109B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71FD56109B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71FD56109B
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 19:15:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8f2.dip0.t-ipconnect.de [84.161.184.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECAECA4C1277
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:15:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36150)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tso1n-0000000082X-2z8r
 for buildroot@buildroot.org; Thu, 13 Mar 2025 19:15:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 20:15:35 +0100
Message-Id: <20250313191535.2659102-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1741893335;
 bh=3KrhmOSp7Ue2xCBCRLoWv37OwWPVgHTLWyled1CB1BA=;
 h=From:To:Subject:Date:From;
 b=UizeJ15vEN08jD+mpK7RqbtpFqZrpxZ/tQRZrJ1GExyhSt4zb7EdixRJNdGvqjgen
 RfinX54zvpgoVtlYybSg7Z77UwnsB694AsluuoaQQmwkJq2m4j7LjMqcD9udxArmNX
 Ips9uOVjE937XnpH0+DTl0MrskgjP6FJFXlkFDyPdyTyFimnSiI+paKQxSCbvrhjg5
 Xv44GFXecZvyOrftyMtc8v2uZG+vRmcUICvIH+5rZzpvRw2ttp6yrzSoXyZ/lD6PfC
 SgplUY35oAB6WxtsofNVfzTy1TS6g3vsKnN2tmkQFcXVkCbFhEJnVB9Wm/HLl0g8i5
 lTK+MjmZt8aPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=UizeJ15v
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.3.19
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

Release notes: https://news-web.php.net/php.announce/455
"(The 8.3.18 release was skipped due to the erroneous omission of a
non-security related patch.)"

Fixes CVE-2024-11235, CVE-2025-1219, CVE-2025-1736, CVE-2025-1861,
CVE-2025-1734, and CVE-2025-1217.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 8696b234c7..ba9c5bb468 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  6158ee678e698395da13d72c7679a406d2b7554323432f14d37b60ed87d8ccfb  php-8.3.17.tar.xz
+sha256  976e4077dd25bec96b5dfe8938052d243bbd838f95368a204896eff12756545f  php-8.3.19.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index d127154815..374fdb2c69 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.17
+PHP_VERSION = 8.3.19
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
