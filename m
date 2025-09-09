Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807D5CAC583
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 16:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CDE83EBC;
	Tue,  9 Sep 2025 16:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhScmVDUTs8u; Tue,  9 Sep 2025 16:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C40F840AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C40F840AF;
	Tue,  9 Sep 2025 16:12:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 264D9186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA2B41314
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eihbK-nG6k8B for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 16:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 126A24094A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 126A24094A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 126A24094A
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:12:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0bb.dip0.t-ipconnect.de [84.161.176.187])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2A86BA4C0ED2
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 18:12:17 +0200 (CEST)
Received: from [192.168.1.144] (port=59790 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uw0x6-000000000Ml-2KyD
 for buildroot@buildroot.org; Tue, 09 Sep 2025 16:12:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 18:12:16 +0200
Message-ID: <20250909161216.59631-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757434337;
 bh=PpWmWHLQX+bi6dIEyDh+b2GY2fsPr+00XZ8HhHZIzDs=;
 h=From:To:Subject:Date:From;
 b=G2Gd2FVYUIBNxzNtIOxI3RaFDF/45onNGlZrdmbS6gZ1VKZuKLQ7dQBg3Qz2OXHoB
 JuOYJjF6AbuJ/OiKbTaUPLjx1hJiFdFVevQPyBP2PxbXsroe6CkTNoZaczKhq7Wt9i
 q2FiSZp8JcFFFtZxVp6Lb8Z0pE4Hi3GMT7U4fyAsaIBf0k4gi9HVgMimIVoueqv+PN
 Z+9K6mCeCNXENESsbNQ4cFdTo9SYp0eEeaimg+zrDoe+ywtH6r/vGQpQT6kK1iuU16
 Ootffoy+Y8fJ4PIDVp+0MyPZmQLjkxoQ4CK20hw1s7fDXPcN5AvOkIBAzpNqaWJz+L
 m2MP5b75XSyAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=G2Gd2FVY
Subject: [Buildroot] [PATCH 1/1] package/php-imagick: bump to version 3.8.0
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

Changelog:
https://pecl.php.net/package-changelog.php?package=imagick&release=3.8.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index 97c0b2f0e0..f6091c6b7e 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5a364354109029d224bcbb2e82e15b248be9b641227f45e63425c06531792d3e  imagick-3.7.0.tgz
+sha256  bda67461c854f20d6105782b769c524fc37388b75d4481d951644d2167ffeec6  imagick-3.8.0.tgz
 sha256  b6e00df9cb3b91977c0d64a7c4db48cb6f5041f6eeda6583c236775f70a35b78  LICENSE
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 925423b12a..0223b6ae93 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.7.0
+PHP_IMAGICK_VERSION = 3.8.0
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
