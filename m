Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E08E64000
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 18:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65636402B0;
	Thu, 21 Nov 2024 18:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScAjky1Vjrpv; Thu, 21 Nov 2024 18:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 290BD402E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 290BD402E7;
	Thu, 21 Nov 2024 18:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DBE9E11
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 18:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 564A8402E7
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 18:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hgal15xbbxT6 for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 18:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD0E5402B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD0E5402B0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD0E5402B0
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 18:21:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02ba.dip0.t-ipconnect.de [91.58.2.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9299FA4C3B6C
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 19:21:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34504)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tEBoE-000000001SQ-085d
 for buildroot@buildroot.org; Thu, 21 Nov 2024 18:21:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 21 Nov 2024 19:21:41 +0100
Message-Id: <20241121182141.25658-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1732213302;
 bh=RlzozKSSbbnNwwi3No755NbspZ0JNsEBKjVoSjx0rAk=;
 h=From:To:Subject:Date:From;
 b=Ro4wsaXjx5kgEF1zMl7KGVegC9cMmAfYiBo4hX7BjnDiDpYZpUn8D17hjLB+v3F7H
 lxEAuEUwMNrT0jeWoQjpsdDoplo75k/DuV8sd/64DmExvbSlDBhdsX6E+CjL1sRuyJ
 tPoorU9/Wh3meGQUgFgTfXsDIeOi81XK7CSL5c770b6Psbp2bpRZ3FZgXBYKei2GfX
 dLbCXkOwdq9IJSzSGwFFoFyg/I4+4nwOipOzTyTjQYrRXTYq/ZoN+Rk00k8ZsG4A2p
 xwzNKGfGxDD+IWiXxFMh3mNQZ/Vg0s6KHWt2rhQrpYIh+5XdbmCzQDnaWt+U6jZT74
 6QLc4R/psun+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Ro4wsaXj
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.3.14
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
Release notes: https://news-web.php.net/php.announce/444

Fixes CVE-2024-8929, CVE-2024-8932, CVE-2024-11233, CVE-2024-11234 &
CVE-2024-11236.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 9cbb600c98..e3a1c6cf2f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  89adb978cca209124fe53fd6327bc4966ca21213a7fa2e9504f854e340873018  php-8.3.13.tar.xz
+sha256  58b4cb9019bf70c0cbcdb814c7df79b9065059d14cf7dbf48d971f8e56ae9be7  php-8.3.14.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 17feb90d82..2f649dc6fb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.13
+PHP_VERSION = 8.3.14
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
