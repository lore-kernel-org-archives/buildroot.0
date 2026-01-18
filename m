Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F4AC98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C53D14067C;
	Sun, 18 Jan 2026 22:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1epBkxy7PHi; Sun, 18 Jan 2026 22:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 554B740664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768776620;
	bh=dl1zmkUjQQ1w8Nga7Q2vwLxRxTuqPL41tifdcHnJOp4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acdCkdXJco3s5Ow32N7mzDsUT2l79/cqXJes6MEo2k9iPLXVvVRO6Hs6T3ej2HJ2e
	 S520AC/uwonb+Q9PJxSnVJK6KTqtUbbEGM1gMg+32QH1ERd34hdSOvHCbPUgDUG/DP
	 C0twydptB13lWtOgGjw9joNWJPoI/7+i8+LzpiHPeRsw1idlF242n1rjce60E1MVLa
	 cnb9mPK7+NOhLK5AbnhRJyDMsfcB2lsqmkX0QbsAzXM4yhRDtkkgwAExMFUuHB8qCr
	 SwHBkDplF8EL4gylHLTMMN+iMF9BaNzsUpIo87n4J+/2IGBTizqtMknXkbWZ2KVPPw
	 /TAbhbACE63IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554B740664;
	Sun, 18 Jan 2026 22:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5D46160
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5058808A1
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgLn1qZa7cSX for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C046A80835
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C046A80835
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C046A80835
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EEB2A4C47A2;
 Sun, 18 Jan 2026 23:49:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhbae-000000001R1-2lqo;
 Sun, 18 Jan 2026 22:49:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 23:49:43 +0100
Message-ID: <20260118224947.3879017-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260118224947.3879017-1-bernd@kuhls.net>
References: <20260118224947.3879017-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768776589;
 bh=DZvfkaBQzuGSRd2Kjm4PIDYi5HG9UzcaallnGshiH7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LKb5GJ+6pw9vTRwrVdGnZP2ponZHEDQ99jIMY3CUBg+MFLhP+/u2nODFUN/3hOcma
 /GF9kOB9NRpgLO+BSK6ReQxIkOkYLO2JeFq+++GktTEkQOsyWBvwYPchBhDdQMf9CX
 YIkxWiqPfqvabJE0x+wni/5twI3ah1O9WIGHIvZW03Iw3bFPr2Z//IdCWgybbsKSUd
 /dGZXhfdkaazmQHZOovbfnu/RpGeBPs6tLkbzzm1kut95Gd+5ubxSgp1VZPcsiJqrO
 a9EkyUvE6xUphadHalRIwrF+IPtJVaBiF39AiajeDhKnAgyWcHksLzGS9Nv4hn7Gp9
 dJYIIsiczQx0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LKb5GJ+6
Subject: [Buildroot] [PATCH 2/6] package/php-amqp: bump version to 2.2.0
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

https://pecl.php.net/package-changelog.php?package=amqp&release=2.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/php-amqp/php-amqp.hash | 2 +-
 package/php-amqp/php-amqp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
index 1c0938542c..22ed4ffb13 100644
--- a/package/php-amqp/php-amqp.hash
+++ b/package/php-amqp/php-amqp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0cb16d63752a0055de55a22062a6c1744908696d92268d76181284669025d993  amqp-2.1.2.tgz
+sha256  5ae624bd785e299523f6132c204bd562cc73066dd33a10a12aa96389f55a4de7  amqp-2.2.0.tgz
 sha256  ecd004e9ae3fcf54896b562d5e8008e36041f2620076effd58e5f4187299cee8  LICENSE
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index 5507032ee1..f47c0ae874 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_AMQP_VERSION = 2.1.2
+PHP_AMQP_VERSION = 2.2.0
 PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
 PHP_AMQP_SITE = https://pecl.php.net/get
 PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
