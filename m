Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A417C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 22:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B9304192D;
	Tue, 26 Dec 2023 22:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B9304192D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jj0UUc2BQ5Z0; Tue, 26 Dec 2023 22:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A6A44192A;
	Tue, 26 Dec 2023 22:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A6A44192A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F7201BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3883681F34
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3883681F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bsjTbsmL0Cj for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 22:43:52 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43EE581F32
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 22:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43EE581F32
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3367f8f8cb0so4854327f8f.2
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 14:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703630629; x=1704235429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Eby/gM0BxTSmVicna8PAYm/rto1jNtudiaEYHCneAU=;
 b=ehsSa5nu8NSg3IpbTaJZq2OYcjw1WbTRpyl9ZWFi/tunjonmMai0YOdnyIpNMgx77L
 hmq+lGm4rOC07wx3ee5aBEn4gwk0QJ67nhja2PCrX70l1/9ugbN5kTUKp4xcmNbIwcol
 T/LPTrP8Tn4d9JELQWKvHCLuf6hy/UjIArdvU5nONDLyMsAYKkMJtP44SteSOn5yQV0I
 dhE9Gn8iyFwdOKySJ+SmJcYSxMdCEFfFM1tljznINYUAgM6GyIDM9nmW4Bi528gX6z0u
 /DsisdGaAExdSi5CbIe6Mjck4PMguzTl73RYiDuoUrf6pI3P1lwprQO+vv3drp8ATVSB
 8e2w==
X-Gm-Message-State: AOJu0YxeHb1lBUHk3HXbGvYIVv4MI3n4zMsaLNQbTk3RD9etiii6P1XE
 OqNdDaIqLmOxL3g3O8uVHD7eVuRj68M=
X-Google-Smtp-Source: AGHT+IHw5XNewjvSx7PikkbyFjg6z5V5uR08ibKPgD4K8ifSfCcsxiJcEi51M7T+psk+SceXfFidcw==
X-Received: by 2002:a5d:4b05:0:b0:336:615e:9308 with SMTP id
 v5-20020a5d4b05000000b00336615e9308mr4397294wrq.18.1703630629398; 
 Tue, 26 Dec 2023 14:43:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m17-20020adffe51000000b003364a0e6983sm13347707wrs.62.2023.12.26.14.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 14:43:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 23:43:46 +0100
Message-ID: <20231226224346.2065722-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703630629; x=1704235429; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Eby/gM0BxTSmVicna8PAYm/rto1jNtudiaEYHCneAU=;
 b=l6ErL79efSOeopMzq32EFbH+5ugDOuH4ozxAPlfqqzVMF8dWhkEUyNEK8BniCI8hOl
 jdVWqJBaV11AoCEA3orYfelwusdN6p1geWWkc+9g3J5kaKa8BYsad3PRui94ITY/X2H3
 /E69RV9uX7UpDQPaUXmlT4bqUTkFJUgmtmN9lQ13hA/2Gnx5iSFo6r9FiAA9hHnkBYOq
 8iqeEFpJv8E8rtPdra5TX8CChvMLwR70HSxhZm6nOsxYY2B86w4viqSgOCBO/iPWD+u6
 H2dKRfvkJO2yk2BEGZSww24y4LdT07INERbVItx6uYJIY51W9WSI5106qFYBiJf2w+r2
 s7Og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l6ErL79e
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.6.6
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball and so drop autoreconf
- Fix CVE-2023-6935, CVE-2023-6936 and CVE-2023-6937

https://github.com/wolfSSL/wolfssl/releases/tag/v5.6.6-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index fb5a570de8..59e42e98b9 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  031691906794ff45e1e792561cf31759f5d29ac74936bc8dffb8b14f16d820b4  wolfssl-5.6.4.tar.gz
+sha256  75aaafe3b8c776d1ac417288116c8d444115f9fac5acb382a39a7d163dfd618d  wolfssl-5.6.6.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 17452fdcaf..68c69afd59 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.6.4
-WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
+WOLFSSL_VERSION = 5.6.6
+WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/releases/download/v$(WOLFSSL_VERSION)-stable
 WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0+
@@ -14,10 +14,6 @@ WOLFSSL_CPE_ID_VENDOR = wolfssl
 WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
 WOLFSSL_DEPENDENCIES = host-pkgconf
 
-# wolfssl's source code is released without a configure
-# script, so we need autoreconf
-WOLFSSL_AUTORECONF = YES
-
 WOLFSSL_CONF_OPTS = --disable-examples --disable-crypttests
 
 ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
