Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88F7C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 22:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CE5E60BA6;
	Fri, 26 Jan 2024 22:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CE5E60BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96zUyxgu9lT0; Fri, 26 Jan 2024 22:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B91605EA;
	Fri, 26 Jan 2024 22:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B91605EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9401BF3C8
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 22:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1022181337
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 22:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1022181337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVAqMc83Emea for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 22:23:31 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0036C81336
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 22:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0036C81336
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e775695c6so6801785e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 14:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706307808; x=1706912608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3VUeE47DHe8Zc3kp0TsW4IGbd2vAAGA2njorWXBB1gw=;
 b=ua4leR1enrnZr24MEzatQ8m5z0a6lK1il8fN1ho3X2BE6xiR+r+QcnNO7C5+AkChO5
 QwKg+J/aQNDQg4ENss3/2DGp3wDrEyWHuFupDuwY71KmPwOWy+6U1ptXteva9ClD9UNC
 c+Ivw7MaGt4edBGPlU7mICuIv4rul2jAKslVN6lkRkYO/8B4VIKjAnd1OzQMz4JbsN+G
 TDDd8VkI8EIv0ThvoK9fuOUagGy9QH7xl2Y76Uim5uTD/84B5gblsi0C4+Xt2EUMtdEZ
 8j2wVV53DcqhL7io5qSC8mqWLtKCW/Qw7Bi6kzCs0KXkLxNrwD2XWmghwMx2DejNAzz8
 jNgw==
X-Gm-Message-State: AOJu0YxH5DkRGCQE3N/CHMp+EFANqeplHG/ieUbqhuLGaZYrx9kFdlwO
 8RTEQUEgCDwr2vzUG4eDUnrrW9Z1QaX2IWUSLYqA00Q5shp2fklukyPCAp40OSQ=
X-Google-Smtp-Source: AGHT+IEm3AxH8kPvgmaaewyeHCyvbdAnBLzpvR45OJSD7xJG4dC683KycEg+0IYYG9lhDcog+yMcSA==
X-Received: by 2002:a05:600c:5404:b0:40e:4e48:513b with SMTP id
 he4-20020a05600c540400b0040e4e48513bmr676077wmb.12.1706307808118; 
 Fri, 26 Jan 2024 14:23:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b0040ee51f1025sm1847072wmb.43.2024.01.26.14.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 14:23:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 23:23:24 +0100
Message-ID: <20240126222324.1790975-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706307808; x=1706912608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3VUeE47DHe8Zc3kp0TsW4IGbd2vAAGA2njorWXBB1gw=;
 b=Kn5P4H4E2ppuR/v3HLIHjU9TJfMYKzXs/phNbE6JhKt/YlKZ+mKBAZxW20HNA0UkYG
 jmSJIzUet1vdtX8OiQg+6NHBFDJ8Qu37KjVVAi+O2KO0rn/yDwciKtmO0/EFx/ekzUHg
 agH1rnP2tYYOOK8aBm30Jn8EHFqUNJ4rNyTFwvX56nrR4SC4UDrWKGcuSyqA1uEA8aTZ
 kDRwSlV5J+fl0uy5IlubY4fLKPOqIy2VIqTCy4VZRiy8vVbeQALz6W2LdAwSIGkufKH3
 AfspzIsPT2ATgcm381FvN+2dhDgVmg5sasQuOESuAVhkeD7QKCV1Nyhh1CC3qWJH3LV+
 yhLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kn5P4H4E
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to version
 2.28.7
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

- Fix CVE-2024-23170 and CVE-2024-23775
- Mbed TLS is now released under a dual Apache-2.0 OR GPL-2.0-or-later
  license. Users may choose which license they take the code under:
  https://github.com/Mbed-TLS/mbedtls/commit/f429557c5900d3b90bd10a21b228f719e80f81a2

https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-1/
https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-2/
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.6
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index d0cd0b2105..3ec151a859 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.4:
-sha256  849e86b626e42ded6bf67197b64aa771daa54e2a7e2868dc67e1e4711959e5e3  mbedtls-2.28.5.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.7:
+sha256  1df6073f0cf6a4e1953890bf5e0de2a8c7e6be50d6d6c69fa9fefcb1d14e981a  mbedtls-2.28.7.tar.gz
 # Locally calculated
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 1b941e04f4..cdb4aef4f4 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.5
+MBEDTLS_VERSION = 2.28.7
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
@@ -12,7 +12,7 @@ MBEDTLS_CONF_OPTS = \
 	-DENABLE_TESTING=OFF \
 	-DMBEDTLS_FATAL_WARNINGS=OFF
 MBEDTLS_INSTALL_STAGING = YES
-MBEDTLS_LICENSE = Apache-2.0
+MBEDTLS_LICENSE = Apache-2.0 or GPL-2.0+
 MBEDTLS_LICENSE_FILES = LICENSE
 MBEDTLS_CPE_ID_VENDOR = arm
 MBEDTLS_CPE_ID_PRODUCT = mbed_tls
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
