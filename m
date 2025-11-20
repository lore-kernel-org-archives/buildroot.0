Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F2FCFA446
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 21:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 877C36F559;
	Thu, 20 Nov 2025 21:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkTZafiGkv3q; Thu, 20 Nov 2025 21:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA3136F55C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA3136F55C;
	Thu, 20 Nov 2025 21:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 428AF117
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 396E440542
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rc2C87L32NS4 for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 21:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0291A40567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0291A40567
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0291A40567
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:19:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 059A2A4C72BA
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:19:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49506)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMC44-000000004qH-1wIU
 for buildroot@buildroot.org; Thu, 20 Nov 2025 21:19:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 22:19:40 +0100
Message-ID: <20251120211940.1692904-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763673581;
 bh=ATRIe52kAeqvfkEGEXFan3pjloTS0VxaTzge+WVMxD0=;
 h=From:To:Subject:Date:From;
 b=jxrMo5oheyIn5W6nqpGHWydXiPvILQy2bkvhRgPnZKJTg6BgbBn7XzVQmheAzrrGI
 W7c+zPZXYPfVsH4w2Ijn1QhXOHHr5xocjs9+bAs76r2SQgzu+E/35dTTbTZ4pBzbz1
 MUtE7A6kZKoPY6C9x2dnPjbRnfYTUb2kd9h1BUE+xVunoakfoeJZEaGVW5zp/35DGl
 J5oFTBQ4j5pLPPJhRH9kGKmwKVGZPxlLRU3eG7gkIDdXaTBCOV9Klg2YvQwx5HoUpz
 WJXVcA9WZQiXAr1sGxpjyaNxNZcsvN5gUnWUBbEltZk1w4uORLfuqBq3ZU05S9djYd
 PgNd6npVRyUKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=jxrMo5oh
Subject: [Buildroot] [PATCH 1/1] package/php-yaml: bump version to 2.3.0
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

Changelog: https://pecl.php.net/package-changelog.php?package=yaml

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-yaml/php-yaml.hash | 2 +-
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index 4fa5dfbc16..796e654659 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5937eb9722ddf6d64626799cfa024598ff2452ea157992e4e67331a253f90236  yaml-2.2.3.tgz
+sha256  bc8404807a3a4dc896b310af21a7f8063aa238424ff77f27eb6ffa88b5874b8a  yaml-2.3.0.tgz
 sha256  68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index e825e3146f..440b07afe4 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.2.3
+PHP_YAML_VERSION = 2.3.0
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
