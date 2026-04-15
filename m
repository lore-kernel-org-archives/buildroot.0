Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE21FF428C6
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 18:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B68342336;
	Wed, 15 Apr 2026 18:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TtcPg8lbpFy; Wed, 15 Apr 2026 18:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6E642209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776279055;
	bh=gRfMu8/EvrwINBh3tuOHBMph5RQXGpGqjbrwvJeeWL8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=poCX18uswb8KRQ9W21eOtNoRm0J6v/YQYILiuPZQNe2wthV/BXhXUQPlflIoXC1kD
	 JZaBCuqQ4TlyEbkmF+xqP07ceKAhQmCYFV5onK6LCl9EU/t35WaWsdlFR+4TveLKK1
	 f5QiFVB+BblzmBDXjYNoH3ePIdf47ZbO1kY6sLd7Rz+JhKvv383txZJ5SCtBwESnmN
	 7lCFvTMd0pWNp5WwQnMOKnJgJ+EE3yP548iPdkHe8+Rxr7peid2tFkDV6rdfFu8U2I
	 0fvrvkNptbA0590sdiJ5vzNS8JepInN2lTn+XL4wnj067h94PrhK6ydVtXyUoJBfPg
	 nKjE1lWcAQzeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D6E642209;
	Wed, 15 Apr 2026 18:50:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 391ED127
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 18:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EC6460B62
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 18:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYtUbyb__NkP for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 18:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C261A60B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C261A60B5A
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C261A60B5A
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 18:50:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso110179995e9.3
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 11:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776279049; x=1776883849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vw8RgvYd2cc5x3Z9061EFsq90qRdl0yzKRLrMa7zPFA=;
 b=ppWGN+VjrHfWNXnzCU8C0RJyRsfZdEfC2OfSXUE7i2ZUhOTRNcM6MhlObu6pGDPViH
 1uP0lZws3zmCZOtuzN2wbiE+GIxechJnociNECFhf7vm5Es5Oe3Jx9liFqD2aFFNhajr
 DpnhtCcqn+eGXMHZcunYDBlEZsS9KCkQHVqiBz8sg8YeGJkqlXSw+3+hGguUY8hWoBjh
 OkyY7aFQlRY8OQ9ivLtCG0cJ/Q2TY09c/F6+4fCl52CSxmzspWdiW8CZPESmKjaDcHfV
 789lSg+SYY3M8wNehwvRyWgOj+wSBHE9Z7n8kTjMejMs3+da6q7odzMeY8+nXzsWTO9W
 LZeQ==
X-Gm-Message-State: AOJu0Yyxxf3W4/JfB2oHYhN4oJpnnfLiyA4MlWD7k1POwYhYrRNGo5Em
 QNZqrsT/WJpQqbDvq5930quJGXL/r1RE5yNfQ+EDt6CZX8RKTfsriYF8Jul0zOR5kMPE/MT25FE
 jx3wh
X-Gm-Gg: AeBDietrpQdEiYRCdXRQTf1RmFl1v/XHbaDs2wAqKPhcdyLM6h4lm7ZB3zOG2AOnHZA
 nzdiZEsOnFv9nheOe7O6tkQysX+kkEMYrcZWjPH9sdypbbpTBcvOIAZfg+URGMLIWVaj1CPxZp2
 0EdYFeftQKwdvCF4lDL7sBFawaPg7i/mtC1c25aDikuVKVTEWfR+EMMwzQSInhX7t8nCWdWfR1f
 xUcUYjyurepV1NAksWqJ0YJuii5Vyd99g8QotWK4GsmQ14NbIRi3/pMahOUjII76mgCCPfJ74zY
 cohKNTQAboOhMY+GOR7rRKLUyHylLtheuzasEOy0A3ZV98kA8Yp9C721Fs1mFB84DVrfmSUqm27
 Js3Fuc4Ghb1wXSGNCpvFeo4jeGfVAzmz8WNB7xqeps8pW8HG4sTYElvsSjHtGHkZmJtEpVEXybN
 Vd8XrS3a6N0P1jxHf1p9UPhZwAX7l3rmntMnYfUaA1XZZuKBeo6UZ0QM/nTuDeOKKytzSxoleSl
 xwl5JzEIs/Ju+PzxSlHx7L86NpY6lIjMmCpGwWVnLT+wsvCTI/wzBWdrg==
X-Received: by 2002:a05:600d:1:b0:488:a2ac:a334 with SMTP id
 5b1f17b1804b1-488d67c720emr289493315e9.3.1776279049110; 
 Wed, 15 Apr 2026 11:50:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.40.93])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f1dd899esm68092665e9.1.2026.04.15.11.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 11:50:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 15 Apr 2026 20:50:37 +0200
Message-ID: <20260415185037.3034594-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1776279049; x=1776883849;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vw8RgvYd2cc5x3Z9061EFsq90qRdl0yzKRLrMa7zPFA=;
 b=etttNygOSIBD+Cf/NCvc8pcRNuxxrvCX9i7N07t98xQ5mdTp09yMUYXXOSpRQK9V3w
 yZUzJTj0ZRMHuZAZBoUa8NB83H1IyxH9vXIgiOJapYFcDMwt0lZ49UTfmL38jSpD2BuE
 6JcqSn2leCKZpUClcIMSuIpWvD+JVbGC8Sk98=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=etttNygO
Subject: [Buildroot] [PATCH v3 1/1] package/mtd: bump to version 2.3.1
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

Version 2.3.0 added the fsck.ubifs utility, so support it with
the new Kconfig option BR2_PACKAGE_MTD_FSCKUBIFS.

The new version also needs host-pkgconfig, as can be seen from the error
triggered during build tests:

checking pkg-config is at least version 0.9.0... ./configure: line 5613: buildroot/test-output/TestMtd/host/bin/pkg-config: No such file or directory
no
configure: error: pkg-config not found
make[1]: *** [package/pkg-generic.mk:263: buildroot/test-output/TestMtd/build/mtd-2.3.1/.stamp_configured] Error 1

Changelog: https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v2 -> v3:
- Add host-pkgconf to the package dependencies

Changes v1 -> v2:
- fix the commit title removing the 'to' word

 package/mtd/Config.in |  4 ++++
 package/mtd/mtd.hash  |  4 ++--
 package/mtd/mtd.mk    | 10 ++++++----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 0c95e3cc54ae..1054106f81e5 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -58,6 +58,10 @@ config BR2_PACKAGE_MTD_FLASH_UNLOCK
 	bool "flash_unlock"
 	default y
 
+config BR2_PACKAGE_MTD_FSCKUBIFS
+	bool "fsck.ubifs"
+	select BR2_PACKAGE_MTD_UBIFS_UTILS
+
 config BR2_PACKAGE_MTD_FTL_CHECK
 	bool "ftl_check"
 
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 0eb90a5118be..5f02e698d1b9 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
-sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.3.1.tar.bz2.asc
+sha256  03d9dc58ad10ea3549d9528f6b17a44d8944e18e96c0f31474f9f977078b83dc  mtd-utils-2.3.1.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 77050e7e40b6..48f417c6f441 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.2.1
+MTD_VERSION = 2.3.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
@@ -12,6 +12,7 @@ MTD_LICENSE_FILES = COPYING
 MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
+MTD_INSTALL_DEPENDENCIES = host-pkgconf
 
 MTD_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -28,7 +29,7 @@ MTD_CONF_OPTS += --without-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MTD_DEPENDENCIES += host-pkgconf zlib
+MTD_DEPENDENCIES += zlib
 MTD_CONF_OPTS += --with-zlib
 else
 MTD_CONF_OPTS += --without-zlib
@@ -43,7 +44,7 @@ MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux host-pkgconf
+MTD_DEPENDENCIES += util-linux
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
@@ -83,7 +84,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd
+HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd host-pkgconf
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
@@ -145,6 +146,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDBITERRS)	+= nandbiterrs
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDPAGETEST)	+= nandpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDSUBPAGETEST)	+= nandsubpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDFLIPBITS)	+= nandflipbits
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FSCKUBIFS)	+= fsck.ubifs
 
 define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
