Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38A9CFA446
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 21:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B71126F55C;
	Thu, 20 Nov 2025 21:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNL__LXpChjd; Thu, 20 Nov 2025 21:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF36D6F556
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF36D6F556;
	Thu, 20 Nov 2025 21:11:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5378A122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 459658414F
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMCs0My3wTAM for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 21:11:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F9678415C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F9678415C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F9678415C
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:11:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C943A4C74E4;
 Thu, 20 Nov 2025 22:11:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49108)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMBvt-000000003LH-4C55;
 Thu, 20 Nov 2025 21:11:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 22:11:14 +0100
Message-ID: <20251120211114.1671246-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763673074;
 bh=XygwotBq2Nyv+ezR5vN0/UkIGA4SfTSqoyQHQ6c17H0=;
 h=From:To:Cc:Subject:Date:From;
 b=Gh+uZEesnM0t6Zkf93dd4G18qtNmJZ3GcItNP6KvFe8R8EMg7eSu4lRZpC1Gua/kY
 V1f09EOvhSDnZiIGAVSFuOyTQARUv3jkrpTmbP8C1QjO51LFLTlhGeNs87FnUUyDto
 5cF4o6k0uW/DZ3mLp+Jo60g7S1CiY1FJdTpGLm/UfXH2tSITSUfd0JZVjHCImKk6KJ
 Fdh7VgCrhU5rqBG3Zx1SqNngPCuhnb8rnFrqbzLZ0hxqVLXC51TBFis7bvlLUBf+nY
 GdjAvcFZZULO3uD+wUPmv+a1LsY5ouItPqg6TfuOy8UhT7qD+Jhr4bE7Aka7QAFqvL
 TrbO9G3qnhuWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Gh+uZEes
Subject: [Buildroot] [PATCH 1/1] package/php-amqp: bump version to 2.1.2
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

Changelog: https://pecl.php.net/package-changelog.php?package=amqp

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-amqp/php-amqp.hash | 2 +-
 package/php-amqp/php-amqp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
index 159a157a49..1c0938542c 100644
--- a/package/php-amqp/php-amqp.hash
+++ b/package/php-amqp/php-amqp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2de740da9a884ade2caf0e59e5521bbf80da16155fa6a6205630b473aed5e6dd  amqp-2.0.0.tgz
+sha256  0cb16d63752a0055de55a22062a6c1744908696d92268d76181284669025d993  amqp-2.1.2.tgz
 sha256  ecd004e9ae3fcf54896b562d5e8008e36041f2620076effd58e5f4187299cee8  LICENSE
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index 7e58234d1f..5507032ee1 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_AMQP_VERSION = 2.0.0
+PHP_AMQP_VERSION = 2.1.2
 PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
 PHP_AMQP_SITE = https://pecl.php.net/get
 PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
