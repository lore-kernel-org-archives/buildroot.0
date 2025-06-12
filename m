Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7CDC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 16:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD8E40785;
	Thu, 12 Jun 2025 16:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhk5390tTq-5; Thu, 12 Jun 2025 16:59:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EB040787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07EB040787;
	Thu, 12 Jun 2025 16:59:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 942B11E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 916DB4088E
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKb89LeZL_md for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 16:59:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B076540787
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B076540787
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B076540787
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:59:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c09e.dip0.t-ipconnect.de [79.214.192.158])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A24E8A4C213B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 18:59:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39846)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uPlH8-0000000043Y-3DG8
 for buildroot@buildroot.org; Thu, 12 Jun 2025 16:59:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 18:59:38 +0200
Message-Id: <20250612165938.3474011-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749747578;
 bh=YzLlIdBw3hGrQl5zsWSKQ7AOZSM9YPjAPearmyjizz0=;
 h=From:To:Subject:Date:From;
 b=j03g+aEfMAcZoQpFDwH3fmu5FBnh7xImI0UbU5Aeh2pby/gacMARlsQ8JSRrzs3Ck
 u4UdK0pVGfgm/mMDJZt0IETeCJvg4tROkaMMuJv6qzJNEJmdslsUJXZuPUtDrG9t1Q
 hpeklpfSTsOtpw8FIbm2ct2R749azHjPfaZby96NBukRz5C4dM1VnrrPq3xBeKV3rq
 q26IbaiOZMnXJjzZB1YVVOMAJ8bVU6SlnS1rJ0BZnU2IFvT8ReuAuxInsda5v+bgss
 06HJu7HqvdrGW//ElwIrH9bDepN/i3QPGIp4RoMBSWSbOciv+8ru0nPI3j6LFecJL5
 e/gJN0JkiOZxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=j03g+aEf
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.22
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

Changelog: https://www.php.net/ChangeLog-8.php#8.3.22

Release notes:
https://news-web.php.net/php.announce/460

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 8e3be2dbe1..4260c1e5f4 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  4dfb329f209a552c3716394fc123bb62e80a468b55ce27fc8cb0fd5f30b9dcd6  php-8.3.21.tar.xz
+sha256  66c86889059bd27ccf460590ca48fcaf3261349cc9bdba2023ac6a265beabf36  php-8.3.22.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ad42e57d72..01166bae64 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.21
+PHP_VERSION = 8.3.22
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
