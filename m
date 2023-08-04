Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F72C04A6A
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 06:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5B9E41C64;
	Fri,  4 Aug 2023 06:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5B9E41C64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28kJ9e-6uhlt; Fri,  4 Aug 2023 06:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 098BA40A8F;
	Fri,  4 Aug 2023 06:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 098BA40A8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97A331BF2F2
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 06:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A54C41E58
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 06:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A54C41E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ebeZQRBJv11 for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 06:23:11 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D88A417AE
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 06:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D88A417AE
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78CF6A4C04F6;
 Fri,  4 Aug 2023 08:23:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRoDM-0000xe-06;
 Fri, 04 Aug 2023 08:23:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 08:23:07 +0200
Message-Id: <20230804062307.227606-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691130188;
 bh=xUYW0cfdX10O+AzqTgaaNUKR86jHJAVdassZVp2AYko=;
 h=From:To:Cc:Subject:Date:From;
 b=w6mof+pLDAHiMYW1A88oIpqCaxfQa9zWRVDVFgv3DAymEYX4Fhbvje10kPZICqIRh
 GuTkkfWnjQtbbHkgHDLH1UIzTAv2imKY0pZuNoHeB4qYUMDiEF5iAPd3ap28Ov8cb5
 mwC7dWByUXzszLzPAjmEe+kurI3Po3MKnvFquZN5LnQDZLexXPOp92+CZwFIqAtZO8
 C5jzrNVeP8GzcA61FWEkHoRlFDRC1KAjDVVSadylxseAuM6ubVps4CH+GhpxIL+xzH
 qDtlNbXT68qP/QKbaVZ5k6zPWhme7vXoU69/vMNo8CBwLZw7CnB2AOx3x5Ba1kUYHl
 5aXhbREIArOtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=w6mof+pL
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic: handle host-php as an
 extract dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Fixes:
http://autobuild.buildroot.net/results/506/50658c50fde8145fac320e3b17004e98c78c6c4d/

Although composer has host-php as build dependency, in the case of
BR2_PER_PACKAGE_DIRECTORIES=y host-php was not built during extract stage
of the composer package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/composer/composer.mk           |  2 +-
 package/pkg-utils.mk                   |  2 ++
 support/dependencies/check-host-php.mk |  4 ++++
 support/dependencies/check-host-php.sh | 14 ++++++++++++++
 4 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 support/dependencies/check-host-php.mk
 create mode 100755 support/dependencies/check-host-php.sh

diff --git a/package/composer/composer.mk b/package/composer/composer.mk
index a24c020796..ad1785cba6 100644
--- a/package/composer/composer.mk
+++ b/package/composer/composer.mk
@@ -18,7 +18,7 @@ HOST_COMPOSER_DEPENDENCIES = host-php
 
 define HOST_COMPOSER_EXTRACT_CMDS
 	cp $(HOST_COMPOSER_DL_DIR)/$(COMPOSER_SOURCE) $(@D)
-	cd $(@D); $(HOST_DIR)/bin/php <<< '<?php \
+	cd $(@D); $(PHP) <<< '<?php \
 		$$p = new Phar("$(COMPOSER_SOURCE)"); \
 		$$p->extractTo(".", "LICENSE");'
 endef
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 530638566c..353190c334 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -55,6 +55,7 @@ INFLATE.bz2  = $(BZCAT)
 INFLATE.gz   = $(ZCAT)
 INFLATE.lz   = $(LZCAT)
 INFLATE.lzma = $(XZCAT)
+INFLATE.phar = $(PHP)
 INFLATE.tbz  = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
@@ -64,6 +65,7 @@ INFLATE.tar  = cat
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
 EXTRACTOR_PKG_DEPENDENCY.lzma = $(BR2_XZCAT_HOST_DEPENDENCY)
+EXTRACTOR_PKG_DEPENDENCY.phar = $(BR2_PHP_HOST_DEPENDENCY)
 EXTRACTOR_PKG_DEPENDENCY.xz   = $(BR2_XZCAT_HOST_DEPENDENCY)
 EXTRACTOR_PKG_DEPENDENCY.lz   = $(BR2_LZIP_HOST_DEPENDENCY)
 
diff --git a/support/dependencies/check-host-php.mk b/support/dependencies/check-host-php.mk
new file mode 100644
index 0000000000..eac98e73d9
--- /dev/null
+++ b/support/dependencies/check-host-php.mk
@@ -0,0 +1,4 @@
+ifeq (,$(call suitable-host-package,php,$(PHP)))
+BR2_PHP_HOST_DEPENDENCY = host-php
+PHP = $(HOST_DIR)/bin/php
+endif
diff --git a/support/dependencies/check-host-php.sh b/support/dependencies/check-host-php.sh
new file mode 100755
index 0000000000..d049a89455
--- /dev/null
+++ b/support/dependencies/check-host-php.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+candidate="$1"
+
+php=`which $candidate 2>/dev/null`
+if [ ! -x "$php" ]; then
+	php=`which php 2>/dev/null`
+	if [ ! -x "$php" ]; then
+		# echo nothing: no suitable php found
+		exit 1
+	fi
+fi
+
+echo $php
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
