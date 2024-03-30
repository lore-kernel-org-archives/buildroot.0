Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167ABCD128D
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 09:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE6F40B74;
	Sat, 30 Mar 2024 09:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id groQyaDOTGSq; Sat, 30 Mar 2024 09:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 837FE4178A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 837FE4178A;
	Sat, 30 Mar 2024 09:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 785271BF41B
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6313940B69
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0sy10Nky87M for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 09:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DA7440B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA7440B66
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DA7440B66
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:03:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4154614b47eso12147465e9.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 02:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711789423; x=1712394223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o1nxznd3bH0C8sts+0QgPQoy0wN8FrISPJDCboCgJsw=;
 b=G6G0eLN1dutogIZobgbCrsdvbW9GJNfBP6SWM7cJ0nBbKiVhL2nVqbufVeCIUwR7GO
 axW9EEHYJhIvs4hU0zKbzzdXJJcM5NseiekZHf3y+WTgaeuiuDrgi6g2V1IlQ8y0CPhF
 8pacUQHuSpE3Jy2zJxDceH6RV5nHZ4+8D19gb0YQlnPKEWLEaWp0gRNQfrU2ZdTi8pV6
 9jSkxbR76QGBKlJ0hzofsNazoMO8c2pOHpchxQdCRMd1fWtIYX7vl4lJ3BejOoDQ1sWO
 4kbVTH4zNZ7ZtpjCzFWXqexBwYmvXSuFIaSGjUYP+n3euEAgxT15oyhufU647GndqLj9
 i4EA==
X-Gm-Message-State: AOJu0Yx3CkufMMAq62Ca9j9fmEhLUPOGvExnOe5lQqJ/juVbXP+zi854
 267Z4cCCTWkLsDWy6mg+u8XEwZUWNJ23ElkxyvMS8CKND76GyMrcJmnYz/PP
X-Google-Smtp-Source: AGHT+IEjjXANOZr1jTPNhFkOanPMhb6hm3ghSl3g8c322SppiDCpYwDwmeArPySoGwOy8qjGRcabNQ==
X-Received: by 2002:a05:600c:1c20:b0:414:61d9:d1f5 with SMTP id
 j32-20020a05600c1c2000b0041461d9d1f5mr3784348wms.10.1711789423109; 
 Sat, 30 Mar 2024 02:03:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004148d7b889asm10978316wmf.8.2024.03.30.02.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 02:03:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 10:03:36 +0100
Message-ID: <20240330090336.567660-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330090336.567660-1-fontaine.fabrice@gmail.com>
References: <20240330090336.567660-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711789423; x=1712394223; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o1nxznd3bH0C8sts+0QgPQoy0wN8FrISPJDCboCgJsw=;
 b=WPbsHVNjMrQ5oMi5cvLO4d1ZrLV0rjotT/Vn5G7aBbIAhEEXiAYpX57Gvq2Y6815//
 UXDcv3nWMMO9DPIeDcLIlybTdPzq+VyNh4TtfYuVd95/BgNL9Lx8rpbwkCY0GNTuntTM
 z62qzwc61lKUZuPq4iUHeJHI7xZFsV0qkSaxCLkL+AssKq5mBlQHpR3dzdC4yANKQvj7
 gkxXT8XkydZtIAADWWNPO/TystHImgHQ1zmBR9i+FfCK2EYvInvvejJIhebsNLFfPigq
 /OLDUiZKUDmZt5/AWjboBJNISmVsH3wJlbnWJcHNoAoKD7mxNwtppqYpy9eW43q8IErd
 Hi6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WPbsHVNj
Subject: [Buildroot] [PATCH v2,
 3/3] package/php-xdebug: bump to version 3.3.1
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

- License updated to match the PHP 3.01 license:
  https://github.com/xdebug/xdebug/commit/5fc2d818067d05503226ee8c6442985cb2fe069d
- This bump will fix the following build failure raised since bump of
  php to version 8.3.4 in commit
  e50460f9f12a8c5f82f2166733afe9cca3c8cd19:

  checking Check for supported PHP versions... configure: error: not supported. Need a PHP version >= 8.0.0 and < 8.3.0 (found 8.3.4)

https://xdebug.org/updates#x_3_3_1

Fixes: e50460f9f12a8c5f82f2166733afe9cca3c8cd19
 - http://autobuild.buildroot.org/results/0209b522baec3c88a2060e79f805552db79b2c70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Update PXP_XDEBUG_LICENSE

 package/php-xdebug/php-xdebug.hash | 4 ++--
 package/php-xdebug/php-xdebug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 2509e6e2ee..251b79ab77 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f48777371f90cbb315ea4ea082a1ede6765bcfb35d7d6356ab8f71fd6dfcc157  xdebug-3.2.2.tgz
-sha256  ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
+sha256  4eb4ee270bbcc5f14195c38f6ee58580e007cf4886ce32e11430318ab5bc2315  xdebug-3.3.1.tgz
+sha256  bc2aee27f3f0806be39e329d284ddbbfb14602a49af261df305dd6122d988eb0  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 3bc197e556..771b96534a 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.2.2
+PHP_XDEBUG_VERSION = 3.3.1
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
-PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.0-like)
+PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.01-like)
 PHP_XDEBUG_LICENSE_FILES = LICENSE
 # phpize does the autoconf magic
 PHP_XDEBUG_DEPENDENCIES = php host-autoconf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
