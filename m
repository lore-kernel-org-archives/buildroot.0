Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91219C982F0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 18:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1A6610A8;
	Fri, 16 Jan 2026 18:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUgzMoyW7UjF; Fri, 16 Jan 2026 18:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30D356102E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768587965;
	bh=n7vkeyFAiazYVblLcRno4qngXrtvPYP3vGvOqH6h9ME=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s1jTyLCZEgbkdj+RLIUeuUj8T/Ucqs8c4eHKBSUeTSKov9EhSNWA549ez8JXLxVdr
	 q1wvpkJz3in6eROMy9kW149LCKt7y0N7K5o+35QorD0lk+TtWkBjAnz/76nlmadpGA
	 X4AxIT1iFKSminbjHGBklbV1eLMz6bCUWTUhNFnaESFFECI6c8VGQbX/As1Hlk28Ks
	 G8q9nocxh61NGCHI/9MD8uZZag15tVdHl7g019q+KsMcdOVTjO9NFsRs/xOk1V8cFD
	 Qq4qs5OGlaSZ0mFK26rD8SycKvzZ+wq3JD7TPpi8xVHiUdxW0Qtx4lJjH4glKVk3lJ
	 NOYLySeM8cvXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D356102E;
	Fri, 16 Jan 2026 18:26:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55AD5223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B52C40A5D
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbVE9aYqfbAi for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 18:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1173740A57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1173740A57
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1173740A57
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:26:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd81.dip0.t-ipconnect.de [84.161.189.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F001A4C322F;
 Fri, 16 Jan 2026 19:26:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54568)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgoWG-000000000kN-3xh5;
 Fri, 16 Jan 2026 18:26:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 19:26:00 +0100
Message-ID: <20260116182600.364461-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768587961;
 bh=q+twaW3xxKdYMM2e9YGIi0GpvfmLMqYkOqI5zaDpYMk=;
 h=From:To:Cc:Subject:Date:From;
 b=ba/LaziBkEGjJn5imUqsfFiHx1aaIu88HlTbuVGofVkbxC63K2bGRzQoaicphv72A
 fXd1mFycC/nzQiF32my+Y9c9i5pqjeyDkiUouc5EucUcxcb1TTFSXRMrWWZXlhm19n
 4DjBaMX7bRrQDK/DYROHDpFmsGi8lpNllAeImPvG1KReC0FhDbhIlUD18n55BuH0Ky
 GHma66VnCc6JgIh03PpOZnoR2HRROSlttIrblqhudrsZVpmRDRLnOCJuyAzGD4+9PA
 kKxMGLjziKImZPuAQ2gXOdHyk0WhMXUaAuq6BBYcwKIJVRcQbJrqFP02rxtEu9JT+A
 be90cyyY/BouQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ba/LaziB
Subject: [Buildroot] [PATCH 1/1] package/php-amqp: bump version to 2.2.0
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
