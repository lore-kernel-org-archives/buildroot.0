Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0B1C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 08:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E60E7051B;
	Sat, 18 Jan 2025 08:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3f_W4GMpYfeX; Sat, 18 Jan 2025 08:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E15E70568
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E15E70568;
	Sat, 18 Jan 2025 08:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E147B89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E697642A4E
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNNG1I9PDAHd for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 08:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4869B42A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4869B42A4A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4869B42A4A
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:32:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c706.dip0.t-ipconnect.de [79.214.199.6])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 901EEA4C4529
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:32:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33054)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tZ4Ft-000000000bT-2Vr5
 for buildroot@buildroot.org; Sat, 18 Jan 2025 08:32:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 09:32:33 +0100
Message-Id: <20250118083233.2882216-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737189154;
 bh=i31rdCxOn9Eyj9uvW9m75Sxst6vtmlOVG/8489u/RDE=;
 h=From:To:Subject:Date:From;
 b=gzuBNoKgG/JO7ji3Oe2igq/RxSc1zV+jIi8rbSuZbRPXHrwckVRRIBWsmCUuC210d
 gxTy/iKpnYpK0zWtExxkYj7xcKWcE4XTkQcc2hkf8sZPylhIA6H1AYpGmS1BbqfiwS
 KyXc+G0Aom14Sydb999itEy8PYjqiJZm+qwlnTqIDh2eWWqYvVBqIBjATCpBpXcVvk
 0wpZTPZA3U9sFBZ+wvRwGpfUDW5lGBpT+756bujVdlL0CI/k1/4rcjdO4yQhBQE1ky
 bH+XvGViknc8DBZU37K0pBJDqb26e7/Ox+pDSl48WAAHZXx+Ewzve6jlHuUIDtDMhi
 4sTNMq70RnM1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=gzuBNoKg
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.16
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
Release notes: https://news-web.php.net/php.announce/450

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 535761f047..a27e934474 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  3df5d45637283f759eef8fc3ce03de829ded3e200c3da278936a684955d2f94f  php-8.3.15.tar.xz
+sha256  40d3b4e6cac33d3bcefe096d75a28d4fb4e3a9615eb20a4de55ba139fbfacdd5  php-8.3.16.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ebdd5c2a5a..c127473799 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.15
+PHP_VERSION = 8.3.16
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
