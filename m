Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBB1C5B543
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A77C83D9A;
	Fri, 30 May 2025 21:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyTwzbADoovv; Fri, 30 May 2025 21:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B52483D25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B52483D25;
	Fri, 30 May 2025 21:39:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 423C2127
 for <buildroot@buildroot.org>; Fri, 30 May 2025 21:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C1F60FA8
 for <buildroot@buildroot.org>; Fri, 30 May 2025 21:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayXu_DAXLxfg for <buildroot@buildroot.org>;
 Fri, 30 May 2025 21:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F64560E98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F64560E98
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F64560E98
 for <buildroot@buildroot.org>; Fri, 30 May 2025 21:39:08 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-234f17910d8so25124675ad.3
 for <buildroot@buildroot.org>; Fri, 30 May 2025 14:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748641148; x=1749245948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JSyFE8DVgXBrB1R3HrStaSshkwercmgXM4lrtyI5ryc=;
 b=fRb40h4PR96wpa0EqMT+a1+28M/vreZvhcLGNGQ+JT2BQRCRdduDgGC427De2daA12
 NeBPWCpmVsTOsLciP2snRYmGvuf5gqtEjMzhn0ITeiC9sn4ZvIJuFOhWdIkyiGW6MGBu
 +PxVNOKaz68YdQDfsSSwjj8o8+NUU4LM7yL6Xl88kCUw5R8B9Go8INavl/KY/Kcu5Ltl
 fQlw19qEwPZm2zM7jn1k8Ib6jpuQzfNGAtFPEui0Hdz1se9c3glULhy2vyqm11/EuJNU
 IRSCk+7FjooMBQJxPqIbfyfoFN/+d1P1FtvDYEq131NI3RAIJ33mGRFwmY1GxfFQB/9+
 Lu/g==
X-Gm-Message-State: AOJu0YyU0TTFrHLM7QxyYX9wUNEYesagTo3J/cnqSLtcgkqSHebWRls3
 xqb0cgSw3S8FKo6rfet7fJq2e/E2gvA/8qFVxnWgdyhR+dC/ElSK//07ryOTi/M6
X-Gm-Gg: ASbGncsNZIvg5UD3TSqUGrO1A4iQiOsTtRx3F54w+kibBSLmZvF0ylJrrG2rqRLQAxH
 c5lclAxppbo7hVt4xqXY6fXCwU0StAMkEbqMGWhXD+AZRJHsmwrMrRXPaKX9US6wXyLrAaGgnBW
 U+FenDaH5JxVkTL0L3eu4XoMz+mv+1+TPRJZqdv03SgRHYOdxQkxkITdkKfqv0BbgLDAS+RDP9I
 axo4tadQL0unffkJbPo90RPngsREAlwaa3zoY8uf8ebLZ4m09sV4FcEiCc9npbBsQQARY4w7rFV
 UV4WgfGyr965MwjzPxF///NJEDNGpQq20nE1XGSbecoKWWawoQVLx5mB037PkGu/dzFtxiddhbi
 cAynBErmOYzZW3EDMwky8qzDcyHhuy8Vp+HXiTjtSddcPwK63
X-Google-Smtp-Source: AGHT+IFeUOCNaeeaPp0OZXDBFdR2ca554y0gg0Ven+FEPIhYAxDvp8K1q3YAnaDGCHo8Fz3VBXQ40Q==
X-Received: by 2002:a17:902:f711:b0:234:986c:66f9 with SMTP id
 d9443c01a7336-235390e3c23mr61076135ad.22.1748641147829; 
 Fri, 30 May 2025 14:39:07 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bf8132sm32676905ad.106.2025.05.30.14.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 14:39:07 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 May 2025 14:39:04 -0700
Message-Id: <20250530213904.465152-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748641148; x=1749245948; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JSyFE8DVgXBrB1R3HrStaSshkwercmgXM4lrtyI5ryc=;
 b=UoK7KTi7dset4rNtFN4/f1fHqDWHQoZOg07XrvI+nCfcbdaam8DoK40lBFqWWtCvaW
 gYvdcq+XqGlrRlIfsVhQVVvIy43Ou9pCDJna/EAQTHmLt0ziC1fbngLqqyxWXaT+6ztc
 T1InMxPWI3qcSYkGBitu/FoS1tF6WwbECHZRz8Rf4sY5h/q48JMEZt6phgCDc5WqiyR8
 jUHASMO4aqLCnPur7bML7Xwuu7JD1DsmA5TGrE85VAKYJ0PODMexngqB3YSaS09cwdwJ
 FlUxy9lWTjcSX4Ls9SllS7DBKu5nsgD8jrS3TCy+kILwoSL1YYKGEC6c5JheMcbj5C+d
 m+5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UoK7KTi7
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump to version
 8.14.0
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:
- CVE-2025-5025:
  No QUIC certificate pinning with wolfSSL.
  https://curl.se/docs/CVE-2025-5025.html

- CVE-2025-4947:
  QUIC certificate check skip with wolfSSL.
  https://curl.se/docs/CVE-2025-4947.html

Changelog:
https://curl.se/ch/8.14.0.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 388ddc1418..1e908536a1 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.13.0.tar.xz.asc
+# https://curl.se/download/curl-8.14.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025  curl-8.13.0.tar.xz
+sha256  b3634cfc538c72c9c6ca794ef4c73d7fdbd171e8dee2db837d83a5e45231002a  curl-8.14.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 5f04fc381f..2a9239148e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.13.0
+LIBCURL_VERSION = 8.14.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
