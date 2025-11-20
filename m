Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615CACFA447
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 21:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12B99818E6;
	Thu, 20 Nov 2025 21:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05JEK13YzXNG; Thu, 20 Nov 2025 21:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38F26817FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F26817FF;
	Thu, 20 Nov 2025 21:13:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6874F117
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B0AD6F55C
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39nqBweZ6JNk for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 21:13:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F4CE6F559
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F4CE6F559
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F4CE6F559
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:13:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24111A4C729E;
 Thu, 20 Nov 2025 22:13:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56248)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMByN-000000003md-2c6S;
 Thu, 20 Nov 2025 21:13:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 22:13:47 +0100
Message-ID: <20251120211347.1681108-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763673228;
 bh=H0987YuJlyBjtQh/RpG4kB1FeNTkIgKtdOdbtdcPkqk=;
 h=From:To:Cc:Subject:Date:From;
 b=D4/0mwz0Kxfz45KMQJhkBoi6DMcqIPugiaXHPEtMS1sk3hK2nAtTu9HH+hiCJllB/
 kGXRAInruEMxXBMbojZWkJuCqNYBJTghcZQtzHQ0VAZyuhf8SJDnf+GjN94h2J9oO4
 oIUI87xVUwfXo8ZIH4xmP2Xgocicmcz8J2YVzuzxuToxCSEwDdKEaw88ma+kNjYV9z
 D3HvymQn/RfEN5spsmkAq4iFzMBQA326iaOTTIKPX4qaMQDyXyGjPzc/6jam8Fgl4W
 5UvCBEOVwNxCebBF/ETSBvkrUljQxBDWMfiGCsMelORmgIMbu53qSgSlv3kZqH5rEz
 ttWjMmAvdZCDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=D4/0mwz0
Subject: [Buildroot] [PATCH 1/1] package/php-apcu: bump version to 5.1.27
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://pecl.php.net/package-changelog.php?package=APCu

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-apcu/php-apcu.hash | 2 +-
 package/php-apcu/php-apcu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-apcu/php-apcu.hash b/package/php-apcu/php-apcu.hash
index 4a5eadf803..073d1ae6e9 100644
--- a/package/php-apcu/php-apcu.hash
+++ b/package/php-apcu/php-apcu.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  010a0d8fd112e1ed7a52a356191da3696a6b76319423f7b0dfdeaeeafcb41a1e  apcu-5.1.22.tgz
+sha256  1a2c37fcad2ae2a1aea779cd6ca9353d8b38d4e27dde2327c52ff3892dfadb3f  apcu-5.1.27.tgz
 sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
index b8eeb9de7c..ce640c9c03 100644
--- a/package/php-apcu/php-apcu.mk
+++ b/package/php-apcu/php-apcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_APCU_VERSION = 5.1.22
+PHP_APCU_VERSION = 5.1.27
 PHP_APCU_SITE = http://pecl.php.net/get
 PHP_APCU_SOURCE = apcu-$(PHP_APCU_VERSION).tgz
 PHP_APCU_LICENSE = PHP-3.01
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
