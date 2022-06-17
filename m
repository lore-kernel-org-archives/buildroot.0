Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8C1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Jun 2022 20:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CB1640186;
	Fri, 17 Jun 2022 20:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CB1640186
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p65IbI42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c5bGxczyolvB; Fri, 17 Jun 2022 20:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B83A40150;
	Fri, 17 Jun 2022 20:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B83A40150
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8A671BF489
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 20:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A298040150
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 20:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A298040150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBZ0KaPk_UES for <buildroot@lists.busybox.net>;
 Fri, 17 Jun 2022 20:42:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B585040012
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B585040012
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 20:42:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 s21-20020a1cf215000000b0039ee8149524so1390404wmc.5
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 13:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iLzQaU4JdxrhvlusBM+tFGhLL1/lGwzSzcIaLcPwt3A=;
 b=p65IbI42sxMaEnzcOgvuxMUPrFD+V6Em2xPsh9fGYL6BmiX8zj1MAm5MTq/Kd500M7
 v43uaZUPtUiLZwK1sSpvTZyu3S9japiPusEfmF88S22opcAn8bLg04jzAOi0C3NF4q5G
 a1x4ueSQuqBK2w6kMySEbJcaaS6ed6haUrEHOTnCZaWfS3w9yFwiVimBw6o+B4FVtSqE
 5LioXMGPszlWCEO/EKUmM84RBWnKzq7Jjbijl18TDCsZxh3RiNGUV+ZCxKDjvyfJ3AHC
 yyLWHT6JOOdiY3sffrZiG97UVi1nLfNgGbPjqmrpTjD4j03bMByNwxdXUygxJ/GMrJhJ
 4D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iLzQaU4JdxrhvlusBM+tFGhLL1/lGwzSzcIaLcPwt3A=;
 b=Lu9RsBgsXKVmAu7tiHeCktT7aCXHEZUDpITdtLCoYX938hZXL+Mlv6x3bVAm9y4cae
 aA+5ryJWTKyWOuZ/Rxx8LZnmcXFG1gJg0TTL97R7lMFpVgly7AAMPy24RXMXCMm8+bNj
 FwjGUZ5tGNaOkP/v3KUleH0PkuUIEEb/0TJTE+LVtKZtgN9G1cHbzq/lqhoCCHAP7tBp
 BZyskikTW1x+U51CQE8UbQwahSrXSpLflKzvi1lGSYvBIJ+LWtkx6Y1RvcCU5IwS6Xbt
 ZifjesVkGlBkNzTmm2fyVnnLDO8KzDksYwNMeT4QcvEGkghXe4Foq0PN/tSRKGNGJBF9
 sqLw==
X-Gm-Message-State: AJIora/bFZIbGC0Q//dLunyOnlY5KRO8BtyJOvT6Vh2bJ0mIejoMv31/
 93jIw5jtGYlXB1ufk5hcL8lhASXedeQ=
X-Google-Smtp-Source: AGRyM1vAYk9yMBRjMcerkSeOMgDDroxN8NjUlzbsMkeiXy+sUy4+YPgO659ko9hwCsaxIps/ADH45A==
X-Received: by 2002:a7b:c755:0:b0:39c:3beb:32aa with SMTP id
 w21-20020a7bc755000000b0039c3beb32aamr12218459wmk.30.1655498576762; 
 Fri, 17 Jun 2022 13:42:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002103bd9c5acsm5611973wrn.105.2022.06.17.13.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 13:42:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Jun 2022 22:40:16 +0200
Message-Id: <20220617204016.11763-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php-imagick: bump to version 3.7.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of php to version
8.1.7 in commit 0ddfece7f7e5b10a5da89f2c462616d5deb5b1ec:

/bin/sh: line 7: /home/autobuild/autobuild/instance-8/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/bin/../../usr/bin/php-cgi: cannot execute binary file: Exec format error

https://github.com/Imagick/imagick/blob/refs/tags/3.7.0/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/9f82a9b95061d908e3dc10a83dd16facdbdd05b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index e915808585..97c0b2f0e0 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  795db7c36fbacd3d33a4f53ff2d38584c846e80a04dcd04c55e9e46c28f5d229  imagick-3.5.0.tgz
+sha256  5a364354109029d224bcbb2e82e15b248be9b641227f45e63425c06531792d3e  imagick-3.7.0.tgz
 sha256  b6e00df9cb3b91977c0d64a7c4db48cb6f5041f6eeda6583c236775f70a35b78  LICENSE
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 2dc055f0b3..925423b12a 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.5.0
+PHP_IMAGICK_VERSION = 3.7.0
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
