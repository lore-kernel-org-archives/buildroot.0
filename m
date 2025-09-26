Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C765DCAC5AC
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 09:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6775361BDE;
	Fri, 26 Sep 2025 09:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ngd_h4b_HHW; Fri, 26 Sep 2025 09:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F51261BEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F51261BEE;
	Fri, 26 Sep 2025 09:12:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25ABC177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0459F4211D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbtNOuBvDrS5 for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 09:12:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED3A741FF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED3A741FF4
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED3A741FF4
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:26 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3164978f11so353218966b.3
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 02:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758877945; x=1759482745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NcaG51DTLVrksbbrlPxL9avBTAxL77xMA/kg5oIeg4s=;
 b=JanCtOCnIUsCnY22Z8IpfK4+qSctYk5Wc9Zt7zrwesGpeCYbnfFjoBIUMpMlVF8o97
 XtoxfQTtFSaQS54LZtardZPhbSFRNcScPmtpl2JlMnuo1EeaJPWKOsKViPuR1tZNMgZZ
 ylU2qoxwycjxPyi35ju+WM3SxZ/j9tMJSSLbKo5YETVM2G3esZzPiuS3OBcmez+cOFYX
 UgeltRDLzHIaFugsFm9IYrGojG0vvCy/gj2mK2750tA+/AAhsRTpiA9CNZl/49hi9su6
 GNGFgkVGG08Zs1JF2nS5wB7XYUbJIdEh3Cx/Cc6/6JG6xq37bj7CGZNLuWbfz9I+4O7+
 XlaQ==
X-Gm-Message-State: AOJu0YzQ0Zu7ar4yNkQqy4kgszvPB5i1uDUkiw3J39QRUFUZJ7M+Fx6C
 Sk7DiTczHlZSHRANjuTqlRwrMnrycRAHvHAgCU0++WznwtF2v+xpAlwoNhwOghtmq20=
X-Gm-Gg: ASbGncupbtFid6nBVnEL5R25Ud81wJhaLnZi94Lgyc1FlGRF4FX937XWZLMKGuWijsT
 783BLcKl/PieZH+ATWYYfhajIljhonZiR3elCy8KvVzrOEdk9sEjT9Hlz2ghuH4k3RquAb5sboA
 cfhGpMZzWMWcRbqC74fQuTaMsVuVVd4B8K9VYRJududeQl7glmv48vW0c0JJ3Gv+TEvnY2b3+YL
 W/6i7uReO/gz24+7pEIhT8tD8/e+Q/6yF6c8qzB6aOOrndtZdvo53RHh6dBo6pW96oo9MprfjlN
 DmFCoK+jTPqloXW9tYWl8eo5N/wWxXxDv4YkCoC7eCEWebBW9eJjxnLtIFxojswLL9cXciUX3BQ
 nKffkUhk/LUhcL5XCrs+vUUM=
X-Google-Smtp-Source: AGHT+IGpcUV3QeEWNtE6FTlkF4BqD5niOl0L0cl0yyBuKyrNHiCg9RGz6tMvKNv7n6K1LR4w015StA==
X-Received: by 2002:a17:907:2da0:b0:b02:a093:eac9 with SMTP id
 a640c23a62f3a-b34bb9e731fmr736612066b.53.1758877944475; 
 Fri, 26 Sep 2025 02:12:24 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545c8510bsm328256466b.108.2025.09.26.02.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 02:12:24 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 26 Sep 2025 11:11:17 +0000
Message-ID: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758877945; x=1759482745; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NcaG51DTLVrksbbrlPxL9avBTAxL77xMA/kg5oIeg4s=;
 b=AC5MmjhUL+CFufmQWhqxXGxuAogJd5Rhy/9hMJVctq2utWznEPgrYw/mlELHem8gpI
 UUmuFlYCTWVpsbbut2tuJ/1JGKh6tddUxAGm8Jc0fg7D70nb5tjyXSydiBjrWqeowtgD
 n4uLVuattMBK9ebqUI+QWbJRs7N249zijeS6RkG13TUDirm+s0WvVDbcelVsNB7clDcc
 +iiUW1hgfdAhXVKXloM/kYaKpfRbh8GU7O1u6WD9zYW2My79/hWgwGAzfpwTxpQ3ErZ+
 mavQLx4ztk1SrklHzsh4+9UqEZs5YgGwideXraMpnTGXAEPi8GSNFvaA3ThPO7gLPlPX
 0LdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AC5MmjhU
Subject: [Buildroot] [PATCH v2 1/4] package/wlroots: bump to version 0.19.0
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

Changelog:
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.0
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 68b5dbd6d2..77d5c4552b 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.2/downloads/wlroots-0.18.2.tar.gz.sig
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.0/downloads/wlroots-0.19.0.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  cf776c169169f279808d9eabc6583f484338dcd454c966a285ff178c88c105d4  wlroots-0.18.2.tar.gz
+sha256  aefb0fe2633b0aad1d66123b2f41afab004fb625e2a7790492cdd39a805cac91  wlroots-0.19.0.tar.gz
 
 # Hashes for license files:
 sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 81f76fcdc7..689662f536 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.18.2
+WLROOTS_VERSION = 0.19.0
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
