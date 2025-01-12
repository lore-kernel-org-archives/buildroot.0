Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49F7E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 22:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 971916074A;
	Sun, 12 Jan 2025 22:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dswlo3ZKsfOF; Sun, 12 Jan 2025 22:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F31960704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F31960704;
	Sun, 12 Jan 2025 22:31:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00638940
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 22:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF7DA40147
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 22:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JB8wtUxfDUQ for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 22:31:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E19540108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E19540108
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E19540108
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 22:31:46 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21619108a6bso61495515ad.3
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 14:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736721106; x=1737325906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FBnyTOFFQQDcAir5406R2vSR9vqy+YN8ygdrLBT52iM=;
 b=BWLUX3ogoLJgRXgzEJpv1qfBjpJDFmffFZ3MIZRAwfHzrEnLvFCSu6NW+swmVpW6aJ
 tfEDAeRm8dOkijJlnvrEqr+KwXmnzJ6ywUuuYBpe219qnI1A24i67iaj6sDGVC/fMSFe
 fYFTrhpKo01i3iTKQn0n/+QjWZ3LukT4wMXuApdlnzNwA06KCU8mpRDO3vIXA2/6Bt6I
 BNJKZ5GiepjpTZpo18j7WrhL7dPjzsymZ30Hys+vh3faYUA3T5LndawOS4eurymcpVeW
 j06KywmzqjbcW1H8Z4okRbt7yz/c+1pln2XWlUOxGpNcjpExeZV10223LE3WMM+v10kI
 58bg==
X-Gm-Message-State: AOJu0Ywe+SIqGeUUI0AGspNHEWK+kd6ogbaIr2oPCTnLQnPL3JCeaH2T
 EiWqWaBX64uPUNDMk0vLCsnj4FMis2sOjboGNLtkTZv9/ZO41nfioTt5oM8L
X-Gm-Gg: ASbGncuY1R11c9ctQvhF89NCBugY8TH4UdoNk/BvQUCIC4Ozn5GXNC0n/pouESd3AQU
 AC7ce+TPTcyIgCY6MFS8/iCrbJ4tfSciaLCd7AzM+GdH0JAWJe1dELsEbJH6oBejlzxgZeBTXUB
 srooWQzok/a1v2ihcXV2xbWx9ErxKtJRFseK+ea90y7Xq2//0q3GqYYp8Lo/cTyNsoKo/yUIOLk
 dMkRbd8E4hw4fljGTGqeCcPGJmYqY3VALWiqMNy/wKJFui/ZoN7XcOQ21vQ4bdA3R4Sh1szGXWy
 ZK2BBiBCpf9FIewhPiL/AAiK2ZqTmbMUGO9tHAPr
X-Google-Smtp-Source: AGHT+IExbRjv1maWZorg6D1HfejTlkRKOh8Np4wRHCG3S2GjW2JzrYOuwgOzfgIgwpaK/0n8R2AWjw==
X-Received: by 2002:a05:6a00:3a05:b0:725:b6fb:7efb with SMTP id
 d2e1a72fcca58-72d21f28f43mr24476757b3a.9.1736721105553; 
 Sun, 12 Jan 2025 14:31:45 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4067e9d4sm4677458b3a.127.2025.01.12.14.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 14:31:45 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun, 12 Jan 2025 14:31:42 -0800
Message-Id: <20250112223142.770914-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736721106; x=1737325906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FBnyTOFFQQDcAir5406R2vSR9vqy+YN8ygdrLBT52iM=;
 b=OwptWtPAZAk3Gy5OUh/G+hPRo7dpP2MBq/ssQOGVGRcSRBtQasNc5NTTtVIAMhbsws
 fSsVc7M6Tf88mjMes9L1UWpLNQ/STGBFXvod+DJJVi/1SbR31BIPnfpHHBQUe0G7PpwL
 e6al9THK4ZYEVjBkcd6ZZDL2gzZTDJen2UwzGr7zdNk/vIJVftwuT2LoAQwxqmtkSv/6
 5HdwKO+z+LFc65aG4i9OY0pkUDJgvCPA2ljiI9HrI7gW0m9BITLMmk+h1x3WZEfdPLmc
 oTlCBYT9iOGIyaH6f5BjHEeLjUVNLo1KWKFLqicPO8dT3DhSKJLf/LNMrVshlF7KSJJe
 nA+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OwptWtPA
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to 4.4.37
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

Release notes:
https://github.com/besser82/libxcrypt/releases/tag/v4.4.37

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

---
Changes v1 -> v2:
  - Add host-pkgconf dependency (suggested by Julien)

---
 package/libxcrypt/Config.in      | 1 +
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 4 +++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/Config.in b/package/libxcrypt/Config.in
index 38c75b5e63..508e1a43cd 100644
--- a/package/libxcrypt/Config.in
+++ b/package/libxcrypt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBXCRYPT
 	bool "libxcrypt"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HOST_PKGCONF
 	help
 	  libxcrypt is a modern library for one-way hashing
 	  of passwords. It supports a wide variety of both
diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index 9bcf119077..45e2df6d4f 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,5 +1,5 @@
-# From https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz.sha256sum
-sha256  e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943  libxcrypt-4.4.36.tar.xz
+# From https://github.com/besser82/libxcrypt/releases/download/v4.4.37/libxcrypt-4.4.37.tar.xz.sha256sum
+sha256  902aa2976f959b5ebe55679b1722b8479f8f13cd4ce2ef432b0a84ae298fffd0  libxcrypt-4.4.37.tar.xz
 
 # Locally calculated
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 60901988ac..d96d1661a8 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.36
+LIBXCRYPT_VERSION = 4.4.37
 LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
 LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
+LIBXCRYPT_DEPENDENCIES = host-pkgconf
+HOST_LIBXCRYPT_DEPENDENCIES = host-pkgconf
 LIBXCRYPT_INSTALL_STAGING = YES
 
 # Some warnings turn into errors with some sensitive compilers
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
