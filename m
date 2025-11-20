Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D887CF9C7F
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 18:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACCB584266;
	Thu, 20 Nov 2025 18:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1Kje6xQgGF2; Thu, 20 Nov 2025 18:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E93B184256
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E93B184256;
	Thu, 20 Nov 2025 18:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 079A2122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAC1A60901
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3Ih4cCTX7Jk for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 18:51:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E85860815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E85860815
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E85860815
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:51:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7434CA4C7532
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 19:51:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41760)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vM9kx-0000000017A-3vqC
 for buildroot@buildroot.org; Thu, 20 Nov 2025 18:51:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 19:51:48 +0100
Message-ID: <20251120185148.307327-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763664708;
 bh=MbJA+Y7ZpXsk/+Bb0D6no7yQbm8sUj5NHYgTzpvdOJM=;
 h=From:To:Subject:Date:From;
 b=cYB4mJDbq1RTcOBJSjL/n7vcT9ZobVIekrHcB8xQYrrTQU47a1DxWE9mwEMYHfcKj
 ZDrxb+T6Tr755tgMkuigwCi/7eWz1TJRx6ZGrkIyo2wnvz+7Q6sc5FhmQXkJBfnVIz
 03XwZuegQYyMzRIuBTSBvI5gMGnYDW0oBgJ9HBnePym7MKHqt9ILALVtUePoAJ/yL8
 ZpFpLgjETWP2W5x0/ZTe45Flt3XLQAL9hXRctFkvydETO37IIwCPArt5ICzHanoTHD
 H9mlpYrcFfekz9QUAl9770KCMG/JtIDwUcXDAWnkT4LSPvYO0yBacJzFD4T3owQFbP
 LFracQOxAct0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=cYB4mJDb
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.4.15
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

Release notes:
https://www.php.net/releases/8.4/en.php
https://news-web.php.net/php.announce/473

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 80feeb731c..0532adeed6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  bac90ee7cf738e814c89b6b27d4d2c4b70e50942a420837e1a22f5fd5f9867a3  php-8.4.14.tar.xz
+sha256  a060684f614b8344f9b34c334b6ba8db1177555997edb5b1aceab0a4b807da7e  php-8.4.15.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 4aca21a5d8..cd48cd1bd9 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.4.14
+PHP_VERSION = 8.4.15
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
